﻿<%@ WebHandler Language="C#" Class="LabelCode" %>

using System;
using System.Web;
using Newtonsoft.Json;
using System.Data;
public class LabelCode : IHttpHandler {
    SQlHelper db = new SQlHelper();
    Plan types = new Plan();
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        try
        {
            types.Sql = "select dose from codeMaster where label='" + context.Request["code"].ToString() + "'";
            IDataReader dr = db.ExecuteReader("SqlServer", types.Sql);
            if (dr.Read())
            {
                types.result = dr["dose"].ToString();
                context.Response.Write(JsonConvert.SerializeObject(types.result));
            }
            else
            {
                context.Response.Write("未识别此部品");
            }
            
        }
        catch 
        {
            context.Response.Write(JsonConvert.SerializeObject("系统错误"));
        }
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}