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
namespace WK.Web.bus_dish
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
		WK.BLL.bus_dish bll=new WK.BLL.bus_dish();
		WK.Model.bus_dish model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.lblmarket_id.Text=model.market_id.ToString();
		this.lbldish_type.Text=model.dish_type.ToString();
		this.lblname_en.Text=model.name_en;
		this.lblname_cn.Text=model.name_cn;
		this.lbldescription_en.Text=model.description_en;
		this.lbldescription_cn.Text=model.description_cn;
		this.lbloriginal_price.Text=model.original_price.ToString();
		this.lbldiscount_price.Text=model.discount_price.ToString();
		this.lblsales_total.Text=model.sales_total.ToString();
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
