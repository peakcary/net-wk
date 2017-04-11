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
namespace WK.Web.bus_deadline
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
		WK.BLL.bus_deadline bll=new WK.BLL.bus_deadline();
		WK.Model.bus_deadline model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.txtdeadline_time_type.Text=model.deadline_time_type.ToString();
		this.txteat_type.Text=model.eat_type.ToString();
		this.txtdeadline_days.Text=model.deadline_days.ToString();
		this.txtdeadline_times.Text=model.deadline_times.ToString();
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
			if(!PageValidate.IsNumber(txtdeadline_time_type.Text))
			{
				strErr+="deadline_time_type格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txteat_type.Text))
			{
				strErr+="eat_type格式错误！\\n";	
			}
			if(!PageValidate.IsNumber(txtdeadline_days.Text))
			{
				strErr+="deadline_days格式错误！\\n";	
			}
			if(!PageValidate.IsDateTime(txtdeadline_times.Text))
			{
				strErr+="deadline_times格式错误！\\n";	
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
			int deadline_time_type=int.Parse(this.txtdeadline_time_type.Text);
			int eat_type=int.Parse(this.txteat_type.Text);
			int deadline_days=int.Parse(this.txtdeadline_days.Text);
			DateTime deadline_times=DateTime.Parse(this.txtdeadline_times.Text);
			int is_delete=int.Parse(this.txtis_delete.Text);
			string remark=this.txtremark.Text;
			int create_by=int.Parse(this.txtcreate_by.Text);
			DateTime create_date=DateTime.Parse(this.txtcreate_date.Text);
			int update_by=int.Parse(this.txtupdate_by.Text);
			DateTime update_date=DateTime.Parse(this.txtupdate_date.Text);


			WK.Model.bus_deadline model=new WK.Model.bus_deadline();
			model.id=id;
			model.deadline_time_type=deadline_time_type;
			model.eat_type=eat_type;
			model.deadline_days=deadline_days;
			model.deadline_times=deadline_times;
			model.is_delete=is_delete;
			model.remark=remark;
			model.create_by=create_by;
			model.create_date=create_date;
			model.update_by=update_by;
			model.update_date=update_date;

			WK.BLL.bus_deadline bll=new WK.BLL.bus_deadline();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
