using System;
using System.Data;
using System.Text;
using System.Web;
using Maticsoft.DBUtility;

namespace WK.Web.Handler
{
    /// <summary>
    /// index 的摘要说明
    /// </summary>
    public class index : IHttpHandler
    {

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        [Serializable]
        public class ReturnInfo
        {
            public bool isSuccess { get; set; }
        }
        [Serializable]
        public class Record
        {
            public int RecordCount { get; set; }
        }

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";

            string t = context.Request.Params["t"];
            StringBuilder sb = new StringBuilder();
            switch (t)
            {
                case "getDateOrderList":
                    sb.Append(getDateOrderList(context));
                    break;
                case "getPersonOrderList":
                    sb.Append(getPersonOrderList(context));
                    break;
                case "getPriceOrderList":
                    sb.Append(getPriceOrderList(context));
                    break;
                case "getListCountByTomorrowEattype":
                    sb.Append(getListCountByTomorrowEattype(context));
                    break;
                case "getListCountByYesterdayCreateUser":
                    sb.Append(getListCountByYesterdayCreateUser(context));
                    break;
                case "getListCountByAllUser":
                    sb.Append(getListCountByAllUser(context));
                    break;
                case "getAllDeadlineListAndTime":
                    sb.Append(getAllDeadlineListAndTime(context));
                    break;   
                    
                default:
                    sb.Append("");
                    break;
            }
            context.Response.Write(sb.ToString());
        }


        private string getDateOrderList(HttpContext context)
        {  
            int minDays = int.Parse(context.Request.Params["minDays"]); 
            WK.BLL.bus_order bll = new WK.BLL.bus_order(); 
            return Newtonsoft.Json.JsonConvert.SerializeObject(bll.GetDateList(minDays).Tables[0]);
        }
        private string getPersonOrderList(HttpContext context)
        {
            int minDays = int.Parse(context.Request.Params["minDays"]);
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            return Newtonsoft.Json.JsonConvert.SerializeObject(bll.GetPersonList(minDays).Tables[0]);
        }
        private string getPriceOrderList(HttpContext context)
        {
            int minDays = int.Parse(context.Request.Params["minDays"]);
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            return Newtonsoft.Json.JsonConvert.SerializeObject(bll.GetPriceList(minDays).Tables[0]);
        }

        private string getListCountByTomorrowEattype(HttpContext context)
        {
            int eatType = int.Parse(context.Request.Params["eatType"]);
            int minDays = int.Parse(context.Request.Params["minDays"]);
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            Record r = new Record();
            r.RecordCount = bll.GetListCountByTomorrowEattype(eatType);
            return Newtonsoft.Json.JsonConvert.SerializeObject(r);
        }

        private string getListCountByYesterdayCreateUser(HttpContext context)
        { 
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            Record r = new Record();
            r.RecordCount = bll.GetListCountByYesterdayCreateUser();
            return Newtonsoft.Json.JsonConvert.SerializeObject(r);
        }

        private string getListCountByAllUser(HttpContext context)
        { 
            WK.BLL.bus_order bll = new WK.BLL.bus_order();
            Record r = new Record();
            r.RecordCount = bll.GetListCountByAllUser();
            return Newtonsoft.Json.JsonConvert.SerializeObject(r);
        }

        private string getAllDeadlineListAndTime(HttpContext context)
        { 
            WK.BLL.bus_deadline bll = new WK.BLL.bus_deadline();
            DataSet ds = bll.GetAllListAndTime();
            DataTable dt1 = ds.Tables[0];
            DataTable dt2 = ds.Tables[1];
            DateTime dTime = DateTime.Parse( dt1.Rows[0][0].ToString());


            string[] Day = new string[] { "0", "1", "2", "3", "4", "5", "6" };
            string week = Day[Convert.ToInt32(dTime.DayOfWeek.ToString("d"))].ToString();

            DataTable newdt = new DataTable(); 
            newdt = dt2.Clone(); // 克隆dt 的结构，包括所有 dt 架构和约束,并无数据； 

            if (week == "0" || week == "6")
            {
                DataRow[] rows = dt2.Select(" deadline_time_type=2 ");  
                foreach (DataRow row in rows)   
                {
                    newdt.Rows.Add(row.ItemArray);
                } 
            }
            else 
            {
                DataRow[] rows = dt2.Select(" deadline_time_type=1 "); 
                foreach (DataRow row in rows)   
                {
                    newdt.Rows.Add(row.ItemArray);
                } 
            }

            DataTable dt = new DataTable("datatable");
            dt.Columns.Add("eat_type", typeof(System.Int32));
            dt.Columns.Add("dtime", typeof(System.String));
            dt.Columns.Add("dtimenow", typeof(System.String));
            dt.Columns.Add("dtimes", typeof(System.Int32));
            dt.Columns.Add("remainTime", typeof(System.String));
            dt.Columns.Add("isDead", typeof(System.Boolean));

           
            for(int i=0,l=newdt.Rows.Count;i<l;i++)
            {

                string s = dTime.AddDays(-int.Parse(newdt.Rows[i]["deadline_days"].ToString())).ToShortDateString() + DateTime.Parse(newdt.Rows[i]["deadline_times"].ToString()).ToString(" HH:mm:ss");

                //string s1 = dTime.ToShortDateString() + " 00:00:00";
                string s1 = dTime.ToString();
                DataRow row = dt.NewRow();
                row["eat_type"] = newdt.Rows[i]["eat_type"];
                row["dtime"] = s;
                row["dtimenow"] = s1;
                row["dtimes"] = DateTime.Compare(DateTime.Parse(s1), DateTime.Parse(s));
                row["remainTime"] = DateDiff(DateTime.Parse(s), DateTime.Parse(s1));
                row["isDead"] = CompareDate(s, s1,0);
                dt.Rows.Add(row);
            }


            //目标日期零点 - deadline_days（提前天数）+deadline_times（截单时间点）



            return Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        }

        private bool CompareDate(string today, string writeDate, int n)
        {
            DateTime Today = Convert.ToDateTime(today);
            DateTime WriteDate = Convert.ToDateTime(writeDate);
            WriteDate = WriteDate.AddDays(n);
            if (Today >= WriteDate)
                return false;
            else
                return true;
        }

        //计算时间的差值
        private  string DateDiff(DateTime DateTime1, DateTime DateTime2)
        {
            string dateDiff = null;
            TimeSpan ts1 = new TimeSpan(DateTime1.Ticks);
            TimeSpan ts2 = new TimeSpan(DateTime2.Ticks);
            TimeSpan ts = ts1.Subtract(ts2).Duration();
            dateDiff = ts.Days.ToString() + "天" + ts.Hours.ToString() + "小时" + ts.Minutes.ToString() + "分钟" + ts.Seconds.ToString() + "秒";
            return dateDiff;
            #region note
            //C#中使用TimeSpan计算两个时间的差值
            //可以反加两个日期之间任何一个时间单位。
            //TimeSpan ts = Date1 - Date2;
            //double dDays = ts.TotalDays;//带小数的天数，比如1天12小时结果就是1.5 
            //int nDays = ts.Days;//整数天数，1天12小时或者1天20小时结果都是1  
            #endregion
        }

    }
}