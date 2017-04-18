using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WK.Model
{
    public partial class bus_deadline
    {
        private TimeSpan? _deadline_times_s;
        public TimeSpan? deadline_times_s
        {
            set { _deadline_times_s = value; }
            get { return _deadline_times_s; }
        }
    }
}
