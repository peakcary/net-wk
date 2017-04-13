using System;
using System.Data;
using System.Collections.Generic;
using Maticsoft.Common;
using WK.Model;

namespace WK.BLL
{
    public partial class bus_pickup_times
    {
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
