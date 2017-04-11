using System;
namespace WK.Model
{
	/// <summary>
	/// bus_discount_gift:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class bus_discount_gift
	{
		public bus_discount_gift()
		{}
		#region Model
		private int _id;
		private int _discount_id;
		private int _gift_id;
		private int _count=1;
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
		public int discount_id
		{
			set{ _discount_id=value;}
			get{return _discount_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int gift_id
		{
			set{ _gift_id=value;}
			get{return _gift_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int count
		{
			set{ _count=value;}
			get{return _count;}
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

