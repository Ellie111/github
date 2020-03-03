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

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["yhm"] != null)
        {
            this.load.Visible = true;
            this.loading.Visible = false;
        }

        if (!IsPostBack)
        {

            SqlConnection myConn = GetConnection();
            string sqlStr1 = "select * from ad where lanmu like '%新闻%'";
            SqlDataAdapter myDa1 = new SqlDataAdapter(sqlStr1, myConn);
            DataSet myDs1 = new DataSet();
            myDa1.Fill(myDs1, "ad");
            this.GridView2.DataSource = myDs1.Tables["ad"].DefaultView;
            this.GridView2.DataBind();


        }

    }
    protected void btnZhao_Click(object sender, EventArgs e)
    {




        Application["name"] = txtSou_suo.Text.ToString();

        Response.Redirect("search.aspx");

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
