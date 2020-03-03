<%@ Page Title="" Language="C#" MasterPageFile="~/member.master" AutoEventWireup="true" CodeFile="modify_member.aspx.cs" Inherits="modify_member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="right" style=" padding:50px 0 0 200px; width:400px;">

 <h3>个人信息修改</h3>
 <br>
  

  
     用户名：<asp:TextBox ID="uname" runat="server"></asp:TextBox>  <br/> <br/>
     密 码 ：<asp:TextBox ID="pwd" runat="server" ></asp:TextBox><br/> <br/>



     邮  箱 :<asp:TextBox ID="email" runat="server" ></asp:TextBox><br/> <br/>


        <asp:Button ID="btn_ok" runat="server" Text="修改" OnClick="btn_click"/>
</div>

</asp:Content>

