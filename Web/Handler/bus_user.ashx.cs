using System;
using System.Data;
using System.Text;
using System.Web;
using Maticsoft.DBUtility;

namespace WK.Web.Handler
{
    /// <summary>
    /// bus_user 的摘要说明
    /// </summary>
    public class bus_user : IHttpHandler
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
            public string rMessage { get; set; }
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
                case "deleteData":
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
            strWhere.Append(" and user_type = 2 ");
            WK.BLL.bus_user bll = new WK.BLL.bus_user();
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
            WK.BLL.bus_user bll = new WK.BLL.bus_user();
            WK.Model.bus_user model = bll.GetModel(int.Parse(id));
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
            int id = 0;
            if (context.Request.Params["id"] != "")
            {
                id = int.Parse(context.Request.Params["id"]);
            }
            string phone_num = context.Request.Params["phone_num"];
            StringBuilder sb = new StringBuilder();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            strWhere.Append(" and user_type = 2 ");
            strWhere.AppendFormat(" and phone_num = {0} ", phone_num);
            WK.BLL.bus_user bll = new WK.BLL.bus_user(); 
            int RecordCount = bll.GetListCount(strWhere.ToString());
            if (RecordCount > 0 && id<=0)
            {
                ReturnInfo returnInfo = new ReturnInfo();
                returnInfo.isSuccess = false;
                returnInfo.rMessage = "已经存在同手机配送员";
                return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
            }
            else { 
                WK.Model.bus_user model = new Model.bus_user();

                
                model.id = id;
                //model.create_by
                //model.create_date
                //model.cur_deviceId = context.Request.Params["cur_deviceId"];
                //model.generate_time
                model.is_delete = 0;
                model.nickname = context.Request.Params["nickname"];
                model.phone_num = context.Request.Params["phone_num"];
                //model.pic_url = context.Request.Params["pic_url"];
                model.pwd = DESEncrypt.Encrypt(context.Request.Params["pwd"]);
                //model.remark = context.Request.Params["remark"];
                //model.sex = int.Parse( context.Request.Params["sex"]);
                //model.status = int.Parse(context.Request.Params["status"]);
                model.status = 1;//1启用2停用
                //model.update_by
                //model.update_date
                model.user_type = 2;//1用户2配送员

                ReturnInfo returnInfo = new ReturnInfo();
                returnInfo.isSuccess = false;
                //WK.BLL.bus_user bll = new WK.BLL.bus_user();
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
            WK.BLL.bus_user bll = new WK.BLL.bus_user();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                WK.Model.bus_user model = bll.GetModel(id);
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
            WK.BLL.bus_user bll = new WK.BLL.bus_user();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                returnInfo.isSuccess = bll.Delete(id);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }

        
 
    }
}