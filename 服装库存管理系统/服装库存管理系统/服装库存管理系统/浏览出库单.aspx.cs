using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 服装库存管理系统
{
    public partial class 浏览出库单 : System.Web.UI.Page
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
            //查看明细
            if (e.CommandName == "look")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];

                string id = row.Cells[0].Text;
                int ID = int.Parse(id);
                Session["ckdjh1"] = ID;
                Response.Redirect("浏览出库单.aspx");

            }
        }
    }
}