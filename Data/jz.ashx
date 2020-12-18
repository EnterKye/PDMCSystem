<%@ WebHandler Language="C#" Class="jz" %>

using System;
using System.Web;
using System.Data;
using System.Collections;
using Newtonsoft.Json;
public class jz : IHttpHandler {
    
    SQlHelper db = new SQlHelper();
    Master codeMaster = new Master();
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        IDataReader dr = db.ExecuteReader("SqlServer", "select distinct jz from codemaster");
        ArrayList listJz = new ArrayList();
        while (dr.Read()) 
        {
            codeMaster.jz = dr["jz"].ToString();
            listJz.Add(codeMaster.jz);        
        }
        codeMaster.Json = JsonConvert.SerializeObject(listJz);
        context.Response.Write(codeMaster.Json);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}