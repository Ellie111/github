<%@ Page Title="" Language="C#" MasterPageFile="~/member.master" AutoEventWireup="true" CodeFile="modify_zy.aspx.cs" Inherits="modify_member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="right" style=" padding:50px 0 0 200px; width:400px;">

 <h3>提交作业</h3>
 <br>
  

  
     作业名：<asp:TextBox ID="title" runat="server"></asp:TextBox>  <br/> <br/>
     发布人：<asp:TextBox ID="uname" runat="server" ></asp:TextBox><br/> <br/>



     作业简介:<asp:TextBox ID="content" runat="server" Height="162px" 
            Width="271px" TextMode="MultiLine"></asp:TextBox><br/> <br/>
       提交人：<asp:TextBox ID="student" runat="server" ></asp:TextBox><br/> <br/>
      提交人：<asp:FileUpload ID="fuUpLoad" runat="server" /><br>  <br/>


        <asp:Button ID="btn_ok" runat="server" Text="提交" OnClick="btn_click"/>
</div>

</asp:Content>

