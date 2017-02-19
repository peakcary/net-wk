﻿using System;
using System.Data;
using System.Text;
using MySql.Data.MySqlClient;
using Maticsoft.DBUtility;//Please add references
namespace WK.DAL
{
	/// <summary>
	/// 数据访问类:sys_sequence
	/// </summary>
	public partial class sys_sequence
	{
		public sys_sequence()
		{}
		#region  BasicMethod

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(string sequence_name)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from sys_sequence");
			strSql.Append(" where sequence_name=@sequence_name ");
			MySqlParameter[] parameters = {
					new MySqlParameter("@sequence_name", MySqlDbType.VarChar,200)			};
			parameters[0].Value = sequence_name;

			return DbHelperMySQL.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(WK.Model.sys_sequence model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into sys_sequence(");
			strSql.Append("sequence_name,value)");
			strSql.Append(" values (");
			strSql.Append("@sequence_name,@value)");
			MySqlParameter[] parameters = {
					new MySqlParameter("@sequence_name", MySqlDbType.VarChar,200),
					new MySqlParameter("@value", MySqlDbType.Int32,11)};
			parameters[0].Value = model.sequence_name;
			parameters[1].Value = model.value;

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
		public bool Update(WK.Model.sys_sequence model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update sys_sequence set ");
			strSql.Append("value=@value");
			strSql.Append(" where sequence_name=@sequence_name ");
			MySqlParameter[] parameters = {
					new MySqlParameter("@value", MySqlDbType.Int32,11),
					new MySqlParameter("@sequence_name", MySqlDbType.VarChar,200)};
			parameters[0].Value = model.value;
			parameters[1].Value = model.sequence_name;

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
		public bool Delete(string sequence_name)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from sys_sequence ");
			strSql.Append(" where sequence_name=@sequence_name ");
			MySqlParameter[] parameters = {
					new MySqlParameter("@sequence_name", MySqlDbType.VarChar,200)			};
			parameters[0].Value = sequence_name;

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
		public bool DeleteList(string sequence_namelist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from sys_sequence ");
			strSql.Append(" where sequence_name in ("+sequence_namelist + ")  ");
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
		public WK.Model.sys_sequence GetModel(string sequence_name)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select sequence_name,value from sys_sequence ");
			strSql.Append(" where sequence_name=@sequence_name ");
			MySqlParameter[] parameters = {
					new MySqlParameter("@sequence_name", MySqlDbType.VarChar,200)			};
			parameters[0].Value = sequence_name;

			WK.Model.sys_sequence model=new WK.Model.sys_sequence();
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
		public WK.Model.sys_sequence DataRowToModel(DataRow row)
		{
			WK.Model.sys_sequence model=new WK.Model.sys_sequence();
			if (row != null)
			{
				if(row["sequence_name"]!=null)
				{
					model.sequence_name=row["sequence_name"].ToString();
				}
				if(row["value"]!=null && row["value"].ToString()!="")
				{
					model.value=int.Parse(row["value"].ToString());
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
			strSql.Append("select sequence_name,value ");
			strSql.Append(" FROM sys_sequence ");
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
			strSql.Append("select count(1) FROM sys_sequence ");
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
				strSql.Append("order by T.sequence_name desc");
			}
			strSql.Append(")AS Row, T.*  from sys_sequence T ");
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
			parameters[0].Value = "sys_sequence";
			parameters[1].Value = "sequence_name";
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

