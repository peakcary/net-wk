using System;
namespace WK.Model
{
	/// <summary>
	/// bus_user_device:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class bus_user_device
	{
		public bus_user_device()
		{}
		#region Model
		private int _id;
		private int _user_id;
		private string _phone_num;
		private string _device_id;
		private int? _device_type=0;
		private string _pushtoken;
		private string _app_version;
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
		public int user_id
		{
			set{ _user_id=value;}
			get{return _user_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string phone_num
		{
			set{ _phone_num=value;}
			get{return _phone_num;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string device_id
		{
			set{ _device_id=value;}
			get{return _device_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? device_type
		{
			set{ _device_type=value;}
			get{return _device_type;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string pushToken
		{
			set{ _pushtoken=value;}
			get{return _pushtoken;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string app_version
		{
			set{ _app_version=value;}
			get{return _app_version;}
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

