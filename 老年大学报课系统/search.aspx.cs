﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string name;
        Application.Lock();
        name = Application["name"].ToString();
        Application.UnLock();

        SqlConnection myConn = GetConnection();
        string sqlStr = "select * from course where title like '%" + name + "%' ";
        SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
        DataSet myDs = new DataSet();
        myDa.Fill(myDs, "books");
        this.GridView1.DataSource = myDs.Tables["books"].DefaultView;
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