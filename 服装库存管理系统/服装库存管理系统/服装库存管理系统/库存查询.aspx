<%@ Page Title="" Language="C#" MasterPageFile="~/出库单管理.Master" AutoEventWireup="true" CodeBehind="库存查询.aspx.cs" Inherits="服装库存管理系统.库存查询" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
  .login_btn
{
    position:relative;
    top:-40px;
    left:250px;
    
    }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <asp:TextBox ID="TextBox1" runat="server" Height="35px" placeholder="请输入所入仓库编号"
            style="margin-left: 0px" Width="190px"></asp:TextBox>
    &nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" Height="35px" placeholder="请输入货号"
            style="margin-left: 0px" Width="190px"></asp:TextBox>
    &nbsp;<asp:Button ID="Button1" runat="server"  Text="查询"  CssClass="button_base login_btn " />
    <br />
      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
         AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
         DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
         Width="665px">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
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
     <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
         DataFile="~/App_Data/服装.accdb" 
         SelectCommand="SELECT * FROM [库存表] WHERE (([仓库编号] LIKE '%' + ? + '%') AND ([货号] LIKE '%' + ? + '%'))">
         <SelectParameters>
             <asp:ControlParameter ControlID="TextBox1" Name="仓库编号" PropertyName="Text" 
                 Type="String" />
             <asp:ControlParameter ControlID="TextBox2" Name="货号" PropertyName="Text" 
                 Type="String" />
         </SelectParameters>
     </asp:AccessDataSource>
      <br />

    </center>
</asp:Content>

