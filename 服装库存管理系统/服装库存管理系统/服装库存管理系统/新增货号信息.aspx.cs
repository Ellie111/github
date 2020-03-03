using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace 服装库存管理系统
{
    public partial class 新增货号信息 : System.Web.UI.Page
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
            String xuhao = TextBox1.Text;
            String huohao = TextBox2.Text;
            String color = DropDownList2.Text;
            String size = DropDownList1.Text;
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            conn.Open();
            String sql = "select * from 货号表";
            OleDbCommand comm = new OleDbCommand(sql, conn);
            OleDbDataReader dr = comm.ExecuteReader();
            String xh = null;
            String hh = null;
            String sh = null;
            String cm = null;
            int flag = 0;
            while (dr.Read())
            {
                xh = dr["序号"].ToString();
                hh = dr["货号"].ToString();
                sh = dr["色号"].ToString();
                cm = dr["尺码"].ToString();
                if ((xh.Equals(xuhao)) || (hh.Equals(huohao) && sh.Equals(color) && cm.Equals(size)))
                {
                    flag = 1;
                    break;
                }

            }
            dr.Close();
            if (flag == 1)
            {
                Response.Write("<script language=javascript>alert('此商品已存在，请重新输入!');window.location = '新增货号信息.aspx';</script>");
            }
            else
            {
                String insertstu = "insert into 货号表(序号,货号,色号,尺码,品名,面料,里料,厂价,售价) values ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + DropDownList2.Text + "','" + DropDownList1.Text + "','" + TextBox3.Text + "','" + DropDownList3.Text + "','" + DropDownList4.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "')";
                OleDbCommand com = new OleDbCommand(insertstu, conn);
                com.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script language=javascript>alert('增加成功!');window.location = '新增货号信息.aspx';</script>");

            }
        }
    }
}