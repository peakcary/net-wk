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
                case "getListByPage":
                    sb.Append(getListByPage(context));
                    break;
                case "getRecordCount":
                    sb.Append(getRecordCount(context));
                    break;

                case "deleteDataByStatus":
                    sb.Append(deleteDataByStatus(context));
                    break;
                case "getDataAreaList":
                    sb.Append(getDataAreaList(context));
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
            WK.BLL.bus_market bll = new WK.BLL.bus_market();
            ds = bll.GetList(strWhere.ToString());
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
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

            WK.BLL.bus_market bll = new WK.BLL.bus_market();
            ds = bll.GetListByPage(strWhere.ToString(), orderby.ToString(), startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }

        private string getRecordCount(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            StringBuilder strWhere = new StringBuilder();
            WK.BLL.bus_market bll = new WK.BLL.bus_market();
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
            WK.BLL.bus_market bll = new WK.BLL.bus_market();
            WK.Model.bus_market model = bll.GetModel(int.Parse(id));
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

            WK.Model.bus_market model = new Model.bus_market();

            model.id = int.Parse(context.Request.Params["id"]);
            model.address = context.Request.Params["address"];
            model.area_id =int.Parse( context.Request.Params["area_id"]);
            model.description_cn = context.Request.Params["description_cn"];
            model.description_en = context.Request.Params["description_en"];
            model.lat = decimal.Parse( context.Request.Params["lat"]);
            model.lon = decimal.Parse( context.Request.Params["lon"]);
            model.market_type = context.Request.Params["market_type"];
            model.markket_code = context.Request.Params["markket_code"];
            model.name_cn = context.Request.Params["name_cn"];
            model.name_en = context.Request.Params["name_en"];
            model.remark = context.Request.Params["remark"];
            model.sort =int.Parse( context.Request.Params["sort"]);
            model.status =int.Parse( context.Request.Params["status"]);
         

            WK.BLL.bus_market bll = new WK.BLL.bus_market();
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


        private string deleteDataByStatus(HttpContext context)
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

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private string deleteData(HttpContext context)
        {
            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = false;
            WK.BLL.bus_market bll = new WK.BLL.bus_market();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                returnInfo.isSuccess = bll.Delete(id);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }

        private string getDataAreaList(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            StringBuilder strWhere = new StringBuilder();

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
 
    }
}