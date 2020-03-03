<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="首页.aspx.cs" Inherits="服装库存管理系统.首页" %>

<!DOCTYPE html>
<html lang="en">
<head>
 <style type="text/css">
     .login_btn
{
    position:relative;
    top:-100px;
    left:782px;
    
    }
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
    background-color: #DC4E1B;
    color:#fff;
    letter-spacing:5px;
    -webkit-transition:color .4s ease-in-out;
    transition-delay:color .4s ease-in-out;
    border-radius:5px;
    border: 1px solid rgba(5,5,5,0.7);  
}

         body
        {
            width:100%;
            background-image:url("images/1.jpg");
            background-size:100% 100%;
            background-repeat:no-repeat;
            background-attachment:fixed;
            margin-top:100px;
        }
    </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
 <nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">导航</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Welcome to SUGA服装管理系统</a>&nbsp;&nbsp;
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">系统管理<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="用户管理页.aspx">用户管理</a></li>
            <li class="divider"></li>
            <li><a href="货号管理页.aspx">货号管理</a></li>
          </ul>
        </li>

         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">库存管理<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="入库单管理页.aspx">入库单管理</a></li>
            <li class="divider"></li>
            <li><a href="出库单管理页.aspx">出库单管理</a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">辅助管理<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="修改密码页.aspx">修改密码</a></li>
          </ul>
        </li>
        <div>
        </div>
      </ul>
    
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <br /> <br />
   <div>

       <asp:Button ID="Button1" runat="server"  Text="注销"  
           CssClass="button_base login_btn " onclick="Button1_Click" />

        </div>

    </form>

</body>
</html>

