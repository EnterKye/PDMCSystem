<%@ WebHandler Language="C#" Class="AddPlan" %>

using System;
using System.Web;
using Newtonsoft.Json;
using System.Data;
public class AddPlan : IHttpHandler {

    SQlHelper db = new SQlHelper();
    Plan num = new Plan();
    public void ProcessRequest (HttpContext context) {
      //  context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        num.jz = context.Request["jz"].ToString();
        num.ItemCode = context.Request["ItemCode"].ToString();
        num.PlanNum = Convert.ToInt32(context.Request["PlanNum"]);
        num.users = context.Request["users"].ToString();
       string sql = "insert into ProducePlan values('" + num.jz + "','" + num.ItemCode + "','" + num.PlanNum + "','" + num.users + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "')";
       DataTable dt = db.ExcuteQuery("SqlServer", sql);
        if (dt.Rows.Count > 0)
        {

        }
        else
        { 
            
        }
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}