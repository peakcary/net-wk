using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
namespace WK.Web.sys_sequence
{
    public partial class Show : Page
    {        
        		public string strid=""; 
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
				{
					strid = Request.Params["id"];
					string sequence_name= strid;
					ShowInfo(sequence_name);
				}
			}
		}
		
	private void ShowInfo(string sequence_name)
	{
		WK.BLL.sys_sequence bll=new WK.BLL.sys_sequence();
		WK.Model.sys_sequence model=bll.GetModel(sequence_name);
		this.lblsequence_name.Text=model.sequence_name;
		this.lblvalue.Text=model.value.ToString();

	}


    }
}
