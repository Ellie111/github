<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="修改密码页.aspx.cs" Inherits="服装库存管理系统.修改密码页" %>

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
    
        <table style="width: 90%; height: 497px; margin-left: 100px;">
            <tr>
              <td colspan="3"  style="font-family: 华文行楷; color: black; font-size: 60px; font-weight:400; font-variant: small-caps; " 
                    > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 服装库存管理系统<br /><br /><br /></td>
            </tr>
            <tr>
                <td style="  height: 300px;width: 300px;margin-left:150px;">
                <img src="images/3.jpg" alt="登录" 
                        style="width: 500px; height: 400px; margin-left: 10px"/>
                </td>
                <td  style="width: 800px"; >
              
               <br />
                  
                    <asp:Label ID="Label1" runat="server" Font-Size="23px" Height="25px" 
                        Text="旧密码" Width="100px"></asp:Label>
                        ：<asp:TextBox ID="TextBox1" runat="server"  Width="140px" Height="32px" 
                        TextMode="Password"></asp:TextBox> 
                    <br />
                     <br />
                  
                    <asp:Label ID="Label2" runat="server" Font-Size="23px" Height="25px" 
                        Text="新密码" Width="100px"></asp:Label>
                        ：<asp:TextBox  ID="TextBox2" runat="server"   TextMode="Password"  Width="140px" Height="32px"></asp:TextBox> 
                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                        ControlToCompare="TextBox1" ControlToValidate="TextBox2" 
                        ErrorMessage="新密码不能与原密码一样！" ForeColor="Red" Operator="NotEqual"></asp:CompareValidator>
                    <br />
                    <br />
                     <asp:Label ID="Label3" runat="server" Font-Size="23px" Height="25px" 
                        Text="确认密码" Width="100px"></asp:Label>
                        ：
                        <asp:TextBox ID="TextBox3" runat="server" Width="140px" Height="32px" 
                        TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="TextBox2" ControlToValidate="TextBox3" 
                        ErrorMessage="密码输入不一致！" ForeColor="Red"></asp:CompareValidator>
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" Text="确认" CssClass="button_base login_btn "/>
                    <asp:Button ID="Button2" runat="server" Text="返回" 
                        CssClass="button_base reset_btn" onclick="Button2_Click" />
                </td>
              
            </tr>
    
        </table>
    
    </div>
    </form>
</body>
</html>

