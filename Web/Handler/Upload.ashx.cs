using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Qiniu.IO.Model;
using Qiniu.Common;
using System.Text;
using Qiniu.Util;
using Qiniu.IO;
 

namespace WK.Web.Handler
{
   
        
    /// <summary>
    /// Upload 的摘要说明
    /// </summary>
    public class Upload : IHttpHandler
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
            //不让浏览器缓存
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";

            string t = context.Request.Params["t"];
            StringBuilder sb = new StringBuilder();

            string AK = "pfbSmizd7FGjdPqJ4l9jbvXDNgegvB3gZ2FqyPpI";
            string SK = "JCquyPx5tcrd8skdY8ZutBVLvlxnrDlJCPJuxaGE";
			// 目标空间名
			string bucket = "busimages";
            //// 目标文件名
            //string saveKey = "SAVE_KEY";
            //// 本地文件
            //string localFile = "LOCAL_FILE";
	                         
			// 上传策略
			PutPolicy putPolicy = new PutPolicy();
			// 设置要上传的目标空间
			putPolicy.Scope = bucket;
			// 上传策略的过期时间(单位:秒)
			putPolicy.SetExpires(3600);
		    // 文件上传完毕后，在多少天后自动被删除
			putPolicy.DeleteAfterDays = 1;
			Mac mac = new Mac(AK,SK); // Use AK & SK here
	        // 生成上传凭证       
            string token = Auth.CreateUploadToken(mac, putPolicy.ToJsonString());
            //StringBuilder sbReturn = new StringBuilder();
            //sbReturn.AppendFormat("{token:{0}}", token.ToString());
            context.Response.Write(token.ToString());
        }

        
    }
}