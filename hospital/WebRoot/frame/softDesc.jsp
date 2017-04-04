<%@ page language="java" import="java.util.*,crt.bean.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Staff staff = (Staff)session.getAttribute("staff");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'hushi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/top.css">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	
	<style type="text/css">
		.img{
			width:70%;
			height:470px;
			clear:both;
			margin: 20px auto;
		}
	</style>
  </head>
  
  <body>
  <div class="top">城　乡　医　院　住　院　部</div>
  	<div class="img">
  		<img class="changeImg" alt="" src="img/10.jpg" height=470px width="800px">
  	</div>
  </body>
  <script type="text/javascript">
  	var index = 11;
  	window.setInterval(function(){
  		if(index>14) index=10;
  		$(".changeImg").attr("src","img/"+index+".jpg");
  		index++;
  	},3000);
  </script>
</html>
