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
namespace WK.Web.bus_order_dish
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        		protected void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(!PageValidate.IsNumber(txtorder_id.Text))
			{
				strErr+="order_id格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtdish_id.Text))
			{
				strErr+="dish_id格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txttotal_original_price.Text))
			{
				strErr+="total_original_price格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txttotal_discount_price.Text))
			{
				strErr+="total_discount_price格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txtunit_original_price.Text))
			{
				strErr+="unit_original_price格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txtunit_discount_price.Text))
			{
				strErr+="unit_discount_price格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtcount.Text))
			{
				strErr+="count格式错误！\\n";	
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
			int order_id=int.Parse(this.txtorder_id.Text);
			int dish_id=int.Parse(this.txtdish_id.Text);
			decimal total_original_price=decimal.Parse(this.txttotal_original_price.Text);
			decimal total_discount_price=decimal.Parse(this.txttotal_discount_price.Text);
			decimal unit_original_price=decimal.Parse(this.txtunit_original_price.Text);
			decimal unit_discount_price=decimal.Parse(this.txtunit_discount_price.Text);
			int count=int.Parse(this.txtcount.Text);
			int is_delete=int.Parse(this.txtis_delete.Text);
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime create_date=DateTime.Parse(this.txtcreate_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			DateTime update_date=DateTime.Parse(this.txtupdate_date.Text);

			WK.Model.bus_order_dish model=new WK.Model.bus_order_dish();
			model.order_id=order_id;
			model.dish_id=dish_id;
			model.total_original_price=total_original_price;
			model.total_discount_price=total_discount_price;
			model.unit_original_price=unit_original_price;
			model.unit_discount_price=unit_discount_price;
			model.count=count;
			model.is_delete=is_delete;
			model.remark=remark;
			model.create_by=create_by;
			model.create_date=create_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_order_dish bll=new WK.BLL.bus_order_dish();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
