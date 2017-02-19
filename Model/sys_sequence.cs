using System;
namespace WK.Model
{
	/// <summary>
	/// sys_sequence:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class sys_sequence
	{
		public sys_sequence()
		{}
		#region Model
		private string _sequence_name;
		private int? _value;
		/// <summary>
		/// 
		/// </summary>
		public string sequence_name
		{
			set{ _sequence_name=value;}
			get{return _sequence_name;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? value
		{
			set{ _value=value;}
			get{return _value;}
		}
		#endregion Model

	}
}

