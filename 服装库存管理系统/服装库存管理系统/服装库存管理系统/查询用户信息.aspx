<%@ Page Title="" Language="C#" MasterPageFile="~/用户管理.Master" AutoEventWireup="true" CodeBehind="查询用户信息.aspx.cs" Inherits="服装库存管理系统.查询用户信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
       .login_btn
{
    position:relative;
     top:-32px;
    left:280px;
    
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <br />
   <center>
    
        <br />
    
        请输入
      
    
        账号：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp; 姓名：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="查询" CssClass="button_base login_btn " />
   
    
        <br />
        <br />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="账号" DataSourceID="AccessDataSource1" 
            ForeColor="#333333" GridLines="None" Height="178px" Width="459px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="账号" HeaderText="账号" ReadOnly="True" 
                    SortExpression="账号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="简介" HeaderText="简介" SortExpression="简介" />
                <asp:BoundField DataField="删除标志" HeaderText="删除标志" SortExpression="删除标志" />
                <asp:BoundField DataField="角色" HeaderText="角色" SortExpression="角色" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/服装.accdb" 
            
            SelectCommand="SELECT [账号], [姓名], [简介], [删除标志], [角色] FROM [用户表] WHERE (([删除标志] = ?) AND ([账号] LIKE '%' + ? + '%'))">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="删除标志" Type="String" />
                <asp:ControlParameter ControlID="TextBox1" Name="账号" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
    </center>
</asp:Content>

