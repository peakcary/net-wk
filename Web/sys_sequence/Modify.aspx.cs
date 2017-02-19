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
namespace WK.Web.sys_sequence
{
    public partial class Modify : Page
    {       

        		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
				{
					string sequence_name= Request.Params["id"];
					ShowInfo(sequence_name);
				}
			}
		}
			
	private void ShowInfo(string sequence_name)
	{
		WK.BLL.sys_sequence bll=new WK.BLL.sys_sequence();
		WK.Model.sys_sequence model=bll.GetModel(sequence_name);
		this.lblsequence_name.Text=model.sequence_name;
		this.txtvalue.Text=model.value.ToString();

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(!PageValidate.IsNumber(txtvalue.Text))
			{
				strErr+="value格式错误！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			string sequence_name=this.lblsequence_name.Text;
			int value=int.Parse(this.txtvalue.Text);


			WK.Model.sys_sequence model=new WK.Model.sys_sequence();
			model.sequence_name=sequence_name;
			model.value=value;

			WK.BLL.sys_sequence bll=new WK.BLL.sys_sequence();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
