using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;

namespace WK.Web.Handler
{
    /// <summary>
    /// bus_image 的摘要说明
    /// </summary>
    public class bus_image : IHttpHandler
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
                case "getDataDetail":
                    sb.Append(getDataDetail(context));
                    break;
                case "editData":
                    sb.Append(editData(context));
                    break;
                case "deleteData":
                    sb.Append(deleteData(context));
                    break;
                case "getListByPage":
                    sb.Append(getListByPage(context));
                    break;
                case "getRecordCount":
                    sb.Append(getRecordCount(context));
                    break;


                default:
                    sb.Append("");
                    break;
            }
            context.Response.Write(sb.ToString());
        }
         

        /// <summary>
        /// 分页列表
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private string getListByPage(HttpContext context)
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

            WK.BLL.bus_image bll = new WK.BLL.bus_image();
            ds = bll.GetListByPage(strWhere.ToString(), orderby.ToString(), startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }

        private string getRecordCount(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            StringBuilder strWhere = new StringBuilder();
            WK.BLL.bus_image bll = new WK.BLL.bus_image();
            Record r = new Record();
            r.RecordCount = bll.GetRecordCount(strWhere.ToString());
            return Newtonsoft.Json.JsonConvert.SerializeObject(r);
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
            WK.BLL.bus_image bll = new WK.BLL.bus_image();
            WK.Model.bus_image model = bll.GetModel(int.Parse(id));
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

            WK.Model.bus_image model = new Model.bus_image();
            model.id = int.Parse(context.Request.Params["id"]);
            model.bus_type = int.Parse(context.Request.Params["bus_type"]);
            model.correlation_id = int.Parse(context.Request.Params["correlation_id"]);
            model.img_type = int.Parse(context.Request.Params["correlation_id"]);
            model.sort = int.Parse(context.Request.Params["sort"]);
            model.remark = context.Request.Params["remark"];
            model.url = context.Request.Params["url"];

            WK.BLL.bus_image bll = new WK.BLL.bus_image();
            if (model.id > 0)
            {
                returnInfo.isSuccess = bll.Update(model);
            }
            else
            {
                returnInfo.isSuccess = bll.Add(model);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private string deleteData(HttpContext context)
        {
            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = false;
            WK.BLL.bus_image bll = new WK.BLL.bus_image();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                WK.Model.bus_image model = bll.GetModel(id);
                model.is_delete = 1;
                returnInfo.isSuccess = bll.Update(model);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }

        
    }
}