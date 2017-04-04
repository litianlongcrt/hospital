<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'patient.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/top.css">
	<style type="text/css">
	*{
	margin: 0;
	padding: 0;
	}
		a{
			text-decoration: none;
		}
		a:HOVER {
			color: red;
			font-weight:900;
		}
	</style>
  </head>
  
  <body>
  <div class="top">城　乡　医　院　住　院　部</div>
  <div style="width: 60%;margin: 0 auto;">
  <%
  String year = new SimpleDateFormat("yyyy").format(new Date());
  String month = new SimpleDateFormat("MM").format(new Date());
  String day = new SimpleDateFormat("dd").format(new Date());
  %>
  <div style="height: 20px; margin:20px 0;">
  	姓名：<font size="5">${sessionScope.patient.name}</font>　　性别：${sessionScope.patient.sex}　　年龄：${sessionScope.patient.age}　　
  	<div style="float: right;">
  		<a href="AddDrug?pno=${sessionScope.patient.pno}"><font size="5">点击开药</font></a>
 	</div>
</div>
  
  
  
 <div style="width: 800px; margin: 0 auto;">
 <h3 style="text-align: center;margin: 10 auto;">出院证明 </h3>${requestScope.updateDesc}
 <form action="UpdatePatientDesc" method="post" >
	 <textarea rows="10" cols="100" name="desc" style="text-align: left; line-height: 25px">
XXXXXXXXX医院　　　　　
姓名：${sessionScope.patient.name}　　　　性别：${sessionScope.patient.sex}　　　　年龄：${sessionScope.patient.age}　　　　　
诊断结果：　　　　　
医嘱及建议：　　　　　
注：1、未加盖本院公章无效 2、涂改无效 3、疾病证明，他用无效　　　　　
医师签名（公章）：　　　　　
<%=year %>年<%=month %>月<%=day %>日　　　　　
-------------------剪----------切----------线-----------------------------
</textarea>
<input type="hidden" value="${sessionScope.patient.pno}" name="pno"><br>
<input type="submit" value="完成">
 </form>
 </div>
 </div>
  </body>
</html>
