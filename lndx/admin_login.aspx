<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>管理登录 </span>  
	
	 </h3>
	 <div class="scmb-ct">
    <label> 用户名 ：<asp:TextBox ID="username" runat="server" Width="100px"></asp:TextBox></label>  <br><br>
     <label> 密   &nbsp;码 ：<asp:TextBox ID="password" runat="server" Width="100px" TextMode="Password"></asp:TextBox></label>  <br> <br> 

      <label><asp:Button ID="btnlogin" runat="server" Text="登录" OnClick="btn_login" /></label>
     </div>

</div>






</asp:Content>

