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

public partial class book_detail : System.Web.UI.Page
{
    public DataRow dr;
    public string newsid;

    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!IsPostBack)
        {
            newsid = Request.Params["id"];
            SqlConnection myConn = GetConnection();
            string sqlStr = "select * from books where id= " + newsid;
            SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs, "books");
            this.GridView1.DataSource = myDs.Tables["books"].DefaultView;
            this.GridView1.DataBind();


   
        
            

        }
    }

    public SqlConnection GetConnection()
    {
        string myStr = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection myConn = new SqlConnection(myStr);
        return myConn;
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}