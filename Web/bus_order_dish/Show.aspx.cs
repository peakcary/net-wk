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
namespace WK.Web.bus_order_dish
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
		WK.BLL.bus_order_dish bll=new WK.BLL.bus_order_dish();
		WK.Model.bus_order_dish model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.lblorder_id.Text=model.order_id.ToString();
		this.lbldish_id.Text=model.dish_id.ToString();
		this.lbltotal_original_price.Text=model.total_original_price.ToString();
		this.lbltotal_discount_price.Text=model.total_discount_price.ToString();
		this.lblunit_original_price.Text=model.unit_original_price.ToString();
		this.lblunit_discount_price.Text=model.unit_discount_price.ToString();
		this.lblcount.Text=model.count.ToString();
		this.lblis_delete.Text=model.is_delete.ToString();
		this.lblremark.Text=model.remark;
		this.lblcreate_by.Text=model.create_by.ToString();
		this.lblcreate_date.Text=model.create_date.ToString();
		this.lblupdate_by.Text=model.update_by.ToString();
		this.lblupdate_date.Text=model.update_date.ToString();

	}


    }
}
