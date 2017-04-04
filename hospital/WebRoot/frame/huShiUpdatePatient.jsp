<%@ page language="java" import="java.util.*,crt.bean.*" pageEncoding="UTF-8"%>
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
    
    <title>My JSP 'huShiUpdatePatient.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/top.css">
	
	<script type="text/javascript">
		function chuYuan() {
			var pno = "${sessionScope.patient.pno}";
			//alert("PatientOut?bno="+bno);
			window.location.href="PatientOut?pno="+pno;
		}
	</script>
	<style type="text/css">
		td{
			width: 100px;
			height: 40px;
			text-align: center;
		}
	</style>
  </head>
  
  <body>
  	<div class="top">城　乡　医　院　住　院　部</div>
  	<div >
	    <table border="3" style="margin: 0 auto;">
	    	<tr><td>姓名</td><td>药物名称</td><td>主治医生</td><td>开药时间</td><td>用药时间</td><td>药房是否已经送药</td></tr>	
		  <c:choose>
		  	   <c:when test="${empty sessionScope.SelectMakeDrugByPnoAndDate}">
			   		<tr><td rowspan="2">${sessionScope.patient.name}</td><td colspan="5">主治医生还没有开药</td></tr>
			   </c:when>
			   <c:otherwise>
			   <tr><td rowspan="${fn:length(sessionScope.SelectMakeDrugByPnoAndDate)+2}">${sessionScope.patient.name}</td></tr>     		
				   <c:forEach items="${sessionScope.SelectMakeDrugByPnoAndDate}" var="item" varStatus="status">
						<tr><td>${item.dname}</td><td>${item.sno}</td><td>${item.makeDrugDate}</td><td>${item.useDrugDate}</td><td>${item.send}</td></tr>
				   </c:forEach>	  	
			   </c:otherwise>
	  	 	</c:choose>
	  	 	<tr><td colspan="5">
		  	 	<c:if test="${empty sessionScope.patient.desc}">
		   			<button type="button" disabled="disabled">出院</button>
			    </c:if>
			    <c:if test="${!empty sessionScope.patient.desc}">
			   		<button type="button" onclick="chuYuan()">出院</button>
			    </c:if>
	  	 	</td></tr>
	    </table>
	  
	    
	   
   </div>
  </body>
</html>
