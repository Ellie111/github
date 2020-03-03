<%@ Page Title="" Language="C#" MasterPageFile="~/出库单管理.Master" AutoEventWireup="true" CodeBehind="新增出库单明细.aspx.cs" Inherits="服装库存管理系统.新增出库单明细" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
     .login_btn
{
    position:relative;
    top:-30px;
    left:700px;
    height: 33px;
    width: 66px;
        }
        .add_btn
{
    position:relative;
    top:150px;
    left:300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="请选择要增加的出库单明细:"></asp:Label>
    <asp:Button ID="Button1" runat="server"  Text="新增"   CssClass="button_base login_btn " onclick="Button1_Click" />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
        DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
        Width="1072px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="数量">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server">1</asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="货号" HeaderText="货号" SortExpression="货号" />
            <asp:BoundField DataField="仓库编号" HeaderText="仓库编号" SortExpression="仓库编号" />
            <asp:BoundField DataField="库存数量" HeaderText="库存数量" SortExpression="库存数量" />
            <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
            <asp:BoundField DataField="色号" HeaderText="色号" SortExpression="色号" />
            <asp:BoundField DataField="尺码" HeaderText="尺码" SortExpression="尺码" />
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
    <br />
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/服装.accdb" 
        SelectCommand="SELECT [ID], [货号], [仓库编号], [库存数量], [品名], [色号], [尺码] FROM [库存表] WHERE ([仓库编号] = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="仓库编号" SessionField="wid" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
    <center>
    出库单明细表：
    <asp:Button ID="Button2" runat="server" Text="提交" CssClass="button_base reset_btn"  onclick="Button2_Click"/><br />


        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
            DataSourceID="AccessDataSource2" ForeColor="#333333" GridLines="None" 
            Width="800px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked="True" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="出库单据号" HeaderText="出库单据号" SortExpression="出库单据号" 
                    ReadOnly="True" />
                <asp:BoundField DataField="货号" HeaderText="货号" SortExpression="货号" 
                    ReadOnly="True" />
                <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" 
                    ReadOnly="True" />
                <asp:BoundField DataField="色号" HeaderText="色号" SortExpression="色号" 
                    ReadOnly="True" />
                <asp:BoundField DataField="尺码" HeaderText="尺码" SortExpression="尺码" 
                    ReadOnly="True" />
                <asp:BoundField DataField="数量" HeaderText="数量" SortExpression="数量" />
                <asp:CommandField HeaderText="操作" ShowDeleteButton="True" 
                    ShowEditButton="True" />
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
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
            DataFile="~/App_Data/服装.accdb" 
            DeleteCommand="DELETE FROM [出库单明细表] WHERE [ID] = ?" 
            InsertCommand="INSERT INTO [出库单明细表] ([出库单据号], [货号], [品名], [色号], [尺码], [数量], [ID]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
            SelectCommand="SELECT [出库单据号], [货号], [品名], [色号], [尺码], [数量], [ID] FROM [出库单明细表] WHERE ([出库单据号] = ?)" 
            UpdateCommand="UPDATE [出库单明细表] SET [数量] = ? WHERE [ID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="出库单据号" Type="Int32" />
                <asp:Parameter Name="货号" Type="String" />
                <asp:Parameter Name="品名" Type="String" />
                <asp:Parameter Name="色号" Type="String" />
                <asp:Parameter Name="尺码" Type="String" />
                <asp:Parameter Name="数量" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="出库单据号" SessionField="出库单据号" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
               
                <asp:Parameter Name="数量" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>

    <br />
     
    </center>
</asp:Content>

