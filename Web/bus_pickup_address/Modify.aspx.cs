﻿using System;
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
namespace WK.Web.bus_pickup_address
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
		WK.BLL.bus_pickup_address bll=new WK.BLL.bus_pickup_address();
		WK.Model.bus_pickup_address model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.txtpickup_code.Text=model.pickup_code;
		this.txtname.Text=model.name;
		this.txtaddress.Text=model.address;
		this.txtarea_id.Text=model.area_id.ToString();
		this.txtlon.Text=model.lon.ToString();
		this.txtlat.Text=model.lat.ToString();
		this.txtstatus.Text=model.status.ToString();
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
			if(this.txtpickup_code.Text.Trim().Length==0)
			{
				strErr+="pickup_code不能为空！\\n";	
			}
			if(this.txtname.Text.Trim().Length==0)
			{
				strErr+="name不能为空！\\n";	
			}
			if(this.txtaddress.Text.Trim().Length==0)
			{
				strErr+="address不能为空！\\n";	
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
			string pickup_code=this.txtpickup_code.Text;
			string name=this.txtname.Text;
			string address=this.txtaddress.Text;
			int area_id=int.Parse(this.txtarea_id.Text);
			decimal lon=decimal.Parse(this.txtlon.Text);
			decimal lat=decimal.Parse(this.txtlat.Text);
			int status=int.Parse(this.txtstatus.Text);
			int sort=int.Parse(this.txtsort.Text);
			int is_delete=int.Parse(this.txtis_delete.Text);
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime create_date=DateTime.Parse(this.txtcreate_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			DateTime update_date=DateTime.Parse(this.txtupdate_date.Text);


			WK.Model.bus_pickup_address model=new WK.Model.bus_pickup_address();
			model.id=id;
			model.pickup_code=pickup_code;
			model.name=name;
			model.address=address;
			model.area_id=area_id;
			model.lon=lon;
			model.lat=lat;
			model.status=status;
			model.sort=sort;
			model.is_delete=is_delete;
			model.remark=remark;
			model.create_by=create_by;
			model.create_date=create_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_pickup_address bll=new WK.BLL.bus_pickup_address();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
