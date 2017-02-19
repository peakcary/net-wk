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
namespace WK.Web.bus_order
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        		protected void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(!PageValidate.IsNumber(txtorder_status.Text))
			{
				strErr+="order_status格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtpayment_status.Text))
			{
				strErr+="payment_status格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtmarket_id.Text))
			{
				strErr+="market_id格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtuser_id.Text))
			{
				strErr+="user_id格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtdilivery_user_id.Text))
			{
				strErr+="dilivery_user_id格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtpickup_address_id.Text))
			{
				strErr+="pickup_address_id格式错误！\\n";	
			}
			if(this.txtconsignee_name.Text.Trim().Length==0)
			{
				strErr+="consignee_name不能为空！\\n";	
			}
			if(this.txtconsignee_phone.Text.Trim().Length==0)
			{
				strErr+="consignee_phone不能为空！\\n";	
			}
			if(!PageValidate.IsDecimal(txttotal_plan_price.Text))
			{
				strErr+="total_plan_price格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txttotal_real_price.Text))
			{
				strErr+="total_real_price格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtmeal_num.Text))
			{
				strErr+="meal_num格式错误！\\n";	
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
			int order_status=int.Parse(this.txtorder_status.Text);
			int payment_status=int.Parse(this.txtpayment_status.Text);
			int market_id=int.Parse(this.txtmarket_id.Text);
			int user_id=int.Parse(this.txtuser_id.Text);
			int dilivery_user_id=int.Parse(this.txtdilivery_user_id.Text);
			int pickup_address_id=int.Parse(this.txtpickup_address_id.Text);
			string consignee_name=this.txtconsignee_name.Text;
			string consignee_phone=this.txtconsignee_phone.Text;
			decimal total_plan_price=decimal.Parse(this.txttotal_plan_price.Text);
			decimal total_real_price=decimal.Parse(this.txttotal_real_price.Text);
			int meal_num=int.Parse(this.txtmeal_num.Text);
			int is_delete=int.Parse(this.txtis_delete.Text);
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime create_date=DateTime.Parse(this.txtcreate_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			DateTime update_date=DateTime.Parse(this.txtupdate_date.Text);

			WK.Model.bus_order model=new WK.Model.bus_order();
			model.order_status=order_status;
			model.payment_status=payment_status;
			model.market_id=market_id;
			model.user_id=user_id;
			model.dilivery_user_id=dilivery_user_id;
			model.pickup_address_id=pickup_address_id;
			model.consignee_name=consignee_name;
			model.consignee_phone=consignee_phone;
			model.total_plan_price=total_plan_price;
			model.total_real_price=total_real_price;
			model.meal_num=meal_num;
			model.is_delete=is_delete;
			model.remark=remark;
			model.create_by=create_by;
			model.create_date=create_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_order bll=new WK.BLL.bus_order();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
