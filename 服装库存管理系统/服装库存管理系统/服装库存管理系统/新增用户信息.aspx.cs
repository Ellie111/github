using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace 服装库存管理系统
{
    public partial class 新增用户信息 : System.Web.UI.Page
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
            string user = TextBox1.Text;
            string name = TextBox2.Text;
            string password = TextBox3.Text;
            string tel = TextBox4.Text;
            string juese = TextBox5.Text;
            string introduce = TextBox6.Text;
            string connstr = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();
            int count = 0;
            string sql1 = "select count(*) from [用户表] where 账号  ='" + user + "' ";
            string sql2 = "insert into [用户表]([账号],[姓名],[密码],[电话],[角色],[简介])values('" + user + "','" + name + "','" + password + "','" + tel + "','" + juese + "','" + introduce + "')";
            OleDbCommand Cmd = new OleDbCommand(sql2, conn);
            OleDbCommand Cmd1 = new OleDbCommand(sql1, conn);
            count = (int)Cmd1.ExecuteScalar();
            if (count == 0)
            {
                count = (int)Cmd.ExecuteNonQuery();
                if (count == 1)
                {

                    ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('新增用户成功');window.location = '新增用户信息.aspx';</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('此用户已存在！');</script>");
            }
        }
    }

}