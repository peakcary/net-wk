using System;
using System.Data;
using System.Text;
using System.Web;
using System.Collections.Generic;

namespace WK.Web.Handler
{
    /// <summary>
    /// bus_order 的摘要说明
    /// </summary>
    public class bus_order : IHttpHandler
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
        [Serializable]
        public class ImageObj
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
                case "getListCount":
                    sb.Append(getListCount(context));
                    break;
                case "getDataList":
                    sb.Append(getDataList(context));
                    break;

                case "getListByQuery":
                    sb.Append(getListByQuery(context));
                    break;
                case "getDataDetail":
                    sb.Append(getDataDetailExtend(context));
                    break;
                case "getOrderDishList":
                    sb.Append(getOrderDishList(context));
                    break;
                case "getAllOrderListByQuery":
                    sb.Append(getAllOrderListByQuery(context));
                    break;


                    

                    
                default:
                    sb.Append("");
                    break;
            }
            context.Response.Write(sb.ToString());
        }

        

        private string getDataDetailExtend(HttpContext context)
        {
            string id = "";
            if (context.Request.Params["id"] != null)
            {
                id = context.Request.Params["id"];
            }
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            DataSet ds  = bll.GetDetailExtend(int.Parse(id));

            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]); 
        }

        private string getDataDetail(HttpContext context)
        {
            string id = "";
            if (context.Request.Params["id"] != null)
            {
                id = context.Request.Params["id"];
            }
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            WK.Model.bus_order model = bll.GetModel(int.Parse(id));
             

            return Newtonsoft.Json.JsonConvert.SerializeObject(model);
        }

        private string getListCount(HttpContext context)
        {
            StringBuilder sb = new StringBuilder();
            StringBuilder strWhere = new StringBuilder();
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            Record r = new Record();
            r.RecordCount = bll.GetListCount(strWhere.ToString());
            return Newtonsoft.Json.JsonConvert.SerializeObject(r);
        }

        private string getDataList(HttpContext context)
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

            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            ds = bll.GetListByPageInfo(strWhere.ToString(), orderby.ToString(), startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }
        
        private string getListByQuery(HttpContext context)
        {
            string order_code=string.Empty;
            if (context.Request.Params["order_code"] != null && context.Request.Params["order_code"].ToString() != "")
            {
                order_code = context.Request.Params["order_code"].ToString();
            }
            int user_id=0;
            if (context.Request.Params["user_id"] != null && context.Request.Params["user_id"].ToString() != "")
            {
                user_id = int.Parse(context.Request.Params["user_id"].ToString());
            }
            int order_status=0;
            if (context.Request.Params["order_status"] != null && context.Request.Params["order_status"].ToString() != "")
            {
                order_status = int.Parse(context.Request.Params["order_status"].ToString());
            }
            int pay_status=0;
            if (context.Request.Params["pay_status"] != null && context.Request.Params["pay_status"].ToString() != "")
            {
                pay_status = int.Parse(context.Request.Params["pay_status"].ToString());
            }
            int eat_type=0;
            if (context.Request.Params["eat_type"] != null && context.Request.Params["eat_type"].ToString() != "")
            {
                eat_type = int.Parse(context.Request.Params["eat_type"].ToString());
            }
            int minDays=0;
            if (context.Request.Params["minDays"] != null && context.Request.Params["minDays"].ToString() != "")
            {
                minDays = int.Parse(context.Request.Params["minDays"].ToString());
            }
            int isDiscount=0;
            if (context.Request.Params["isDiscount"] != null && context.Request.Params["isDiscount"].ToString() != "")
            {
                isDiscount = int.Parse(context.Request.Params["isDiscount"].ToString());
            }
             

            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            
             

            int pageIndex = int.Parse(context.Request.Params["pageIndex"]);
            int pageSize = int.Parse(context.Request.Params["pageSize"]);
            int startIndex = 0;
            if (pageIndex >= 0)
            {
                startIndex = pageSize * pageIndex;
            }

            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            ds = bll.GetListByQuery(order_code, user_id, order_status, pay_status, eat_type, minDays, isDiscount, startIndex, pageSize);
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }

        private string getOrderDishList(HttpContext context)
        {
            int order_id = int.Parse(context.Request.Params["order_id"]);
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            StringBuilder strWhere = new StringBuilder();
            strWhere.Append(" is_delete != 1");
            strWhere.AppendFormat(" and order_id = {0}", order_id); 
             

            WK.BLL.bus_order_dish bll = new WK.BLL.bus_order_dish();
            ds = bll.GetList(strWhere.ToString());
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }


        private string getAllOrderListByQuery(HttpContext context)
        {
            string order_code = string.Empty;
            if (context.Request.Params["order_code"] != null && context.Request.Params["order_code"].ToString() != "")
            {
                order_code = context.Request.Params["order_code"].ToString();
            }
            int user_id = 0;
            if (context.Request.Params["user_id"] != null && context.Request.Params["user_id"].ToString() != "")
            {
                user_id = int.Parse(context.Request.Params["user_id"].ToString());
            }
            int order_status = 0;
            if (context.Request.Params["order_status"] != null && context.Request.Params["order_status"].ToString() != "")
            {
                order_status = int.Parse(context.Request.Params["order_status"].ToString());
            }
            int pay_status = 0;
            if (context.Request.Params["pay_status"] != null && context.Request.Params["pay_status"].ToString() != "")
            {
                pay_status = int.Parse(context.Request.Params["pay_status"].ToString());
            }
            int eat_type = 0;
            if (context.Request.Params["eat_type"] != null && context.Request.Params["eat_type"].ToString() != "")
            {
                eat_type = int.Parse(context.Request.Params["eat_type"].ToString());
            }
            int minDays = 0;
            if (context.Request.Params["minDays"] != null && context.Request.Params["minDays"].ToString() != "")
            {
                minDays = int.Parse(context.Request.Params["minDays"].ToString());
            }
            int isDiscount = 0;
            if (context.Request.Params["isDiscount"] != null && context.Request.Params["isDiscount"].ToString() != "")
            {
                isDiscount = int.Parse(context.Request.Params["isDiscount"].ToString());
            }


            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();



            int pageIndex = int.Parse(context.Request.Params["pageIndex"]);
            int pageSize = int.Parse(context.Request.Params["pageSize"]);
            int startIndex = 0;
            if (pageIndex >= 0)
            {
                startIndex = pageSize * pageIndex;
            }

            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            ds = bll.GetListByQuery(order_code, user_id, order_status, pay_status, eat_type, minDays, isDiscount, startIndex, pageSize);
            List<Model.bus_order> listOrder = new List<Model.bus_order>();
            if (ds != null)
            {
                DataTable dt = ds.Tables[0];
                int dtRowsCount = dt.Rows.Count;
                for (int i = 0; i < dtRowsCount; i++)
                {
                    DataRow dr = dt.Rows[i];
                    
                    Model.bus_order orderModel = new Model.bus_order();
                    orderModel.id = int.Parse(dr["id"].ToString());
                    orderModel.consignee_name = dr["consignee_name"].ToString();
                    orderModel.consignee_phone = dr["consignee_phone"].ToString();

                    //orderModel.create_by = dr["create_by"] == null ? 0 : int.Parse(dr["create_by"].ToString());
                    orderModel.create_date = DateTime.Parse(dr["create_date"].ToString());
                    orderModel.dilivery_user_id =int.Parse( dr["dilivery_user_id"].ToString());
                    orderModel.dish_time = int.Parse(dr["dilivery_user_id"].ToString());
                    orderModel.eat_type = int.Parse(dr["eat_type"].ToString());
                    orderModel.meal_num = int.Parse(dr["meal_num"].ToString());
                    orderModel.order_code = dr["order_code"].ToString();
                    orderModel.order_status =int.Parse( dr["order_status"].ToString());
                    orderModel.pay_status =int.Parse( dr["pay_status"].ToString());
                    orderModel.pay_type = int.Parse(dr["pay_status"].ToString());
                    orderModel.pickup_address_id = int.Parse(dr["pickup_address_id"].ToString());
                    orderModel.pickup_date = DateTime.Parse(dr["pickup_date"].ToString());
                    orderModel.pickup_end_time = DateTime.Parse(dr["pickup_end_time"].ToString());
                    orderModel.pickup_start_time = DateTime.Parse(dr["pickup_start_time"].ToString());
                    orderModel.remark = dr["remark"].ToString();
                    orderModel.total_plan_price = decimal.Parse(dr["total_plan_price"].ToString());
                    orderModel.total_real_price = decimal.Parse(dr["total_real_price"].ToString());
                    //orderModel.update_by = dr["create_by"] == null ? 0 : int.Parse(dr["total_real_price"].ToString());
                    orderModel.update_date = DateTime.Parse(dr["update_date"].ToString());
                    orderModel.user_id = int.Parse(dr["user_id"].ToString());

                    WK.BLL.bus_order_discount orderDiscountBll = new BLL.bus_order_discount();
                    Model.bus_order_discount orderDiscount = new Model.bus_order_discount();
                    StringBuilder strWhereOrderDiscount = new StringBuilder();
                    strWhereOrderDiscount.Append(" is_delete != 1");
                    strWhereOrderDiscount.AppendFormat(" and order_id = {0}", orderModel.id);
                    DataSet dsOrderDiscount = orderDiscountBll.GetList(strWhereOrderDiscount.ToString());
                    if (dsOrderDiscount != null)
                    {
                        DataTable dtOrderDiscount = dsOrderDiscount.Tables[0];
                        if (dtOrderDiscount != null && dtOrderDiscount.Rows.Count > 0)
                         {
                             int drOrderDiscountRowsCount = dtOrderDiscount.Rows.Count;

                             for (int j = 0; j < drOrderDiscountRowsCount; j++)
                             {
                                 DataRow drOrderDiscount = dtOrderDiscount.Rows[j];
                                 orderDiscount.discount_desc = drOrderDiscount["discount_desc"].ToString();
                                 orderDiscount.discount_id =int.Parse( drOrderDiscount["discount_id"].ToString());
                                 
                             }
                         }
                    }
                    orderModel.orderDiscount = orderDiscount;
                     
                    List<Model.bus_order_dish> listOrderDish = new List<Model.bus_order_dish>();
                    StringBuilder strWhereOrderDish = new StringBuilder();
                    strWhereOrderDish.Append(" is_delete != 1");
                    strWhereOrderDish.AppendFormat(" and order_id = {0}", orderModel.id);  
                    WK.BLL.bus_order_dish bllOrderDish = new WK.BLL.bus_order_dish();
                    DataSet dsOrderDish = bllOrderDish.GetList(strWhereOrderDish.ToString());
                    if (dsOrderDish != null)
                    {
                        DataTable dtOrderDish = dsOrderDish.Tables[0];
                        if (dtOrderDish != null && dtOrderDish.Rows.Count>0)
                        {
                            int dtOrderDishRowsCount = dtOrderDish.Rows.Count;

                            for (int j = 0; j < dtOrderDishRowsCount; j++)
                            {
                                DataRow drOrderDish = dtOrderDish.Rows[j];
                                
                                Model.bus_order_dish orderDishModel = new Model.bus_order_dish();
                                orderDishModel.id =  int.Parse(drOrderDish["id"].ToString());
                                orderDishModel.count = int.Parse(drOrderDish["count"].ToString());
                                //orderDishModel.create_by =drOrderDish["create_by"]==null?0: int.Parse(drOrderDish["create_by"].ToString());
                                orderDishModel.create_date = DateTime.Parse(drOrderDish["create_date"].ToString());
                                orderDishModel.dish_id = int.Parse(drOrderDish["dish_id"].ToString());
                                orderDishModel.dish_name_cn = drOrderDish["dish_name_cn"].ToString();
                                orderDishModel.dish_name_en = drOrderDish["dish_name_en"].ToString();
                                orderDishModel.market_id = int.Parse(drOrderDish["market_id"].ToString());
                                orderDishModel.market_name_cn = drOrderDish["market_name_cn"].ToString();
                                orderDishModel.market_name_en = drOrderDish["market_name_en"].ToString();
                                orderDishModel.order_id = int.Parse(drOrderDish["order_id"].ToString());
                                orderDishModel.order_status = int.Parse(drOrderDish["order_status"].ToString());
                                orderDishModel.remark = drOrderDish["remark"].ToString();
                                orderDishModel.size_list = drOrderDish["size_list"].ToString();
                                orderDishModel.total_discount_price = decimal.Parse(drOrderDish["total_discount_price"].ToString());
                                orderDishModel.total_original_price = decimal.Parse(drOrderDish["total_original_price"].ToString());
                                orderDishModel.unit_discount_price = decimal.Parse(drOrderDish["unit_discount_price"].ToString());
                                orderDishModel.unit_original_price = decimal.Parse(drOrderDish["unit_original_price"].ToString());
                                //orderDishModel.update_by =drOrderDish["update_by"]!=null? int.Parse(drOrderDish["update_by"].ToString()):0;
                                orderDishModel.update_date = DateTime.Parse(drOrderDish["update_date"].ToString());
                                listOrderDish.Add(orderDishModel);
                            }
                        }
                    }
                    orderModel.listOrderDish = listOrderDish;

                    listOrder.Add(orderModel);
                }
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(listOrder);
        }
    
    }
}