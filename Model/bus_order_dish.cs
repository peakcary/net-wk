using System;
namespace WK.Model
{
	/// <summary>
	/// bus_order_dish:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class bus_order_dish
	{
		public bus_order_dish()
		{}
		#region Model
		private int _id;
		private int _order_id;
		private int _dish_id;
		private decimal _total_original_price=0.00M;
		private decimal? _total_discount_price;
		private decimal? _unit_original_price;
		private decimal? _unit_discount_price;
		private int? _count;
		private string _size_list;
		private string _dish_name_cn;
		private string _dish_name_en;
		private int _market_id;
		private string _market_name_cn;
		private string _market_name_en;
		private int _order_status=0;
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
		public int order_id
		{
			set{ _order_id=value;}
			get{return _order_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int dish_id
		{
			set{ _dish_id=value;}
			get{return _dish_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal total_original_price
		{
			set{ _total_original_price=value;}
			get{return _total_original_price;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? total_discount_price
		{
			set{ _total_discount_price=value;}
			get{return _total_discount_price;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? unit_original_price
		{
			set{ _unit_original_price=value;}
			get{return _unit_original_price;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? unit_discount_price
		{
			set{ _unit_discount_price=value;}
			get{return _unit_discount_price;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? count
		{
			set{ _count=value;}
			get{return _count;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string size_list
		{
			set{ _size_list=value;}
			get{return _size_list;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string dish_name_cn
		{
			set{ _dish_name_cn=value;}
			get{return _dish_name_cn;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string dish_name_en
		{
			set{ _dish_name_en=value;}
			get{return _dish_name_en;}
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
		public string market_name_cn
		{
			set{ _market_name_cn=value;}
			get{return _market_name_cn;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string market_name_en
		{
			set{ _market_name_en=value;}
			get{return _market_name_en;}
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

