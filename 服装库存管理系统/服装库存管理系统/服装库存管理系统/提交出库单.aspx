<%@ Page Title="" Language="C#" MasterPageFile="~/出库单管理.Master" AutoEventWireup="true" CodeBehind="提交出库单.aspx.cs" Inherits="服装库存管理系统.提交出库单" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>
        <br /><center>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="出库单据号" 
            DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
            onrowcommand="GridView1_RowCommand" Width="985px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="出库单据号" HeaderText="出库单据号" InsertVisible="False" 
                    ReadOnly="True" SortExpression="出库单据号" />
                <asp:BoundField DataField="出库日期" HeaderText="出库日期" SortExpression="出库日期" />
                <asp:BoundField DataField="经办人" HeaderText="经办人" SortExpression="经办人" />
                <asp:BoundField DataField="所出仓库" HeaderText="所出仓库" SortExpression="所出仓库" />
                <asp:BoundField DataField="接收人" HeaderText="接收人" SortExpression="接收人" />
                <asp:BoundField DataField="接收人电话" HeaderText="接收人电话" SortExpression="接收人电话" />
                <asp:BoundField DataField="接收人地址" HeaderText="接收人地址" SortExpression="接收人地址" />
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
            SelectCommand="SELECT [出库单据号], [出库日期], [经办人], [所出仓库], [接收人], [接收人电话], [接收人地址], [备注] FROM [出库单表] WHERE (([删除状态] = ?) AND ([确认状态] = ?))">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="删除状态" Type="String" />
                <asp:Parameter DefaultValue="0" Name="确认状态" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        </center>
    </p>

</asp:Content>

