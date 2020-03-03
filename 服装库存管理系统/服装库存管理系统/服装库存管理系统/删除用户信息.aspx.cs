using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;


namespace 服装库存管理系统
{
    public partial class 删除用户信息 : System.Web.UI.Page
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
            if (e.CommandName == "select")
            {
                int index = Convert.ToInt32(e.CommandArgument);  //  确定点击的行
                GridViewRow row = GridView1.Rows[index];
                string id = row.Cells[0].Text;
                String state = "1";
                string connstr = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                OleDbConnection conn = new OleDbConnection(connstr);
                conn.Open();
                string sql = "update [用户表] set 删除标志='" + state + "' where ID =" + id + "";
                OleDbCommand com = new OleDbCommand(sql, conn);
                com.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('删除员工成功！');window.location='删除用户信息.aspx';</script>");
            }
        }
    }

}