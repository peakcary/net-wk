using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.IO;
using System.Web.Script.Serialization;

namespace WK.Web.Handler
{
    /// <summary>
    /// PickupAddress 的摘要说明
    /// </summary>
    public class PickupAddress : IHttpHandler
    {
        public bool IsReusable
        {
            get
            {
                return false;
            }
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
                case "getDataDetail":
                    sb.Append(getDataDetail(context));
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

        
        /// <summary>
        /// 列表
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private string getDataList(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            StringBuilder strWhere = new StringBuilder();
            WK.BLL.user bll = new WK.BLL.user();
            ds = bll.GetList(strWhere.ToString());
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }

        /// <summary>
        /// 详情
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private string getDataDetail(HttpContext context)
        {
            string id = "";
            if (context.Request.Params["id"] != null)
            {
                id = context.Request.Params["id"];
            }
            WK.BLL.user bll = new WK.BLL.user();
            WK.Model.user model = bll.GetModel(int.Parse(id));
            return Newtonsoft.Json.JsonConvert.SerializeObject(model);
        }

        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private string editData(HttpContext context)
        {  
            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = false;

            WK.Model.user model = new Model.user();
            model.userId = int.Parse( context.Request.Params["userId"]);
            model.username = context.Request.Params["username"];
            model.password = context.Request.Params["password"];
            model.address = context.Request.Params["address"];

            WK.BLL.user bll = new WK.BLL.user();
            if (model.userId > 0)
            {
                returnInfo.isSuccess = bll.Update(model);
            }
            else
            {
                returnInfo.isSuccess = bll.Add(model);
            } 

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo); 
        } 

       
    }

    [Serializable]
    public   class ReturnInfo
    {
        public bool isSuccess { get; set; }
    }
}