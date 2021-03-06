﻿using System;
namespace WK.Model
{
	/// <summary>
	/// bus_pickup_address:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class bus_pickup_address
	{
		public bus_pickup_address()
		{}
		#region Model
		private int _id;
		private string _pickup_code;
		private string _name;
		private string _address;
		private int? _area_id=0;
		private decimal? _lon;
		private decimal? _lat;
		private int _status=0;
		private int _dilivery_user_id;
		private int? _sort=0;
		private int _is_delete=0;
		private string _remark;
		private int? _create_by;
		private DateTime? _create_date;
		private int? _update_by;
		private DateTime? _update_date;
		/// <summary>
		/// auto_increment
		/// </summary>
		public int id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string pickup_code
		{
			set{ _pickup_code=value;}
			get{return _pickup_code;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string name
		{
			set{ _name=value;}
			get{return _name;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string address
		{
			set{ _address=value;}
			get{return _address;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? area_id
		{
			set{ _area_id=value;}
			get{return _area_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? lon
		{
			set{ _lon=value;}
			get{return _lon;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? lat
		{
			set{ _lat=value;}
			get{return _lat;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int status
		{
			set{ _status=value;}
			get{return _status;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int dilivery_user_id
		{
			set{ _dilivery_user_id=value;}
			get{return _dilivery_user_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? sort
		{
			set{ _sort=value;}
			get{return _sort;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int is_delete
		{
			set{ _is_delete=value;}
			get{return _is_delete;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string remark
		{
			set{ _remark=value;}
			get{return _remark;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? create_by
		{
			set{ _create_by=value;}
			get{return _create_by;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? create_date
		{
			set{ _create_date=value;}
			get{return _create_date;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? update_by
		{
			set{ _update_by=value;}
			get{return _update_by;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? update_date
		{
			set{ _update_date=value;}
			get{return _update_date;}
		}
		#endregion Model

	}
}

