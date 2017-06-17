using System;
using System.Data;
using System.Text;
using MySql.Data.MySqlClient;
using Maticsoft.DBUtility;//Please add references
namespace WK.DAL
{
    public partial class bus_order
    {

        public DataSet GetDetailExtend(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select a.*,b.*,c.nickname as userName,d.address,d.name as pickupName,e.discount_desc  ");
            strSql.Append(" from bus_order a ");
            strSql.Append(" LEFT JOIN bus_order_discount b on b.order_id = a.id ");
            strSql.Append(" left JOIN bus_user c on c.id = a.user_id ");
            strSql.Append(" LEFT JOIN bus_pickup_address d on d.id = a.pickup_address_id ");
            strSql.Append(" left join bus_order_discount e on e.order_id = a.id ");
            strSql.AppendFormat(" where a.id = {0} ",id);
            return DbHelperMySQL.Query(strSql.ToString());
        }
        public int GetListCountByAllUser()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT COUNT(DISTINCt user_id) ");
            strSql.Append(" from bus_order  a ");
            strSql.Append(" LEFT JOIN bus_user b on b.id = a.user_id ");
            DataSet ds = DbHelperMySQL.Query(strSql.ToString());
            return ds == null ? 0 : Convert.ToInt32(ds.Tables[0].Rows[0][0]); 
        }

