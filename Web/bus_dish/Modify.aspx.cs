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
namespace WK.Web.bus_dish
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
		WK.BLL.bus_dish bll=new WK.BLL.bus_dish();
		WK.Model.bus_dish model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.txtmarket_id.Text=model.market_id.ToString();
		this.txtdish_type.Text=model.dish_type.ToString();
		this.txtname_en.Text=model.name_en;
		this.txtname_cn.Text=model.name_cn;
		this.txtdescription_en.Text=model.description_en;
		this.txtdescription_cn.Text=model.description_cn;
		this.txtoriginal_price.Text=model.original_price.ToString();
		this.txtdiscount_price.Text=model.discount_price.ToString();
		this.txtsales_total.Text=model.sales_total.ToString();
		this.txtsort.Text=model.sort.ToString();
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
			if(!PageValidate.IsNumber(txtmarket_id.Text))
			{
				strErr+="market_id格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtdish_type.Text))
			{
				strErr+="dish_type格式错误！\\n";	
			}
			if(this.txtname_en.Text.Trim().Length==0)
			{
				strErr+="name_en不能为空！\\n";	
			}
			if(this.txtname_cn.Text.Trim().Length==0)
			{
				strErr+="name_cn不能为空！\\n";	
			}
			if(this.txtdescription_en.Text.Trim().Length==0)
			{
				strErr+="description_en不能为空！\\n";	
			}
			if(this.txtdescription_cn.Text.Trim().Length==0)
			{
				strErr+="description_cn不能为空！\\n";	
			}
			if(!PageValidate.IsDecimal(txtoriginal_price.Text))
			{
				strErr+="original_price格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txtdiscount_price.Text))
			{
				strErr+="discount_price格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtsales_total.Text))
			{
				strErr+="sales_total格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtsort.Text))
			{
				strErr+="sort格式错误！\\n";	
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
			int market_id=int.Parse(this.txtmarket_id.Text);
			int dish_type=int.Parse(this.txtdish_type.Text);
			string name_en=this.txtname_en.Text;
			string name_cn=this.txtname_cn.Text;
			string description_en=this.txtdescription_en.Text;
			string description_cn=this.txtdescription_cn.Text;
			decimal original_price=decimal.Parse(this.txtoriginal_price.Text);
			decimal discount_price=decimal.Parse(this.txtdiscount_price.Text);
			int sales_total=int.Parse(this.txtsales_total.Text);
			int sort=int.Parse(this.txtsort.Text);
			int is_delete=int.Parse(this.txtis_delete.Text);
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime create_date=DateTime.Parse(this.txtcreate_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			DateTime update_date=DateTime.Parse(this.txtupdate_date.Text);


			WK.Model.bus_dish model=new WK.Model.bus_dish();
			model.id=id;
			model.market_id=market_id;
			model.dish_type=dish_type;
			model.name_en=name_en;
			model.name_cn=name_cn;
			model.description_en=description_en;
			model.description_cn=description_cn;
			model.original_price=original_price;
			model.discount_price=discount_price;
			model.sales_total=sales_total;
			model.sort=sort;
			model.is_delete=is_delete;
			model.remark=remark;
			model.create_by=create_by;
			model.create_date=create_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_dish bll=new WK.BLL.bus_dish();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
