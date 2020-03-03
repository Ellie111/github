using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace 服装库存管理系统
{
    public partial class 提交出库单 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["账号"] == null)
            {
                Response.Write("<script>alert('您还未登录，请前往登录页面进行登录！');window.location='用户登录页.aspx';</script>");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "submit")
            {
                string connstr = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                OleDbConnection conn = new OleDbConnection(connstr);
                conn.Open();
                int index = Convert.ToInt32(e.CommandArgument);  //  确定点击的行
                GridViewRow row = GridView1.Rows[index];
                string id = row.Cells[0].Text;
                int i = int.Parse(id);
                string sql = "update [出库单表] set 确认状态='1' where 出库单据号 =" + i + "";
                int count = 0;
                OleDbCommand com = new OleDbCommand(sql, conn);
                count = com.ExecuteNonQuery();
                conn.Close();
                if (count == 1)
                {
                    ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('提交成功！');</script>");
                }
            }
        }
    }
}