        public int GetListCountByYesterdayCreateUser()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT COUNT(DISTINCt user_id) ");
            strSql.Append(" from bus_order  a ");
            strSql.Append(" LEFT JOIN bus_user b on b.id = a.user_id ");
            strSql.Append(" WHERE DATE(b.create_date) = DATE_ADD(CURDATE(),interval -1 day) ");
            DataSet ds = DbHelperMySQL.Query(strSql.ToString());
            return ds == null ? 0 : Convert.ToInt32(ds.Tables[0].Rows[0][0]); 
        }


        public int GetListCountByTomorrowEattype(int eatType)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT count(id) from bus_order ");
            strSql.Append(" WHERE DATE(create_date) = DATE_ADD(CURDATE(),interval 1 day) ");
            strSql.AppendFormat(" and eat_type={0} ", eatType);
            DataSet ds = DbHelperMySQL.Query(strSql.ToString());
            return ds == null ? 0 : Convert.ToInt32(ds.Tables[0].Rows[0][0]); 
        }

        public DataSet GetDateList(int minDays)
        { 
            //StringBuilder strSql = new StringBuilder();
            //strSql.Append(" SELECT COUNT(id) as ct,DATE_FORMAT(create_date, '%Y-%m-%d %H-%i-%s') as dt  from bus_order ");
            //strSql.AppendFormat(" where create_date BETWEEN   DATE_ADD(CURDATE(),interval {0} day) and CURDATE()", -minDays);
            //strSql.Append(" GROUP BY DATE_FORMAT(create_date, '%Y-%m-%d %H-%i-%s') ");
            //return DbHelperMySQL.Query(strSql.ToString());
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT COUNT(id) as ct,DATE_FORMAT(create_date, '%Y-%m-%d') as dt  from bus_order ");
            strSql.AppendFormat(" where create_date BETWEEN   DATE_ADD(CURDATE(),interval {0} day) and CURDATE()", -minDays);
            strSql.Append(" GROUP BY DATE_FORMAT(create_date, '%Y-%m-%d') ");
            return DbHelperMySQL.Query(strSql.ToString());
        }

        public DataSet GetPersonList(int minDays)
        {
            //StringBuilder strSql = new StringBuilder();
            //strSql.Append(" SELECT count(DISTINCT user_id) as ct,DATE_FORMAT(create_date, '%Y-%m-%d') as dt  from bus_order ");
            //strSql.AppendFormat(" where create_date BETWEEN  DATE_ADD(CURDATE(),interval {0} day) and CURDATE()  ", -minDays);
            //strSql.Append(" GROUP BY DATE_FORMAT(create_date, '%Y-%m-%d') ");
            //return DbHelperMySQL.Query(strSql.ToString());
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT count(DISTINCT user_id) as ct,DATE_FORMAT(create_date, '%Y-%m-%d') as dt  from bus_order ");
            strSql.AppendFormat(" where create_date BETWEEN  DATE_ADD(CURDATE(),interval {0} day) and CURDATE()  ", -minDays);
            strSql.Append(" GROUP BY DATE_FORMAT(create_date, '%Y-%m-%d') ");
            return DbHelperMySQL.Query(strSql.ToString());
        }

        public DataSet GetPriceList(int minDays)
        {
            //StringBuilder strSql = new StringBuilder();
            //strSql.Append(" SELECT sum(total_real_price) as ct,DATE_FORMAT(create_date, '%Y-%m-%d %H-%i-%s') as dt  from bus_order ");
            //strSql.AppendFormat(" where create_date BETWEEN  DATE_ADD(CURDATE(),interval {0} day) and  CURDATE() ", -minDays);
            //strSql.Append(" GROUP BY DATE_FORMAT(create_date, '%Y-%m-%d %H-%i-%s') ");
            //return DbHelperMySQL.Query(strSql.ToString());
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT sum(total_real_price) as ct,DATE_FORMAT(create_date, '%Y-%m-%d') as dt  from bus_order ");
            strSql.AppendFormat(" where create_date BETWEEN  DATE_ADD(CURDATE(),interval {0} day) and  CURDATE() ", -minDays);
            strSql.Append(" GROUP BY DATE_FORMAT(create_date, '%Y-%m-%d') ");
            return DbHelperMySQL.Query(strSql.ToString());
        }

        public DataSet GetListByQuery(string order_code, int user_id, int order_status, int pay_status, int eat_type, int minDays, int isDiscount, int startIndex, int endIndex, int pickup_address_id, string phone_num, string consignee_phone, string order_com, string order_sc)
        {
            //SELECT a.*
            //FROM bus_order a
            //LEFT JOIN bus_order_discount b on b.order_id = a.id
            //where 1=1
            //and a.order_code = '0001201704180011' /*订单号*/
            //and a.user_id = 1  /*用户ID*/
            //and a.order_status = 1 /*订单状态 1已预订 2待取餐 3待送达 4已完成 5已退单 6申请退单*/
            //and a.pay_status = 1 /*支付状态 1已支付 2未支付*/
            //and a.eat_type = 1 /*饭餐类型 1午餐 2晚餐*/
            //and a.create_date BETWEEN CURDATE() and DATE_ADD(CURDATE(),interval 1 day)
            //and b.id is not null /*是否有赠品*/
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT a.id as orderId, a.*,b.id as dicountId,c.id as diliveryUserId,c.nickname,d.name as pickupAddressName ,e.charge_id ");
            strSql.Append(" FROM bus_order a ");
            strSql.Append(" LEFT JOIN bus_order_discount b on b.order_id = a.id and b.is_delete!=1 ");
            strSql.Append(" left join bus_user c on c.id = a.dilivery_user_id and c.is_delete!=1 ");
            strSql.Append(" LEFT JOIN bus_pickup_address d on d.id = a.pickup_address_id and d.is_delete!=1 ");

            strSql.Append(" LEFT JOIN bus_stripe_pay e on e.order_id = a.id and e.is_delete!=1 ");
            strSql.Append(" where a.is_delete!=1 ");
            if (order_code != string.Empty)
            {
                strSql.AppendFormat(" and a.order_code ='{0}'", order_code);
            }
            if (user_id != 0)
            {
                strSql.AppendFormat(" and a.user_id ={0}", user_id);
            }
            if (pickup_address_id != 0)
            {
                strSql.AppendFormat(" and a.pickup_address_id ={0}", pickup_address_id);
            }
            
            if (order_status != 0)
            {
                strSql.AppendFormat(" and a.order_status ={0}", order_status);
            }
            if (pay_status != 0)
            {
                strSql.AppendFormat(" and a.pay_status ={0}", pay_status);
            }
            if (eat_type != 0)
            {
                strSql.AppendFormat(" and a.eat_type ={0}", eat_type);
            }
            if (minDays != -1)
            {
                strSql.AppendFormat(" and a.create_date BETWEEN CURDATE() and DATE_ADD(CURDATE(),interval {0} day)", minDays);
            }
            if (isDiscount != 0)
            {
                if (isDiscount==1)
                {
                    strSql.AppendFormat(" and b.id is not null ");
                }
                else
                {
                    strSql.AppendFormat(" and b.id is  null ");
                } 
            }
            if (phone_num != "")
            {
                strSql.AppendFormat(" and c.phone_num ='{0}'", phone_num);
            }
            if (consignee_phone != "")
            {
                strSql.AppendFormat(" and a.consignee_phone ='{0}'", consignee_phone);
            }

            if (order_com != "" &&　order_sc　 != "")
            {
                if (order_com == "create_date") {
                    strSql.Append(" order by a.create_date  " + order_sc);
                }
                if (order_com == "total_real_price") {
                    strSql.Append(" order by a.total_real_price  " + order_sc);
                }
                if (order_com == "order_status")
                {
                    strSql.Append(" order by a.order_status  " + order_sc);
                }
                if (order_com == "consignee_name")
                {
                    strSql.Append(" order by a.consignee_name  " + order_sc);
                }
                if (order_com == "nickname")
                {
                    strSql.Append(" order by c.nickname  " + order_sc);
                }
                
                
            }

            　


           
            strSql.AppendFormat("  LIMIT  {0},{1}", startIndex, endIndex);
            
            return DbHelperMySQL.Query(strSql.ToString());
        }

        public DataSet GetMarketOrderList(string order_code, int user_id, int order_status, int pay_status, int eat_type, int minDays, int isDiscount, int startIndex, int endIndex)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT a.id as orderId, a.*,b.id as orderDishId, b.*,c.id as marketId,c.* ");
            strSql.Append(" FROM bus_order a ");
            strSql.Append(" left join bus_order_dish b on b.order_id = a.id and b.is_delete!=1 ");
            strSql.Append(" left JOIN bus_market c on c.id = b.market_id and c.is_delete!=1 ");
            strSql.Append(" where a.is_delete !=1 and  c.id is not null ");
            if (order_code != string.Empty)
            {
                strSql.AppendFormat(" and a.order_code ='{0}'", order_code);
            }
            if (user_id != 0)
            {
                strSql.AppendFormat(" and a.user_id ={0}", user_id);
            }
            if (order_status != 0)
            {
                strSql.AppendFormat(" and a.order_status ={0}", order_status);
            }
            if (pay_status != 0)
            {
                strSql.AppendFormat(" and a.pay_status ={0}", pay_status);
            }
            if (eat_type != 0)
            {
                strSql.AppendFormat(" and a.eat_type ={0}", eat_type);
            }
            if (minDays != -1)
            {
                strSql.AppendFormat(" and a.create_date BETWEEN CURDATE() and DATE_ADD(CURDATE(),interval {0} day)", minDays);
            }
            if (isDiscount != 0)
            {
                if (isDiscount == 1)
                {
                    strSql.AppendFormat(" and b.id is not null ");
                }
                else
                {
                    strSql.AppendFormat(" and b.id is  null ");
                }

            }
            strSql.AppendFormat("  LIMIT  {0},{1}", startIndex, endIndex);
            return DbHelperMySQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPageInfo(string strWhere, string orderby, int startIndex, int endIndex)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM bus_order ");
            if (!string.IsNullOrEmpty(strWhere.Trim()))
            {
                strSql.Append(" WHERE " + strWhere);
            }
            if (!string.IsNullOrEmpty(orderby.Trim()))
            {
                strSql.Append(" order by " + orderby);
            }
            else
            {
                strSql.Append(" order by id desc");
            }

            strSql.AppendFormat("  LIMIT  {0},{1}", startIndex, endIndex);
            return DbHelperMySQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获取记录总数
        /// </summary>
        public int GetListCount(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) FROM bus_order ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            object obj = DbHelperMySQL.GetSingle(strSql.ToString());
            return obj == null ? 0 : Convert.ToInt32(obj);
        }





    }
}
