using System;
using System.Data;
using System.Text;
using MySql.Data.MySqlClient;
using Maticsoft.DBUtility;//Please add references
namespace WK.DAL
{
	/// <summary>
	/// 数据访问类:bus_dish
	/// </summary>
	public partial class bus_dish
	{
		public bus_dish()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperMySQL.GetMaxID("id", "bus_dish"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from bus_dish");
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
		public bool Add(WK.Model.bus_dish model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into bus_dish(");
			strSql.Append("market_id,dish_type,name_en,name_cn,description_en,description_cn,original_price,discount_price,sales_total,sort,is_delete,remark,create_by,create_date,update_by,update_date)");
			strSql.Append(" values (");
			strSql.Append("@market_id,@dish_type,@name_en,@name_cn,@description_en,@description_cn,@original_price,@discount_price,@sales_total,@sort,@is_delete,@remark,@create_by,@create_date,@update_by,@update_date)");
			MySqlParameter[] parameters = {
					new MySqlParameter("@market_id", MySqlDbType.Int32,11),
					new MySqlParameter("@dish_type", MySqlDbType.Int32,11),
					new MySqlParameter("@name_en", MySqlDbType.VarChar,100),
					new MySqlParameter("@name_cn", MySqlDbType.VarChar,100),
					new MySqlParameter("@description_en", MySqlDbType.VarChar,1000),
					new MySqlParameter("@description_cn", MySqlDbType.VarChar,1000),
					new MySqlParameter("@original_price", MySqlDbType.Decimal,10),
					new MySqlParameter("@discount_price", MySqlDbType.Decimal,10),
					new MySqlParameter("@sales_total", MySqlDbType.Int32,11),
					new MySqlParameter("@sort", MySqlDbType.Int32,11),
					new MySqlParameter("@is_delete", MySqlDbType.Int32,11),
					new MySqlParameter("@remark", MySqlDbType.VarChar,500),
					new MySqlParameter("@create_by", MySqlDbType.Int32,11),
					new MySqlParameter("@create_date", MySqlDbType.DateTime),
					new MySqlParameter("@update_by", MySqlDbType.Int32,11),
					new MySqlParameter("@update_date", MySqlDbType.DateTime)};
			parameters[0].Value = model.market_id;
			parameters[1].Value = model.dish_type;
			parameters[2].Value = model.name_en;
			parameters[3].Value = model.name_cn;
			parameters[4].Value = model.description_en;
			parameters[5].Value = model.description_cn;
			parameters[6].Value = model.original_price;
			parameters[7].Value = model.discount_price;
			parameters[8].Value = model.sales_total;
			parameters[9].Value = model.sort;
			parameters[10].Value = model.is_delete;
			parameters[11].Value = model.remark;
			parameters[12].Value = model.create_by;
			parameters[13].Value = model.create_date;
			parameters[14].Value = model.update_by;
			parameters[15].Value = model.update_date;

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
		public bool Update(WK.Model.bus_dish model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update bus_dish set ");
			strSql.Append("market_id=@market_id,");
			strSql.Append("dish_type=@dish_type,");
			strSql.Append("name_en=@name_en,");
			strSql.Append("name_cn=@name_cn,");
			strSql.Append("description_en=@description_en,");
			strSql.Append("description_cn=@description_cn,");
			strSql.Append("original_price=@original_price,");
			strSql.Append("discount_price=@discount_price,");
			strSql.Append("sales_total=@sales_total,");
			strSql.Append("sort=@sort,");
			strSql.Append("is_delete=@is_delete,");
			strSql.Append("remark=@remark,");
			strSql.Append("create_by=@create_by,");
			strSql.Append("create_date=@create_date,");
			strSql.Append("update_by=@update_by,");
			strSql.Append("update_date=@update_date");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@market_id", MySqlDbType.Int32,11),
					new MySqlParameter("@dish_type", MySqlDbType.Int32,11),
					new MySqlParameter("@name_en", MySqlDbType.VarChar,100),
					new MySqlParameter("@name_cn", MySqlDbType.VarChar,100),
					new MySqlParameter("@description_en", MySqlDbType.VarChar,1000),
					new MySqlParameter("@description_cn", MySqlDbType.VarChar,1000),
					new MySqlParameter("@original_price", MySqlDbType.Decimal,10),
					new MySqlParameter("@discount_price", MySqlDbType.Decimal,10),
					new MySqlParameter("@sales_total", MySqlDbType.Int32,11),
					new MySqlParameter("@sort", MySqlDbType.Int32,11),
					new MySqlParameter("@is_delete", MySqlDbType.Int32,11),
					new MySqlParameter("@remark", MySqlDbType.VarChar,500),
					new MySqlParameter("@create_by", MySqlDbType.Int32,11),
					new MySqlParameter("@create_date", MySqlDbType.DateTime),
					new MySqlParameter("@update_by", MySqlDbType.Int32,11),
					new MySqlParameter("@update_date", MySqlDbType.DateTime),
					new MySqlParameter("@id", MySqlDbType.Int32,11)};
			parameters[0].Value = model.market_id;
			parameters[1].Value = model.dish_type;
			parameters[2].Value = model.name_en;
			parameters[3].Value = model.name_cn;
			parameters[4].Value = model.description_en;
			parameters[5].Value = model.description_cn;
			parameters[6].Value = model.original_price;
			parameters[7].Value = model.discount_price;
			parameters[8].Value = model.sales_total;
			parameters[9].Value = model.sort;
			parameters[10].Value = model.is_delete;
			parameters[11].Value = model.remark;
			parameters[12].Value = model.create_by;
			parameters[13].Value = model.create_date;
			parameters[14].Value = model.update_by;
			parameters[15].Value = model.update_date;
			parameters[16].Value = model.id;

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
			strSql.Append("delete from bus_dish ");
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
			strSql.Append("delete from bus_dish ");
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
		public WK.Model.bus_dish GetModel(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select id,market_id,dish_type,name_en,name_cn,description_en,description_cn,original_price,discount_price,sales_total,sort,is_delete,remark,create_by,create_date,update_by,update_date from bus_dish ");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32)
			};
			parameters[0].Value = id;

			WK.Model.bus_dish model=new WK.Model.bus_dish();
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
		public WK.Model.bus_dish DataRowToModel(DataRow row)
		{
			WK.Model.bus_dish model=new WK.Model.bus_dish();
			if (row != null)
			{
				if(row["id"]!=null && row["id"].ToString()!="")
				{
					model.id=int.Parse(row["id"].ToString());
				}
				if(row["market_id"]!=null && row["market_id"].ToString()!="")
				{
					model.market_id=int.Parse(row["market_id"].ToString());
				}
				if(row["dish_type"]!=null && row["dish_type"].ToString()!="")
				{
					model.dish_type=int.Parse(row["dish_type"].ToString());
				}
				if(row["name_en"]!=null)
				{
					model.name_en=row["name_en"].ToString();
				}
				if(row["name_cn"]!=null)
				{
					model.name_cn=row["name_cn"].ToString();
				}
				if(row["description_en"]!=null)
				{
					model.description_en=row["description_en"].ToString();
				}
				if(row["description_cn"]!=null)
				{
					model.description_cn=row["description_cn"].ToString();
				}
				if(row["original_price"]!=null && row["original_price"].ToString()!="")
				{
					model.original_price=decimal.Parse(row["original_price"].ToString());
				}
				if(row["discount_price"]!=null && row["discount_price"].ToString()!="")
				{
					model.discount_price=decimal.Parse(row["discount_price"].ToString());
				}
				if(row["sales_total"]!=null && row["sales_total"].ToString()!="")
				{
					model.sales_total=int.Parse(row["sales_total"].ToString());
				}
				if(row["sort"]!=null && row["sort"].ToString()!="")
				{
					model.sort=int.Parse(row["sort"].ToString());
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
			strSql.Append("select id,market_id,dish_type,name_en,name_cn,description_en,description_cn,original_price,discount_price,sales_total,sort,is_delete,remark,create_by,create_date,update_by,update_date ");
			strSql.Append(" FROM bus_dish ");
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
			strSql.Append("select count(1) FROM bus_dish ");
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
			strSql.Append(")AS Row, T.*  from bus_dish T ");
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
			parameters[0].Value = "bus_dish";
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

