using System;
namespace WK.Model
{
	/// <summary>
	/// bus_deadline:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class bus_deadline
	{
		public bus_deadline()
		{}
		#region Model
		private int _id;
		private int _deadline_time_type;
		private int _eat_type;
		private int _deadline_days=0;
		private DateTime? _deadline_times;
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
		public int deadline_time_type
		{
			set{ _deadline_time_type=value;}
			get{return _deadline_time_type;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int eat_type
		{
			set{ _eat_type=value;}
			get{return _eat_type;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int deadline_days
		{
			set{ _deadline_days=value;}
			get{return _deadline_days;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? deadline_times
		{
			set{ _deadline_times=value;}
			get{return _deadline_times;}
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

