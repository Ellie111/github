<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/admin.master" AutoEventWireup="true" CodeFile="modify_product.aspx.cs" Inherits="admin_modify_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div class="ny-right">
  <h3>信息修改</h3>
<div class="ny-zjhz">

  


     教师名：<asp:TextBox ID="uname" runat="server"></asp:TextBox>  <br/> <br/>
     密码：<asp:TextBox ID="pwd" runat="server" ></asp:TextBox><br/> <br/>

     简介<asp:TextBox ID="content" runat="server" Height="162px" 
            Width="271px" TextMode="MultiLine"></asp:TextBox><br/> <br/>


        <asp:Button ID="btn_ok" runat="server" Text="修改" OnClick="btn_click"/>
  
</div>

</div>

<div class="clear"></div>
</asp:Content>

