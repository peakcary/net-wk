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
namespace WK.Web.bus_discount
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
			if(!PageValidate.IsDateTime(txtstart_date.Text))
			{
				strErr+="start_date格式错误！\\n";	
			}
			if(!PageValidate.IsDateTime(txtend_date.Text))
			{
				strErr+="end_date格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txtmin_amount.Text))
			{
				strErr+="min_amount格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txtmax_amount.Text))
			{
				strErr+="max_amount格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtstatus.Text))
			{
				strErr+="status格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txtdiscount_amount.Text))
			{
				strErr+="discount_amount格式错误！\\n";	
			}
			if(this.txtdescription.Text.Trim().Length==0)
			{
				strErr+="description不能为空！\\n";	
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
			DateTime start_date=DateTime.Parse(this.txtstart_date.Text);
			DateTime end_date=DateTime.Parse(this.txtend_date.Text);
			decimal min_amount=decimal.Parse(this.txtmin_amount.Text);
			decimal max_amount=decimal.Parse(this.txtmax_amount.Text);
			int status=int.Parse(this.txtstatus.Text);
			decimal discount_amount=decimal.Parse(this.txtdiscount_amount.Text);
			string description=this.txtdescription.Text;
			int is_delete=int.Parse(this.txtis_delete.Text);
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime create_date=DateTime.Parse(this.txtcreate_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			DateTime update_date=DateTime.Parse(this.txtupdate_date.Text);

			WK.Model.bus_discount model=new WK.Model.bus_discount();
			model.name=name;
			model.start_date=start_date;
			model.end_date=end_date;
			model.min_amount=min_amount;
			model.max_amount=max_amount;
			model.status=status;
			model.discount_amount=discount_amount;
			model.description=description;
			model.is_delete=is_delete;
			model.remark=remark;
			model.create_by=create_by;
			model.create_date=create_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_discount bll=new WK.BLL.bus_discount();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
