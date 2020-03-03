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


public partial class admin_admin_dingdan : System.Web.UI.Page
{
    public DataRow dr;
    public String tid;
    protected void Page_Load(object sender, EventArgs e)
    {
  


        if (!IsPostBack)
        {
            SqlConnection myConn = GetConnection();
            string sqlStr = "select * from users";
            SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs, "dingdan");
            this.GridView1.DataSource = myDs.Tables["dingdan"].DefaultView;
            this.GridView1.DataBind();

            string sqlStr1 = "select sum(price) as zjl from dingdan";
            SqlDataAdapter myDa1 = new SqlDataAdapter(sqlStr1, myConn);
            DataSet myDs1 = new DataSet();
            myDa1.Fill(myDs1, "books");
            dr = myDs1.Tables["books"].Rows[0];
            zjl.Text = dr["zjl"].ToString();
     

        }


    }
    public DataView myBind()
    {
        //建立数据连接
        SqlConnection myConn = GetConnection();
        string sqlStr = "select * from users ";
        SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
        DataSet myDs = new DataSet();
        myDa.Fill(myDs, "dingdan");
        return myDs.Tables["dingdan"].DefaultView;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //获取当前显示页索引
        GridView1.PageIndex = e.NewPageIndex;

        //重新绑定　
        this.GridView1.DataSource = myBind();
        this.GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection myConn = GetConnection();
        myConn.Open();

        //使用 Value 属性确定记录的主键值。
        //设置
        String id = GridView1.DataKeys[e.RowIndex].Value.ToString();
        String sql = "delete from dingdan where id =" + id;
        //Response.Write("<script>alert('ddd')</script>");
        SqlCommand cmd = new SqlCommand(sql, myConn);

        try
        {
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('删除成功')</script>");
        }
        catch (Exception ee)
        {

        }
        myConn.Close();
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