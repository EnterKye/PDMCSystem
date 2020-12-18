<%@ WebHandler Language="C#" Class="login" %>

using System;
using System.Web;
using System.Data;
using Newtonsoft.Json;
public class login : IHttpHandler {
    SQlHelper db = new SQlHelper();    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
       // context.Response.Write("Hello World");
        string user = context.Request["a1"];
        string pwd = context.Request["a2"];

        string sql = "select users,passwords from login where users='" + user + "' and passwords ='" + pwd + "'";
        DataTable dt = db.ExcuteQuery("SqlServer", sql);
        if (dt.Rows.Count == 1) 
        {
            context.Response.Write("0");
        }
        else
        {
            context.Response.Write("-1");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}