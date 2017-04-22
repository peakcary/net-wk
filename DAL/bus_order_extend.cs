using System;
using System.Data;
using System.Text;
using MySql.Data.MySqlClient;
using Maticsoft.DBUtility;//Please add references
namespace WK.DAL
{
    public partial class bus_order
    {
        public DataSet GetDateList(int minDays)
        { 
            StringBuilder strSql = new StringBuilder(); 
            strSql.Append(" SELECT COUNT(id) as ct,DATE_FORMAT(create_date, '%Y-%m-%d') as dt  from bus_order ");
            strSql.AppendFormat(" where create_date BETWEEN CURDATE() and DATE_ADD(CURDATE(),interval {0} day) ", minDays);
            strSql.Append(" GROUP BY DATE_FORMAT(create_date, '%Y-%m-%d') ");
            return DbHelperMySQL.Query(strSql.ToString());
        }

        public DataSet GetPersonList(int minDays)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT count(DISTINCT user_id) as ct,DATE_FORMAT(create_date, '%Y-%m-%d') as dt  from bus_order ");
            strSql.AppendFormat(" where create_date BETWEEN CURDATE() and DATE_ADD(CURDATE(),interval {0} day) ", minDays);
            strSql.Append(" GROUP BY DATE_FORMAT(create_date, '%Y-%m-%d') ");
            return DbHelperMySQL.Query(strSql.ToString());
        }

        public DataSet GetPriceList(int minDays)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT sum(total_real_price) as ct,DATE_FORMAT(create_date, '%Y-%m-%d') as dt  from bus_order ");
            strSql.AppendFormat(" where create_date BETWEEN CURDATE() and DATE_ADD(CURDATE(),interval {0} day) ", minDays);
            strSql.Append(" GROUP BY DATE_FORMAT(create_date, '%Y-%m-%d') ");
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
