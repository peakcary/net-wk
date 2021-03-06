﻿using System;
using System.Data;
using System.Text;
using Maticsoft.DBUtility;//Please add references
using MySql.Data.MySqlClient;
namespace WK.DAL
{
	/// <summary>
	/// 数据访问类:bus_market
	/// </summary>
	public partial class bus_market
	{
		public bus_market()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperMySQL.GetMaxID("id", "bus_market"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from bus_market");
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
		public bool Add(WK.Model.bus_market model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into bus_market(");
			strSql.Append("markket_code,name_en,name_cn,market_type,area_id,lon,lat,address,description_en,description_cn,status,sort,is_delete,remark,create_by,craete_date,update_by,update_date)");
			strSql.Append(" values (");
			strSql.Append("@markket_code,@name_en,@name_cn,@market_type,@area_id,@lon,@lat,@address,@description_en,@description_cn,@status,@sort,@is_delete,@remark,@create_by,@craete_date,@update_by,@update_date)");
			MySqlParameter[] parameters = {
					new MySqlParameter("@markket_code", MySqlDbType.VarChar,100),
					new MySqlParameter("@name_en", MySqlDbType.VarChar,100),
					new MySqlParameter("@name_cn", MySqlDbType.VarChar,100),
					new MySqlParameter("@market_type", MySqlDbType.VarChar,500),
					new MySqlParameter("@area_id", MySqlDbType.Int32,11),
					new MySqlParameter("@lon", MySqlDbType.Decimal,10),
					new MySqlParameter("@lat", MySqlDbType.Decimal,10),
					new MySqlParameter("@address", MySqlDbType.VarChar,200),
					new MySqlParameter("@description_en", MySqlDbType.VarChar,1000),
					new MySqlParameter("@description_cn", MySqlDbType.VarChar,10000),
					new MySqlParameter("@status", MySqlDbType.Int32,11),
					new MySqlParameter("@sort", MySqlDbType.Int32,11),
					new MySqlParameter("@is_delete", MySqlDbType.Int32,11),
					new MySqlParameter("@remark", MySqlDbType.VarChar,500),
					new MySqlParameter("@create_by", MySqlDbType.Int32,11),
					new MySqlParameter("@craete_date", MySqlDbType.DateTime),
					new MySqlParameter("@update_by", MySqlDbType.Int32,11),
					new MySqlParameter("@update_date", MySqlDbType.DateTime)};
			parameters[0].Value = model.markket_code;
			parameters[1].Value = model.name_en;
			parameters[2].Value = model.name_cn;
			parameters[3].Value = model.market_type;
			parameters[4].Value = model.area_id;
			parameters[5].Value = model.lon;
			parameters[6].Value = model.lat;
			parameters[7].Value = model.address;
			parameters[8].Value = model.description_en;
			parameters[9].Value = model.description_cn;
			parameters[10].Value = model.status;
			parameters[11].Value = model.sort;
			parameters[12].Value = model.is_delete;
			parameters[13].Value = model.remark;
			parameters[14].Value = model.create_by;
			parameters[15].Value = model.craete_date;
			parameters[16].Value = model.update_by;
			parameters[17].Value = model.update_date;

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
		public bool Update(WK.Model.bus_market model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update bus_market set ");
			strSql.Append("markket_code=@markket_code,");
			strSql.Append("name_en=@name_en,");
			strSql.Append("name_cn=@name_cn,");
			strSql.Append("market_type=@market_type,");
			strSql.Append("area_id=@area_id,");
			strSql.Append("lon=@lon,");
			strSql.Append("lat=@lat,");
			strSql.Append("address=@address,");
			strSql.Append("description_en=@description_en,");
			strSql.Append("description_cn=@description_cn,");
			strSql.Append("status=@status,");
			strSql.Append("sort=@sort,");
			strSql.Append("is_delete=@is_delete,");
			strSql.Append("remark=@remark,");
			strSql.Append("create_by=@create_by,");
			strSql.Append("craete_date=@craete_date,");
			strSql.Append("update_by=@update_by,");
			strSql.Append("update_date=@update_date");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@markket_code", MySqlDbType.VarChar,100),
					new MySqlParameter("@name_en", MySqlDbType.VarChar,100),
					new MySqlParameter("@name_cn", MySqlDbType.VarChar,100),
					new MySqlParameter("@market_type", MySqlDbType.VarChar,500),
					new MySqlParameter("@area_id", MySqlDbType.Int32,11),
					new MySqlParameter("@lon", MySqlDbType.Decimal,10),
					new MySqlParameter("@lat", MySqlDbType.Decimal,10),
					new MySqlParameter("@address", MySqlDbType.VarChar,200),
					new MySqlParameter("@description_en", MySqlDbType.VarChar,1000),
					new MySqlParameter("@description_cn", MySqlDbType.VarChar,10000),
					new MySqlParameter("@status", MySqlDbType.Int32,11),
					new MySqlParameter("@sort", MySqlDbType.Int32,11),
					new MySqlParameter("@is_delete", MySqlDbType.Int32,11),
					new MySqlParameter("@remark", MySqlDbType.VarChar,500),
					new MySqlParameter("@create_by", MySqlDbType.Int32,11),
					new MySqlParameter("@craete_date", MySqlDbType.DateTime),
					new MySqlParameter("@update_by", MySqlDbType.Int32,11),
					new MySqlParameter("@update_date", MySqlDbType.DateTime),
					new MySqlParameter("@id", MySqlDbType.Int32,11)};
			parameters[0].Value = model.markket_code;
			parameters[1].Value = model.name_en;
			parameters[2].Value = model.name_cn;
			parameters[3].Value = model.market_type;
			parameters[4].Value = model.area_id;
			parameters[5].Value = model.lon;
			parameters[6].Value = model.lat;
			parameters[7].Value = model.address;
			parameters[8].Value = model.description_en;
			parameters[9].Value = model.description_cn;
			parameters[10].Value = model.status;
			parameters[11].Value = model.sort;
			parameters[12].Value = model.is_delete;
			parameters[13].Value = model.remark;
			parameters[14].Value = model.create_by;
			parameters[15].Value = model.craete_date;
			parameters[16].Value = model.update_by;
			parameters[17].Value = model.update_date;
			parameters[18].Value = model.id;

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
			strSql.Append("delete from bus_market ");
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
			strSql.Append("delete from bus_market ");
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
		public WK.Model.bus_market GetModel(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select id,markket_code,name_en,name_cn,market_type,area_id,lon,lat,address,description_en,description_cn,status,sort,is_delete,remark,create_by,craete_date,update_by,update_date from bus_market ");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32)
			};
			parameters[0].Value = id;

			WK.Model.bus_market model=new WK.Model.bus_market();
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
		public WK.Model.bus_market DataRowToModel(DataRow row)
		{
			WK.Model.bus_market model=new WK.Model.bus_market();
			if (row != null)
			{
				if(row["id"]!=null && row["id"].ToString()!="")
				{
					model.id=int.Parse(row["id"].ToString());
				}
				if(row["markket_code"]!=null)
				{
					model.markket_code=row["markket_code"].ToString();
				}
				if(row["name_en"]!=null)
				{
					model.name_en=row["name_en"].ToString();
				}
				if(row["name_cn"]!=null)
				{
					model.name_cn=row["name_cn"].ToString();
				}
				if(row["market_type"]!=null)
				{
					model.market_type=row["market_type"].ToString();
				}
				if(row["area_id"]!=null && row["area_id"].ToString()!="")
				{
					model.area_id=int.Parse(row["area_id"].ToString());
				}
				if(row["lon"]!=null && row["lon"].ToString()!="")
				{
					model.lon=decimal.Parse(row["lon"].ToString());
				}
				if(row["lat"]!=null && row["lat"].ToString()!="")
				{
					model.lat=decimal.Parse(row["lat"].ToString());
				}
				if(row["address"]!=null)
				{
					model.address=row["address"].ToString();
				}
				if(row["description_en"]!=null)
				{
					model.description_en=row["description_en"].ToString();
				}
				if(row["description_cn"]!=null)
				{
					model.description_cn=row["description_cn"].ToString();
				}
				if(row["status"]!=null && row["status"].ToString()!="")
				{
					model.status=int.Parse(row["status"].ToString());
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
				if(row["craete_date"]!=null && row["craete_date"].ToString()!="")
				{
					model.craete_date=DateTime.Parse(row["craete_date"].ToString());
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
			strSql.Append("select id,markket_code,name_en,name_cn,market_type,area_id,lon,lat,address,description_en,description_cn,status,sort,is_delete,remark,create_by,craete_date,update_by,update_date ");
			strSql.Append(" FROM bus_market ");
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
			strSql.Append("select count(1) FROM bus_market ");
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
			strSql.Append(")AS Row, T.*  from bus_market T ");
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
			parameters[0].Value = "bus_market";
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

