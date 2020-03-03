<%@ Page Title="" Language="C#" MasterPageFile="~/用户管理.Master" AutoEventWireup="true" CodeBehind="修改用户信息.aspx.cs" Inherits="服装库存管理系统.修改用户信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">  
     .login_btn
{
    position:relative;
    top:0px;
    left:30px;
    
    }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
        <center><br />
   
    
            <br />
            <br />
   
    
        请输入要修改的用户的账号：<asp:TextBox ID="TextBox1" runat="server" Height="39px" Width="166px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查询" CssClass="button_base login_btn " 
                style="top: -45px; left: 252px" />
    
    
            <br />
            <br />
    
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="账号" DataSourceID="AccessDataSource1" 
            ForeColor="#333333" GridLines="None" Height="116px" Width="722px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField EditText="修改" ShowEditButton="True" />
                <asp:BoundField DataField="账号" HeaderText="账号" 
                    SortExpression="账号" ReadOnly="True" />
                <asp:TemplateField HeaderText="姓名" SortExpression="姓名">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("姓名") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="姓名不能为空！" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("姓名") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="电话" HeaderText="电话" SortExpression="电话" 
                    ReadOnly="True" />
                <asp:BoundField DataField="角色" HeaderText="角色" SortExpression="角色" 
                    ReadOnly="True" />
                <asp:TemplateField HeaderText="简介" SortExpression="简介">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("简介") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("简介") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
            
            
                SelectCommand="SELECT [账号], [姓名], [电话], [角色], [简介] FROM [用户表] WHERE (([删除标志] = ?) AND ([账号] LIKE '%' + ? + '%'))" 
                DeleteCommand="DELETE FROM [用户表] WHERE [账号] = ?" 
                InsertCommand="INSERT INTO [用户表] ([账号], [姓名], [电话], [角色], [简介]) VALUES (?, ?, ?, ?, ?)" 
                UpdateCommand="UPDATE [用户表] SET [姓名] = ?,  [简介] = ? WHERE [账号] = ?">
            <DeleteParameters>
                <asp:Parameter Name="账号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="账号" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="电话" Type="String" />
                <asp:Parameter Name="角色" Type="String" />
                <asp:Parameter Name="简介" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="删除标志" Type="String" />
                <asp:ControlParameter ControlID="TextBox1" Name="账号" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="简介" Type="String" />
                <asp:Parameter Name="账号" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
   
    <br />
    </center>
</asp:Content>

