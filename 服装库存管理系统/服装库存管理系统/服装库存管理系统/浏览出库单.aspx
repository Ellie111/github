<%@ Page Title="" Language="C#" MasterPageFile="~/出库单管理.Master" AutoEventWireup="true" CodeBehind="浏览出库单.aspx.cs" Inherits="服装库存管理系统.浏览出库单" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="出库单据号" 
            DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
            Width="967px" onrowcommand="GridView1_RowCommand">
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
                <asp:BoundField DataField="确认状态" HeaderText="确认状态" SortExpression="确认状态" />
                <asp:ButtonField CommandName="look" HeaderText="操作" Text="查看明细">
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
            SelectCommand="SELECT [出库单据号], [出库日期], [经办人], [所出仓库], [接收人], [接收人电话], [接收人地址], [备注], [确认状态] FROM [出库单表] WHERE ([删除状态] = ?)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="删除状态" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
    </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="ID" DataSourceID="AccessDataSource2" 
                ForeColor="#333333" GridLines="None" Width="745px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="出库单据号" HeaderText="出库单据号" SortExpression="出库单据号" />
                    <asp:BoundField DataField="货号" HeaderText="货号" SortExpression="货号" />
                    <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
                    <asp:BoundField DataField="色号" HeaderText="色号" SortExpression="色号" />
                    <asp:BoundField DataField="尺码" HeaderText="尺码" SortExpression="尺码" />
                    <asp:BoundField DataField="数量" HeaderText="数量" SortExpression="数量" />
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
                SelectCommand="SELECT [ID], [出库单据号], [货号], [品名], [色号], [尺码], [数量] FROM [出库单明细表] WHERE (([删除标志] = ?) AND ([出库单据号] = ?))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="删除标志" Type="String" />
                    <asp:SessionParameter Name="出库单据号" SessionField="ckdjh1" Type="Int32" />
                </SelectParameters>
            </asp:AccessDataSource>
        <br />
    </p>
    </center>
</asp:Content>

