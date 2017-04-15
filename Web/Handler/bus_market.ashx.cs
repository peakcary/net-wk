using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;

namespace WK.Web.Handler
{
    /// <summary>
    /// bus_market 的摘要说明
    /// </summary>
    public class bus_market : IHttpHandler
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
                case "getListCount":
                    sb.Append(getListCount(context));
                    break;
                case "getDataList":
                    sb.Append(getDataList(context));
                    break;
                case "getDataDetail":
                    sb.Append(getDataDetail(context));
                    break;
                case "editData":
                    sb.Append(editData(context));
                    break;
                case "deleteData":
                    sb.Append(deleteData(context));
                    break;
                case "getAreaList":
                    sb.Append(getAreaList(context));
                    break;
                case "getPickupList":
                    sb.Append(getPickupList(context));
                    break;

                default:
                    sb.Append("");
                    break;
            }
            context.Response.Write(sb.ToString());
        }

        private string getListCount(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            StringBuilder strWhere = new StringBuilder();
            WK.BLL.bus_market bll = new WK.BLL.bus_market();
            Record r = new Record();
            r.RecordCount = bll.GetListCount(strWhere.ToString());
            return Newtonsoft.Json.JsonConvert.SerializeObject(r);
        }
    
        private string getDataList(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            StringBuilder orderby = new StringBuilder();

            int pageIndex = int.Parse(context.Request.Params["pageIndex"]);
            int pageSize = int.Parse(context.Request.Params["pageSize"]);
            int startIndex = 0;
            if (pageIndex >= 0)
            {
                startIndex = pageSize * pageIndex;
            }

            WK.BLL.bus_market bll = new WK.BLL.bus_market();
            ds = bll.GetListByPageInfo(strWhere.ToString(), orderby.ToString(), startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        } 
              
        private string getDataDetail(HttpContext context)
        {
            string id = "";
            if (context.Request.Params["id"] != null)
            {
                id = context.Request.Params["id"];
            }
            WK.BLL.bus_market bll = new WK.BLL.bus_market();
            WK.Model.bus_market model = bll.GetModel(int.Parse(id));

            WK.BLL.bus_pickup_market marketBll = new BLL.bus_pickup_market();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            strWhere.AppendFormat(" and market_id = {0}", id);
            DataSet ds = new DataSet();
            ds = marketBll.GetList(strWhere.ToString());
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                model.pickup_address_id = int.Parse(ds.Tables[0].Rows[0]["pickup_address_id"].ToString());
            } 

            return Newtonsoft.Json.JsonConvert.SerializeObject(model);
        }
  
        private string editData(HttpContext context)
        {
            

            WK.Model.bus_market model = new Model.bus_market();

            model.id =0;
            if (context.Request.Params["id"] != null && context.Request.Params["id"].ToString() != "")
            {
                model.id = int.Parse(context.Request.Params["id"]);
            }
            model.address = context.Request.Params["address"];
            model.area_id =0;
            if (context.Request.Params["area_id"]!=null
                &&context.Request.Params["area_id"].ToString() != "")
            {
                model.area_id = int.Parse(context.Request.Params["area_id"]);
            }
            model.description_cn = context.Request.Params["description_cn"];
            model.description_en = context.Request.Params["description_en"];
            model.lat = decimal.Parse( context.Request.Params["lat"]);
            model.lon = decimal.Parse( context.Request.Params["lon"]);
            model.market_type = context.Request.Params["market_type"];
            model.markket_code = context.Request.Params["markket_code"];
            model.name_cn = context.Request.Params["name_cn"];
            model.name_en = context.Request.Params["name_en"];
            model.remark = context.Request.Params["remark"];
            model.sort = int.Parse(context.Request.Params["sort"]);
            model.status = int.Parse(context.Request.Params["status"]);
            model.address = context.Request.Params["address"]; 

            

            
            WK.BLL.bus_market bll = new WK.BLL.bus_market();
             int market_id =0;
            if(model.id > 0){
                market_id = model.id;
            }else{
                market_id = bll.GetMaxId();
            }
            ReturnInfo returnInfo = new ReturnInfo(); 
            returnInfo.isSuccess = model.id > 0 ? bll.Update(model) : bll.Add(model);

            int pickup_address_id = 0;
            if (context.Request.Params["pickup_address_id"] != null
                && context.Request.Params["pickup_address_id"].ToString() != "")
            {
                pickup_address_id = int.Parse(context.Request.Params["pickup_address_id"]);
            }
            if (pickup_address_id > 0)
            {
                WK.BLL.bus_pickup_market marketBll = new BLL.bus_pickup_market();
                StringBuilder strWhere = new StringBuilder();
                strWhere.Append(" is_delete != 1");
                strWhere.AppendFormat(" and market_id = {0}", market_id);
                DataSet ds = new DataSet();
                ds = marketBll.GetList(strWhere.ToString());
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                }
                else
                {
                    WK.Model.bus_pickup_market marketModel = new Model.bus_pickup_market();
                    marketModel.is_delete = 0;
                    marketModel.market_id = market_id;
                    marketModel.pickup_address_id = pickup_address_id;
                    marketBll.Add(marketModel);
                }
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }
   
        private string deleteData(HttpContext context)
        {
            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = false;
            WK.BLL.bus_market bll = new WK.BLL.bus_market();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                WK.Model.bus_market model = bll.GetModel(id);
                model.is_delete = 1;
                returnInfo.isSuccess = bll.Update(model);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }

        private string getAreaList(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");

            WK.BLL.bus_area bll = new WK.BLL.bus_area();
            ds = bll.GetList(strWhere.ToString());
            DataTable dt = new DataTable();
            dt.Columns.Add("data", typeof(System.Int32));
            dt.Columns.Add("value", typeof(System.String));
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                int l = ds.Tables[0].Rows.Count;
                for (int i = 0; i < l; i++)
                {
                    DataRow row = dt.NewRow();
                    row["data"] = ds.Tables[0].Rows[i]["id"];
                    row["value"] = ds.Tables[0].Rows[i]["name"];
                    dt.Rows.Add(row);
                }

            }
            return Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        }

        private string getPickupList(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");

            WK.BLL.bus_pickup_address bll = new WK.BLL.bus_pickup_address();
            ds = bll.GetList(strWhere.ToString());
            DataTable dt = new DataTable();
            dt.Columns.Add("data", typeof(System.Int32));
            dt.Columns.Add("value", typeof(System.String));
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                int l = ds.Tables[0].Rows.Count;
                for (int i = 0; i < l; i++)
                {
                    DataRow row = dt.NewRow();
                    row["data"] = ds.Tables[0].Rows[i]["id"];
                    row["value"] = ds.Tables[0].Rows[i]["name"];
                    dt.Rows.Add(row);
                }

            }
            return Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        }
 
    }
}