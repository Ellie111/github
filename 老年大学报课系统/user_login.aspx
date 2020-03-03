<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user_login.aspx.cs" Inherits="user_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="scmb">
	   <h3> <span>用户登录 </span>  
	
	 </h3>
	 <div class="scmb-ct">


  
    <label> 用户名 ：<asp:TextBox ID="username" runat="server" Width="100px"></asp:TextBox></label> <br> <br> 
     <label> 密   &nbsp;码 ：<asp:TextBox ID="password" runat="server" Width="100px" TextMode="Password"></asp:TextBox></label>  <br> <br> 

      <label><asp:Button ID="btnlogin" runat="server" Text="登录" OnClick="btn_login" />    <asp:Button ID="btnregister" runat="server" Text="注册" OnClick="btn_register" /> </label>



      </div>

</div>


 


</asp:Content>

