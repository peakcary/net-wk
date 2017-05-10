using System;
using System.Data;
using System.Text;
using System.Web;


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
            public int primaryKey { get; set; }
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

                case "getPickupTimes":
                    sb.Append(getPickupTimes(context));
                    break;
                case "editPickupTimes":
                    sb.Append(editPickupTimes(context));
                    break;
                case "deletePickupTimes":
                    sb.Append(deletePickupTimes(context));
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
 
        private string editData(HttpContext context)
        {
            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = false;

            WK.Model.bus_pickup_address model = new Model.bus_pickup_address();

            int id = 0;
            if (context.Request.Params["id"]!=null
                &&context.Request.Params["id"].ToString() != "")
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
            model.sort = 0;
            if (context.Request.Params["sort"] != null
                && context.Request.Params["sort"].ToString() != "")
            {
                model.sort = int.Parse(context.Request.Params["sort"]);
            }
            model.status = int.Parse(context.Request.Params["status"]); ;//1启用2停用
            //model.update_by
            //model.update_date


            WK.BLL.bus_pickup_address bll = new WK.BLL.bus_pickup_address();
            if (model.id > 0)
            {
                returnInfo.primaryKey = model.id;
                returnInfo.isSuccess = bll.Update(model);
            }
            else
            {
                returnInfo.primaryKey = bll.GetMaxId();
                returnInfo.isSuccess = bll.Add(model);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }
         
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

        private string getPickupTimes(HttpContext context)
        {
            int pickup_address_id = int.Parse(context.Request.Params["pickup_address_id"]); 
            
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            strWhere.AppendFormat(" and pickup_address_id = {0} ", pickup_address_id); 

            int pageIndex = int.Parse(context.Request.Params["pageIndex"]);
            int pageSize = int.Parse(context.Request.Params["pageSize"]);
            int startIndex = pageIndex >= 0 ? pageSize * pageIndex : 0; 

            WK.BLL.bus_pickup_times bll = new WK.BLL.bus_pickup_times();
            DataSet ds = new DataSet();
            ds = bll.GetListByPageInfo(strWhere.ToString(), "", startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        } 
         
        private string deletePickupTimes(HttpContext context)
        {
            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = false;
            WK.BLL.bus_pickup_times bll = new WK.BLL.bus_pickup_times();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                WK.Model.bus_pickup_times model = bll.GetModel(id);
                model.is_delete = 1;
                returnInfo.isSuccess = bll.Update(model);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }

        private string editPickupTimes(HttpContext context)
        {
            int id = 0;
            int pickup_address_id = int.Parse(context.Request.Params["pickup_address_id"]); 
            int eat_type =  int.Parse(context.Request.Params["eat_type"]);
            int pickup_time = int.Parse(context.Request.Params["pickup_time"]);  
           
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            strWhere.AppendFormat(" and pickup_address_id = {0}", pickup_address_id);
            strWhere.AppendFormat(" and eat_type = {0}", eat_type);
            strWhere.AppendFormat(" and pickup_time = {0}", pickup_time);  

            WK.BLL.bus_pickup_times bll = new WK.BLL.bus_pickup_times();
            DataSet ds = new DataSet();
            ds = bll.GetListByPageInfo(strWhere.ToString(), "", 0, 100);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count>0)
            {
                id = int.Parse(ds.Tables[0].Rows[0]["id"].ToString());
            } 

            WK.Model.bus_pickup_times model = new Model.bus_pickup_times(); 
            model.id  = id;
            //model.create_by ;
            //model.create_date
            model.eat_type = eat_type;
            model.is_delete = 0;
            model.pickup_address_id = pickup_address_id;

            string spickup_end_time = String.Format("{0:HH:mm:ss}", DateTime.Parse(context.Request.Params["pickup_end_time"]));
            TimeSpan pickup_end_time = TimeSpan.Parse(spickup_end_time); 
            model.pickup_end_time = pickup_end_time;

            string spickup_start_time = String.Format("{0:HH:mm:ss}", DateTime.Parse(context.Request.Params["pickup_start_time"]));
            TimeSpan pickup_start_time = TimeSpan.Parse(spickup_start_time);
            model.pickup_start_time = pickup_start_time;
            model.pickup_time = pickup_time;
            model.remark = context.Request.Params["remark"];
            //model.update_by
            //model.update_date 
            
            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = model.id > 0?bll.Update(model):bll.Add(model); 
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