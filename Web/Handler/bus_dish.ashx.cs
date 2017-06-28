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
            public int id { get; set; }
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
                case "addDishSize":
                    sb.Append(addDishSize(context));
                    break;
                case "getDishSize":
                    sb.Append(getDishSize(context));
                    break;
                case "deleteDishSize":
                    sb.Append(deleteDishSize(context));
                    break;

                case "getSysConstantDetailById":
                    sb.Append(getSysConstantDetailById(context));
                    break;


                default:
                    sb.Append("");
                    break;
            }
            context.Response.Write(sb.ToString());
        }

        private string getSysConstantDetailById(HttpContext context)
        {
            int id = int.Parse(context.Request.Params["id"]);
            WK.BLL.sys_constant_detail bll = new WK.BLL.sys_constant_detail();
            return Newtonsoft.Json.JsonConvert.SerializeObject(bll.GetModel(id));
        }

        private string getDataList(HttpContext context)
        {
            int market_id = int.Parse(context.Request.Params["market_id"]);
            int pageIndex = int.Parse(context.Request.Params["pageIndex"]);
            int pageSize = int.Parse(context.Request.Params["pageSize"]);

            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            //strWhere.Append("is_delete = 0 or is_delete is NULL");
            strWhere.AppendFormat(" and market_id = {0}", market_id);
            StringBuilder orderby = new StringBuilder();

           
            int startIndex = 0;
            if (pageIndex >= 0)
            {
                startIndex = pageSize * pageIndex;
            }

            WK.BLL.bus_dish bll = new WK.BLL.bus_dish();
            ds = bll.GetListByPageInfo(strWhere.ToString(), orderby.ToString(), startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }

        private string getListCount(HttpContext context)
        {
            int market_id = int.Parse(context.Request.Params["market_id"]);
            StringBuilder sb = new StringBuilder();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            //strWhere.Append("is_delete = 0 or is_delete is NULL");
            strWhere.AppendFormat(" and market_id = {0}", market_id);
            WK.BLL.bus_dish bll = new WK.BLL.bus_dish();
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
            WK.BLL.bus_dish bll = new WK.BLL.bus_dish();
            WK.Model.bus_dish model = bll.GetModel(int.Parse(id));

            #region 菜品规格
            List<WK.Model.bus_dish_size> listSize = new List<Model.bus_dish_size>();
            WK.BLL.bus_dish_size sizeBll = new BLL.bus_dish_size();
            StringBuilder sizeWhere = new StringBuilder();
            sizeWhere.Append(" is_delete != 1");
            sizeWhere.AppendFormat(" and dish_id  = {0}", id);
            DataSet dsSize =  sizeBll.GetList(sizeWhere.ToString());
            string dishSizeList = string.Empty;
            if (dsSize != null 
                && dsSize.Tables.Count > 0 
                && dsSize.Tables[0].Rows.Count > 0)
            {
                int sizeCount = dsSize.Tables[0].Rows.Count;
                for (int i = 0; i < sizeCount; i++)
                {
                    WK.Model.bus_dish_size sizeModel = new Model.bus_dish_size();
                    sizeModel.id = int.Parse(dsSize.Tables[0].Rows[i]["id"].ToString());
                    sizeModel.affect_price = decimal.Parse(dsSize.Tables[0].Rows[i]["affect_price"].ToString());
                    sizeModel.dish_id = int.Parse(dsSize.Tables[0].Rows[i]["dish_id"].ToString());
                    sizeModel.name = dsSize.Tables[0].Rows[i]["name"].ToString();
                    listSize.Add(sizeModel);
                }
            }
            model.listSize = listSize;
            #endregion

            #region 图片
            List<WK.Model.bus_image> listImage = new List<Model.bus_image>();
            WK.BLL.bus_image imageBll = new BLL.bus_image();
            StringBuilder imageWhere = new StringBuilder();
            imageWhere.Append(" is_delete != 1");
            imageWhere.AppendFormat(" and correlation_id  = {0}", id);
            imageWhere.AppendFormat(" and bus_type   = {0}", 2);
            DataSet dsImage = new DataSet();
            dsImage = imageBll.GetList(imageWhere.ToString());
            string imageList = string.Empty;
            if (dsImage != null && dsImage.Tables.Count > 0 && dsImage.Tables[0].Rows.Count > 0)
            {
                int imageCount = dsImage.Tables[0].Rows.Count;
                for (int i = 0; i < imageCount; i++)
                {
                    WK.Model.bus_image imageModel = new Model.bus_image();
                    imageModel.bus_type = int.Parse(dsImage.Tables[0].Rows[i]["bus_type"].ToString());
                    imageModel.correlation_id = int.Parse(dsImage.Tables[0].Rows[i]["correlation_id"].ToString());
                    imageModel.img_type = int.Parse(dsImage.Tables[0].Rows[i]["img_type"].ToString());
                    imageModel.sort =   int.Parse(dsImage.Tables[0].Rows[i]["sort"].ToString());
                    imageModel.url = dsImage.Tables[0].Rows[i]["url"].ToString(); 
                    listImage.Add(imageModel);
                }
            }
            model.listImage = listImage;
            #endregion
            return Newtonsoft.Json.JsonConvert.SerializeObject(model);
        }

        private string editData(HttpContext context)
        {
            ReturnInfo returnInfo = new ReturnInfo();
            try
            {
                WK.Model.bus_dish model = new Model.bus_dish();
                int id = 0;
                if (context.Request.Params["id"] != null && context.Request.Params["id"].ToString() != "")
                {
                    id = int.Parse(context.Request.Params["id"]);
                }
                model.id = id;
                //model.create_by
                //model.create_date
                model.description_cn = context.Request.Params["description_cn"];
                model.description_en = context.Request.Params["description_en"];
                model.discount_price = decimal.Parse(context.Request.Params["discount_price"]);
                model.dish_tag = context.Request.Params["dish_tag"];//
                model.dish_time = int.Parse(context.Request.Params["dish_time"]);//菜品提供的时间，1周末2工作日3全周
                model.eat_type = int.Parse(context.Request.Params["eat_type"]);//1午餐2晚餐3所有
                model.is_delete = 0;
                model.market_id = int.Parse(context.Request.Params["market_id"]);
                model.name_cn = context.Request.Params["name_cn"];
                model.name_en = context.Request.Params["name_en"];
                model.original_price = decimal.Parse(context.Request.Params["original_price"]);
                model.remark = context.Request.Params["remark"];
                model.sales_total = int.Parse(context.Request.Params["sales_total"]);
                model.sort = int.Parse(context.Request.Params["sort"]);
                model.status = int.Parse(context.Request.Params["status"]);//1启用 2停用
                //model.update_by
                //model.update_date 

                WK.BLL.bus_dish bll = new WK.BLL.bus_dish();
                id = model.id > 0 ? model.id : bll.GetMaxId();

                returnInfo.isSuccess = model.id > 0 ? bll.Update(model) : bll.Add(model);
                returnInfo.id = id;

                #region 菜品规格
                string dishSizeList = string.Empty;
                if (context.Request.Params["dishSizeList"] != null)
                {
                    dishSizeList = context.Request.Params["dishSizeList"].ToString();
                }
                if (dishSizeList != "")
                {
                    WK.BLL.bus_dish_size sizeBll = new BLL.bus_dish_size();
                    StringBuilder sizeWhere = new StringBuilder();
                    sizeWhere.Append(" is_delete != 1");
                    sizeWhere.AppendFormat(" and dish_id  = {0}", id);
                    DataSet dsSize = sizeBll.GetList(sizeWhere.ToString());
                    if (dsSize != null
                        && dsSize.Tables.Count > 0
                        && dsSize.Tables[0].Rows.Count > 0)
                    {
                        int dsSizeCount = dsSize.Tables[0].Rows.Count;
                        for (int i = 0; i < dsSizeCount; i++)
                        {
                            int sizeId = int.Parse(dsSize.Tables[0].Rows[i]["id"].ToString());
                            sizeBll.Delete(sizeId);
                        }
                    }

                    Object anArray = Newtonsoft.Json.JsonConvert.DeserializeObject(dishSizeList);
                    int dishSizeListCount = ((Newtonsoft.Json.Linq.JContainer)(anArray)).Count;
                    for (int i = 0; i < dishSizeListCount; i++)
                    {
                        string name = ((Newtonsoft.Json.Linq.JContainer)(anArray))[i]["name"].ToString();
                        string affect_price = ((Newtonsoft.Json.Linq.JContainer)(anArray))[i]["affect_price"].ToString();
                        WK.Model.bus_dish_size sizeModel = new Model.bus_dish_size();
                        sizeModel.affect_price = decimal.Parse(affect_price);
                        sizeModel.dish_id = id;
                        sizeModel.is_delete = 0;
                        sizeModel.name = name;
                        sizeBll.Add(sizeModel);
                    }
                }
                #endregion

                #region 图片
                string listImage = string.Empty;
                if (context.Request.Params["listImage"] != null)
                {
                    listImage = context.Request.Params["listImage"].ToString();
                }
                if (listImage != "")
                {
                    WK.BLL.bus_image imageBll = new BLL.bus_image();
                    StringBuilder imageWhere = new StringBuilder();
                    imageWhere.Append(" is_delete != 1");
                    imageWhere.AppendFormat(" and correlation_id  = {0}", id);
                    imageWhere.AppendFormat(" and bus_type   = {0}", 2);
                    DataSet dsImage = new DataSet();
                    dsImage = imageBll.GetList(imageWhere.ToString());
                    string imageList = string.Empty;
                    if (dsImage != null && dsImage.Tables.Count > 0 && dsImage.Tables[0].Rows.Count > 0)
                    {
                        int imageCount = dsImage.Tables[0].Rows.Count;
                        for (int i = 0; i < imageCount; i++)
                        {
                            int imageId = int.Parse(dsImage.Tables[0].Rows[i]["id"].ToString());
                            imageBll.Delete(imageId);
                        }
                    }

                    Object imageArray = Newtonsoft.Json.JsonConvert.DeserializeObject(listImage);
                    int listImageCount = ((Newtonsoft.Json.Linq.JContainer)(imageArray)).Count;
                    for (int i = 0; i < listImageCount; i++)
                    {
                        string url = ((Newtonsoft.Json.Linq.JContainer)(imageArray))[i]["url"].ToString();
                        WK.Model.bus_image imageModel = new Model.bus_image();
                        imageModel.bus_type = 2;
                        imageModel.correlation_id = id;
                        imageModel.img_type = 1;
                        imageModel.sort = i + 1;
                        imageModel.url = url;
                        imageBll.Add(imageModel);
                    }
                }
                #endregion
            }
            catch{
                returnInfo.isSuccess = false;
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }

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

        private string addDishSize(HttpContext context)
        {
            WK.Model.bus_dish_size model = new Model.bus_dish_size();
            model.affect_price = decimal.Parse(context.Request.Params["affect_price"]);
            model.dish_id = int.Parse(context.Request.Params["dish_id"]);
            model.is_delete = 0;
            model.name = context.Request.Params["name"].ToString();

            WK.BLL.bus_dish_size bll = new WK.BLL.bus_dish_size(); 
            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess =  bll.Add(model);
            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }

        private string getDishSize(HttpContext context)
        {
            int dish_id = int.Parse(context.Request.Params["dish_id"]);  
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            strWhere.AppendFormat(" and dish_id = {0}", dish_id); 
            WK.BLL.bus_dish_size bll = new WK.BLL.bus_dish_size();
            ds = bll.GetList(strWhere.ToString());
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }

        private string deleteDishSize(HttpContext context)
        {
            ReturnInfo returnInfo = new ReturnInfo();
            returnInfo.isSuccess = false;
            WK.BLL.bus_dish_size bll = new WK.BLL.bus_dish_size();
            int id = int.Parse(context.Request.Params["id"]);
            if (id > 0)
            {
                WK.Model.bus_dish_size model = bll.GetModel(id);
                model.is_delete = 1;
                returnInfo.isSuccess = bll.Update(model);
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(returnInfo);
        }



    }
}