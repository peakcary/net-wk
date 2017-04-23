﻿using System;
using System.Data;
using System.Text;
using System.Web;
using Maticsoft.DBUtility;

namespace WK.Web.Handler
{
    /// <summary>
    /// bus_deadline 的摘要说明
    /// </summary>
    public class bus_deadline : IHttpHandler
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
                case "deleteRData":
                    sb.Append(deleteData(context));
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

            WK.BLL.bus_deadline bll = new WK.BLL.bus_deadline();
            ds = bll.GetListByPageInfo(strWhere.ToString(), orderby.ToString(), startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }
         
        private string getListCount(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            StringBuilder strWhere = new StringBuilder();
            WK.BLL.bus_deadline bll = new WK.BLL.bus_deadline();
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
            WK.BLL.bus_deadline bll = new WK.BLL.bus_deadline();
            WK.Model.bus_deadline model = bll.GetModel(int.Parse(id));
             
            return Newtonsoft.Json.JsonConvert.SerializeObject(model);
        }
         
        private string editData(HttpContext context)
        {  
            WK.Model.bus_deadline model = new Model.bus_deadline(); 
            int id = 0;
            if (context.Request.Params["id"] != "")
            {
                id = int.Parse(context.Request.Params["id"]);
            }
            model.id = id;
            //model.create_by
            //model.create_date
            model.deadline_days = int.Parse(context.Request.Params["deadline_days"]);
            model.deadline_time_type = int.Parse(context.Request.Params["deadline_time_type"]);
            model.deadline_times = DateTime.Parse(context.Request.Params["deadline_times"]);
            model.eat_type = int.Parse(context.Request.Params["eat_type"]);
            model.is_delete = 0;
            //model.remark = context.Request.Params["remark"]; 
            //model.update_by
            //model.update_date 

            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = false;
            WK.BLL.bus_deadline bll = new WK.BLL.bus_deadline();
            returnInfo.isSuccess = model.id > 0 ? bll.Update(model) : bll.Add(model); 
            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }
           
         
        private string deleteData(HttpContext context)
        {
            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = false;
            WK.BLL.bus_deadline bll = new WK.BLL.bus_deadline();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                WK.Model.bus_deadline model = bll.GetModel(id);
                model.is_delete = 1;
                returnInfo.isSuccess = bll.Update(model);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }

        
    }
}