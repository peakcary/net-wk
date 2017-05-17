using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;

namespace WK.BLL
{
    public partial class bus_order
    {
        public DataSet GetDetailExtend(int id)
        {
            return dal.GetDetailExtend(id);
        }
        public int GetListCountByAllUser()
        {
            return dal.GetListCountByAllUser();
        }

        public int GetListCountByYesterdayCreateUser()
        {
            return dal.GetListCountByYesterdayCreateUser();
        }
        public int GetListCountByTomorrowEattype(int eatType)
        {
            return dal.GetListCountByTomorrowEattype(eatType);
        }

        public DataSet GetDateList(int minDays)
        {
            return dal.GetDateList(minDays);
        }
        public DataSet GetPersonList(int minDays)
        {
            return dal.GetPersonList(minDays);
        }
        public DataSet GetPriceList(int minDays)
        {
            return dal.GetPriceList(minDays);
        }
         public DataSet GetListByQuery(string order_code, int user_id,int order_status,int pay_status,int eat_type,int minDays,int isDiscount, int startIndex, int endIndex,int pickup_address_id)
        {
            return dal.GetListByQuery(order_code, user_id, order_status, pay_status, eat_type, minDays, isDiscount, startIndex, endIndex, pickup_address_id);
        }

         public DataSet GetMarketOrderList(string order_code, int user_id, int order_status, int pay_status, int eat_type, int minDays, int isDiscount, int startIndex, int endIndex)
         {
             return dal.GetMarketOrderList(order_code, user_id, order_status, pay_status, eat_type, minDays, isDiscount, startIndex, endIndex);
         }

        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPageInfo(string strWhere, string orderby, int startIndex, int endIndex)
        {
            return dal.GetListByPageInfo(strWhere, orderby, startIndex, endIndex);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public int GetListCount(string strWhere)
        {
            return dal.GetListCount(strWhere);
        }
    }
}
