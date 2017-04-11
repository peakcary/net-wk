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
namespace WK.Web.bus_pickup_times
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
		WK.BLL.bus_pickup_times bll=new WK.BLL.bus_pickup_times();
		WK.Model.bus_pickup_times model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.lblpickup_address_id.Text=model.pickup_address_id.ToString();
		this.lblpickup_time.Text=model.pickup_time.ToString();
		this.lbleat_type.Text=model.eat_type.ToString();
		this.lblpickup_start_time.Text=model.pickup_start_time.ToString();
		this.lblpickup_end_time.Text=model.pickup_end_time.ToString();
		this.lblis_delete.Text=model.is_delete.ToString();
		this.lblremark.Text=model.remark;
		this.lblcreate_by.Text=model.create_by.ToString();
		this.lblcreate_date.Text=model.create_date.ToString();
		this.lblupdate_by.Text=model.update_by.ToString();
		this.lblupdate_date.Text=model.update_date.ToString();

	}


    }
}
