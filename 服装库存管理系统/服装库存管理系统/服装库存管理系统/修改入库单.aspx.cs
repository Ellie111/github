using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace 服装库存管理系统
{
    public partial class 修改入库单 : System.Web.UI.Page
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
            if (e.CommandName == "del")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                string state = "1";
                string id = row.Cells[2].Text;
                int did = int.Parse(id);
                OleDbConnection conn = new OleDbConnection();
                conn.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                conn.Open();
                OleDbCommand commandupdate = new OleDbCommand();
                commandupdate.CommandText = "UPDATE [入库单表] SET 删除状态='" + state + "' WHERE (入库单据号=" + did + ")";
                commandupdate.Connection = conn;
                commandupdate.ExecuteNonQuery();
                conn.Close();
                OleDbConnection conn2 = new OleDbConnection();
                conn2.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                conn2.Open();
                OleDbCommand commandupdate2 = new OleDbCommand();
                commandupdate2.CommandText = "UPDATE [入库单明细表] SET 删除标志='" + state + "' WHERE (入库单据号=" + did + ")";
                commandupdate2.Connection = conn2;
                commandupdate2.ExecuteNonQuery();
                conn2.Close();
                ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('删除成功！');</script>");
            }
        }
    }
}