<%@ Page Title="" Language="C#" MasterPageFile="~/member.master" AutoEventWireup="true" CodeFile="modify_account.aspx.cs" Inherits="modify_account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>信息修改 </span>  
	
	 </h3>
	 <div class="scmb-ct" style="padding:0 0 0 200px;">
<br>
<br>
<br>
 <br>
  

   账户：<asp:TextBox ID="id" runat="server"></asp:TextBox>  <br/> <br/>
     姓名：<asp:TextBox ID="uname" runat="server"></asp:TextBox>  <br/> <br/>




     余额:<asp:TextBox ID="account" runat="server" ></asp:TextBox><br/> <br/>
     金额:<asp:TextBox ID="je" runat="server" ></asp:TextBox><br/> <br/>



        <asp:Button ID="btn_ok" runat="server" Text="充值" OnClick="btn_click"/>
</div>
</div>

</asp:Content>

