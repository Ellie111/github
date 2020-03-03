<%@ Page Title="" Language="C#" MasterPageFile="~/用户管理.Master" AutoEventWireup="true" CodeBehind="新增用户信息.aspx.cs" Inherits="服装库存管理系统.新增用户信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
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
       .login_btn
{
    position:relative;
    top:0px;
    left:-80px;
    
    }
    .reset_btn
{
    position:relative;
    top:-61px;
    left:80px;
}
.mm
{
    position:relative;
    left:25px;
    top: -37px;
        }
.p
{ position:relative;
    left:-110px;
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="p_center">
<center>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        请输入账号:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="账号不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 请输入姓名：
         
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBox2" ErrorMessage="姓名不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 请输入密码：
         
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="TextBox3" ErrorMessage="密码不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
            <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 请输入电话： 
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="TextBox4" ErrorMessage="电话不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        请输入角色:&nbsp;
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="TextBox5" ErrorMessage="角色不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        
        <p class=p>请输入简介:</p>&nbsp; 
        <asp:TextBox ID="TextBox6" runat="server" CssClass="mm"></asp:TextBox>
        <br />
&nbsp;<br />
            <br />

    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="新增" CssClass="button_base login_btn " />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="重置" CssClass="button_base reset_btn"  />
    </center>
    </div>
</asp:Content>
