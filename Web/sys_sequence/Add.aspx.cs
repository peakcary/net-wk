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
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        		protected void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtsequence_name.Text.Trim().Length==0)
			{
				strErr+="sequence_name不能为空！\\n";	
			}
			if(!PageValidate.IsNumber(txtvalue.Text))
			{
				strErr+="value格式错误！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			string sequence_name=this.txtsequence_name.Text;
			int value=int.Parse(this.txtvalue.Text);

			WK.Model.sys_sequence model=new WK.Model.sys_sequence();
			model.sequence_name=sequence_name;
			model.value=value;

			WK.BLL.sys_sequence bll=new WK.BLL.sys_sequence();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
