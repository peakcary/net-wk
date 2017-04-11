using System;
using System.Data;
using System.Text;
using MySql.Data.MySqlClient;
using Maticsoft.DBUtility;//Please add references
namespace WK.DAL
{
	/// <summary>
	/// 数据访问类:bus_discount
	/// </summary>
	public partial class bus_discount
	{
		public bus_discount()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperMySQL.GetMaxID("id", "bus_discount"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from bus_discount");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32)
			};
			parameters[0].Value = id;

			return DbHelperMySQL.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(WK.Model.bus_discount model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into bus_discount(");
			strSql.Append("name,start_date,end_date,min_amount,max_amount,status,discount_amount,description,is_delete,remark,create_by,create_date,update_by,update_date)");
			strSql.Append(" values (");
			strSql.Append("@name,@start_date,@end_date,@min_amount,@max_amount,@status,@discount_amount,@description,@is_delete,@remark,@create_by,@create_date,@update_by,@update_date)");
			MySqlParameter[] parameters = {
					new MySqlParameter("@name", MySqlDbType.VarChar,200),
					new MySqlParameter("@start_date", MySqlDbType.DateTime),
					new MySqlParameter("@end_date", MySqlDbType.DateTime),
					new MySqlParameter("@min_amount", MySqlDbType.Decimal,10),
					new MySqlParameter("@max_amount", MySqlDbType.Decimal,10),
					new MySqlParameter("@status", MySqlDbType.Int32,11),
					new MySqlParameter("@discount_amount", MySqlDbType.Decimal,10),
					new MySqlParameter("@description", MySqlDbType.VarChar,1000),
					new MySqlParameter("@is_delete", MySqlDbType.Int32,11),
					new MySqlParameter("@remark", MySqlDbType.VarChar,500),
					new MySqlParameter("@create_by", MySqlDbType.Int32,11),
					new MySqlParameter("@create_date", MySqlDbType.DateTime),
					new MySqlParameter("@update_by", MySqlDbType.Int32,11),
					new MySqlParameter("@update_date", MySqlDbType.DateTime)};
			parameters[0].Value = model.name;
			parameters[1].Value = model.start_date;
			parameters[2].Value = model.end_date;
			parameters[3].Value = model.min_amount;
			parameters[4].Value = model.max_amount;
			parameters[5].Value = model.status;
			parameters[6].Value = model.discount_amount;
			parameters[7].Value = model.description;
			parameters[8].Value = model.is_delete;
			parameters[9].Value = model.remark;
			parameters[10].Value = model.create_by;
			parameters[11].Value = model.create_date;
			parameters[12].Value = model.update_by;
			parameters[13].Value = model.update_date;

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
		public bool Update(WK.Model.bus_discount model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update bus_discount set ");
			strSql.Append("name=@name,");
			strSql.Append("start_date=@start_date,");
			strSql.Append("end_date=@end_date,");
			strSql.Append("min_amount=@min_amount,");
			strSql.Append("max_amount=@max_amount,");
			strSql.Append("status=@status,");
			strSql.Append("discount_amount=@discount_amount,");
			strSql.Append("description=@description,");
			strSql.Append("is_delete=@is_delete,");
			strSql.Append("remark=@remark,");
			strSql.Append("create_by=@create_by,");
			strSql.Append("create_date=@create_date,");
			strSql.Append("update_by=@update_by,");
			strSql.Append("update_date=@update_date");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@name", MySqlDbType.VarChar,200),
					new MySqlParameter("@start_date", MySqlDbType.DateTime),
					new MySqlParameter("@end_date", MySqlDbType.DateTime),
					new MySqlParameter("@min_amount", MySqlDbType.Decimal,10),
					new MySqlParameter("@max_amount", MySqlDbType.Decimal,10),
					new MySqlParameter("@status", MySqlDbType.Int32,11),
					new MySqlParameter("@discount_amount", MySqlDbType.Decimal,10),
					new MySqlParameter("@description", MySqlDbType.VarChar,1000),
					new MySqlParameter("@is_delete", MySqlDbType.Int32,11),
					new MySqlParameter("@remark", MySqlDbType.VarChar,500),
					new MySqlParameter("@create_by", MySqlDbType.Int32,11),
					new MySqlParameter("@create_date", MySqlDbType.DateTime),
					new MySqlParameter("@update_by", MySqlDbType.Int32,11),
					new MySqlParameter("@update_date", MySqlDbType.DateTime),
					new MySqlParameter("@id", MySqlDbType.Int32,11)};
			parameters[0].Value = model.name;
			parameters[1].Value = model.start_date;
			parameters[2].Value = model.end_date;
			parameters[3].Value = model.min_amount;
			parameters[4].Value = model.max_amount;
			parameters[5].Value = model.status;
			parameters[6].Value = model.discount_amount;
			parameters[7].Value = model.description;
			parameters[8].Value = model.is_delete;
			parameters[9].Value = model.remark;
			parameters[10].Value = model.create_by;
			parameters[11].Value = model.create_date;
			parameters[12].Value = model.update_by;
			parameters[13].Value = model.update_date;
			parameters[14].Value = model.id;

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
		public bool Delete(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from bus_discount ");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32)
			};
			parameters[0].Value = id;

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
		public bool DeleteList(string idlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from bus_discount ");
			strSql.Append(" where id in ("+idlist + ")  ");
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
		public WK.Model.bus_discount GetModel(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select id,name,start_date,end_date,min_amount,max_amount,status,discount_amount,description,is_delete,remark,create_by,create_date,update_by,update_date from bus_discount ");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32)
			};
			parameters[0].Value = id;

			WK.Model.bus_discount model=new WK.Model.bus_discount();
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
		public WK.Model.bus_discount DataRowToModel(DataRow row)
		{
			WK.Model.bus_discount model=new WK.Model.bus_discount();
			if (row != null)
			{
				if(row["id"]!=null && row["id"].ToString()!="")
				{
					model.id=int.Parse(row["id"].ToString());
				}
				if(row["name"]!=null)
				{
					model.name=row["name"].ToString();
				}
				if(row["start_date"]!=null && row["start_date"].ToString()!="")
				{
					model.start_date=DateTime.Parse(row["start_date"].ToString());
				}
				if(row["end_date"]!=null && row["end_date"].ToString()!="")
				{
					model.end_date=DateTime.Parse(row["end_date"].ToString());
				}
				if(row["min_amount"]!=null && row["min_amount"].ToString()!="")
				{
					model.min_amount=decimal.Parse(row["min_amount"].ToString());
				}
				if(row["max_amount"]!=null && row["max_amount"].ToString()!="")
				{
					model.max_amount=decimal.Parse(row["max_amount"].ToString());
				}
				if(row["status"]!=null && row["status"].ToString()!="")
				{
					model.status=int.Parse(row["status"].ToString());
				}
				if(row["discount_amount"]!=null && row["discount_amount"].ToString()!="")
				{
					model.discount_amount=decimal.Parse(row["discount_amount"].ToString());
				}
				if(row["description"]!=null)
				{
					model.description=row["description"].ToString();
				}
				if(row["is_delete"]!=null && row["is_delete"].ToString()!="")
				{
					model.is_delete=int.Parse(row["is_delete"].ToString());
				}
				if(row["remark"]!=null)
				{
					model.remark=row["remark"].ToString();
				}
				if(row["create_by"]!=null && row["create_by"].ToString()!="")
				{
					model.create_by=int.Parse(row["create_by"].ToString());
				}
				if(row["create_date"]!=null && row["create_date"].ToString()!="")
				{
					model.create_date=DateTime.Parse(row["create_date"].ToString());
				}
				if(row["update_by"]!=null && row["update_by"].ToString()!="")
				{
					model.update_by=int.Parse(row["update_by"].ToString());
				}
				if(row["update_date"]!=null && row["update_date"].ToString()!="")
				{
					model.update_date=DateTime.Parse(row["update_date"].ToString());
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
			strSql.Append("select id,name,start_date,end_date,min_amount,max_amount,status,discount_amount,description,is_delete,remark,create_by,create_date,update_by,update_date ");
			strSql.Append(" FROM bus_discount ");
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
			strSql.Append("select count(1) FROM bus_discount ");
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
				strSql.Append("order by T.id desc");
			}
			strSql.Append(")AS Row, T.*  from bus_discount T ");
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
			parameters[0].Value = "bus_discount";
			parameters[1].Value = "id";
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

