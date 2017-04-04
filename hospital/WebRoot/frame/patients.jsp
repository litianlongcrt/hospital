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
    
    <title>My JSP 'patient.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/top.css">
	

	<style type="text/css">
	.fullBed{
			height: 150px;
			width: 150px;
			border: 1px solid black;
			margin:20px;
			float: left;
			background-color: orange;
			text-align: center;						
		}
		.fullBedLeft{
			float: left;
			width: 50px;
			height: 150px;
			font-size: xx-large;
		}
		.fullBedRight{
			float: right;
			width: 100px;
			height: 150px;
		}
		.fullBedRightRow{
			line-height: 35px;
		}
		.addPatient{
			margin: 20px; 
		}
		.addPatient #addPno{
			width: 80px;
			height: 27px;
			font-size: large;
			color: red;
		}
	</style>
	<script type="text/javascript">
		function getOnePatientInfo(obj) {
			var inputs = obj.getElementsByTagName("input");
			var pno = inputs[0].value;
			//alert(pno);
			//window.open("Patient?pno="+pno);
			window.location.href="Patient?pno="+pno;
		}
	</script>
  </head>
  
  <body>
    <div class="top">城　乡　医　院　住　院　部</div>
  <%
  if(staff!=null){
	%>
	<c:if test="${!empty DoctorAddPatientShowDiv}">
	<div class="addPatient">	
		<form action="DoctorAddPatient" method="post">
			
			患者ID：<input type="text" name="pno" id="addPno"/>
			<input type="hidden" name="sno" value="${staff.sno}">
			<input type="submit" value="添加病人" /><span style="color: red; font-size:x-large;"> 　　${msg}</span>
		</form>		
	</div>
	</c:if>
	<div style="clear: both;">
		<c:if test="${staff.patients==null || fn:length(staff.patients) == 0}">
	  		<div class="" style="color: red;margin-left:20px; ">现在您还没有治疗的患者！</div>
		</c:if>
		<c:forEach items="${staff.patients}" var="item" varStatus="status">
	 		<div class="fullBed" onclick="getOnePatientInfo(this)">
	 			<div class="fullBedLeft">${item.name}</div>
	 			<div class="fullBedRight">
	 				<div class="fullBedRightRow" style="font-size: 13">住院号：${item.pno}</div>
	 				<div class="fullBedRightRow">床位：${item.bed}</div>
	 				<div class="fullBedRightRow">性别：${item.sex}</div>
	 				<div class="fullBedRightRow">年龄：${item.age}</div>
	 				
	 			</div>
	 			<input type="hidden" value="${item.pno}" id="pno">
	 		</div>
		</c:forEach>
	</div>
	<%
  }else{
	  %>
	  <jsp:forward page="index.jsp"></jsp:forward>
	  <%
  }
  %>
  </body>
</html>
