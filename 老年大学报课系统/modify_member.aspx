<%@ Page Title="" Language="C#" MasterPageFile="~/member.master" AutoEventWireup="true" CodeFile="modify_member.aspx.cs" Inherits="modify_member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>信息修改 </span>  
	
	 </h3>
	 <div class="scmb-ct" style="padding:0 0 0 200px;">
<br>
<br>
<br>
 <br>
  

  
     用户名：<asp:TextBox ID="uname" runat="server"></asp:TextBox>  <br/> <br/>
     密 码 ：<asp:TextBox ID="pwd" runat="server" ></asp:TextBox><br/> <br/>



     邮  箱 :<asp:TextBox ID="email" runat="server" ></asp:TextBox><br/> <br/>


        <asp:Button ID="btn_ok" runat="server" Text="修改" OnClick="btn_click"/>
</div>
</div>

</asp:Content>

