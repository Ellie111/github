﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

public partial class admin_modify_product : System.Web.UI.Page
{
    public DataRow dr;
    public String bookid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bookid = Request.Params["id"];

            SqlConnection myConn = GetConnection();
            string sqlStr = "select * from users where id=" + bookid;
            SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs, "books");
            dr = myDs.Tables["books"].Rows[0];
            uname.Text = dr["uname"].ToString();
       

       
            pwd.Text = dr["pwd"].ToString();
            content.Text = dr["nr"].ToString();

        }

    }

    protected void btn_click(object sender, EventArgs e)
    {



        bookid = Request.Params["id"];

        SqlConnection myConn = GetConnection();
        string sql = "update users set uname='" + uname.Text + "',pwd='" + pwd.Text + "',nr='" + content.Text + "' where id=" + bookid;

        SqlCommand cmd = new SqlCommand(sql, myConn);
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        Response.Write("<script>alert('修改成功');location='admin.aspx'</script>");



    }

    public SqlConnection GetConnection()
    {
        string myStr = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection myConn = new SqlConnection(myStr);
        return myConn;
    }


}