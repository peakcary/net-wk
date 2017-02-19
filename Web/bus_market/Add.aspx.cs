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
namespace WK.Web.bus_market
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        		protected void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtmarkket_code.Text.Trim().Length==0)
			{
				strErr+="markket_code不能为空！\\n";	
			}
			if(this.txtname_en.Text.Trim().Length==0)
			{
				strErr+="name_en不能为空！\\n";	
			}
			if(this.txtname_cn.Text.Trim().Length==0)
			{
				strErr+="name_cn不能为空！\\n";	
			}
			if(!PageValidate.IsNumber(txtmarket_type.Text))
			{
				strErr+="market_type格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtarea_id.Text))
			{
				strErr+="area_id格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txtlon.Text))
			{
				strErr+="lon格式错误！\\n";	
			}
			if(!PageValidate.IsDecimal(txtlat.Text))
			{
				strErr+="lat格式错误！\\n";	
			}
			if(this.txtaddress.Text.Trim().Length==0)
			{
				strErr+="address不能为空！\\n";	
			}
			if(this.txtdescription_en.Text.Trim().Length==0)
			{
				strErr+="description_en不能为空！\\n";	
			}
			if(this.txtdescription_cn.Text.Trim().Length==0)
			{
				strErr+="description_cn不能为空！\\n";	
			}
			if(!PageValidate.IsNumber(txtstatus.Text))
			{
				strErr+="status格式错误！\\n";	
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
			if(!PageValidate.IsDateTime(txtcraete_date.Text))
			{
				strErr+="craete_date格式错误！\\n";	
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
			string markket_code=this.txtmarkket_code.Text;
			string name_en=this.txtname_en.Text;
			string name_cn=this.txtname_cn.Text;
			int market_type=int.Parse(this.txtmarket_type.Text);
			int area_id=int.Parse(this.txtarea_id.Text);
			decimal lon=decimal.Parse(this.txtlon.Text);
			decimal lat=decimal.Parse(this.txtlat.Text);
			string address=this.txtaddress.Text;
			string description_en=this.txtdescription_en.Text;
			string description_cn=this.txtdescription_cn.Text;
			int status=int.Parse(this.txtstatus.Text);
			int sort=int.Parse(this.txtsort.Text);
			int is_delete=int.Parse(this.txtis_delete.Text);
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime craete_date=DateTime.Parse(this.txtcraete_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			DateTime update_date=DateTime.Parse(this.txtupdate_date.Text);

			WK.Model.bus_market model=new WK.Model.bus_market();
			model.markket_code=markket_code;
			model.name_en=name_en;
			model.name_cn=name_cn;
			model.market_type=market_type;
			model.area_id=area_id;
			model.lon=lon;
			model.lat=lat;
			model.address=address;
			model.description_en=description_en;
			model.description_cn=description_cn;
			model.status=status;
			model.sort=sort;
			model.is_delete=is_delete;
			model.remark=remark;
			model.create_by=create_by;
			model.craete_date=craete_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_market bll=new WK.BLL.bus_market();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
