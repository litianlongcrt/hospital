<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'emptyBed.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/top.css">
	
	<style type="text/css">
		.emptyBed{
			height: 130px;
			width: 130px;
			border: 1px solid black;
			margin:20px;
			float: left;
			background-color: orange;
			text-align: center;
			line-height: 130px;
			font-size: xx-large;			
		}
		div h3{
			margin-top: 20px;
		}
	
	</style>

  </head>
  
  <body>
   <div class="top">城　乡　医　院　住　院　部</div>
    <div><h3 align="center">空床列表</h3></div>
    <div class="content">
    <c:if test="${requestScope.bnos==null || fn:length(requestScope.bnos) == 0}">
  		<div>没有空床了</div>
	</c:if>
	<c:forEach items="${requestScope.bnos}" var="item" varStatus="status">
	 	<div class="emptyBed" style="color: red">${item}</div>
	</c:forEach>
    </div>
  </body>
</html>
