using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WK.Model
{
    public partial class bus_pickup_market
    {
        private List<WK.Model.bus_market> _listMarket;
        public List<WK.Model.bus_market> listMarket
        {
            set { _listMarket = value; }
            get { return _listMarket; }
        }
    }
}
