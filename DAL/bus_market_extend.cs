using System;
using System.Data;
using System.Text;
using Maticsoft.DBUtility;//Please add references

namespace WK.DAL
{
    public partial class bus_market
    {
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPageInfo(string strWhere, string orderby, int startIndex, int endIndex)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM bus_market ");
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
            strSql.Append("select count(1) FROM bus_market ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            object obj = DbHelperMySQL.GetSingle(strSql.ToString());
            return obj == null ? 0 : Convert.ToInt32(obj);
        }

        public DataSet GetPickupMarketList(int pickupid)
        {
            //SELECT b.*,a.id as bus_pickup_market_id,a.sort
            //from bus_pickup_market a
            //LEFT JOIN bus_market b on b.id = a.market_id and b.is_delete=0
            //where pickup_address_id = 12
            //ORDER BY a.sort
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT b.*,a.id as bus_pickup_market_id,a.sort as pickupsort ");
            strSql.Append(" from bus_pickup_market a ");
            strSql.Append(" LEFT JOIN bus_market b on b.id = a.market_id and b.is_delete=0 ");
            strSql.AppendFormat(" where pickup_address_id = {0} ", pickupid);
            strSql.Append(" ORDER BY a.sort ");
             
            return DbHelperMySQL.Query(strSql.ToString());
        } 
    }
}
