using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace 服装库存管理系统
{
    public partial class 用户登录页 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string UserName = TextBox1.Text;
            string PassWord = TextBox2.Text;
            Session["shorttime"] = DateTime.Now.ToString("yyyy-MM-dd");
            string connstr = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();
            string sql = "select * from 用户表";
            OleDbCommand comm = new OleDbCommand(sql, conn);
            OleDbDataReader dr = comm.ExecuteReader();
            string cname = null;
            string cpassword = null;
            string yourname = null;
            string bz = null;
            int flag = 0;
            while (dr.Read())
            {
                cname = dr["账号"].ToString();
                cpassword = dr["密码"].ToString();
                yourname = dr["姓名"].ToString();
                bz = dr["删除标志"].ToString();
                Session["密码"] = cpassword;
                Session["姓名"] = yourname;
                Session["删除标志"] = bz;
                if (cname.Equals(UserName) && cpassword.Equals(PassWord) && bz.Equals("0"))
                {
                    flag = 1;
                    break;
                }
            }
            dr.Close();
            if (flag == 1)
            {
                string connstr3 = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                OleDbConnection conn3 = new OleDbConnection(connstr3);
                conn3.Open();
                string sql3 = "select * from [密码校对表]";
                OleDbCommand comm3 = new OleDbCommand(sql3, conn3);
                OleDbDataReader dr3 = comm3.ExecuteReader();
                string yh1 = null;
                string tt1 = null;
                int cs1 = 0;
                while (dr3.Read())
                {
                    yh1 = dr3["用户账户"].ToString();
                    tt1 = dr3["时间"].ToString();
                    cs1 = int.Parse(dr3["错误次数"].ToString());
                }
                dr3.Close();
                if (cs1 > 3 && yh1.Equals(UserName) && tt1.Equals(Session["shorttime"]))
                {
                    Response.Write("<script>alert('您已登录错误超过3次，请明天再登录！');</script>");
                }
                else
                {
                    Session["账号"] = TextBox1.Text.Trim();
                    Response.Write("<script>alert('登录成功！');window.location = '首页.aspx';</script>");
                }
            }
            else
            {
                string connstr1 = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                OleDbConnection conn1 = new OleDbConnection(connstr1);
                conn1.Open();
                string sql1 = "select * from [密码校对表]";
                OleDbCommand comm1 = new OleDbCommand(sql1, conn1);
                OleDbDataReader dr1 = comm1.ExecuteReader();
                string yh = null;
                string tt = null;
                int cs = 0;
                while (dr1.Read())
                {
                    yh = dr1["用户账户"].ToString();
                    tt = dr1["时间"].ToString();
                    cs = int.Parse(dr1["错误次数"].ToString());
                }
                dr1.Close();
                if (yh == null)
                {
                    OleDbConnection conn3 = new OleDbConnection();
                    conn3.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                    OleDbCommand comm3 = new OleDbCommand();
                    conn3.Open();
                    comm3.CommandText = "insert into [密码校对表] (用户账户,时间,错误次数)values('" + UserName + "','" + Session["shorttime"] + "'," + 1 + ")";
                    comm3.Connection = conn3;
                    comm3.ExecuteNonQuery();
                    conn3.Close();
                    Response.Write("<script>alert('用户名或密码错误，请重新登录！');</script>");

                }
                else if (yh != null && yh.Equals(UserName) && tt.Equals(Session["shorttime"]) && cs > 3)
                {
                    Response.Write("<script>alert('您已登录错误3次，请明天再登录！');</script>");
                }
                else if (yh != null && yh.Equals(UserName) && tt.Equals(Session["shorttime"]) && cs <= 3)
                {
                    cs = cs + 1;
                    OleDbConnection con = new OleDbConnection();
                    con.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                    con.Open();
                    OleDbCommand commandupdate = new OleDbCommand();
                    commandupdate.CommandText = "UPDATE [密码校对表] SET 错误次数='" + cs + "' WHERE 用户账户='" + yh + "' ";
                    commandupdate.Connection = con;
                    commandupdate.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('用户名或密码错误，请重新登录！');</script>");


                }
            }
        }
    }
}