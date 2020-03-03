using System;
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

public partial class member_ping : System.Web.UI.Page
{
    public DataRow dr;
    public String bookid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bookid = Request.Params["id"];

            SqlConnection myConn = GetConnection();
            string sqlStr = "select * from dingdan where id=" + bookid;
            SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs, "dingdan");
            dr = myDs.Tables["dingdan"].Rows[0];
            title.Text = dr["title"].ToString();
            pid.Text = dr["id"].ToString();
            price.Text = dr["price"].ToString();

            uname.Text = dr["uname"].ToString();





        }

    }

    protected void btn_click(object sender, EventArgs e)
    {

        SqlConnection myConn = GetConnection();
        string sql = "insert into pinglun(tid,title,uname,nr)values";
        sql += "('" + pid.Text + "','" + title.Text + "','" + uname.Text + "','" + nr.Text + "')";
        SqlCommand cmd = new SqlCommand(sql, myConn);
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        Response.Redirect("member_pinglun.aspx");

    }

    public SqlConnection GetConnection()
    {
        string myStr = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection myConn = new SqlConnection(myStr);
        return myConn;
    }

}