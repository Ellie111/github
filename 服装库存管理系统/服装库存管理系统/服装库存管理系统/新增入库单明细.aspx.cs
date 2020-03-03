using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace 服装库存管理系统
{
    public partial class 新增入库单明细 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["账号"] == null)
            {
                Response.Write("<script>alert('您还未登录，请前往登录页面进行登录！');window.location='用户登录页.aspx';</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String time = Session["time"].ToString();
            String connstr = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbConnection conn1 = new OleDbConnection(connstr);
            conn1.Open();
            String sql = "select * from [入库单表] WHERE 入库日期='" + time + "'";
            OleDbCommand comm = new OleDbCommand(sql, conn1);
            OleDbDataReader dr = comm.ExecuteReader();
            String id = null;
            String warehouse = null;
            int state = 0;

            while (dr.Read())
            {
                id = dr["入库单据号"].ToString();
                warehouse = dr["所入仓库"].ToString();
            }
            dr.Close();
            Session["入库单据号"] = int.Parse(id);//单据号
            Session["仓库编号"] = warehouse;

            for (int ii = 0; ii < GridView1.Rows.Count; ii++)
            {
                CheckBox cc = (CheckBox)GridView1.Rows[ii].Cells[0].FindControl("CheckBox1");
                if (cc.Checked)
                {
                    String pid = GridView1.Rows[ii].Cells[4].Text.ToString();//获取货号
                    TextBox tt = (TextBox)GridView1.Rows[ii].Cells[1].FindControl("TextBox1");
                    String dgl = tt.Text;
                    int num = int.Parse(dgl);

                    //查询入库单明细表 相同的货号
                    String connstr1 = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                    OleDbConnection conn2 = new OleDbConnection(connstr1);
                    conn2.Open();
                    String sql2 = "select * from [入库单明细表] ";
                    OleDbCommand comm2 = new OleDbCommand(sql2, conn2);
                    OleDbDataReader dr2 = comm2.ExecuteReader();
                    int did1 = 0;
                    string pid1 = null;
                    int num1 = 0;
                    int flag = 0;

                    while (dr2.Read())
                    {
                        did1 = int.Parse(dr2["入库单据号"].ToString());
                        pid1 = dr2["货号"].ToString();
                        num1 = int.Parse(dr2["数量"].ToString());

                        if ((did1.Equals(Session["入库单据号"])) && (pid.Equals(pid1)))
                        {
                            flag = 1;
                            break;
                        }
                    }
                    dr2.Close();

                    if (flag == 1)
                    {
                        num = num + num1;
                        OleDbConnection conn4 = new OleDbConnection();
                        conn4.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                        conn4.Open();
                        OleDbCommand commandupdate4 = new OleDbCommand();
                        commandupdate4.CommandText = "UPDATE [入库单明细表] SET 数量='" + num + "'  WHERE (入库单据号= " + did1 + " AND 货号='" + pid1 + "')";
                        commandupdate4.Connection = conn4;
                        commandupdate4.ExecuteNonQuery();
                        conn4.Close();
                    }
                    else
                    {
                        OleDbConnection con = new OleDbConnection();
                        con.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                        con.Open();
                        OleDbCommand commandinsert = new OleDbCommand();
                        commandinsert.CommandText = "INSERT INTO [入库单明细表](入库单据号,货号,品名,色号,尺码,数量,删除标志) VALUES('" + Session["入库单据号"] + "',@货号,@品名,@色号,@尺码,'" + num + "','" + state + "')";
                        commandinsert.Connection = con;
                        OleDbParameter spara;
                        spara = new OleDbParameter("@货号", pid);
                        commandinsert.Parameters.Add(spara);
                        spara = new OleDbParameter("@品名", GridView1.Rows[ii].Cells[7].Text);
                        commandinsert.Parameters.Add(spara);
                        spara = new OleDbParameter("@色号", GridView1.Rows[ii].Cells[5].Text);
                        commandinsert.Parameters.Add(spara);
                        spara = new OleDbParameter("@尺码", GridView1.Rows[ii].Cells[6].Text);
                        commandinsert.Parameters.Add(spara);
                        commandinsert.ExecuteNonQuery();
                        con.Close();

                    }
                }
            }
            Response.Redirect("新增入库单明细.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String connstr = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbConnection conn1 = new OleDbConnection(connstr);
            conn1.Open();
            String sql = "select * from [仓库表] WHERE 仓库编号='" + Session["仓库编号"] + "'";
            OleDbCommand comm = new OleDbCommand(sql, conn1);
            OleDbDataReader dr = comm.ExecuteReader();
            String wid = null;


            while (dr.Read())
            {
                wid = dr["ID"].ToString();
            }
            dr.Close();


            //查询库存容量

            double sum = 0.0;
            int Sum = 0;

            String connstr3 = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbConnection conn3 = new OleDbConnection(connstr3);
            conn3.Open();
            String sql3 = "select * from [仓库表] WHERE 仓库编号='" + Session["仓库编号"] + "'";
            OleDbCommand comm3 = new OleDbCommand(sql3, conn3);
            OleDbDataReader dr3 = comm3.ExecuteReader();
            String capacity = null;


            while (dr3.Read())
            {
                capacity = dr3["容量"].ToString();
            }
            dr3.Close();


            int capa = int.Parse(capacity);//仓库容量
            int store = 0;

            //写入库存表
            for (int ii = 0; ii < GridView2.Rows.Count; ii++)
            {
                CheckBox cc = (CheckBox)GridView2.Rows[ii].Cells[0].FindControl("CheckBox2");
                if (cc.Checked)
                {
                    sum = sum + (double.Parse(GridView2.Rows[ii].Cells[7].Text));
                    String SUM = sum.ToString();
                    Sum = int.Parse(SUM);

                    store = capa - Sum;
                    if (store < 0)
                    {
                        Response.Write("<script language=javascript>alert('仓库容量不足！');</script>");
                    }
                    else
                    {
                        String pid = GridView2.Rows[ii].Cells[3].Text.ToString();//获取货号
                        String Num = GridView2.Rows[ii].Cells[7].Text.ToString();
                        int num = int.Parse(Num);

                        //查询库存 相同仓库中相同的货号
                        string connstr1 = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                        OleDbConnection conn2 = new OleDbConnection(connstr1);
                        conn2.Open();
                        String sql2 = "select * from [库存表] ";
                        OleDbCommand comm2 = new OleDbCommand(sql2, conn2);
                        OleDbDataReader dr2 = comm2.ExecuteReader();
                        String wid1 = null;
                        String pid1 = null;
                        int num1 = 0;
                        int flag = 0;

                        while (dr2.Read())
                        {
                            wid1 = dr2["仓库编号"].ToString();
                            pid1 = dr2["货号"].ToString();
                            num1 = int.Parse(dr2["库存数量"].ToString());

                            if ((wid.Equals(wid1)) && (pid.Equals(pid1)))
                            {
                                flag = 1;
                                break;
                            }
                        }

                        dr2.Close();
                        if (flag == 1)
                        {
                            num = num + num1;
                            OleDbConnection conn4 = new OleDbConnection();
                            conn4.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                            conn4.Open();
                            OleDbCommand commandupdate4 = new OleDbCommand();
                            commandupdate4.CommandText = "UPDATE [库存表] SET 库存数量='" + num + "'  WHERE (仓库编号= '" + wid + "' AND 货号='" + pid1 + "')";
                            commandupdate4.Connection = conn4;
                            commandupdate4.ExecuteNonQuery();
                            conn4.Close();
                        }
                        else
                        {

                            OleDbConnection con = new OleDbConnection();
                            con.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                            con.Open();
                            OleDbCommand commandinsert = new OleDbCommand();
                            commandinsert.CommandText = "INSERT INTO [库存表](仓库编号,货号,品名,色号,尺码,库存数量) VALUES('" + wid + "',@货号,@品名,@色号,@尺码,'" + num + "')";
                            commandinsert.Connection = con;
                            OleDbParameter spara;
                            spara = new OleDbParameter("@货号", pid);
                            commandinsert.Parameters.Add(spara);
                            spara = new OleDbParameter("@品名", GridView2.Rows[ii].Cells[4].Text);
                            commandinsert.Parameters.Add(spara);
                            spara = new OleDbParameter("@色号", GridView2.Rows[ii].Cells[5].Text);
                            commandinsert.Parameters.Add(spara);
                            spara = new OleDbParameter("@尺码", GridView2.Rows[ii].Cells[6].Text);
                            commandinsert.Parameters.Add(spara);
                            commandinsert.ExecuteNonQuery();
                            con.Close();
                        }

                    }
                }
            }

            //仓库容量减少
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            conn.Open();
            OleDbCommand commandupdate = new OleDbCommand();
            commandupdate.CommandText = "UPDATE [仓库表] SET 容量='" + store + "' WHERE 仓库编号='" + Session["仓库编号"] + "'";
            commandupdate.Connection = conn;
            commandupdate.ExecuteNonQuery();
            conn.Close();
            Session["入库单据号"] = null;
            Response.Write("<script>alert('提交成功！');window.location = '入库单管理页.aspx';</script>");


        }
    }
}