﻿using System;
using System.Data;
using System.Text;
using MySql.Data.MySqlClient;
using Maticsoft.DBUtility;//Please add references
namespace WK.DAL
{
	/// <summary>
	/// 数据访问类:bus_user_device
	/// </summary>
	public partial class bus_user_device
	{
		public bus_user_device()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperMySQL.GetMaxID("id", "bus_user_device"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from bus_user_device");
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
		public bool Add(WK.Model.bus_user_device model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into bus_user_device(");
			strSql.Append("user_id,phone_num,device_id,device_type,pushToken,app_version,is_delete,remark,create_by,create_date,update_by,update_date)");
			strSql.Append(" values (");
			strSql.Append("@user_id,@phone_num,@device_id,@device_type,@pushToken,@app_version,@is_delete,@remark,@create_by,@create_date,@update_by,@update_date)");
			MySqlParameter[] parameters = {
					new MySqlParameter("@user_id", MySqlDbType.Int32,11),
					new MySqlParameter("@phone_num", MySqlDbType.VarChar,50),
					new MySqlParameter("@device_id", MySqlDbType.VarChar,100),
					new MySqlParameter("@device_type", MySqlDbType.Int32,11),
					new MySqlParameter("@pushToken", MySqlDbType.VarChar,100),
					new MySqlParameter("@app_version", MySqlDbType.VarChar,100),
					new MySqlParameter("@is_delete", MySqlDbType.Int32,11),
					new MySqlParameter("@remark", MySqlDbType.VarChar,500),
					new MySqlParameter("@create_by", MySqlDbType.Int32,11),
					new MySqlParameter("@create_date", MySqlDbType.DateTime),
					new MySqlParameter("@update_by", MySqlDbType.Int32,11),
					new MySqlParameter("@update_date", MySqlDbType.DateTime)};
			parameters[0].Value = model.user_id;
			parameters[1].Value = model.phone_num;
			parameters[2].Value = model.device_id;
			parameters[3].Value = model.device_type;
			parameters[4].Value = model.pushToken;
			parameters[5].Value = model.app_version;
			parameters[6].Value = model.is_delete;
			parameters[7].Value = model.remark;
			parameters[8].Value = model.create_by;
			parameters[9].Value = model.create_date;
			parameters[10].Value = model.update_by;
			parameters[11].Value = model.update_date;

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
		public bool Update(WK.Model.bus_user_device model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update bus_user_device set ");
			strSql.Append("user_id=@user_id,");
			strSql.Append("phone_num=@phone_num,");
			strSql.Append("device_id=@device_id,");
			strSql.Append("device_type=@device_type,");
			strSql.Append("pushToken=@pushToken,");
			strSql.Append("app_version=@app_version,");
			strSql.Append("is_delete=@is_delete,");
			strSql.Append("remark=@remark,");
			strSql.Append("create_by=@create_by,");
			strSql.Append("create_date=@create_date,");
			strSql.Append("update_by=@update_by,");
			strSql.Append("update_date=@update_date");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@user_id", MySqlDbType.Int32,11),
					new MySqlParameter("@phone_num", MySqlDbType.VarChar,50),
					new MySqlParameter("@device_id", MySqlDbType.VarChar,100),
					new MySqlParameter("@device_type", MySqlDbType.Int32,11),
					new MySqlParameter("@pushToken", MySqlDbType.VarChar,100),
					new MySqlParameter("@app_version", MySqlDbType.VarChar,100),
					new MySqlParameter("@is_delete", MySqlDbType.Int32,11),
					new MySqlParameter("@remark", MySqlDbType.VarChar,500),
					new MySqlParameter("@create_by", MySqlDbType.Int32,11),
					new MySqlParameter("@create_date", MySqlDbType.DateTime),
					new MySqlParameter("@update_by", MySqlDbType.Int32,11),
					new MySqlParameter("@update_date", MySqlDbType.DateTime),
					new MySqlParameter("@id", MySqlDbType.Int32,11)};
			parameters[0].Value = model.user_id;
			parameters[1].Value = model.phone_num;
			parameters[2].Value = model.device_id;
			parameters[3].Value = model.device_type;
			parameters[4].Value = model.pushToken;
			parameters[5].Value = model.app_version;
			parameters[6].Value = model.is_delete;
			parameters[7].Value = model.remark;
			parameters[8].Value = model.create_by;
			parameters[9].Value = model.create_date;
			parameters[10].Value = model.update_by;
			parameters[11].Value = model.update_date;
			parameters[12].Value = model.id;

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
			strSql.Append("delete from bus_user_device ");
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
			strSql.Append("delete from bus_user_device ");
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
		public WK.Model.bus_user_device GetModel(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select id,user_id,phone_num,device_id,device_type,pushToken,app_version,is_delete,remark,create_by,create_date,update_by,update_date from bus_user_device ");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32)
			};
			parameters[0].Value = id;

			WK.Model.bus_user_device model=new WK.Model.bus_user_device();
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
		public WK.Model.bus_user_device DataRowToModel(DataRow row)
		{
			WK.Model.bus_user_device model=new WK.Model.bus_user_device();
			if (row != null)
			{
				if(row["id"]!=null && row["id"].ToString()!="")
				{
					model.id=int.Parse(row["id"].ToString());
				}
				if(row["user_id"]!=null && row["user_id"].ToString()!="")
				{
					model.user_id=int.Parse(row["user_id"].ToString());
				}
				if(row["phone_num"]!=null)
				{
					model.phone_num=row["phone_num"].ToString();
				}
				if(row["device_id"]!=null)
				{
					model.device_id=row["device_id"].ToString();
				}
				if(row["device_type"]!=null && row["device_type"].ToString()!="")
				{
					model.device_type=int.Parse(row["device_type"].ToString());
				}
				if(row["pushToken"]!=null)
				{
					model.pushToken=row["pushToken"].ToString();
				}
				if(row["app_version"]!=null)
				{
					model.app_version=row["app_version"].ToString();
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
			strSql.Append("select id,user_id,phone_num,device_id,device_type,pushToken,app_version,is_delete,remark,create_by,create_date,update_by,update_date ");
			strSql.Append(" FROM bus_user_device ");
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
			strSql.Append("select count(1) FROM bus_user_device ");
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
			strSql.Append(")AS Row, T.*  from bus_user_device T ");
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
			parameters[0].Value = "bus_user_device";
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

