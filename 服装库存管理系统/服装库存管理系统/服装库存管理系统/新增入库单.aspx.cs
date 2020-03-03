using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace 服装库存管理系统
{
    public partial class 新增入库单 : System.Web.UI.Page
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
            string ly = TextBox2.Text;
            string ck = DropDownList1.Text;
            string beizhu = TextBox3.Text;
            Session["time"] = DateTime.Now.ToString();
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbCommand comm = new OleDbCommand();
            conn.Open();
            comm.CommandText = "insert into [入库单表] (入库日期,经办人,所入仓库,来源,备注)values('" + DateTime.Now.ToString() + "','" + jbr + "','" + ck + "','" + ly + "','" + beizhu + "')";
            comm.Connection = conn;
            comm.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('增加入库单成功！');window.location = '新增入库单明细.aspx';</script>");


        }

    }
    }
