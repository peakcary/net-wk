using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WK.Model
{
    public partial class bus_pickup_address
    {
        private List<WK.Model.bus_order> _listOrder;
        public List<WK.Model.bus_order> listOrder
        {
            set { _listOrder = value; }
            get { return _listOrder; }
        }
    }
}
