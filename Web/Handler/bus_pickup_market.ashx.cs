using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Collections;

namespace WK.Web.Handler
{
    /// <summary>
    /// bus_pickup_market 的摘要说明
    /// </summary>
    public class bus_pickup_market : IHttpHandler
    {

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        [Serializable]
        public class ReturnInfo
        {
            public bool isSuccess { get; set; }
        }
        [Serializable]
        public class Record
        {
            public int RecordCount { get; set; }
        }
        [Serializable]
        public class ImageObj
        {
            public int RecordCount { get; set; }
        }

        public void ProcessRequest(HttpContext context)
        {
            //不让浏览器缓存
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";

            string t = context.Request.Params["t"];
            StringBuilder sb = new StringBuilder();
            switch (t)
            { 
                case "getDataList":
                    sb.Append(getDataList(context));
                    break;
                case "editData":
                    sb.Append(editData(context));
                    break; 

                    

                default:
                    sb.Append("");
                    break;
            }
            context.Response.Write(sb.ToString());
        } 
        private string getDataList(HttpContext context)
        {
            int pickup_id = int.Parse(context.Request.Params["pickup_id"]); 
            WK.BLL.bus_market bll = new WK.BLL.bus_market();
            DataSet ds = bll.GetPickupMarketList(pickup_id);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }

        private string editData(HttpContext context)
        {
            int pickup_id = int.Parse(context.Request.Params["pickup_id"]);
            WK.BLL.bus_pickup_market bllPickupMarket = new BLL.bus_pickup_market();
            WK.BLL.bus_market bll = new WK.BLL.bus_market();
            DataSet ds = bll.GetPickupMarketList(pickup_id);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0, l = ds.Tables[0].Rows.Count; i < l; i++)
                {
                    bllPickupMarket.Delete(int.Parse(ds.Tables[0].Rows[i]["bus_pickup_market_id"].ToString()));
                }
            }


            string listData = context.Request.Params["listData"].ToString();
            Object anArray = Newtonsoft.Json.JsonConvert.DeserializeObject(listData);
            int imageListCount = ((Newtonsoft.Json.Linq.JContainer)(anArray)).Count;
            for (int i = 0; i < imageListCount; i++)
            {
                string id = ((Newtonsoft.Json.Linq.JContainer)(anArray))[i]["id"].ToString();
                string market_id = ((Newtonsoft.Json.Linq.JContainer)(anArray))[i]["market_id"].ToString();
                string sort = ((Newtonsoft.Json.Linq.JContainer)(anArray))[i]["sort"].ToString();
                WK.Model.bus_pickup_market pModel = new Model.bus_pickup_market();
                pModel.is_delete = 0;
                pModel.market_id = int.Parse( market_id);
                pModel.pickup_address_id = pickup_id;
                pModel.sort =int.Parse( sort);
                bllPickupMarket.Add(pModel);

            }

            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = true;
            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }
         
    }
}