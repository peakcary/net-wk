﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;

namespace WK.Web.Handler
{
    /// <summary>
    /// bus_area 的摘要说明
    /// </summary>
    public class bus_area : IHttpHandler
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
            WK.BLL.bus_area bll = new WK.BLL.bus_area();
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
            WK.BLL.bus_area bll = new WK.BLL.bus_area();
            WK.Model.bus_area model = bll.GetModel(int.Parse(id));
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

            WK.Model.bus_area model = new Model.bus_area();
            model.area_type = int.Parse(context.Request.Params["area_type"]);
            model.lat = decimal.Parse( context.Request.Params["lat"]);
            model.lon = decimal.Parse(context.Request.Params["lon"]);
            model.name = context.Request.Params["name"];
            model.parent_id = int.Parse( context.Request.Params["parent_id"]);
            model.remark = context.Request.Params["remark"];

            WK.BLL.bus_area bll = new WK.BLL.bus_area();
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
            WK.BLL.bus_area bll = new WK.BLL.bus_area();
            int id = int.Parse(context.Request.Params["id"]);
            if (id  > 0)
            {
                returnInfo.isSuccess = bll.Delete(id);
            } 

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }

        

        
    }
}