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
    
    <title>My JSP 'bingAnShi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/top.css">
	<link rel="stylesheet" type="text/css" href="css/row.css">
	<style type="text/css">
		.row #pno{
			height: 27px;
			width: 80px;
			font-size: 18px;
		}
		.rowAll{
			width:80%;
			border:1px solid gray;
			margin: 0 auto;
		}
		.rowAll h2{
			text-align: center;
			margin: 20px 0;
		}
		.row0{	
			margin-left:60px;					
			height: 40px;
		}
		.rowBottom{
			height: 40px;
			text-align: center;
		}
		
	</style>
	<script type="text/javascript">
	 function  checkPno() {
			var val = $("#pno").val();
			if(val.match("^[0-9]*[1-9][0-9]*$")){
				window.open("SelectFeeAndDesc?pno="+val,"main","");
				return true;
			}else{			
				return false;
			}
		 }
	
	</script>
	<script type="text/javascript">
  function print1(){
	  bdhtml=window.document.body.innerHTML;
	  sprnstr="<!--startprint-->";
	  eprnstr="<!--endprint-->";
	  prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17);
	  prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
	  window.document.body.innerHTML=prnhtml;
	  window.print();
  }
  </script>

  </head>
  
  <body>
  <div class="top">城　乡　医　院　住　院　部</div>
  <div class="row" style="text-align: center;">
  		输入患者住院号：<input type="text" name="pno" id="pno" value="${oneBingLi.pno}"/> 
  		<button type="button" onclick="checkPno()">查询</button>
  </div>
  
  <c:if test="${!empty oneBingLi}">
  <input type="hidden" id="desc" value="${oneBingLi.desc}" /> 
  <!--startprint-->
  <div class="rowAll">
  <h2>诊断证明</h2>
  <div class="row0">
  患者姓名：${oneBingLi.name}　　 性别：${oneBingLi.sex}　　患者年龄：${oneBingLi.age}　　诊断结果：${oneBingLi.bing}
 　　 消费总金额：￥<font size="5" color="red">${oneBingLi.money}</font>
  </div> 
  	<script type="text/javascript">
  		var s = new Array();
  		s = $("#desc").val().split("　　　　　");
  		for ( var a in s) {
  			document.write("<div class='row0'>"+s[a]+"</div>");
		}
  	</script>
   <!--endprint--> 
   <div class="rowBottom">
   <button type="button" onclick="print1()">打印</button>
   </div>
  </div>
  </c:if>

  </body>
  
 
</html>
