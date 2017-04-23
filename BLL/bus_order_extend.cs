using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;

namespace WK.BLL
{
    public partial class bus_order
    {
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
