<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="modify_news.aspx.cs" Inherits="admin_modify_news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="ny-right">
  <h3>新闻信息修改</h3>  <br></br>
<div class="ny-zjhz">


  

  
     标题：<asp:TextBox ID="bt" runat="server"></asp:TextBox>  <br/> <br/>
     作者：<asp:TextBox ID="lxr" runat="server" ></asp:TextBox><br/> <br/>



     简介:<asp:TextBox ID="content" runat="server" Height="162px" 
            Width="271px" TextMode="MultiLine"></asp:TextBox><br/> <br/>


        <asp:Button ID="btn_ok" runat="server" Text="修改" OnClick="btn_click"/>
  
</div>

</div>

<div class="clear"></div>


</asp:Content>

