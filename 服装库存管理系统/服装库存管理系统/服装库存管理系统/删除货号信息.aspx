<%@ Page Title="" Language="C#" MasterPageFile="~/货号管理.Master" AutoEventWireup="true" CodeBehind="删除货号信息.aspx.cs" Inherits="服装库存管理系统.删除货号信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       .login_btn
{
    position:relative;
     top:-35px;
    left:234px;
    
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
   <center>
        <br />
        请输入要删除的服装的序号:&nbsp; <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="查询" CssClass="button_base login_btn "/>
    
        <br />
    
        <br />
        <br />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="序号" DataSourceID="AccessDataSource1" 
            ForeColor="#333333" GridLines="None" Height="45px" 
            onrowcommand="GridView1_RowCommand" Width="700px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    SortExpression="ID" />
                <asp:BoundField DataField="序号" HeaderText="序号" ReadOnly="True" 
                    SortExpression="序号" />
                <asp:BoundField DataField="货号" HeaderText="货号" SortExpression="货号" />
                <asp:BoundField DataField="色号" HeaderText="色号" SortExpression="色号" />
                <asp:BoundField DataField="尺码" HeaderText="尺码" SortExpression="尺码" />
                <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
                <asp:BoundField DataField="面料" HeaderText="面料" SortExpression="面料" />
                <asp:BoundField DataField="里料" HeaderText="里料" SortExpression="里料" />
                <asp:BoundField DataField="厂价" HeaderText="厂价" SortExpression="厂价" />
                <asp:BoundField DataField="售价" HeaderText="售价" SortExpression="售价" />
                <asp:ButtonField CommandName="select" HeaderText="操作" Text="删除" />
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
            DataFile="~/App_Data/服装.accdb" DeleteCommand="DELETE FROM [货号表] WHERE [序号] = ?" 
            InsertCommand="INSERT INTO [货号表] ([序号], [货号], [色号], [尺码], [品名], [面料], [里料], [厂价], [售价], [ID]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            SelectCommand="SELECT [序号], [货号], [色号], [尺码], [品名], [面料], [里料], [厂价], [售价], [ID] FROM [货号表] WHERE (([删除标志] = ?) AND ([序号] = ?))" 
            
            
            UpdateCommand="UPDATE [货号表] SET [货号] = ?, [色号] = ?, [尺码] = ?, [品名] = ?, [面料] = ?, [里料] = ?, [厂价] = ?, [售价] = ?, [ID] = ? WHERE [序号] = ?">
            <DeleteParameters>
                <asp:Parameter Name="序号" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="序号" Type="Int32" />
                <asp:Parameter Name="货号" Type="String" />
                <asp:Parameter Name="色号" Type="String" />
                <asp:Parameter Name="尺码" Type="String" />
                <asp:Parameter Name="品名" Type="String" />
                <asp:Parameter Name="面料" Type="String" />
                <asp:Parameter Name="里料" Type="String" />
                <asp:Parameter Name="厂价" Type="String" />
                <asp:Parameter Name="售价" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="删除标志2" Type="String" />
                <asp:ControlParameter ControlID="TextBox1" Name="序号" PropertyName="Text" 
                    Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                 <asp:Parameter Name="货号" Type="String" />
                <asp:Parameter Name="色号" Type="String" />
                 <asp:Parameter Name="尺码" Type="String" />
                 <asp:Parameter Name="品名" Type="String" />
                 <asp:Parameter Name="面料" Type="String" />
                 <asp:Parameter Name="里料" Type="String" />
                 <asp:Parameter Name="厂价" Type="String" />
                 <asp:Parameter Name="售价" Type="String" />
                 <asp:Parameter Name="ID" Type="Int32" />
                 <asp:Parameter Name="序号" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
   </center>
</asp:Content>

