using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;

namespace WK.Web.Handler
{
    /// <summary>
    /// bus_dish 的摘要说明
    /// </summary>
    public class bus_dish : IHttpHandler
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
            //strWhere.Append(" is_delete != 1");
            strWhere.Append("is_delete = 0 or is_delete is NULL");
            StringBuilder orderby = new StringBuilder();

            int pageIndex = int.Parse(context.Request.Params["pageIndex"]);
            int pageSize = int.Parse(context.Request.Params["pageSize"]);
            int startIndex = 0;
            if (pageIndex >= 0)
            {
                startIndex = pageSize * pageIndex;
            }

            WK.BLL.bus_dish bll = new WK.BLL.bus_dish();
            ds = bll.GetListByPage(strWhere.ToString(), orderby.ToString(), startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }

        private string getRecordCount(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            StringBuilder strWhere = new StringBuilder();
            WK.BLL.bus_dish bll = new WK.BLL.bus_dish();
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
            WK.BLL.bus_dish bll = new WK.BLL.bus_dish();
            WK.Model.bus_dish model = bll.GetModel(int.Parse(id));
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

            WK.Model.bus_dish model = new Model.bus_dish();
            model.id = int.Parse(context.Request.Params["id"]);
            model.description_cn = context.Request.Params["description_cn"];
            model.description_en = context.Request.Params["description_en"];
            model.discount_price = decimal.Parse(context.Request.Params["discount_price"]);
            model.sort = int.Parse(context.Request.Params["sort"]);
            model.remark = context.Request.Params["remark"];
            //model.dish_type =int.Parse( context.Request.Params["dish_type"]);
            model.name_cn = context.Request.Params["name_cn"];
            model.name_en = context.Request.Params["name_en"];
            model.original_price =decimal.Parse( context.Request.Params["name_cn"]);
            //model.sales_total = int.Parse(context.Request.Params["sales_total"]);
            
            WK.BLL.bus_dish bll = new WK.BLL.bus_dish();
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
            WK.BLL.bus_dish bll = new WK.BLL.bus_dish();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                WK.Model.bus_dish model = bll.GetModel(id);
                model.is_delete = 1;
                returnInfo.isSuccess = bll.Update(model);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }
 
    }
}