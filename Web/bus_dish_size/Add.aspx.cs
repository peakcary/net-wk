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
namespace WK.Web.bus_dish_size
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        		protected void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtname.Text.Trim().Length==0)
			{
				strErr+="name不能为空！\\n";	
			}
			if(!PageValidate.IsNumber(txtdish_id.Text))
			{
				strErr+="dish_id格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txtaffect_price.Text))
			{
				strErr+="affect_price格式错误！\\n";	
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
			string name=this.txtname.Text;
			int dish_id=int.Parse(this.txtdish_id.Text);
			decimal affect_price=decimal.Parse(this.txtaffect_price.Text);
			int is_delete=int.Parse(this.txtis_delete.Text);
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime create_date=DateTime.Parse(this.txtcreate_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			DateTime update_date=DateTime.Parse(this.txtupdate_date.Text);

			WK.Model.bus_dish_size model=new WK.Model.bus_dish_size();
			model.name=name;
			model.dish_id=dish_id;
			model.affect_price=affect_price;
			model.is_delete=is_delete;
			model.remark=remark;
			model.create_by=create_by;
			model.create_date=create_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_dish_size bll=new WK.BLL.bus_dish_size();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
