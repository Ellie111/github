﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="modify_product.aspx.cs" Inherits="admin_modify_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div class="ny-right">
  <h3>信息修改</h3>
<div class="ny-zjhz">

  


     标题：<asp:TextBox ID="bookname" runat="server"></asp:TextBox>  <br/> <br/>
     发布人：<asp:TextBox ID="price" runat="server" ></asp:TextBox><br/> <br/>

     内容<asp:TextBox ID="content" runat="server" Height="162px" 
            Width="271px" TextMode="MultiLine"></asp:TextBox><br/> <br/>


        <asp:Button ID="btn_ok" runat="server" Text="修改" OnClick="btn_click"/>
  
</div>

</div>

<div class="clear"></div>
</asp:Content>

