using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Plan 的摘要说明
/// </summary>
public class Plan
{
        /// <summary>
        /// 机种
        /// </summary>
        public string jz { get; set; }
        /// <summary>
        /// 方向
        /// </summary>
        public string ItemCode { get; set; }
        /// <summary>
        /// 计划数
        /// </summary>
        public int PlanNum { get; set; }
        /// <summary>
        /// sql操作
        /// </summary>
        public string Sql { get; set; }
        /// <summary>
        /// 用户
        /// </summary>
        public string users { get; set; }
        /// <summary>
        /// Read结果
        /// </summary>
        public string result { get; set; }
}