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
	<style type="text/css">
		
		.cx{
			float: left;
			margin-left: 20px;
		}
		
	</style>
	<style type="text/css">
		.fullBed{
			height: 150px;
			width: 150px;
			border: 1px solid black;
			margin:20px 40px 20px 30px;
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
	</style>
	<script type="text/javascript">
		function tomorroy(){
			var now = new Date();
			now.setDate(now.getDate()+1);  
			var h=now.getFullYear(); 
		    var m=now.getMonth()+1; 
		    var d=now.getDate();
		    if(m<10) m = "0"+m;
		    if(d<10) d = "0"+d;
		    return h+"-"+m+"-"+d; 
		}
		function today(){
			var now = new Date();
			var h=now.getFullYear(); 
		    var m=now.getMonth()+1; 
		    var d=now.getDate();
		    if(m<10) m = "0"+m;
		    if(d<10) d = "0"+d;
		    return h+"-"+m+"-"+d; 
		}
		function getOnePatientInfo(obj) {
			var inputs = obj.getElementsByTagName("input");
			var pno = inputs[0].value;
			//alert(pno);
			//window.open("Patient?pno="+pno+"&date="+today());
			window.location.href="Patient?pno="+pno+"&date="+today();
		}
	</script>
	
  </head>
  
  <body>
  <div class="top">城　乡　医　院　住　院　部</div>
  <%
  if(staff!=null){
	%>	
	<div>
		<c:if test="${staff.patients==null || fn:length(staff.patients) == 0}">
	  		<div style="margin:20px; color: red; font-weight: bolder; ">现在还没有患者住院！</div>
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
  <script type="text/javascript">
  	var addPatientMsg = new String();
  	addPatientMsg = "${addPatient}";
		if(addPatientMsg=="成功"){
			alert("添加成功，请刷新一下！");			
		}
	var PatientOut = new String();
	PatientOut = "${PatientOut}";
		if(PatientOut=="出院"){
			alert("出院成功，请刷新一下！");			
		}
		
	</script>
  </body>
</html>
