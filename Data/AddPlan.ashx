<%@ WebHandler Language="C#" Class="AddPlan" %>

using System;
using System.Web;
using Newtonsoft.Json;
using System.Data;
using System.Collections;
public class AddPlan : IHttpHandler {

    SQlHelper db = new SQlHelper();
    Plan num = new Plan();
    ArrayList result = new ArrayList();
    Hashtable ht = new Hashtable();
    public void ProcessRequest (HttpContext context) {
        string action = context.Request["action"].ToString();
        switch (action) 
        {
            case "errorApply":
                errorApply(context);
                break;
            case "apply":
                Apply(context);
                break;
            default:
                context.Response.StatusCode = 401;
                break;
                
        }
       

        
    }
    public void errorApply(HttpContext context) 
    { 
    
    }
    public void Apply(HttpContext context)
    {
        try
        {
            num.jz = context.Request["jz"].ToString();
            num.ItemCode = context.Request["ItemCode"].ToString();
            num.PlanNum = Convert.ToInt32(context.Request["PlanNum"]);
            num.users = context.Request["users"].ToString();
            int singleId = Convert.ToInt32(DateTime.Now.ToString("yyyyMMdd"));//当天数值
            //获取今天最大单号
            string GetSingleId = "select max(singleid) 'max' from ProducePlan where  DATEDIFF(dd,times,GETDATE())=0";
            ArrayList avgId = new ArrayList();
            IDataReader dr = db.ExecuteReader("SqlServer", GetSingleId);
            if (dr.Read())
            {
                if (dr["max"].ToString() == "")
                {
                    avgId.Add(singleId + "001");
                }
                else
                {
                    long maxId = Convert.ToInt64(dr["max"].ToString());
                    maxId++;
                    avgId.Add(maxId);
                }
            }
            string sql = "insert into ProducePlan(jz,ItemCode,PlanNum,users,times,Remarks,SingleId) values('" + num.jz + "','" + num.ItemCode + "','" + num.PlanNum + "','" + num.users + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "','正常申请','" + avgId[0] + "')";
            db.ExcuteSqlScalar("SqlServer", sql);
            ht.Add("state", "0");
            result.Add(ht);
            context.Response.Write(JsonConvert.SerializeObject(result));
        }
        catch
        {
            ht.Add("state", "-1");
            result.Add(ht);
            context.Response.Write(JsonConvert.SerializeObject(result));
        }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}