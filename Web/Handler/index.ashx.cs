using System;
using System.Data;
using System.Text;
using System.Web;
using Maticsoft.DBUtility;

namespace WK.Web.Handler
{
    /// <summary>
    /// index 的摘要说明
    /// </summary>
    public class index : IHttpHandler
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
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";

            string t = context.Request.Params["t"];
            StringBuilder sb = new StringBuilder();
            switch (t)
            {
                case "getDateOrderList":
                    sb.Append(getDateOrderList(context));
                    break;
                case "getPersonOrderList":
                    sb.Append(getPersonOrderList(context));
                    break;
                case "getPriceOrderList":
                    sb.Append(getPriceOrderList(context));
                    break;
                case "getListCountByTomorrowEattype":
                    sb.Append(getListCountByTomorrowEattype(context));
                    break;
                case "getListCountByYesterdayCreateUser":
                    sb.Append(getListCountByYesterdayCreateUser(context));
                    break;
                case "getListCountByAllUser":
                    sb.Append(getListCountByAllUser(context));
                    break;  
                default:
                    sb.Append("");
                    break;
            }
            context.Response.Write(sb.ToString());
        }


        private string getDateOrderList(HttpContext context)
        {  
            int minDays = int.Parse(context.Request.Params["minDays"]); 
            WK.BLL.bus_order bll = new WK.BLL.bus_order(); 
            return Newtonsoft.Json.JsonConvert.SerializeObject(bll.GetDateList(minDays).Tables[0]);
        }
        private string getPersonOrderList(HttpContext context)
        {
            int minDays = int.Parse(context.Request.Params["minDays"]);
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            return Newtonsoft.Json.JsonConvert.SerializeObject(bll.GetPersonList(minDays).Tables[0]);
        }
        private string getPriceOrderList(HttpContext context)
        {
            int minDays = int.Parse(context.Request.Params["minDays"]);
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            return Newtonsoft.Json.JsonConvert.SerializeObject(bll.GetPriceList(minDays).Tables[0]);
        }

        private string getListCountByTomorrowEattype(HttpContext context)
        {
            int eatType = int.Parse(context.Request.Params["eatType"]);
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            Record r = new Record();
            r.RecordCount = bll.GetListCountByTomorrowEattype(eatType);
            return Newtonsoft.Json.JsonConvert.SerializeObject(r);
        }

        private string getListCountByYesterdayCreateUser(HttpContext context)
        { 
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            Record r = new Record();
            r.RecordCount = bll.GetListCountByYesterdayCreateUser();
            return Newtonsoft.Json.JsonConvert.SerializeObject(r);
        }

        private string getListCountByAllUser(HttpContext context)
        { 
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            Record r = new Record();
            r.RecordCount = bll.GetListCountByAllUser();
            return Newtonsoft.Json.JsonConvert.SerializeObject(r);
        } 
    }
}