using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WK.Model
{
    public partial class bus_dish
    {
        private List<bus_dish_size> _listSize;
        public List<bus_dish_size> listSize
        { 
            set { _listSize = value; }
            get { return _listSize; }
        }

        private List<bus_image> _listImage;
        public List<bus_image> listImage
        {
            set { _listImage = value; }
            get { return _listImage; }
        }
    }
}
