<%@ Page Title="" Language="C#" MasterPageFile="~/用户管理.Master" AutoEventWireup="true" CodeBehind="浏览用户信息.aspx.cs" Inherits="服装库存管理系统.浏览用户信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="账号" DataSourceID="AccessDataSource1" 
            ForeColor="#333333" GridLines="None" Height="206px" Width="499px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="账号" HeaderText="账号" ReadOnly="True" 
                    SortExpression="账号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="电话" HeaderText="电话" SortExpression="电话" />
                <asp:BoundField DataField="角色" HeaderText="角色" SortExpression="角色" />
                <asp:BoundField DataField="简介" HeaderText="简介" SortExpression="简介" />
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
            
            SelectCommand="SELECT [账号], [姓名], [电话], [角色], [简介] FROM [用户表] WHERE ([删除标志] = ?)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="删除标志" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
   </center>
</asp:Content>

