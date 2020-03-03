<%@ Page Title="" Language="C#" MasterPageFile="~/用户管理.Master" AutoEventWireup="true" CodeBehind="删除用户信息.aspx.cs" Inherits="服装库存管理系统.删除用户信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       .login_btn
{
    position:relative;
     top:-32px;
    left:220px;
    
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
        <br />
   <center>
        <br />
        <br />
        <br />
        请输入要删除的用户账号：<asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="查询"  CssClass="button_base login_btn "/>
  
        <br />
        <br />
  
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="账号" DataSourceID="AccessDataSource1" 
            ForeColor="#333333" GridLines="None" Height="121px" 
            onrowcommand="GridView1_RowCommand" Width="504px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    SortExpression="ID" />
                <asp:BoundField DataField="账号" HeaderText="账号" ReadOnly="True" 
                    SortExpression="账号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="删除标志" HeaderText="删除标志" SortExpression="删除标志" />
                <asp:ButtonField HeaderText="操作" Text="删除用户" CommandName="select" />
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
            DataFile="~/App_Data/服装.accdb" DeleteCommand="DELETE FROM [用户表] WHERE [账号] = ?" 
            InsertCommand="INSERT INTO [用户表] ([账号], [删除标志], [ID], [姓名]) VALUES (?, ?, ?, ?)" 
            SelectCommand="SELECT [账号], [删除标志], [ID], [姓名] FROM [用户表] WHERE (([账号] = ?) AND ([删除标志] = ?))" 
            UpdateCommand="UPDATE [用户表] SET [删除标志] = ?, [ID] = ?, [姓名] = ? WHERE [账号] = ?">
            <DeleteParameters>
                <asp:Parameter Name="账号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="账号" Type="String" />
                <asp:Parameter Name="删除标志" Type="Int16" />
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="姓名" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="账号" PropertyName="Text" 
                    Type="String" />
                <asp:Parameter DefaultValue="0" Name="删除标志" Type="Int16" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="删除标志" Type="Int16" />
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="账号" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
 </center>

</asp:Content>

