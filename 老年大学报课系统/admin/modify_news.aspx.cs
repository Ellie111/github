using System;
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

public partial class admin_modify_news : System.Web.UI.Page
{
    public DataRow dr;
    public String bookid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bookid = Request.Params["id"];

            SqlConnection myConn = GetConnection();
            string sqlStr = "select * from ad where id=" + bookid;
            SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs, "ad");
            dr = myDs.Tables["ad"].Rows[0];
            bt.Text = dr["title"].ToString();
            lxr.Text = dr["uname"].ToString();
   
            content.Text = dr["nr"].ToString();

        }

    }

    protected void btn_click(object sender, EventArgs e)
    {



        bookid = Request.Params["id"];

        SqlConnection myConn = GetConnection();
        string sql = "update ad set title='" + bt.Text + "',uname='" + lxr.Text + "',nr='" + content.Text + "' where id=" + bookid;

        SqlCommand cmd = new SqlCommand(sql, myConn);
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        Response.Redirect("admin_news.aspx");


    }

    public SqlConnection GetConnection()
    {
        string myStr = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection myConn = new SqlConnection(myStr);
        return myConn;
    }


}