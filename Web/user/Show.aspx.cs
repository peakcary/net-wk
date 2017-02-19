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
namespace Maticsoft.Web.user
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
					int userId=(Convert.ToInt32(strid));
					ShowInfo(userId);
				}
			}
		}
		
	private void ShowInfo(int userId)
	{
        WK.BLL.user bll = new WK.BLL.user();
        WK.Model.user model = bll.GetModel(userId);
		this.lbluserId.Text=model.userId.ToString();
		this.lblusername.Text=model.username;
		this.lblpassword.Text=model.password;
		this.lbladdress.Text=model.address;

	}


    }
}
