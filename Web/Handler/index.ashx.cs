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
    }
}