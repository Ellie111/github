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
    public string spid;


    protected void Page_Load(object sender, EventArgs e)
    {
        newsid = Request.Params["id"];
       spid=Session["tid"] as string;

        if (spid == newsid)
        {
            this.wz.Visible = true;
            this.sk.Visible = false;
        }

        if (!IsPostBack)
        {

            SqlConnection myConn = GetConnection();
            string sqlStr = "select * from course where id= " + newsid;
            SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs, "books");
            this.GridView1.DataSource = myDs.Tables["books"].DefaultView;
            this.GridView1.DataBind();


            string sqlStr1 = "select * from course where id= " + newsid;
            SqlDataAdapter myDa1 = new SqlDataAdapter(sqlStr1, myConn);
            DataSet myDs1 = new DataSet();
            myDa1.Fill(myDs1, "books");
            this.GridView2.DataSource = myDs1.Tables["books"].DefaultView;
            this.GridView2.DataBind();

            dr = myDs.Tables["books"].Rows[0];
            tid.Text = dr["id"].ToString();
            title.Text  = dr["title"].ToString();
            price.Text = dr["price"].ToString();
       
            pic.Text = dr["pic"].ToString();

            account.Text = Session["account"] as string;
            uname.Text = Session["yhm"] as string; 

        
            

        }
    }


    protected void btn_gp(object sender, EventArgs e)
    {
        if (Session["yhm"] == null)
        {
            Response.Write("<script>alert('您还没有登录，无法购物，请先登录');window.location.href='admin_login.aspx';</script>");
            return;
        }
        string price = this.price.Text;
        string zhye = this.account.Text;
        string spid = this.tid.Text;
        int zh = int.Parse(zhye);
        int jg = int.Parse(price);
  

        if (zh < jg)
        {
            Response.Write("<script>alert('您的账户余额不足，请先充值再购买');window.location.href='member_account.aspx';</script>");
            return;
        }

        int myaccount = zh-jg;

            Session["tid"] = spid;
       


            SqlConnection myConn = GetConnection();

            string sql1 = "update users set account='" + myaccount + "' where uname='" + Convert.ToString(Session["yhm"]) + "' ";

            SqlCommand cmd1 = new SqlCommand(sql1, myConn);
            cmd1.Connection.Open();
            cmd1.ExecuteNonQuery();
            cmd1.Connection.Close();


            string sql = "insert into dingdan(title,uname,pic,price)values";
            sql += "('" + title.Text + "','" + uname.Text + "','" + pic.Text + "','" + price + "')";
            SqlCommand cmd = new SqlCommand(sql, myConn);
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            Response.Write("<script>alert('加入购物车成功!前往个人中心查看');window.location.href='member_info.aspx';</script>");

    

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