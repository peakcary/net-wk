using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;


namespace WK.Web.Handler
{
    /// <summary>
    /// bus_pickup_address 的摘要说明
    /// </summary>
    public class bus_pickup : IHttpHandler
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
                case "deleteRData":
                    sb.Append(deleteData(context));
                    break;
                case "getListByPageInfo":
                    sb.Append(getListByPageInfo(context));
                    break;
                case "getListCount":
                    sb.Append(getListCount(context));
                    break;
                case "deleteDataByStatus":
                    sb.Append(deleteDataByStatus(context));
                    break;

                case "getListUser2":
                    sb.Append(getListUser2(context));
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
        private string getListByPageInfo(HttpContext context)
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

            WK.BLL.bus_pickup_address bll = new WK.BLL.bus_pickup_address();
            ds = bll.GetListByPageInfo(strWhere.ToString(), orderby.ToString(), startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }

        /// <summary>
        /// 列表数量
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private string getListCount(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            WK.BLL.bus_pickup_address bll = new WK.BLL.bus_pickup_address();
            Record r = new Record();
            r.RecordCount = bll.GetListCount(strWhere.ToString());
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
            WK.BLL.bus_pickup_address bll = new WK.BLL.bus_pickup_address();
            WK.Model.bus_pickup_address model = bll.GetModel(int.Parse(id)); 
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

            WK.Model.bus_pickup_address model = new Model.bus_pickup_address();

            int id = 0;
            if (context.Request.Params["id"] != "")
            {
                id = int.Parse(context.Request.Params["id"]);
            }
            model.id = id;
            model.address = context.Request.Params["address"];
            model.area_id = 0;
            //model.create_by
            //model.create_date
            model.dilivery_user_id = int.Parse(context.Request.Params["dilivery_user_id"]);
            model.is_delete = 0;
            model.lat = decimal.Parse(context.Request.Params["lat"]);
            model.lon = decimal.Parse(context.Request.Params["lon"]);
            model.name  = context.Request.Params["name"];
            model.pickup_code = context.Request.Params["pickup_code"];
            model.remark = context.Request.Params["remark"];
            model.sort = int.Parse(context.Request.Params["sort"]);
            model.status = 1;//1启用2停用
            //model.update_by
            //model.update_date


            WK.BLL.bus_pickup_address bll = new WK.BLL.bus_pickup_address();
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
        /// 状态删除
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private string deleteDataByStatus(HttpContext context)
        {
            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = false;
            WK.BLL.bus_pickup_address bll = new WK.BLL.bus_pickup_address();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                WK.Model.bus_pickup_address model = bll.GetModel(id);
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
            WK.BLL.bus_pickup_address bll = new WK.BLL.bus_pickup_address();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                returnInfo.isSuccess = bll.Delete(id);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }




        private string getListUser2(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            strWhere.Append(" and user_type = 2 ");
            StringBuilder orderby = new StringBuilder();

            int pageIndex = int.Parse(context.Request.Params["pageIndex"]);
            int pageSize = int.Parse(context.Request.Params["pageSize"]);
            int startIndex = 0;
            if (pageIndex >= 0)
            {
                startIndex = pageSize * pageIndex;
            }

            WK.BLL.bus_user bll = new WK.BLL.bus_user();
            ds = bll.GetListByPageInfo(strWhere.ToString(), orderby.ToString(), startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }
 
    }
}