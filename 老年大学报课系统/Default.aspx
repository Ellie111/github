﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>夕阳红老年大学报课管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/1.js"></script>
<script type="text/javascript" src="js/2.js"></script>


</head>
<body >

   <form id="form1" runat="server">
<div class="waper">

<div class="header">
 <div class="top">  
    <div class="grzx"><a href="user_login.aspx">欢迎访问您访问</a>  <a href="member_info.aspx">个人中心</a> </div>
 
      <div class="form"> 
          
          <asp:TextBox ID="txtSou_suo" runat="server" Height="30px" Width="170px"></asp:TextBox>
        
          
             <asp:Button ID="btnZhao" runat="server" Text="查 找" Height="30px" Width="70px" OnClick="btnZhao_Click" />
      </div>
     </div>

<div class="nav">
    <ul>
		     <li><a href="default.aspx">网站首页</a></li>
	   
	   <li><a href="about.aspx">关于我们</a></li>
		<li><a href="news.aspx">新闻动态</a></li>
          	<li><a href="course.aspx">在线课程</a></li>
          	<li><a href="teacher.aspx">师资力量</a></li>

        <li id="loading" visible="true" runat ="server"> <a  href="admin_login.aspx" >用户登录</a></li>
                <li id="load" visible="false" runat="server"><a href="member_info.aspx"><%=Session["yhm"]%></a> <a href="loginout.aspx">退出</a></li>  
 </ul>

   </div>
</div>

<div class="main">
  <div class="wapper">
 
<div class="h-left">
     <div class="wzgg">
	   <h3>网站公告</h3>
	<marquee align="up" behavior="scroll" direction="up" loop="-1" onMouseOut="this.start()" onMouseOver="this.stop()" scrollamount="1" scrolldelay="60">
<p> 

<span>现在的人越来越注重于运动，那么老年人平时应该怎样锻炼身体呢?或者说哪些运动比较的适合老年人呢?第一:老年人适合于打太极。太极是一项放松身心的一项比较高雅的运动，可以强身健体</span></p></marquee>
	
	</div>
 
	   
  
<div class="jrtj1">
   <h3>
<a href="news.aspx">新闻动态</a>
</h3>

  <ul>

   <asp:GridView ID="GridView2" runat="server" 
              AutoGenerateColumns="False" CellPadding="4"
                            CellSpacing="1" EnableViewState="False"  GridLines="None" 
              onselectedindexchanged="GridView1_SelectedIndexChanged" >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                             
                                
                                     
                                       <li><asp:HyperLink ID="HyperLink1" Text='<%# Eval("title") %>' NavigateUrl='<%# "shownews.aspx?id="+Eval("id") %>'
                                            runat="server" /> </li>
                                        
                                   
                             
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
 
 
  </ul>

</div>  


</div>
  
   
  <div class="h-right"> 
  <div class="s-banner">

      	<div class="focus">
		<ul class="rslides f426x240">
			<li><a href="#" target="_blank"><img src="images/banner1.jpg" /></a></li>
			<li><a href="#" target="_blank"><img src="images/banner2.jpg" /></a></li>
			<li><a href="#" target="_blank"><img src="images/banner3.jpg" alt="读。书。" /></a></li>
			<li><a href="#" target="_blank"><img src="images/banner4.jpg" /></a></li>
			
		</ul>
	</div>
	
  

  </div>
  
    <div class="scmb2">
	   <h3> <span>在线课程</span>  
	
	 </h3>
	 <div class="scmb-ct">
	 
	 
	 
					 <asp:GridView ID="GridView1" runat="server" 
              AutoGenerateColumns="False" CellPadding="4"
                            CellSpacing="1" EnableViewState="False"  GridLines="None" 
              onselectedindexchanged="GridView1_SelectedIndexChanged" >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                   <dl><dt><a href="book_detail.aspx?id=<%# Eval("id") %>"> <img src="teacher/file/<%# Eval("pic") %>" ></a></dt>
                                
                                     
                                       <dd><a href="book_detail.aspx?id=<%# Eval("id") %>"> <%# Eval("title") %></a> </dd>
                                        
                                   
                             
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

	   
	   </div> 
  	</div>   
      
	  
	  
	  
	  
	  
</div>

</div>
</div>

<div class="clear"></div>
 <div class="foot">
     <div class="bq">
	  
	  <p style=" padding:50px 0 0 0;"> 版权所有 翻版必究</p>
	  
	  </div>
	 </div> 
<div class="clear"></div>	  
</div>

</form>

</body>
</html>



