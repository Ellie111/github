﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


public partial class member_info : System.Web.UI.Page
{
     


    public DataRow dr;
    public String bookid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["yhm"] == null)
        {

            Response.Write("<script>alert('您还没有登录，不能查看个人中心信息!');window.location.href='user_login.aspx';</script>");
            return;
        }
     
            SqlConnection myConn = GetConnection();
            string sqlStr = "select * from users where uname='" + Convert.ToString(Session["yhm"]) + "' ";
            SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs, "member");
            this.GridView1.DataSource = myDs.Tables["member"].DefaultView;
            this.GridView1.DataBind();
            dr = myDs.Tables["member"].Rows[0];
            Session["account"] = dr["account"].ToString();
         

    }
    public DataView myBind()
    {
        //建立数据连接
        SqlConnection myConn = GetConnection();
        string sqlStr = "select * from users where uname='" + Convert.ToString(Session["yhm"]) + "' ";
        SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
        DataSet myDs = new DataSet();
        myDa.Fill(myDs, "member");
        return myDs.Tables["member"].DefaultView;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //获取当前显示页索引
        GridView1.PageIndex = e.NewPageIndex;

        //重新绑定　
        this.GridView1.DataSource = myBind();
        this.GridView1.DataBind();
    }


    public SqlConnection GetConnection()
    {
        string myStr = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection myConn = new SqlConnection(myStr);
        return myConn;
    }

    public string SubStr(string sString, int nLeng)
    {
        if (sString.Length <= nLeng)
        {
            return sString;
        }
        string sNewStr = sString.Substring(0, nLeng);
        sNewStr = sNewStr + "...";
        return sNewStr;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}