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
namespace WK.Web.bus_wx_user
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
					int id=(Convert.ToInt32(strid));
					ShowInfo(id);
				}
			}
		}
		
	private void ShowInfo(int id)
	{
		WK.BLL.bus_wx_user bll=new WK.BLL.bus_wx_user();
		WK.Model.bus_wx_user model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.lbluser_id.Text=model.user_id.ToString();
		this.lblaccess_token.Text=model.access_token;
		this.lblexpires_in.Text=model.expires_in.ToString();
		this.lblrefresh_token.Text=model.refresh_token;
		this.lblopen_id.Text=model.open_id;
		this.lblscope.Text=model.scope;
		this.lblremark.Text=model.remark;
		this.lblcreate_by.Text=model.create_by.ToString();
		this.lblcreate_date.Text=model.create_date.ToString();
		this.lblupdate_by.Text=model.update_by.ToString();
		this.lblupdate_date.Text=model.update_date.ToString();

	}


    }
}
