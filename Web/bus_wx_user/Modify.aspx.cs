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
namespace WK.Web.bus_wx_user
{
    public partial class Modify : Page
    {       

        		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
				{
					int id=(Convert.ToInt32(Request.Params["id"]));
					ShowInfo(id);
				}
			}
		}
			
	private void ShowInfo(int id)
	{
		WK.BLL.bus_wx_user bll=new WK.BLL.bus_wx_user();
		WK.Model.bus_wx_user model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.txtuser_id.Text=model.user_id.ToString();
		this.txtaccess_token.Text=model.access_token;
		this.txtexpires_in.Text=model.expires_in.ToString();
		this.txtrefresh_token.Text=model.refresh_token;
		this.txtopen_id.Text=model.open_id;
		this.txtscope.Text=model.scope;
		this.txtremark.Text=model.remark;
		this.txtcreate_by.Text=model.create_by.ToString();
		this.txtcreate_date.Text=model.create_date.ToString();
		this.txtupdate_by.Text=model.update_by.ToString();
		this.txtupdate_date.Text=model.update_date.ToString();

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(!PageValidate.IsNumber(txtuser_id.Text))
			{
				strErr+="user_id格式错误！\\n";	
			}
			if(this.txtaccess_token.Text.Trim().Length==0)
			{
				strErr+="access_token不能为空！\\n";	
			}
			if(!PageValidate.IsNumber(txtexpires_in.Text))
			{
				strErr+="expires_in格式错误！\\n";	
			}
			if(this.txtrefresh_token.Text.Trim().Length==0)
			{
				strErr+="refresh_token不能为空！\\n";	
			}
			if(this.txtopen_id.Text.Trim().Length==0)
			{
				strErr+="open_id不能为空！\\n";	
			}
			if(this.txtscope.Text.Trim().Length==0)
			{
				strErr+="scope不能为空！\\n";	
			}
			if(this.txtremark.Text.Trim().Length==0)
			{
				strErr+="remark不能为空！\\n";	
			}
			if(!PageValidate.IsNumber(txtcreate_by.Text))
			{
				strErr+="create_by格式错误！\\n";	
			}
			if(!PageValidate.IsDateTime(txtcreate_date.Text))
			{
				strErr+="create_date格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtupdate_by.Text))
			{
				strErr+="update_by格式错误！\\n";	
			}
			if(!PageValidate.IsDateTime(txtupdate_date.Text))
			{
				strErr+="update_date格式错误！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			int id=int.Parse(this.lblid.Text);
			int user_id=int.Parse(this.txtuser_id.Text);
			string access_token=this.txtaccess_token.Text;
			int expires_in=int.Parse(this.txtexpires_in.Text);
			string refresh_token=this.txtrefresh_token.Text;
			string open_id=this.txtopen_id.Text;
			string scope=this.txtscope.Text;
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime create_date=DateTime.Parse(this.txtcreate_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			DateTime update_date=DateTime.Parse(this.txtupdate_date.Text);


			WK.Model.bus_wx_user model=new WK.Model.bus_wx_user();
			model.id=id;
			model.user_id=user_id;
			model.access_token=access_token;
			model.expires_in=expires_in;
			model.refresh_token=refresh_token;
			model.open_id=open_id;
			model.scope=scope;
			model.remark=remark;
			model.create_by=create_by;
			model.create_date=create_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_wx_user bll=new WK.BLL.bus_wx_user();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
