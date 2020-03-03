using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btn_register(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");//跳转到用户注册页面
    }

    protected void btn_login(object sender, EventArgs e)
    {
        //实例化公共类对象
        DB db = new DB();
        string role = this.role.Text.Trim();
        string userName = this.username.Text.Trim();
        string passWord = this.password.Text.Trim();//对密码进行加密处理
        
            //获取用户信息
        SqlDataReader dr = db.reDr("select * from users where uname='" + userName + "' and pwd='" + passWord  + "'and role='" +role+ "'");
            dr.Read();
            if (dr.HasRows)//通过dr中是否包含行判断用户是否通过身份验证
            {
                Session["UserID"] = dr.GetValue(0);//将该用户的ID存入Session["UserID"]中
                Session["yhm"] = dr.GetValue(1);//将该用户名存入Session["yhm"]中
            //    ???Session["account"] = dr.GetValue(5);//将该用户名存入Session["yhm"]中
                if (role == "管理")
                {

                    Response.Redirect("admin/admin.aspx");
                }

                if (role == "老师")
                {
                    Response.Redirect("teacher/admin.aspx");

                }
                if (role == "学生")
                {
                    Response.Redirect("member_info.aspx");

                }
            }
            else
            {
                Response.Write("<script>alert('登录失败！请返回查找原因');location='admin_login.aspx'</script>");
            }
            dr.Close();
   
    }


}
