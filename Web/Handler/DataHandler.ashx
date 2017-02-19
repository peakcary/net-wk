<%@ WebHandler Language="C#" Class="DataHandler" %>
using System;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public class DataHandler : IHttpHandler
{
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //不让浏览器缓存
        context.Response.Buffer = true;
        context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
        context.Response.AddHeader("pragma", "no-cache");
        context.Response.AddHeader("cache-control", "");
        context.Response.CacheControl = "no-cache";

        string t = context.Request["t"];
        StringBuilder sb = new StringBuilder();
        switch (t)
        {
            case "getLeftTree":
                sb.Append(getLeftTree());
                break; 
                
                

            default:
                sb.Append("");
                break;
        }
        context.Response.Write(sb.ToString());
    }

    //
    private string getLeftTree()
    {
        StringBuilder sb = new StringBuilder();

        DataSet ds = new DataSet();
        StringBuilder strWhere = new StringBuilder();
        Maticsoft.BLL.user bll = new Maticsoft.BLL.user();
        ds = bll.GetList(strWhere.ToString());  
        sb.Append("{'hello':'peak'}");
        return sb.ToString(); 
    }
     


}