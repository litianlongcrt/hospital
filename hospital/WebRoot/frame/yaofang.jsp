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
    
    <title>My JSP 'yaofang.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/top.css">
	
	<style type="text/css">
		td{
			width: 100px;
			text-align: center;
		}
		a{
			text-decoration: none;
		}
		.table{
			width: 80%;
			margin: 20px auto;
		}
	</style>
	<script type="text/javascript">
		function today(){
			var now = new Date();
			var h=now.getFullYear(); 
		    var m=now.getMonth()+1; 
		    var d=now.getDate();
		    if(m<10) m = "0"+m;
		    if(d<10) d = "0"+d;
		    return h+"-"+m+"-"+d; 
		}
		function getDrugByPno() {
			var reg = new RegExp("[0-9]$");
			var inputPno = document.getElementById("inputPno").value;
			var inputDate = document.getElementById("inputDate").value;
			if(reg.test(inputPno)){
				window.location.href="DrugByPnoAndDate?pno="+inputPno+"&date="+inputDate;
				//window.location.href="DrugByPnoAndDate?pno="+inputPno+"&date="+"2017-02-18";
				//alert("DrugByPnoAndDate?pno="+inputPno+"&date="+inputDate);
			}else{
				alert("输入格式有误，只能输入数字！");
				return false;
			}
			
			return;
					
		}
		
	</script>
  </head>
  
  <body>
   	  <div class="top">城　乡　医　院　住　院　部</div>
    <div class="table">
    	<table border="1">
	    	<tr style="height: 50px;line-height: 50px; font-size: 20px">
	    		<td colspan="6" >	
	    		输入患者ID号：<input type="text" name="inputPno" id="inputPno"> 
	    			<input type="text" name="inputDate" id="inputDate">   
		    		<button type="button" onclick="getDrugByPno()">患者药物查询</button>
		    		</td>
		    </tr>
    		<tr><td>姓名</td><td>药品ID号</td><td>药品名称</td><td>数量</td><td>用药时间</td><td>现在送药</td></tr>
    		<c:if test="${empty requestScope.oneMakeDrug}">
    			<tr><td colspan="6">还没有要查询的药物</td></tr>
    		</c:if>
    		<c:if test="${!empty requestScope.oneMakeDrug}">
    			<tr><td rowspan="${fn:length(requestScope.oneMakeDrug)+2}">${requestScope.oneMakeDrug[0].pname}</td></tr>  	
		    	<c:forEach items="${requestScope.oneMakeDrug}" var="item" varStatus="status">
		    		<tr><td>${item.dno}</td><td>${item.dname}</td><td>${item.count}</td><td>${item.useDrugDate}</td><td><a href="SendDrug?mdid=${item.mdid}">送药</a></td></tr>
		    	</c:forEach>
		    	<tr><td colspan="6"><a href="SendDrugs?mdids=${requestScope.oneMakeDrug}">全部送药</a></td></tr>
	  		</c:if>
	  		
    		
    </table>
    </div>
   
     <div class="table">
    	<table border="1">
    		<tr style="height: 50px;line-height: 50px; font-weight: bolder; font-size: 20px"><td colspan="6" >今　　日　　送　　药　　列　　表</td></tr>
    		<tr><td>姓名</td><td>药品ID号</td><td>药品名称</td><td>数量</td><td>用药时间</td><td>现在送药</td></tr>
    		<c:if test="${empty TodayAllDrug}">
    			<tr><td colspan="6">还没有要查询的药物</td></tr>
    		</c:if>
    		<c:if test="${!empty TodayAllDrug}">
		    	<c:forEach items="${TodayAllDrug}" var="item" varStatus="status">
		    		<tr><td>${item.pname}</td><td>${item.dno}</td><td>${item.dname}</td><td>${item.count}</td><td>${item.useDrugDate}</td><td><a href="SendDrug?mdid=${item.mdid}">送药</a></td></tr>
		    	</c:forEach>
		    	<tr><td colspan="6"><a href="SendDrugs?mdids=${TodayAllDrug}">全部送药</a></td></tr>
	  		</c:if>		
    </table>
    </div>
    <script type="text/javascript">
    	document.getElementById("inputDate").value=today();
    </script>
  </body>
</html>
