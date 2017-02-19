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
namespace WK.Web.bus_pickup_address
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
		WK.BLL.bus_pickup_address bll=new WK.BLL.bus_pickup_address();
		WK.Model.bus_pickup_address model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.lblpickup_code.Text=model.pickup_code;
		this.lblname.Text=model.name;
		this.lbladdress.Text=model.address;
		this.lblarea_id.Text=model.area_id.ToString();
		this.lbllon.Text=model.lon.ToString();
		this.lbllat.Text=model.lat.ToString();
		this.lblstatus.Text=model.status.ToString();
		this.lblsort.Text=model.sort.ToString();
		this.lblis_delete.Text=model.is_delete.ToString();
		this.lblremark.Text=model.remark;
		this.lblcreate_by.Text=model.create_by.ToString();
		this.lblcreate_date.Text=model.create_date.ToString();
		this.lblupdate_by.Text=model.update_by.ToString();
		this.lblupdate_date.Text=model.update_date.ToString();

	}


    }
}
