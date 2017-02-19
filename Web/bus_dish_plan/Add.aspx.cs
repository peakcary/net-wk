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
namespace WK.Web.bus_dish_plan
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        		protected void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(!PageValidate.IsNumber(txtdish_id.Text))
			{
				strErr+="dish_id格式错误！\\n";	
			}
			if(!PageValidate.IsDateTime(txtstart_date.Text))
			{
				strErr+="start_date格式错误！\\n";	
			}
			if(!PageValidate.IsDateTime(txtend_date.Text))
			{
				strErr+="end_date格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtdish_type.Text))
			{
				strErr+="dish_type格式错误！\\n";	
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
			if(this.txtupdate_date.Text.Trim().Length==0)
			{
				strErr+="update_date不能为空！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			int dish_id=int.Parse(this.txtdish_id.Text);
			DateTime start_date=DateTime.Parse(this.txtstart_date.Text);
			DateTime end_date=DateTime.Parse(this.txtend_date.Text);
			int dish_type=int.Parse(this.txtdish_type.Text);
			int is_delete=int.Parse(this.txtis_delete.Text);
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime create_date=DateTime.Parse(this.txtcreate_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			string update_date=this.txtupdate_date.Text;

			WK.Model.bus_dish_plan model=new WK.Model.bus_dish_plan();
			model.dish_id=dish_id;
			model.start_date=start_date;
			model.end_date=end_date;
			model.dish_type=dish_type;
			model.is_delete=is_delete;
			model.remark=remark;
			model.create_by=create_by;
			model.create_date=create_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_dish_plan bll=new WK.BLL.bus_dish_plan();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
