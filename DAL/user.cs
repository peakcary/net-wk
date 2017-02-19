using System;
using System.Data;
using System.Text;
using MySql.Data.MySqlClient;
using Maticsoft.DBUtility;//Please add references
namespace WK.DAL
{
	/// <summary>
	/// 数据访问类:user
	/// </summary>
	public partial class user
	{
		public user()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperMySQL.GetMaxID("userId", "tuser"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int userId)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from tuser");
			strSql.Append(" where userId=@userId ");
			MySqlParameter[] parameters = {
					new MySqlParameter("@userId", MySqlDbType.Int32,4)			};
			parameters[0].Value = userId;

			return DbHelperMySQL.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
        public bool Add(WK.Model.user model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into tuser(");
			strSql.Append("userId,username,password,address)");
			strSql.Append(" values (");
			strSql.Append("@userId,@username,@password,@address)");
			MySqlParameter[] parameters = {
					new MySqlParameter("@userId", MySqlDbType.Int32,4),
					new MySqlParameter("@username", MySqlDbType.VarChar,100),
					new MySqlParameter("@password", MySqlDbType.VarChar,100),
					new MySqlParameter("@address", MySqlDbType.VarChar,100)};
			parameters[0].Value = model.userId;
			parameters[1].Value = model.username;
			parameters[2].Value = model.password;
			parameters[3].Value = model.address;

			int rows=DbHelperMySQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// 更新一条数据
		/// </summary>
        public bool Update(WK.Model.user model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update tuser set ");
			strSql.Append("username=@username,");
			strSql.Append("password=@password,");
			strSql.Append("address=@address");
			strSql.Append(" where userId=@userId ");
			MySqlParameter[] parameters = {
					new MySqlParameter("@username", MySqlDbType.VarChar,100),
					new MySqlParameter("@password", MySqlDbType.VarChar,100),
					new MySqlParameter("@address", MySqlDbType.VarChar,100),
					new MySqlParameter("@userId", MySqlDbType.Int32,4)};
			parameters[0].Value = model.username;
			parameters[1].Value = model.password;
			parameters[2].Value = model.address;
			parameters[3].Value = model.userId;

			int rows=DbHelperMySQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int userId)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from tuser ");
			strSql.Append(" where userId=@userId ");
			MySqlParameter[] parameters = {
					new MySqlParameter("@userId", MySqlDbType.Int32,4)			};
			parameters[0].Value = userId;

			int rows=DbHelperMySQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// 批量删除数据
		/// </summary>
		public bool DeleteList(string userIdlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from tuser ");
			strSql.Append(" where userId in ("+userIdlist + ")  ");
			int rows=DbHelperMySQL.ExecuteSql(strSql.ToString());
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
        public WK.Model.user GetModel(int userId)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select userId,username,password,address from tuser ");
			strSql.Append(" where userId=@userId ");
			MySqlParameter[] parameters = {
					new MySqlParameter("@userId", MySqlDbType.Int32,4)			};
			parameters[0].Value = userId;

			WK.Model.user model=new WK.Model.user();
			DataSet ds=DbHelperMySQL.Query(strSql.ToString(),parameters);
			if(ds.Tables[0].Rows.Count>0)
			{
				return DataRowToModel(ds.Tables[0].Rows[0]);
			}
			else
			{
				return null;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public WK.Model.user DataRowToModel(DataRow row)
		{
			WK.Model.user model=new WK.Model.user();
			if (row != null)
			{
				if(row["userId"]!=null && row["userId"].ToString()!="")
				{
					model.userId=int.Parse(row["userId"].ToString());
				}
				if(row["username"]!=null)
				{
					model.username=row["username"].ToString();
				}
				if(row["password"]!=null)
				{
					model.password=row["password"].ToString();
				}
				if(row["address"]!=null)
				{
					model.address=row["address"].ToString();
				}
			}
			return model;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select userId,username,password,address ");
			strSql.Append(" FROM tuser ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperMySQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获取记录总数
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) FROM tuser ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			object obj = DbHelperSQL.GetSingle(strSql.ToString());
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("SELECT * FROM ( ");
			strSql.Append(" SELECT ROW_NUMBER() OVER (");
			if (!string.IsNullOrEmpty(orderby.Trim()))
			{
				strSql.Append("order by T." + orderby );
			}
			else
			{
				strSql.Append("order by T.userId desc");
			}
			strSql.Append(")AS Row, T.*  from tuser T ");
			if (!string.IsNullOrEmpty(strWhere.Trim()))
			{
				strSql.Append(" WHERE " + strWhere);
			}
			strSql.Append(" ) TT");
			strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
			return DbHelperMySQL.Query(strSql.ToString());
		}

		/*
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		{
			MySqlParameter[] parameters = {
					new MySqlParameter("@tblName", MySqlDbType.VarChar, 255),
					new MySqlParameter("@fldName", MySqlDbType.VarChar, 255),
					new MySqlParameter("@PageSize", MySqlDbType.Int32),
					new MySqlParameter("@PageIndex", MySqlDbType.Int32),
					new MySqlParameter("@IsReCount", MySqlDbType.Bit),
					new MySqlParameter("@OrderType", MySqlDbType.Bit),
					new MySqlParameter("@strWhere", MySqlDbType.VarChar,1000),
					};
			parameters[0].Value = "tuser";
			parameters[1].Value = "userId";
			parameters[2].Value = PageSize;
			parameters[3].Value = PageIndex;
			parameters[4].Value = 0;
			parameters[5].Value = 0;
			parameters[6].Value = strWhere;	
			return DbHelperMySQL.RunProcedure("UP_GetRecordByPage",parameters,"ds");
		}*/

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

