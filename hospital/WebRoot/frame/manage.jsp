<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <c:if test="${staff.grade eq 'A'}">
  	<jsp:forward page="other.jsp"></jsp:forward>
  </c:if>
  <c:if test="${staff.grade eq 'B'}">
  	<jsp:forward page="other.jsp"></jsp:forward>
  </c:if>
  <c:if test="${staff.grade eq 'C'}">
  	<jsp:forward page="patients.jsp"></jsp:forward>
  </c:if>
  <c:if test="${staff.grade eq 'D1'}">
  	<jsp:forward page="hushi.jsp"></jsp:forward>
  </c:if>
   <c:if test="${staff.grade eq 'D2'}">
  	<jsp:forward page="hushi.jsp"></jsp:forward>
  </c:if>    
  <c:if test="${staff.grade eq 'E'}">
	<jsp:forward page="yaofang.jsp"></jsp:forward>
  </c:if>
  <c:if test="${staff.grade eq 'F'}">
  	<jsp:forward page="feiyong.jsp"></jsp:forward>
  </c:if> 
  <c:if test="${staff.grade eq 'G'}">
  	<jsp:forward page="bingAnShi.jsp"></jsp:forward>
  </c:if> 
  </body>
</html>
