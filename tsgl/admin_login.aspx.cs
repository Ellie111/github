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

    protected void btn_login(object sender, EventArgs e)
    {
        //实例化公共类对象
        DB db = new DB();
        string userName = this.username.Text.Trim();
        string passWord = this.password.Text.Trim();//对密码进行加密处理
    
            //获取用户信息
            SqlDataReader dr = db.reDr("select * from admin where aname='" + userName + "' and apwd='" + passWord + "'");
            dr.Read();
            if (dr.HasRows)//通过dr中是否包含行判断用户是否通过身份验证
            {
                Session["UserID"] = dr.GetValue(0);//将该用户的ID存入Session["UserID"]中
                Session["yhm"] = dr.GetValue(1);//将该用户的权限存入Session["Role"]中
                Response.Redirect("admin/admin.aspx");//跳转到主页
            }
            else
            {
                Response.Write("<script>alert('登录失败！请返回查找原因');location='admin_login.aspx'</script>");
            }
            dr.Close();
   
    }


}
