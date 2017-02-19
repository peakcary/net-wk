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
namespace WK.Web.bus_user_device
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        		protected void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(!PageValidate.IsNumber(txtuser_id.Text))
			{
				strErr+="user_id格式错误！\\n";	
			}
			if(this.txtphone_num.Text.Trim().Length==0)
			{
				strErr+="phone_num不能为空！\\n";	
			}
			if(this.txtdevice_id.Text.Trim().Length==0)
			{
				strErr+="device_id不能为空！\\n";	
			}
			if(!PageValidate.IsNumber(txtdevice_type.Text))
			{
				strErr+="device_type格式错误！\\n";	
			}
			if(this.txtpushToken.Text.Trim().Length==0)
			{
				strErr+="pushToken不能为空！\\n";	
			}
			if(this.txtapp_version.Text.Trim().Length==0)
			{
				strErr+="app_version不能为空！\\n";	
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
			int user_id=int.Parse(this.txtuser_id.Text);
			string phone_num=this.txtphone_num.Text;
			string device_id=this.txtdevice_id.Text;
			int device_type=int.Parse(this.txtdevice_type.Text);
			string pushToken=this.txtpushToken.Text;
			string app_version=this.txtapp_version.Text;
			int is_delete=int.Parse(this.txtis_delete.Text);
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime create_date=DateTime.Parse(this.txtcreate_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			DateTime update_date=DateTime.Parse(this.txtupdate_date.Text);

			WK.Model.bus_user_device model=new WK.Model.bus_user_device();
			model.user_id=user_id;
			model.phone_num=phone_num;
			model.device_id=device_id;
			model.device_type=device_type;
			model.pushToken=pushToken;
			model.app_version=app_version;
			model.is_delete=is_delete;
			model.remark=remark;
			model.create_by=create_by;
			model.create_date=create_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_user_device bll=new WK.BLL.bus_user_device();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
