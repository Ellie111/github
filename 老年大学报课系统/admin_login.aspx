<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>用户登录 </span>  
	
	 </h3>
	 <div class="scmb-ct">


  
    <label> 身份 ：<asp:DropDownList ID="role" runat="server">
            <asp:ListItem>管理</asp:ListItem>
            <asp:ListItem>老师</asp:ListItem>
           <asp:ListItem>学生</asp:ListItem>
      
     
        </asp:DropDownList></label>  <br>
   
    <label> 账户 ：<asp:TextBox ID="username" runat="server" Width="100px"></asp:TextBox></label>  <br>
     <label> 密码 ：<asp:TextBox ID="password" runat="server" Width="100px" TextMode="Password"></asp:TextBox></label>  <br> 


      <label><asp:Button ID="btnlogin" runat="server" Text="登录" OnClick="btn_login" />  <asp:Button ID="btnregister" runat="server" Text="注册" OnClick="btn_register" /> </label>
    
     </div>

</div>






</asp:Content>

