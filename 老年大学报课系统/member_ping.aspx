<%@ Page Title="" Language="C#" MasterPageFile="~/member.master" AutoEventWireup="true" CodeFile="member_ping.aspx.cs" Inherits="member_ping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>用户评论 </span>  
	
	 </h3>
	 <div class="scmb-ct">
<br><br>
<style>td{padding:10px;} </style>

<table border="1">


<tr>    <td> 课程名：</td> <td><asp:TextBox ID="title" runat="server"></asp:TextBox> </td> </tr>
    <tr>    <td> 价格：</td> <td><asp:TextBox ID="price" runat="server" ></asp:TextBox></td> </tr>
    <tr>    <td> 订购人：</td> <td><asp:TextBox ID="uname" runat="server" ></asp:TextBox></td> </tr>
        <tr>    <td> 课程id：</td> <td><asp:TextBox ID="pid" runat="server" ></asp:TextBox></td> </tr>
          
    <tr>  
   <td> 
     评论内容  </td> <td> <asp:TextBox ID="nr" runat="server" Height="162px" 
            Width="271px" TextMode="MultiLine"></asp:TextBox><br/> 

   </td> </tr>


       <tr>    <td>  <asp:Button ID="btn_ok" runat="server" Text="评论" OnClick="btn_click"/></td> </tr>
       </table>            
</div>

</div>

</asp:Content>

