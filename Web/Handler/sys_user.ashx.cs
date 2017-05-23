using System;
using System.Data;
using System.Text;
using System.Web;
using Maticsoft.DBUtility;

namespace WK.Web.Handler
{
    /// <summary>
    /// sys_user 的摘要说明
    /// </summary>
    public class sys_user : IHttpHandler
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
                case "getListCount":
                    sb.Append(getListCount(context));
                    break;
                case "getListByPageInfo":
                    sb.Append(getListByPageInfo(context));
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
                case "deleteDataByStatus":
                    sb.Append(deleteDataByStatus(context));
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

            WK.BLL.sys_user bll = new WK.BLL.sys_user();
            ds = bll.GetListByPageInfo(strWhere.ToString(), orderby.ToString(), startIndex, pageSize);
            DataTable dt = ds.Tables[0];

            DataTable dt1 = dt.Clone();


            if (dt.Rows.Count > 0) {
                for (int i = 0, l = dt.Rows.Count; i < l; i++) {

                    dt.Rows[i]["pwd"] = DESEncrypt.Decrypt(dt.Rows[i]["pwd"].ToString()).ToString();
                }
            }
            return Newtonsoft.Json.JsonConvert.SerializeObject(dt);
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
            WK.BLL.sys_user bll = new WK.BLL.sys_user();
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
            WK.BLL.sys_user bll = new WK.BLL.sys_user();
            WK.Model.sys_user model = bll.GetModel(int.Parse(id));
            model.pwd = DESEncrypt.Decrypt(model.pwd);
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

            WK.Model.sys_user model = new Model.sys_user();

            int id = 0;
            if (context.Request.Params["id"] != "")
            {
                id = int.Parse(context.Request.Params["id"]);
            }
            model.id = id;
            model.code = context.Request.Params["code"];
            model.is_delete = 0;
            model.name = context.Request.Params["name"];
            model.pwd = DESEncrypt.Encrypt(context.Request.Params["pwd"]);
            //model.remark = context.Request.Params["remark"];
            //model.sex =int.Parse( context.Request.Params["sex"]); 
            //model.create_by
            //model.create_date
            //model.update_by
            //model.update_date  

            WK.BLL.sys_user bll = new WK.BLL.sys_user();
            returnInfo.isSuccess = model.id > 0 ? bll.Update(model) : bll.Add(model); 
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
            WK.BLL.sys_user bll = new WK.BLL.sys_user();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                WK.Model.sys_user model = bll.GetModel(id);
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
            WK.BLL.sys_user bll = new WK.BLL.sys_user();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                returnInfo.isSuccess = bll.Delete(id);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }

        
    }
}