using System;
namespace WK.Model
{
	/// <summary>
	/// bus_order:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class bus_order
	{
		public bus_order()
		{}
		#region Model
		private int _id;
		private int _order_status;
		private int _pay_status;
		private int _pay_type;
		private int _user_id;
		private int _dilivery_user_id;
		private int _pickup_address_id;
		private string _consignee_name;
		private string _consignee_phone;
		private decimal _total_plan_price=0.00M;
		private decimal _total_real_price=0.00M;
		private int _meal_num=1;
		private DateTime _pickup_start_time;
		private string _pickup_end_time;
		private DateTime _pickup_date;
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
		public int order_status
		{
			set{ _order_status=value;}
			get{return _order_status;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int pay_status
		{
			set{ _pay_status=value;}
			get{return _pay_status;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int pay_type
		{
			set{ _pay_type=value;}
			get{return _pay_type;}
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
		public int dilivery_user_id
		{
			set{ _dilivery_user_id=value;}
			get{return _dilivery_user_id;}
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
		public string consignee_name
		{
			set{ _consignee_name=value;}
			get{return _consignee_name;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string consignee_phone
		{
			set{ _consignee_phone=value;}
			get{return _consignee_phone;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal total_plan_price
		{
			set{ _total_plan_price=value;}
			get{return _total_plan_price;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal total_real_price
		{
			set{ _total_real_price=value;}
			get{return _total_real_price;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int meal_num
		{
			set{ _meal_num=value;}
			get{return _meal_num;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime pickup_start_time
		{
			set{ _pickup_start_time=value;}
			get{return _pickup_start_time;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string pickup_end_time
		{
			set{ _pickup_end_time=value;}
			get{return _pickup_end_time;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime pickup_date
		{
			set{ _pickup_date=value;}
			get{return _pickup_date;}
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

