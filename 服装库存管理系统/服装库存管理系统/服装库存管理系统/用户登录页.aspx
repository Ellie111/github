<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="用户登录页.aspx.cs" Inherits="服装库存管理系统.用户登录页" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">  
   .button_base
{
    display:block;
    width:70px;
    height:40px;
    background-color:#fff;
    color:#000;
    text-align:center;
    font-size:20px;
    padding:5px 10px;
    letter-spacing:5px;
    border-radius:5px;
     border: 1px solid rgba(255,255,255,0.7);
}
.button_base:hover
{
    width:80px;
    height:40px;
    background-color:#000;
    color:#fff;
    letter-spacing:5px;
    -webkit-transition:color .4s ease-in-out;
    transition-delay:color .4s ease-in-out;
    border-radius:5px;
    border: 1px solid rgba(5,5,5,0.7);  
}
.reset_btn
{
    position:relative;
    top:-40px;
    left:140px;
}
.login_btn
{
    position:relative;
    top:0px;
    left:30px;
    
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 74%; height: 504px; margin-left: 100px;">
            <tr>
              <td colspan="3"  style="font-family: 华文行楷; color: black; font-size: 60px; font-weight:400; font-variant: small-caps; " 
                    > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 服装库存管理系统 <br />
                    <br />
                    <br /></td>
            <br />
                    
            </tr>
            <center>
            <tr>
                <td style="  height: 400px;width: 300px;margin-left:200px;">
                <img src="images/3.jpg" alt="登录" 
                        style="width: 400px; height: 300px; margin-left: 100px"/>
                </td>
                <td  style="width: 745px"; >
              
               <br />
                  
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Height="25px" 
                        Text="账号" Width="53px"></asp:Label>
                    ：
                     
                    <asp:TextBox ID="TextBox1" runat="server" Height="40px"  Width="150px"  ></asp:TextBox>
                    <br />
                     <br />
                  
                    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Height="25px" 
                        Text="密码" Width="53px"></asp:Label>
                    ：
                     
                    <asp:TextBox ID="TextBox2" runat="server"  Height="40px"  Width="150px" 
                        TextMode="Password" ></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />

                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" Text="登录" CssClass="button_base login_btn "/>
                    <asp:Button ID="Button2" runat="server" Text="重置" CssClass="button_base reset_btn" onclientclick="avascript:document.forms[0].reset()" />
                </td>
              
            </tr>
    </center>
        </table>
    
    </div>
    </form>
</body>
</html>

