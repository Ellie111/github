<%@ Page Title="" Language="C#" MasterPageFile="~/入库单管理.Master" AutoEventWireup="true" CodeBehind="新增入库单.aspx.cs" Inherits="服装库存管理系统.新增入库单" %>
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
    top:-459px;
    left:313px;
}
 .p_center
 {
     width:55%;
     height:65%;
     opacity:0.5;
      position:absolute;
      top:180px;
      left:23%;
       background-color:rgb(230,230,230);
                
            }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="p_center">
    <center style="height: 16px">
    <br />

        <asp:Button ID="Button1" runat="server" Text="新增"  
            CssClass="button_base login_btn" onclick="Button1_Click" />

        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经办人：&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server" Height="27px" Width="154px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="经办人不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 来&nbsp; 源：&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server" Height="27px" Width="154px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="来源不能为空！" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        </p>
        <p>
            &nbsp;所入仓库：&nbsp; 
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="AccessDataSource1" DataTextField="仓库编号" DataValueField="仓库编号">
            </asp:DropDownList>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                DataFile="~/App_Data/服装.accdb" SelectCommand="SELECT [仓库编号] FROM [仓库表]">
            </asp:AccessDataSource>
        </p>
        <p>
            &nbsp;备注：</p>
        <p>
            <asp:TextBox ID="TextBox3" runat="server" Height="53px" Width="297px"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <br />

    &nbsp;</p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="重置" CssClass="button_base reset_btn"/>

</center>
</div>
</asp:Content>

