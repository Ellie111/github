<%@ Page Title="" Language="C#" MasterPageFile="~/货号管理.Master" AutoEventWireup="true" CodeBehind="新增货号信息.aspx.cs" Inherits="服装库存管理系统.新增货号信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
       .login_btn
{
    position:relative;
    top:0px;
    left:-59px;
        width: 70px;
    }
    .reset_btn
{
    position:relative;
    top:-61px;
    left:80px;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    </br></br>
    <center>
        <br />
        <br />
        请输入序号:&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="序号不能为空！" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
         请输入货号：
        <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBox2" ErrorMessage="货号不能为空！" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
            <br />
        请输入品名: 
<asp:TextBox ID="TextBox3" runat="server" style="margin-bottom: 0px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="TextBox3" ErrorMessage="品名不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        请输入色号：
         
        <asp:DropDownList ID="DropDownList2" runat="server" Height="30px" Width="60px">
            <asp:ListItem>白色</asp:ListItem>
            <asp:ListItem>红色</asp:ListItem>
            <asp:ListItem>黄色</asp:ListItem>
            <asp:ListItem>黑色</asp:ListItem>
            <asp:ListItem>灰色</asp:ListItem>
            <asp:ListItem>蓝色</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="DropDownList2" ErrorMessage="色号不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;
         请输入尺码：
         
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            Height="30px" Width="60px">
            <asp:ListItem>150</asp:ListItem>
            <asp:ListItem>155</asp:ListItem>
            <asp:ListItem>160</asp:ListItem>
            <asp:ListItem>165</asp:ListItem>
            <asp:ListItem>170</asp:ListItem>
            <asp:ListItem>175</asp:ListItem>
            <asp:ListItem>180</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="DropDownList1" ErrorMessage="尺码不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
&nbsp;请输入面料：<asp:DropDownList ID="DropDownList3" 
            runat="server" AutoPostBack="True">
            <asp:ListItem>丝绸</asp:ListItem>
            <asp:ListItem>纯棉</asp:ListItem>
            <asp:ListItem>混纺</asp:ListItem>
            <asp:ListItem>羊毛</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
            ControlToValidate="DropDownList3" ErrorMessage="面料不能为空!" 
            ForeColor="#CC0000"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
请输入里料：<asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True">
            <asp:ListItem>丝绸</asp:ListItem>
            <asp:ListItem>纯棉</asp:ListItem>
            <asp:ListItem>混纺</asp:ListItem>
            <asp:ListItem>羊毛</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
            ControlToValidate="DropDownList4" ErrorMessage="里料不能为空!" 
            ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
<br />
请输入厂价： 
<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
            ControlToValidate="TextBox4" ErrorMessage="厂价不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
<br />
请输入售价： 
<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
            ControlToValidate="TextBox5" ErrorMessage="售价不能为空!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
<br />
            <br />

    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="新增" 
            CssClass="button_base login_btn " />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="重置"  CssClass="button_base reset_btn" />
    </center>
</asp:Content>

