using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class user_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //注册按钮
    protected void btn_register(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");//跳转到用户注册页面
    }
    //登录按钮
    protected void btn_login(object sender, EventArgs e)
    {
        //实例化公共类对象
        DB db = new DB();
        string userName = this.username.Text.Trim();
        string passWord = this.password.Text.Trim();//对密码进行加密处理
      
            SqlDataReader dr = db.reDr("select * from users where uname='" + userName + "' and pwd='" + passWord + "'");
            dr.Read();
            if (dr.HasRows)//通过dr中是否包含行判断用户是否通过身份验证
            {
                Session["id"] = dr.GetValue(0);//将该用户的ID存入Session["UserID"]中
                Session["uname"] = dr.GetValue(1);//将该用户的权限存入Session["Role"]中
                Response.Redirect("default.aspx");//跳转到主页
            }
            else
            {
                Response.Write("<script>alert('登录失败！请返回查找原因');location='user_login.aspx'</script>");
            }
            dr.Close();
     
    }
}
