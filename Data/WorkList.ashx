<%@ WebHandler Language="C#" Class="WorkList" %>

using System;
using System.Web;
using System.Data;
using Newtonsoft.Json;
public class WorkList : IHttpHandler {
    SQlHelper db = new SQlHelper();
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        int i;
        int pageSize = int.Parse(context.Request.QueryString["limit"]);
        int pageNumber = int.Parse(context.Request.QueryString["page"]);

        string str = JsonConvert.SerializeObject(SQLJson(pageNumber, pageSize, out i));
      //str = "{\"code\":0,\"msg\":\"\",\"count\":" + i + ",\"data\":" + str + "}";
        str = "{\"code\":0,\"msg\":\"\",\"count\":" + i + ",\"data\":" + str + "}";
        context.Response.Write(str);     
    }

    public DataTable SQLJson(int PageNumber, int PageSize, out int i) 
    {
        int pages;
        pages = PageSize * (PageNumber - 1);
        string sql = "select SingleID,jz,ItemCode,LabelCode,Times,Users from (" + "select *,row_number() over(order by id desc) num " + "from ProducePlan as tb_a) as tb_b" + " where num between " + ((PageNumber - 1) * PageSize + 1) + " and " + (PageNumber) * PageSize + " ";
        DataTable ds = db.ExcuteQuery("SqlServer", sql);
        string count = "select count(*) '数量' from ProducePlan";
        DataTable dt = db.ExcuteQuery("SqlServer", count);
        i = Convert.ToInt32(dt.Rows[0]["数量"].ToString());
        return ds;
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}
