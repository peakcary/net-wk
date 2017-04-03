using System;
using System.Data;
using System.Collections.Generic;
using Maticsoft.Common;
using WK.Model;


namespace WK.BLL
{
    public partial class bus_dish
    {
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPageInfo(string strWhere, string orderby, int startIndex, int endIndex)
        {
            return dal.GetListByPageInfo(strWhere, orderby, startIndex, endIndex);
        }
    }
}
