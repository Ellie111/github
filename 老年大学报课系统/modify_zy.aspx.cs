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

public partial class modify_member : System.Web.UI.Page
{
    public DataRow dr;
    public String bookid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bookid = Request.Params["id"];

            SqlConnection myConn = GetConnection();
            string sqlStr = "select * from aqwj where id=" + bookid;
            SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs, "users");
            dr = myDs.Tables["users"].Rows[0];
            title.Text = dr["title"].ToString();
            uname.Text = dr["uname"].ToString();
            student.Text = Session["uname"].ToString();

            content.Text = dr["nr"].ToString();

        }

    }

    protected void btn_click(object sender, EventArgs e)
    {


        String savePath = Server.MapPath("teacher/file/");
        if (fuUpLoad.HasFile)
        {
            String filename = fuUpLoad.FileName;//上传文件名
            savePath += filename;      //上传路经
            fuUpLoad.SaveAs(savePath);//保存文件
        }
        SqlConnection myConn = GetConnection();
        string sql = "insert into dingdan(title,student,zy,teacher)values";
        sql += "('" + title.Text + "','" + student.Text + "','" + fuUpLoad.FileName.ToString() + "','" + uname.Text + "')";
        SqlCommand cmd = new SqlCommand(sql, myConn);
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        Response.Redirect("member_dzy.aspx");

    }

    public SqlConnection GetConnection()
    {
        string myStr = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection myConn = new SqlConnection(myStr);
        return myConn;
    }
}