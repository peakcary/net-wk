using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WK.Model
{
    public partial class bus_order
    {
        private List<Model.bus_order_dish> _listOrderDish;
        public List<Model.bus_order_dish> listOrderDish
        {
            set { _listOrderDish = value; }
            get { return _listOrderDish; }
        }
    }
}
