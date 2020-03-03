<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'listbook.jsp' starting page</title>
    
	

  </head>
  
  <body style="text-align:center">
    <h2>渊博书店</h2>
    
      <table border="1" width="80%">
        <tr>
           <td>编号</td>
           <td>书名</td>
           <td>作者</td>
           <td>价格</td>
           <td>描述</td>
           <td>操作</td>   
        </tr>
        <c:forEach var="book" items="${books}">
          <tr>
          <td>${book.id}</td>
           <td>${book.name}</td>
           <td>${book.author}</td>
           <td>${book.price}</td>
           <td>${book.description}</td>
           <td>
               <a href="${pageContext.request.contextPath}/servlet/BuyServlet?id=${book.id}">购买</a>
           
           </td>   
          
          </tr>
        
        </c:forEach>
        
      
      
      </table>
  </body>
</html>
