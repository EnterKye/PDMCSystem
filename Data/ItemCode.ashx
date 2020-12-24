<%@ WebHandler Language="C#" Class="ItemCode" %>

using System;
using System.Web;
using Newtonsoft.Json;
using System.Data;
using System.Collections;
public class ItemCode : IHttpHandler {
    SQlHelper db = new SQlHelper();
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        string jz = context.Request["jz"].ToString();
        IDataReader reader = db.ExecuteReader("SqlServer", "select distinct ItemCode from codeMaster where jz='" + jz + "'");
        ArrayList list = new ArrayList();
        while (reader.Read()) 
        {
            list.Add(reader["ItemCode"].ToString());
        }
        context.Response.Write(JsonConvert.SerializeObject(list));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}