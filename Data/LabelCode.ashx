<%@ WebHandler Language="C#" Class="LabelCode" %>

using System;
using System.Web;
using Newtonsoft.Json;
using System.Data;
public class LabelCode : IHttpHandler {
    SQlHelper db = new SQlHelper();
    Plan types = new Plan();
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            types.Sql = "select dose from codeMaster where label='" + context.Request["code"].ToString() + "' and jz='" + context.Request["Jz"].ToString() + "' and ItemCode='" + context.Request["Fx"].ToString() + "'";
            IDataReader dr = db.ExecuteReader("SqlServer", types.Sql);
            if (dr.Read())
            {
                if (dr["dose"].ToString() == "")
                {
                    context.Response.Write("未识别此部品");
                }
                else
                {
                    types.result = dr["dose"].ToString();
                    context.Response.Write(JsonConvert.SerializeObject(types.result));
                }
                
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