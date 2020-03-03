<%@ Page Title="" Language="C#" MasterPageFile="~/入库单管理.Master" AutoEventWireup="true" CodeBehind="提交入库单.aspx.cs" Inherits="服装库存管理系统.提交入库单" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>

    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="入库单据号" 
        DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
        onrowcommand="GridView1_RowCommand" Width="732px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="入库单据号" HeaderText="入库单据号" InsertVisible="False" 
                ReadOnly="True" SortExpression="入库单据号" />
            <asp:BoundField DataField="入库日期" HeaderText="入库日期" SortExpression="入库日期" />
            <asp:BoundField DataField="经办人" HeaderText="经办人" SortExpression="经办人" />
            <asp:BoundField DataField="所入仓库" HeaderText="所入仓库" SortExpression="所入仓库" />
            <asp:BoundField DataField="来源" HeaderText="来源" SortExpression="来源" />
            <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
            <asp:ButtonField CommandName="submit" HeaderText="操作" Text="提交">
            <FooterStyle ForeColor="#CC0000" />
            </asp:ButtonField>
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
        SelectCommand="SELECT [入库单据号], [入库日期], [经办人], [所入仓库], [来源], [备注] FROM [入库单表] WHERE (([删除状态] = ?) AND ([确认状态] = ?))">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="删除状态" Type="String" />
            <asp:Parameter DefaultValue="0" Name="确认状态" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>

</center>
</asp:Content>

