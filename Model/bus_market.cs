using System;
namespace WK.Model
{
	/// <summary>
	/// bus_market:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class bus_market
	{
		public bus_market()
		{}
		#region Model
		private int _id;
		private string _market_code;
		private string _name_en;
		private string _name_cn;
		private string _market_type= "0";
		private string _market_tel;
		private int? _area_id=0;
		private decimal? _lon;
		private decimal? _lat;
		private string _address;
		private string _description_en;
		private string _description_cn;
		private int _status=0;
		private int? _sort=0;
		private int _is_delete=2;
		private string _remark;
		private int? _create_by;
		private DateTime? _craete_date;
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
		public string market_code
		{
			set{ _market_code=value;}
			get{return _market_code;}
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
		public string market_type
		{
			set{ _market_type=value;}
			get{return _market_type;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string market_tel
		{
			set{ _market_tel=value;}
			get{return _market_tel;}
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
		public string address
		{
			set{ _address=value;}
			get{return _address;}
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
		public int status
		{
			set{ _status=value;}
			get{return _status;}
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
		public DateTime? craete_date
		{
			set{ _craete_date=value;}
			get{return _craete_date;}
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

