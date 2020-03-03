using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace 服装库存管理系统
{
    public partial class 修改密码页 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["账号"] == null)
            {
                Response.Write("<script>alert('您还未登录，请前往登录页面进行登录！');window.location='用户登录页.aspx';</script>");
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            //获取旧密码及用户名
            OleDbDataReader reader;

            string oleP = TextBox1.Text;
            string user = "";
            int i = 0;
            if (Session["账号"] != null)
                user = Session["账号"].ToString();
            else
                return;
            // 验证旧密码
            string sql = "select count(*) from 用户表 where 账号 ='" + user + "' and 密码 = '" + oleP + "'";
            string connStr = "provider=Microsoft.Ace.Oledb.12.0;Data Source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbConnection conn = new OleDbConnection(connStr);    //建立连接
            OleDbCommand cmd = new OleDbCommand(sql);   //输入sql语句
            cmd.Connection = conn;
            conn.Open();    //打开连接
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                i = (int)reader[0];
            }
            reader.Close();
            if (i > 0) //验证成功
            {
                // 获取新密码
                string newP = TextBox2.Text;
                // 更新数据
                sql = "update 用户表 set 密码='" + newP + "' where 账号='" + user + "'";
                cmd.CommandText = sql;
                if (cmd.ExecuteNonQuery() > 0)
                {

                    Response.Write("<script language=javascript>alert('密码修改成功！请前往登录页面重新登录');window.location = '用户登录页.aspx';</" + "script");

                }
                else
                {
                    Response.Write("<script language=javascript>alert('密码修改失败！返回首页');window.location = '首页.aspx';</" + "script");


                }
            }
            else { Response.Write("<script language=javascript>alert('旧密码不正确！返回首页');window.location = '首页.aspx';</" + "script"); }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {

            Response.Redirect("首页.aspx");
        }
    }
}