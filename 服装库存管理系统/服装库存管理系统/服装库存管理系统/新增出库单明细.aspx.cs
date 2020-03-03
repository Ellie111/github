using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace 服装库存管理系统
{
    public partial class 新增出库单明细 : System.Web.UI.Page
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
            string time = Session["time"].ToString();
        string connstr = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
        OleDbConnection conn1 = new OleDbConnection(connstr);
        conn1.Open();
        string sql = "select * from [出库单表] WHERE 出库日期='" + time + "'";
        OleDbCommand comm = new OleDbCommand(sql, conn1);
        OleDbDataReader dr = comm.ExecuteReader();
        string id = null;
        string warehouse = null;
        string state = "0";

        while (dr.Read())
        {
            id = dr["出库单据号"].ToString();
            warehouse = dr["所出仓库"].ToString();
        }
        dr.Close();
        Session["出库单据号"] = int.Parse(id);//单据号
        Session["所出仓库"] = warehouse;

        for (int ii = 0; ii < GridView1.Rows.Count; ii++)
        {
            CheckBox cc = (CheckBox)GridView1.Rows[ii].Cells[0].FindControl("CheckBox1");
            if (cc.Checked)
            {
                string pid = GridView1.Rows[ii].Cells[3].Text.ToString();//获取货号
                TextBox tt = (TextBox)GridView1.Rows[ii].Cells[1].FindControl("TextBox1");
                string dgl = tt.Text;
                int num = int.Parse(dgl);

                //查询入库单明细表 相同的货号
                string connstr1 = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                OleDbConnection conn2 = new OleDbConnection(connstr1);
                conn2.Open();
                string sql2 = "select * from [出库单明细表] ";
                OleDbCommand comm2 = new OleDbCommand(sql2, conn2);
                OleDbDataReader dr2 = comm2.ExecuteReader();
                int did1 = 0;
                string pid1 = null;
                int num1 = 0;
                int flag = 0;
                string bb = null;

                while (dr2.Read())
                {
                    did1 = int.Parse(dr2["出库单据号"].ToString());
                    pid1 = dr2["货号"].ToString();
                    num1 = int.Parse(dr2["数量"].ToString());

                    if ((did1.Equals(Session["出库单据号"])) && (pid.Equals(pid1)))
                    {
                        flag = 1;
                        break;
                    }
                }
                dr2.Close();

                if (flag == 1)
                {
                    num = num + num1;
                    bb = num.ToString();
                    OleDbConnection conn4 = new OleDbConnection();
                    conn4.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                    OleDbCommand commandupdate5 = new OleDbCommand();
                    commandupdate5.CommandText = "UPDATE [出库单明细表] SET 数量='" + bb + "'  WHERE ((出库单据号= " + did1 + ") AND (货号='" + pid1 + "'))";
                    commandupdate5.Connection = conn4;
                    commandupdate5.ExecuteNonQuery();
                    conn4.Close();
                }
                else
                {
                    OleDbConnection con = new OleDbConnection();
                    con.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                    con.Open();
                    OleDbCommand commandinsert = new OleDbCommand();
                    commandinsert.CommandText = "INSERT INTO [出库单明细表](出库单据号,货号,品名,色号,尺码,数量,删除标志) VALUES('" + Session["出库单据号"] + "',@货号,@品名,@色号,@尺码,'" + num + "','" + state + "')";
                    commandinsert.Connection = con;
                    OleDbParameter spara;
                    spara = new OleDbParameter("@货号", pid);
                    commandinsert.Parameters.Add(spara);
                    spara = new OleDbParameter("@品名", GridView1.Rows[ii].Cells[6].Text);
                    commandinsert.Parameters.Add(spara);
                    spara = new OleDbParameter("@色号", GridView1.Rows[ii].Cells[7].Text);
                    commandinsert.Parameters.Add(spara);
                    spara = new OleDbParameter("@尺码", GridView1.Rows[ii].Cells[8].Text);
                    commandinsert.Parameters.Add(spara);
                    commandinsert.ExecuteNonQuery();
                    con.Close();

                }
            }
        }
        Response.Redirect("新增出库单明细.aspx");
    }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //查询仓库编号
            string connstr = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbConnection conn1 = new OleDbConnection(connstr);
            conn1.Open();
            string sql = "select * from [仓库表] WHERE 仓库编号='" + Session["所出仓库"] + "'";
            OleDbCommand comm = new OleDbCommand(sql, conn1);
            OleDbDataReader dr = comm.ExecuteReader();
            string wid = null;


            while (dr.Read())
            {
                wid = dr["ID"].ToString();
            }
            dr.Close();

            //库存减少
            double SUM = 0.0;
            int Sum = 0;
            for (int ii = 0; ii < GridView2.Rows.Count; ii++)
            {
                CheckBox cc = (CheckBox)GridView2.Rows[ii].Cells[0].FindControl("CheckBox2");
                if (cc.Checked)
                {
                    //获取 明细表 信息
                    string pid2 = GridView2.Rows[ii].Cells[3].Text.ToString();
                    SUM = SUM + (double.Parse(GridView2.Rows[ii].Cells[7].Text.ToString()));//获取总出库数量
                    string Num = GridView2.Rows[ii].Cells[7].Text.ToString();
                    int outnum = int.Parse(Num);//获取单条出库数量
                    //获取 库存表 信息
                    for (int jj = 0; jj < GridView1.Rows.Count; jj++)
                    {
                        string pid1 = GridView1.Rows[jj].Cells[3].Text.ToString();
                        string num1 = GridView1.Rows[jj].Cells[5].Text.ToString();
                        int num = int.Parse(num1);//获取单条库存数量  

                        if (pid2.Equals(pid1))
                        {
                            Sum = num - outnum;
                            string huohao = GridView2.Rows[ii].Cells[3].Text.ToString();
                            string ab = Sum.ToString();
                            OleDbConnection con = new OleDbConnection();
                            con.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                            con.Open();
                            OleDbCommand commandupdate = new OleDbCommand();
                            commandupdate.CommandText = "UPDATE [库存表] SET 库存数量='" + ab + "' WHERE 货号='" + huohao + "'";
                            commandupdate.Connection = con;
                            commandupdate.ExecuteNonQuery();
                            con.Close();

                        }
                    }
                }
            }

            //查询仓库容量
            string connstr3 = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
            OleDbConnection conn3 = new OleDbConnection(connstr3);
            conn3.Open();
            string sql3 = "select * from [仓库表] WHERE 仓库编号='" + Session["所出仓库"] + "'";
            OleDbCommand comm3 = new OleDbCommand(sql3, conn3);
            OleDbDataReader dr3 = comm3.ExecuteReader();
            string capacity = null;


            while (dr3.Read())
            {
                capacity = dr3["容量"].ToString();
            }
            dr3.Close();

            //库存容量减少
            int capa = int.Parse(capacity);
            string a = SUM.ToString();
            int store = int.Parse(a);
            string c = null;
            if (capa < store)
            {
                Response.Write("<script language=javascript>alert('仓库容量不足！');</script>");
            }
            else
            {
                int Store = capa + store;
                c = Store.ToString();
                OleDbConnection conn = new OleDbConnection();
                conn.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + Server.MapPath("App_Data/服装.accdb");
                conn.Open();
                OleDbCommand commandupdate = new OleDbCommand();
                commandupdate.CommandText = "UPDATE [仓库表] SET 容量='" + c + "' WHERE 仓库编号='" + Session["所出仓库"] + "'";
                commandupdate.Connection = conn;
                commandupdate.ExecuteNonQuery();
                conn.Close();
                Session["出库单据号"] = null;
                Response.Write("<script language=javascript>alert('提交成功！');</script>");
            }
        }
    }


        }
