using System;
namespace WK.Model
{
	/// <summary>
	/// bus_dish:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class bus_dish
	{
		public bus_dish()
		{}
		#region Model
		private int _id;
		private int _market_id;
		private int _dish_time;
		private int _eat_type=0;
		private string _dish_tag;
		private string _name_en;
		private string _name_cn;
		private string _description_en;
		private string _description_cn;
		private decimal _original_price=0.00M;
		private decimal? _discount_price;
		private int _status;
		private int _sales_total=0;
		private int? _sort=0;
		private int? _is_delete;
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
		public int market_id
		{
			set{ _market_id=value;}
			get{return _market_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int dish_time
		{
			set{ _dish_time=value;}
			get{return _dish_time;}
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
		public string dish_tag
		{
			set{ _dish_tag=value;}
			get{return _dish_tag;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string name_en
		{
			set{ _name_en=value;}
			get{return _name_en;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string name_cn
		{
			set{ _name_cn=value;}
			get{return _name_cn;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string description_en
		{
			set{ _description_en=value;}
			get{return _description_en;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string description_cn
		{
			set{ _description_cn=value;}
			get{return _description_cn;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal original_price
		{
			set{ _original_price=value;}
			get{return _original_price;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? discount_price
		{
			set{ _discount_price=value;}
			get{return _discount_price;}
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
		public int sales_total
		{
			set{ _sales_total=value;}
			get{return _sales_total;}
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
		public int? is_delete
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

