using System;
namespace WK.Model
{
	/// <summary>
	/// bus_pickup_times:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class bus_pickup_times
	{
		public bus_pickup_times()
		{}
		#region Model
		private int _id;
		private int _pickup_address_id;
		private int _pickup_time;
		private int _eat_type=0;
        private TimeSpan? _pickup_start_time;
        private TimeSpan? _pickup_end_time;
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
		public int pickup_address_id
		{
			set{ _pickup_address_id=value;}
			get{return _pickup_address_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int pickup_time
		{
			set{ _pickup_time=value;}
			get{return _pickup_time;}
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
        public TimeSpan? pickup_start_time
		{
			set{ _pickup_start_time=value;}
			get{return _pickup_start_time;}
		}
		/// <summary>
		/// 
		/// </summary>
        public TimeSpan? pickup_end_time
		{
			set{ _pickup_end_time=value;}
			get{return _pickup_end_time;}
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

