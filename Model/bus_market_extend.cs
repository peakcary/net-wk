using System;
using System.Collections.Generic;
namespace WK.Model
{ 
    public partial class bus_market
    {
        private int _pickup_address_id;
        public int pickup_address_id
        {
            set { _pickup_address_id = value; }
            get { return _pickup_address_id; }
        }

        private string _imageList;
        public string imageList
        {
            set { _imageList = value; }
            get { return _imageList; }
        }

        private List<WK.Model.bus_order> _listOrder;
        public List<WK.Model.bus_order> listOrder
        {
            set { _listOrder = value; }
            get { return _listOrder; }
        }
    }
}
