using System;
namespace WK.Model
{
	/// <summary>
	/// sys_constant_detail:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class sys_constant_detail
	{
		public sys_constant_detail()
		{}
		#region Model
		private int _id;
		private int _constant_id;
		private string _constant_key;
		private string _constant_value;
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
		public int constant_id
		{
			set{ _constant_id=value;}
			get{return _constant_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string constant_key
		{
			set{ _constant_key=value;}
			get{return _constant_key;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string constant_value
		{
			set{ _constant_value=value;}
			get{return _constant_value;}
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

