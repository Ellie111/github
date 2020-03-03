<%@ Page Title="" Language="C#" MasterPageFile="~/入库单管理.Master" AutoEventWireup="true" CodeBehind="新增入库单明细.aspx.cs" Inherits="服装库存管理系统.新增入库单明细" %>
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
    top:-50px;
    left:320px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>
        <asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="请选择要增加的入库单明细:"></asp:Label>
        <asp:Button ID="Button1" runat="server"  Text="新增"  
            CssClass="button_base login_btn " onclick="Button1_Click" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="序号" DataSourceID="AccessDataSource1" 
            ForeColor="#333333" GridLines="None" Height="159px" Width="1074px" 
            AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="数量">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" style="margin-bottom: 0px">1</asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:AccessDataSource ID="AccessDataSource1" runat="server"   DataFile="~/App_Data/服装.accdb" 
            SelectCommand="SELECT [序号], [货号], [色号], [尺码], [品名], [面料], [里料], [厂价], [售价], [ID] FROM [货号表] WHERE ([删除标志] = ?)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="删除标志" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
    </p>
    <center>
        <p>
            &nbsp;<p>
            &nbsp;<p>
            入库明细表：<asp:Button ID="Button2" runat="server"  Text="提交"   CssClass="button_base add_btn " onclick="Button2_Click" />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="ID" DataSourceID="AccessDataSource2" 
            ForeColor="#333333" GridLines="None" Width="818px" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                    InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="入库单据号" HeaderText="入库单据号" SortExpression="入库单据号" 
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
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/服装.accdb" 
            DeleteCommand="DELETE FROM [入库单明细表] WHERE [ID] = ?" 
            
                SelectCommand="SELECT [ID], [入库单据号], [货号], [品名], [色号], [尺码], [数量] FROM [入库单明细表] WHERE ([入库单据号] = ?)" 
                InsertCommand="INSERT INTO [入库单明细表] ([ID], [入库单据号], [货号], [品名], [色号], [尺码], [数量]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
                
                UpdateCommand="UPDATE [入库单明细表] SET  [数量] = ? WHERE [ID] = ?" >
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="入库单据号" Type="Int32" />
                <asp:Parameter Name="货号" Type="String" />
                <asp:Parameter Name="品名" Type="String" />
                <asp:Parameter Name="色号" Type="String" />
                <asp:Parameter Name="尺码" Type="String" />
                <asp:Parameter Name="数量" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="入库单据号" SessionField="入库单据号" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="数量" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
       
            &nbsp;</center>
    

</asp:Content>

