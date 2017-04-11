using System;
namespace WK.Model
{
	/// <summary>
	/// bus_user:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class bus_user
	{
		public bus_user()
		{}
		#region Model
		private int _id;
		private int _user_type=0;
		private string _pwd;
		private string _nickname;
		private int _status;
		private string _phone_num;
		private string _pic_url;
		private int _sex=1;
		private DateTime? _generate_time;
		private string _cur_deviceid;
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
		public int user_type
		{
			set{ _user_type=value;}
			get{return _user_type;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string pwd
		{
			set{ _pwd=value;}
			get{return _pwd;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string nickname
		{
			set{ _nickname=value;}
			get{return _nickname;}
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
		public string phone_num
		{
			set{ _phone_num=value;}
			get{return _phone_num;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string pic_url
		{
			set{ _pic_url=value;}
			get{return _pic_url;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int sex
		{
			set{ _sex=value;}
			get{return _sex;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? generate_time
		{
			set{ _generate_time=value;}
			get{return _generate_time;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string cur_deviceId
		{
			set{ _cur_deviceid=value;}
			get{return _cur_deviceid;}
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

