<%@ Page Title="" Language="C#" MasterPageFile="~/货号管理.Master" AutoEventWireup="true" CodeBehind="查询货号信息.aspx.cs" Inherits="服装库存管理系统.查询货号信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
       .login_btn
{
    position:relative;
     top:-32px;
    left:500px;
    
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <br />
        <br />
        <br />
   
        请输入查询条件：
    
        货号：<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
&nbsp;色号：<asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
&nbsp;尺码：<asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
&nbsp;品名：<asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="查询" CssClass="button_base login_btn " />
    </p>
        <p>
        </p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="AccessDataSource2" ForeColor="#333333" 
            GridLines="None" Width="985px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="货号" HeaderText="货号" SortExpression="货号" />
                <asp:BoundField DataField="色号" HeaderText="色号" SortExpression="色号" />
                <asp:BoundField DataField="尺码" HeaderText="尺码" SortExpression="尺码" />
                <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
                <asp:BoundField DataField="面料" HeaderText="面料" SortExpression="面料" />
                <asp:BoundField DataField="里料" HeaderText="里料" SortExpression="里料" />
                <asp:BoundField DataField="厂价" HeaderText="厂价" SortExpression="厂价" />
                <asp:BoundField DataField="售价" HeaderText="售价" SortExpression="售价" />
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
            SelectCommand="SELECT [货号], [色号], [尺码], [品名], [面料], [里料], [厂价], [售价] FROM [货号表] WHERE (([色号] LIKE '%' + ? + '%') AND ([尺码] LIKE '%' + ? + '%') AND ([品名] LIKE '%' + ? + '%') AND ([货号] LIKE '%' + ? + '%'))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox11" Name="色号" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="TextBox12" Name="尺码" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="TextBox13" Name="品名" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="TextBox10" Name="货号" PropertyName="Text" 
                    Type="String" />
                     <asp:Parameter DefaultValue="0" Name="删除标志" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
   </center>
</asp:Content>

