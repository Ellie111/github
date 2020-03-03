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


public partial class admin_admin_course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection myConn = GetConnection();
            string sqlStr = "select * from course";
            SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs, "product");
            this.GridView1.DataSource = myDs.Tables["product"].DefaultView;
            this.GridView1.DataBind();
        }
    }
    public DataView myBind()
    {
        //建立数据连接
        SqlConnection myConn = GetConnection();
        string sqlStr = "select * from course";
        SqlDataAdapter myDa = new SqlDataAdapter(sqlStr, myConn);
        DataSet myDs = new DataSet();
        myDa.Fill(myDs, "books");
        return myDs.Tables["books"].DefaultView;
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
        String sql = "delete from course where id =" + id;
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
    protected void btn_click(object sender, EventArgs e)
    {
        String savePath = Server.MapPath("file/");
        if (fuUpLoad.HasFile)
        {
            String filename = fuUpLoad.FileName;//上传文件名
            savePath += filename;      //上传路经
            fuUpLoad.SaveAs(savePath);//保存文件
        }

        String savePath2 = Server.MapPath("file/");

        if (mpupload.HasFile)
        {
            String filename = mpupload.FileName;//上传文件名

            savePath2 += filename;      //上传路经
            mpupload.SaveAs(savePath2);//保存文件
        }
        String savePath3 = Server.MapPath("file/");
        if (viupload.HasFile)
        {
            String filename = viupload.FileName;//上传文件名

            savePath3 += filename;      //上传路经
            viupload.SaveAs(savePath3);//保存文件
        }




        SqlConnection myConn = GetConnection();
        string sql = "insert into course(title,teacher,pic,price,mvideo,video,nr)values";
        sql += "('" + title.Text + "','" + teacher.Text + "','" + fuUpLoad.FileName.ToString() + "','" + price.Text + "','" + mpupload.FileName.ToString() + "','" + viupload.FileName.ToString() + "','" + content.Text + "')";
        SqlCommand cmd = new SqlCommand(sql, myConn);
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        Response.Redirect("admin_course.aspx");
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