using System;
using System.Data;
using System.Text;
using MySql.Data.MySqlClient;
using Maticsoft.DBUtility;//Please add references
namespace WK.DAL
{
	/// <summary>
	/// 数据访问类:bus_order
	/// </summary>
	public partial class bus_order
	{
		public bus_order()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperMySQL.GetMaxID("id", "bus_order"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from bus_order");
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
		public bool Add(WK.Model.bus_order model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into bus_order(");
			strSql.Append("order_code,order_status,pay_status,pay_type,user_id,dilivery_user_id,pickup_address_id,consignee_name,consignee_phone,total_plan_price,total_real_price,meal_num,pickup_start_time,pickup_end_time,pickup_date,dish_time,eat_type,is_delete,remark,create_by,create_date,update_by,update_date)");
			strSql.Append(" values (");
			strSql.Append("@order_code,@order_status,@pay_status,@pay_type,@user_id,@dilivery_user_id,@pickup_address_id,@consignee_name,@consignee_phone,@total_plan_price,@total_real_price,@meal_num,@pickup_start_time,@pickup_end_time,@pickup_date,@dish_time,@eat_type,@is_delete,@remark,@create_by,@create_date,@update_by,@update_date)");
			MySqlParameter[] parameters = {
					new MySqlParameter("@order_code", MySqlDbType.VarChar,50),
					new MySqlParameter("@order_status", MySqlDbType.Int32,11),
					new MySqlParameter("@pay_status", MySqlDbType.Int32,11),
					new MySqlParameter("@pay_type", MySqlDbType.Int32,11),
					new MySqlParameter("@user_id", MySqlDbType.Int32,11),
					new MySqlParameter("@dilivery_user_id", MySqlDbType.Int32,11),
					new MySqlParameter("@pickup_address_id", MySqlDbType.Int32,11),
					new MySqlParameter("@consignee_name", MySqlDbType.VarChar,100),
					new MySqlParameter("@consignee_phone", MySqlDbType.VarChar,50),
					new MySqlParameter("@total_plan_price", MySqlDbType.Decimal,10),
					new MySqlParameter("@total_real_price", MySqlDbType.Decimal,10),
					new MySqlParameter("@meal_num", MySqlDbType.Int32,11),
					new MySqlParameter("@pickup_start_time", MySqlDbType.Time),
					new MySqlParameter("@pickup_end_time", MySqlDbType.Time),
					new MySqlParameter("@pickup_date", MySqlDbType.DateTime),
					new MySqlParameter("@dish_time", MySqlDbType.Int32,11),
					new MySqlParameter("@eat_type", MySqlDbType.Int32,11),
					new MySqlParameter("@is_delete", MySqlDbType.Int32,11),
					new MySqlParameter("@remark", MySqlDbType.VarChar,500),
					new MySqlParameter("@create_by", MySqlDbType.Int32,11),
					new MySqlParameter("@create_date", MySqlDbType.DateTime),
					new MySqlParameter("@update_by", MySqlDbType.Int32,11),
					new MySqlParameter("@update_date", MySqlDbType.DateTime)};
			parameters[0].Value = model.order_code;
			parameters[1].Value = model.order_status;
			parameters[2].Value = model.pay_status;
			parameters[3].Value = model.pay_type;
			parameters[4].Value = model.user_id;
			parameters[5].Value = model.dilivery_user_id;
			parameters[6].Value = model.pickup_address_id;
			parameters[7].Value = model.consignee_name;
			parameters[8].Value = model.consignee_phone;
			parameters[9].Value = model.total_plan_price;
			parameters[10].Value = model.total_real_price;
			parameters[11].Value = model.meal_num;
			parameters[12].Value = model.pickup_start_time;
			parameters[13].Value = model.pickup_end_time;
			parameters[14].Value = model.pickup_date;
			parameters[15].Value = model.dish_time;
			parameters[16].Value = model.eat_type;
			parameters[17].Value = model.is_delete;
			parameters[18].Value = model.remark;
			parameters[19].Value = model.create_by;
			parameters[20].Value = model.create_date;
			parameters[21].Value = model.update_by;
			parameters[22].Value = model.update_date;

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
		public bool Update(WK.Model.bus_order model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update bus_order set ");
			strSql.Append("order_code=@order_code,");
			strSql.Append("order_status=@order_status,");
			strSql.Append("pay_status=@pay_status,");
			strSql.Append("pay_type=@pay_type,");
			strSql.Append("user_id=@user_id,");
			strSql.Append("dilivery_user_id=@dilivery_user_id,");
			strSql.Append("pickup_address_id=@pickup_address_id,");
			strSql.Append("consignee_name=@consignee_name,");
			strSql.Append("consignee_phone=@consignee_phone,");
			strSql.Append("total_plan_price=@total_plan_price,");
			strSql.Append("total_real_price=@total_real_price,");
			strSql.Append("meal_num=@meal_num,");
			strSql.Append("pickup_start_time=@pickup_start_time,");
			strSql.Append("pickup_end_time=@pickup_end_time,");
			strSql.Append("pickup_date=@pickup_date,");
			strSql.Append("dish_time=@dish_time,");
			strSql.Append("eat_type=@eat_type,");
			strSql.Append("is_delete=@is_delete,");
			strSql.Append("remark=@remark,");
			strSql.Append("create_by=@create_by,");
			strSql.Append("create_date=@create_date,");
			strSql.Append("update_by=@update_by,");
			strSql.Append("update_date=@update_date");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@order_code", MySqlDbType.VarChar,50),
					new MySqlParameter("@order_status", MySqlDbType.Int32,11),
					new MySqlParameter("@pay_status", MySqlDbType.Int32,11),
					new MySqlParameter("@pay_type", MySqlDbType.Int32,11),
					new MySqlParameter("@user_id", MySqlDbType.Int32,11),
					new MySqlParameter("@dilivery_user_id", MySqlDbType.Int32,11),
					new MySqlParameter("@pickup_address_id", MySqlDbType.Int32,11),
					new MySqlParameter("@consignee_name", MySqlDbType.VarChar,100),
					new MySqlParameter("@consignee_phone", MySqlDbType.VarChar,50),
					new MySqlParameter("@total_plan_price", MySqlDbType.Decimal,10),
					new MySqlParameter("@total_real_price", MySqlDbType.Decimal,10),
					new MySqlParameter("@meal_num", MySqlDbType.Int32,11),
					new MySqlParameter("@pickup_start_time", MySqlDbType.Time),
					new MySqlParameter("@pickup_end_time", MySqlDbType.Time),
					new MySqlParameter("@pickup_date", MySqlDbType.DateTime),
					new MySqlParameter("@dish_time", MySqlDbType.Int32,11),
					new MySqlParameter("@eat_type", MySqlDbType.Int32,11),
					new MySqlParameter("@is_delete", MySqlDbType.Int32,11),
					new MySqlParameter("@remark", MySqlDbType.VarChar,500),
					new MySqlParameter("@create_by", MySqlDbType.Int32,11),
					new MySqlParameter("@create_date", MySqlDbType.DateTime),
					new MySqlParameter("@update_by", MySqlDbType.Int32,11),
					new MySqlParameter("@update_date", MySqlDbType.DateTime),
					new MySqlParameter("@id", MySqlDbType.Int32,11)};
			parameters[0].Value = model.order_code;
			parameters[1].Value = model.order_status;
			parameters[2].Value = model.pay_status;
			parameters[3].Value = model.pay_type;
			parameters[4].Value = model.user_id;
			parameters[5].Value = model.dilivery_user_id;
			parameters[6].Value = model.pickup_address_id;
			parameters[7].Value = model.consignee_name;
			parameters[8].Value = model.consignee_phone;
			parameters[9].Value = model.total_plan_price;
			parameters[10].Value = model.total_real_price;
			parameters[11].Value = model.meal_num;
			parameters[12].Value = model.pickup_start_time;
			parameters[13].Value = model.pickup_end_time;
			parameters[14].Value = model.pickup_date;
			parameters[15].Value = model.dish_time;
			parameters[16].Value = model.eat_type;
			parameters[17].Value = model.is_delete;
			parameters[18].Value = model.remark;
			parameters[19].Value = model.create_by;
			parameters[20].Value = model.create_date;
			parameters[21].Value = model.update_by;
			parameters[22].Value = model.update_date;
			parameters[23].Value = model.id;

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
			strSql.Append("delete from bus_order ");
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
			strSql.Append("delete from bus_order ");
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
		public WK.Model.bus_order GetModel(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select id,order_code,order_status,pay_status,pay_type,user_id,dilivery_user_id,pickup_address_id,consignee_name,consignee_phone,total_plan_price,total_real_price,meal_num,pickup_start_time,pickup_end_time,pickup_date,dish_time,eat_type,is_delete,remark,create_by,create_date,update_by,update_date from bus_order ");
			strSql.Append(" where id=@id");
			MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32)
			};
			parameters[0].Value = id;

			WK.Model.bus_order model=new WK.Model.bus_order();
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
		public WK.Model.bus_order DataRowToModel(DataRow row)
		{
			WK.Model.bus_order model=new WK.Model.bus_order();
			if (row != null)
			{
				if(row["id"]!=null && row["id"].ToString()!="")
				{
					model.id=int.Parse(row["id"].ToString());
				}
				if(row["order_code"]!=null)
				{
					model.order_code=row["order_code"].ToString();
				}
				if(row["order_status"]!=null && row["order_status"].ToString()!="")
				{
					model.order_status=int.Parse(row["order_status"].ToString());
				}
				if(row["pay_status"]!=null && row["pay_status"].ToString()!="")
				{
					model.pay_status=int.Parse(row["pay_status"].ToString());
				}
				if(row["pay_type"]!=null && row["pay_type"].ToString()!="")
				{
					model.pay_type=int.Parse(row["pay_type"].ToString());
				}
				if(row["user_id"]!=null && row["user_id"].ToString()!="")
				{
					model.user_id=int.Parse(row["user_id"].ToString());
				}
				if(row["dilivery_user_id"]!=null && row["dilivery_user_id"].ToString()!="")
				{
					model.dilivery_user_id=int.Parse(row["dilivery_user_id"].ToString());
				}
				if(row["pickup_address_id"]!=null && row["pickup_address_id"].ToString()!="")
				{
					model.pickup_address_id=int.Parse(row["pickup_address_id"].ToString());
				}
				if(row["consignee_name"]!=null)
				{
					model.consignee_name=row["consignee_name"].ToString();
				}
				if(row["consignee_phone"]!=null)
				{
					model.consignee_phone=row["consignee_phone"].ToString();
				}
				if(row["total_plan_price"]!=null && row["total_plan_price"].ToString()!="")
				{
					model.total_plan_price=decimal.Parse(row["total_plan_price"].ToString());
				}
				if(row["total_real_price"]!=null && row["total_real_price"].ToString()!="")
				{
					model.total_real_price=decimal.Parse(row["total_real_price"].ToString());
				}
				if(row["meal_num"]!=null && row["meal_num"].ToString()!="")
				{
					model.meal_num=int.Parse(row["meal_num"].ToString());
				}
				if(row["pickup_start_time"]!=null && row["pickup_start_time"].ToString()!="")
				{
					model.pickup_start_time=DateTime.Parse(row["pickup_start_time"].ToString());
				}
				if(row["pickup_end_time"]!=null && row["pickup_end_time"].ToString()!="")
				{
					model.pickup_end_time=DateTime.Parse(row["pickup_end_time"].ToString());
				}
				if(row["pickup_date"]!=null && row["pickup_date"].ToString()!="")
				{
					model.pickup_date=DateTime.Parse(row["pickup_date"].ToString());
				}
				if(row["dish_time"]!=null && row["dish_time"].ToString()!="")
				{
					model.dish_time=int.Parse(row["dish_time"].ToString());
				}
				if(row["eat_type"]!=null && row["eat_type"].ToString()!="")
				{
					model.eat_type=int.Parse(row["eat_type"].ToString());
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
			strSql.Append("select id,order_code,order_status,pay_status,pay_type,user_id,dilivery_user_id,pickup_address_id,consignee_name,consignee_phone,total_plan_price,total_real_price,meal_num,pickup_start_time,pickup_end_time,pickup_date,dish_time,eat_type,is_delete,remark,create_by,create_date,update_by,update_date ");
			strSql.Append(" FROM bus_order ");
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
			strSql.Append("select count(1) FROM bus_order ");
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
			strSql.Append(")AS Row, T.*  from bus_order T ");
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
			parameters[0].Value = "bus_order";
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

