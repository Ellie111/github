using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace 服装库存管理系统
{
    public partial class 新增出库单 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["账号"] == null)
            {
                Response.Write("<script>alert('您还未登录，请前往登录页面进行登录！');window.location='用户登录页.aspx';</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string jbr = TextBox1.Text;
            string jsr = TextBox2.Text;
            string address = TextBox3.Text;
            string phone = TextBox4.Text;
            string sign = TextBox5.Text;
            string warehouse = DropDownList1.Text;

            string Qstate = "0";
            string Sstate = "0";
            Session["Time"] = DateTime.Now.ToString();

            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbCommand commandinsert = new OleDbCommand();
            conn.Open();
            commandinsert.CommandText = "INSERT INTO [出库单表](出库日期,经办人,所出仓库,接收人,接收人电话,接收人地址,备注,确认状态,删除状态) VALUES('" + DateTime.Now.ToString() + "','" + jbr + "','" + warehouse + "','" + jsr + "','" + phone + "','" + address + "','" + sign + "','" + Qstate + "','" + Sstate + "')";
            commandinsert.Connection = conn;
            commandinsert.ExecuteNonQuery();
            conn.Close();

            //查询仓库编号
            string connstr = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbConnection conn1 = new OleDbConnection(connstr);
            conn1.Open();
            string sql = "select * from [仓库表] WHERE 仓库编号='" + warehouse + "'";
            OleDbCommand comm = new OleDbCommand(sql, conn1);
            OleDbDataReader dr = comm.ExecuteReader();
            string wid = null;


            while (dr.Read())
            {
                wid = dr["ID"].ToString();
            }
            dr.Close();

            //查询库存仓库编号
            string connstr1 = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbConnection conn2 = new OleDbConnection(connstr1);
            conn2.Open();
            string sql2 = "select * from [仓库表] WHERE 仓库编号='" + warehouse + "'";
            OleDbCommand comm2 = new OleDbCommand(sql2, conn2);
            OleDbDataReader dr2 = comm2.ExecuteReader();
            string wid2 = null;


            while (dr2.Read())
            {
                wid2 = dr2["ID"].ToString();
            }
            dr2.Close();
            if (wid.Equals(wid2))
            {
                Session["wid"] = wid;
                Response.Write("<script>alert('新增出库单成功！');</script>");
                Response.Redirect("新增出库单明细.aspx");
            }
            else
            {
                Response.Write("<script>alert('该仓库内无商品，请重新选择！');window.location='新增出库单.aspx';</script>");
            }
        }
    }
}