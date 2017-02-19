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
using Maticsoft.Common;
using LTP.Accounts.Bus;
namespace Maticsoft.Web.user
{
    public partial class Modify : Page
    {       

        		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
				{
					int userId=(Convert.ToInt32(Request.Params["id"]));
					ShowInfo(userId);
				}
			}
		}
			
	private void ShowInfo(int userId)
	{
        WK.BLL.user bll = new WK.BLL.user();
        WK.Model.user model = bll.GetModel(userId);
		this.lbluserId.Text=model.userId.ToString();
		this.txtusername.Text=model.username;
		this.txtpassword.Text=model.password;
		this.txtaddress.Text=model.address;

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtusername.Text.Trim().Length==0)
			{
				strErr+="username不能为空！\\n";	
			}
			if(this.txtpassword.Text.Trim().Length==0)
			{
				strErr+="password不能为空！\\n";	
			}
			if(this.txtaddress.Text.Trim().Length==0)
			{
				strErr+="address不能为空！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			int userId=int.Parse(this.lbluserId.Text);
			string username=this.txtusername.Text;
			string password=this.txtpassword.Text;
			string address=this.txtaddress.Text;


            WK.Model.user model = new WK.Model.user();
			model.userId=userId;
			model.username=username;
			model.password=password;
			model.address=address;

            WK.BLL.user bll = new WK.BLL.user();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
