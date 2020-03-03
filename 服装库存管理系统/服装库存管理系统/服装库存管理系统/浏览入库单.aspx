<%@ Page Title="" Language="C#" MasterPageFile="~/入库单管理.Master" AutoEventWireup="true" CodeBehind="浏览入库单.aspx.cs" Inherits="服装库存管理系统.浏览入库单" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="入库单据号" 
            DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
            Width="845px" onrowcommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="入库单据号" HeaderText="入库单据号" InsertVisible="False" 
                    ReadOnly="True" SortExpression="入库单据号" />
                <asp:BoundField DataField="入库日期" HeaderText="入库日期" SortExpression="入库日期" />
                <asp:BoundField DataField="经办人" HeaderText="经办人" SortExpression="经办人" />
                <asp:BoundField DataField="所入仓库" HeaderText="所入仓库" SortExpression="所入仓库" />
                <asp:BoundField DataField="来源" HeaderText="来源" SortExpression="来源" />
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
            SelectCommand="SELECT [入库单据号], [入库日期], [经办人], [所入仓库], [来源], [备注], [确认状态] FROM [入库单表] WHERE ([删除状态] = ?)">
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
                ForeColor="#333333" GridLines="None" Width="759px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="入库单据号" HeaderText="入库单据号" SortExpression="入库单据号" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
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
                SelectCommand="SELECT [入库单据号], [ID], [货号], [品名], [色号], [尺码], [数量] FROM [入库单明细表] WHERE (([删除标志] = ?) AND ([入库单据号] = ?))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="删除标志" Type="String" />
                    <asp:SessionParameter Name="入库单据号" SessionField="rkdjh1" Type="Int32" />
                </SelectParameters>
            </asp:AccessDataSource>
    </p>
    </center>
</asp:Content>

