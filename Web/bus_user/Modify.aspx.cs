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
namespace WK.Web.bus_user
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
		WK.BLL.bus_user bll=new WK.BLL.bus_user();
		WK.Model.bus_user model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.txtuser_type.Text=model.user_type.ToString();
		this.txtpwd.Text=model.pwd;
		this.txtnickname.Text=model.nickname;
		this.txtphone_num.Text=model.phone_num;
		this.txtpic_url.Text=model.pic_url;
		this.txtsex.Text=model.sex.ToString();
		this.txtcode.Text=model.code;
		this.txtgenerate_time.Text=model.generate_time.ToString();
		this.txtcur_deviceId.Text=model.cur_deviceId;
		this.txtis_delete.Text=model.is_delete.ToString();
		this.txtremark.Text=model.remark;
		this.txtcreate_by.Text=model.create_by.ToString();
		this.txtcreate_date.Text=model.create_date.ToString();
		this.txtupdate_by.Text=model.update_by.ToString();
		this.txtupdate_date.Text=model.update_date.ToString();

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(!PageValidate.IsNumber(txtuser_type.Text))
			{
				strErr+="user_type格式错误！\\n";	
			}
			if(this.txtpwd.Text.Trim().Length==0)
			{
				strErr+="pwd不能为空！\\n";	
			}
			if(this.txtnickname.Text.Trim().Length==0)
			{
				strErr+="nickname不能为空！\\n";	
			}
			if(this.txtphone_num.Text.Trim().Length==0)
			{
				strErr+="phone_num不能为空！\\n";	
			}
			if(this.txtpic_url.Text.Trim().Length==0)
			{
				strErr+="pic_url不能为空！\\n";	
			}
			if(!PageValidate.IsNumber(txtsex.Text))
			{
				strErr+="sex格式错误！\\n";	
			}
			if(this.txtcode.Text.Trim().Length==0)
			{
				strErr+="code不能为空！\\n";	
			}
			if(!PageValidate.IsDateTime(txtgenerate_time.Text))
			{
				strErr+="generate_time格式错误！\\n";	
			}
			if(this.txtcur_deviceId.Text.Trim().Length==0)
			{
				strErr+="cur_deviceId不能为空！\\n";	
			}
			if(!PageValidate.IsNumber(txtis_delete.Text))
			{
				strErr+="is_delete格式错误！\\n";	
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
			int user_type=int.Parse(this.txtuser_type.Text);
			string pwd=this.txtpwd.Text;
			string nickname=this.txtnickname.Text;
			string phone_num=this.txtphone_num.Text;
			string pic_url=this.txtpic_url.Text;
			int sex=int.Parse(this.txtsex.Text);
			string code=this.txtcode.Text;
			DateTime generate_time=DateTime.Parse(this.txtgenerate_time.Text);
			string cur_deviceId=this.txtcur_deviceId.Text;
			int is_delete=int.Parse(this.txtis_delete.Text);
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime create_date=DateTime.Parse(this.txtcreate_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			DateTime update_date=DateTime.Parse(this.txtupdate_date.Text);


			WK.Model.bus_user model=new WK.Model.bus_user();
			model.id=id;
			model.user_type=user_type;
			model.pwd=pwd;
			model.nickname=nickname;
			model.phone_num=phone_num;
			model.pic_url=pic_url;
			model.sex=sex;
			model.code=code;
			model.generate_time=generate_time;
			model.cur_deviceId=cur_deviceId;
			model.is_delete=is_delete;
			model.remark=remark;
			model.create_by=create_by;
			model.create_date=create_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_user bll=new WK.BLL.bus_user();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
