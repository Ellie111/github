<%@ Page Title="" Language="C#" MasterPageFile="~/出库单管理.Master" AutoEventWireup="true" CodeBehind="新增出库单.aspx.cs" Inherits="服装库存管理系统.新增出库单" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
 .login_btn
{
    position:relative;
    top:-4px;
    left:221px;
    
    }
    .reset_btn
{
    position:relative;
    top:-45px;
    left:313px;
}
 .p_center
 {
     width:55%;
     height:77%;
     opacity:0.5;
      position:absolute;
      top:89px;
      left:23%;
       background-color:rgb(230,230,230);
                
            }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="p_center">
    <center>
     <br />

        <asp:Button ID="Button1" runat="server" Text="新增"   
            CssClass="button_base login_btn" onclick="Button1_Click"  />
            <asp:Button ID="Button2" runat="server" Text="重置" CssClass="button_base reset_btn"/>

        <br />
        经办人:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="经办人不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        接收人:
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBox2" ErrorMessage="接收人不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        接收人地址:
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="TextBox3" ErrorMessage="接收人地址不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        接收人电话:
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="TextBox4" ErrorMessage="接收人电话不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        所出仓库:
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="AccessDataSource1" DataTextField="仓库编号" DataValueField="仓库编号" 
            Height="35px" Width="80px">
        </asp:DropDownList>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/服装.accdb" SelectCommand="SELECT [仓库编号] FROM [仓库表]">
        </asp:AccessDataSource>
        <br />
        <br />
        备注:<br />
        <asp:TextBox ID="TextBox5" runat="server" Height="44px" style="margin-left: 0px" Width="366px"></asp:TextBox>
        </center>
        </div>
</asp:Content>

