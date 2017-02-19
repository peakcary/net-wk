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
namespace WK.Web.bus_order
{
    public partial class Show : Page
    {        
        		public string strid=""; 
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
				{
					strid = Request.Params["id"];
					int id=(Convert.ToInt32(strid));
					ShowInfo(id);
				}
			}
		}
		
	private void ShowInfo(int id)
	{
		WK.BLL.bus_order bll=new WK.BLL.bus_order();
		WK.Model.bus_order model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.lblorder_status.Text=model.order_status.ToString();
		this.lblpayment_status.Text=model.payment_status.ToString();
		this.lblmarket_id.Text=model.market_id.ToString();
		this.lbluser_id.Text=model.user_id.ToString();
		this.lbldilivery_user_id.Text=model.dilivery_user_id.ToString();
		this.lblpickup_address_id.Text=model.pickup_address_id.ToString();
		this.lblconsignee_name.Text=model.consignee_name;
		this.lblconsignee_phone.Text=model.consignee_phone;
		this.lbltotal_plan_price.Text=model.total_plan_price.ToString();
		this.lbltotal_real_price.Text=model.total_real_price.ToString();
		this.lblmeal_num.Text=model.meal_num.ToString();
		this.lblis_delete.Text=model.is_delete.ToString();
		this.lblremark.Text=model.remark;
		this.lblcreate_by.Text=model.create_by.ToString();
		this.lblcreate_date.Text=model.create_date.ToString();
		this.lblupdate_by.Text=model.update_by.ToString();
		this.lblupdate_date.Text=model.update_date.ToString();

	}


    }
}
