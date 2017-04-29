using System;
using System.Data;
using System.Text;
using System.Web;
using Maticsoft.DBUtility;
using System.Web.SessionState;

namespace WK.Web.Handler
{
    /// <summary>
    /// login 的摘要说明
    /// </summary>
    public class login : IHttpHandler, IRequiresSessionState 
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
                case "getDataDetail":
                    sb.Append(getDataDetail(context));
                    break;
                default:
                    sb.Append("");
                    break;
            }
            context.Response.Write(sb.ToString());
        }


       
        private string getDataDetail(HttpContext context)
        {
            string name = context.Request.Params["name"];
            string pwd = DESEncrypt.Encrypt(context.Request.Params["pwd"]);

            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            strWhere.AppendFormat(" and name = '{0}'",name);
            strWhere.AppendFormat(" and pwd = '{0}'",pwd);
             
            WK.BLL.sys_user bll = new WK.BLL.sys_user();
            ds = bll.GetListByPageInfo(strWhere.ToString(), "", 0, 100); 
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]); 
        }
         
    }
}