using System.Data;
namespace WK.BLL
{ 
	public partial class bus_deadline
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

