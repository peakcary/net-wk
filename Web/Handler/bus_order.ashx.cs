using System;
using System.Data;
using System.Text;
using System.Web;

namespace WK.Web.Handler
{
    /// <summary>
    /// bus_order 的摘要说明
    /// </summary>
    public class bus_order : IHttpHandler
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
                case "getListCount":
                    sb.Append(getListCount(context));
                    break;
                case "getDataList":
                    sb.Append(getDataList(context));
                    break;

                case "getListByQuery":
                    sb.Append(getListByQuery(context));
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
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
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

            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            ds = bll.GetListByPageInfo(strWhere.ToString(), orderby.ToString(), startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }
        private string getListByQuery(HttpContext context)
        {
            string order_code=string.Empty;
            if (context.Request.Params["order_code"] != null && context.Request.Params["order_code"].ToString() != "")
            {
                order_code = context.Request.Params["order_code"].ToString();
            }
            int user_id=0;
            if (context.Request.Params["user_id"] != null && context.Request.Params["user_id"].ToString() != "")
            {
                user_id = int.Parse(context.Request.Params["user_id"].ToString());
            }
            int order_status=0;
            if (context.Request.Params["order_status"] != null && context.Request.Params["order_status"].ToString() != "")
            {
                order_status = int.Parse(context.Request.Params["order_status"].ToString());
            }
            int pay_status=0;
            if (context.Request.Params["pay_status"] != null && context.Request.Params["pay_status"].ToString() != "")
            {
                pay_status = int.Parse(context.Request.Params["pay_status"].ToString());
            }
            int eat_type=0;
            if (context.Request.Params["eat_type"] != null && context.Request.Params["eat_type"].ToString() != "")
            {
                eat_type = int.Parse(context.Request.Params["eat_type"].ToString());
            }
            int minDays=0;
            if (context.Request.Params["minDays"] != null && context.Request.Params["minDays"].ToString() != "")
            {
                minDays = int.Parse(context.Request.Params["minDays"].ToString());
            }
            int isDiscount=0;
            if (context.Request.Params["isDiscount"] != null && context.Request.Params["isDiscount"].ToString() != "")
            {
                isDiscount = int.Parse(context.Request.Params["isDiscount"].ToString());
            }
             

            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            
             

            int pageIndex = int.Parse(context.Request.Params["pageIndex"]);
            int pageSize = int.Parse(context.Request.Params["pageSize"]);
            int startIndex = 0;
            if (pageIndex >= 0)
            {
                startIndex = pageSize * pageIndex;
            }

            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            ds = bll.GetListByQuery(order_code, user_id, order_status, pay_status, eat_type, minDays, isDiscount, startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        } 
    }
}