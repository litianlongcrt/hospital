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
	<link rel="stylesheet" type="text/css" href="css/row.css">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	
	<script type="text/javascript">
	 	function  checkPno() {
			var val = $("#pno").val();
			if(val.match("^[0-9]*[1-9][0-9]*$")){
				return true;
			}else{			
				return false;
			}
		 }
	</script>
	<style type="text/css">
	.topRow2{
			width: 80%;
			text-align:center;
			border: 1px solid gray;
			margin: 1 auto;
			clear: both;
			height: 40px;
			line-height: 40px;
	}
	.col2{
			width: 50%;
			height: 40px;
			float:left;
			line-height: 40px;
			text-align: center;
			
		}
		.row .col5 #pno{
			width: 80px;
			height: 27px;
			font-size: large;
			color: red;
		}
		.noRow{
			width: 80%;
			text-align:center;
			border: 1px solid gray;
			margin: 1 auto;
			clear: both;
			height: 40px;
			line-height: 40px;
		}
		.cright{
			float: right;
			margin-right: 38px;
		}
		
		.ssy{
			display:block;
			margin-right: 45px;
		}
	</style>
  </head>
  
  <body>
  <div class="top">城　乡　医　院　住　院　部</div>
  <%
  if(staff!=null){
	%>	
	<c:if test="${!empty SelectMakeDrugMenu}">
	<div class="row topRow1">		
		<div class="col5">
			<form action="SelectDrugFeeMenuByPno" method="post" onsubmit="return checkPno()">
				请输入患者住院号：<input type="text" name="pno" id="pno" value="${detailFee.incomes[0].pno}">
				<input type="submit" value="查询" />
			</form>	
		</div>				
	</div>
	<c:if test="${!empty detailFee}">
	<div class="topRow2">正在统计，请稍等．．． <img src="img/loading.gif"/></div>						
	<div class="row">
			<div class="col">患者住院号</div>
			<div class="col">患者姓名</div>
			<div class="col">患者缴费次数</div>
			<div class="col">患者缴费时间</div>
			<div class="col">患者缴费金额</div>
		<c:if test="${fn:length(detailFee.incomes)!=0}">
			<c:forEach items="${detailFee.incomes}" var="item" varStatus="i">
				<div class="col">${item.pno}</div>
				<div class="col">${item.pname}</div>
				<div class="col">第 ${i.count} 次</div>
				<div class="col">${item.date}</div>
				<div class="col">￥<font size="5" color="green" class="oneMoney">${item.money}</font></div>
			</c:forEach>
		</c:if>
			<div class="col5">
				<div class="cright">
					押金：<font size="5" color="red">${fn:length(detailFee.incomes)}</font> 次
					　　　共计：￥<font size="5" color="green" id="allMoney">${allMoney}</font>
					<script type="text/javascript">
						var allMoney = 0;
						$(".oneMoney").each(function(){
							allMoney+=parseFloat($(this).html().replace(",",""));
						});						
						$("#allMoney").html(allMoney+".00");
					</script>
				</div>	
			</div>
		</div>
		</c:if>
		<c:if test="${fn:length(detailFee.expenses)!=0}">
		<div class="row">
			<div class="col">药品名称</div>
			<div class="col">药品单价</div>
			<div class="col">用药数量</div>
			<div class="col">用药时间</div>
			<div class="col">费用</div>			
		</div>
		<c:forEach items="${detailFee.expenses}" var="expense" varStatus="status">
		<div class="row">
			<div class="col">${expense.dname}</div>
			<div class="col">${expense.price}</div>
			<div class="col">${expense.count}</div>
			<div class="col">${expense.date}</div>
			<div class="col">￥<font size="5" color="red" class="expenseMoney">${expense.money}</font>
			
			</div>			
		</div>
		</c:forEach>
		<div class="row">
			<div style="float: right; margin-right:45px; ">
			共计：￥<font id="expenseAllMoney" size="5" color="red"></font>						
			</div>
			<div style="clear: both;float: right;">
			<span class="ssy">剩余：￥ <font class="sy" id="sy" size="5" color="green"></font></span>
			</div>
			<script type="text/javascript">
						var allMoney = 0;
						$(".expenseMoney").each(function(){
							allMoney+=parseFloat($(this).html().replace(",",""));
						});						
						$("#expenseAllMoney").html(allMoney);
			</script>
			<script type="text/javascript">
				$("#sy").html(($("#allMoney").html()-$("#expenseAllMoney").html()).toFixed(2));
				if($("#sy").html().substring(0,1)=="-"){
					$("#sy").attr("color","red");
				}
			</script>
			
		</div>			
		</c:if>
		<c:if test="${fn:length(detailFee.expenses)==0 && fn:length(detailFee.incomes)==0}">
			<div class="noRow">
					<font color="red" size="5px;">没有查到结果！</font>
			</div>
		</c:if>	
	</c:if>
	
	
  
	<%
  }else{
	  %>
	  <jsp:forward page="index.jsp"></jsp:forward>
	  <%
  }
  %>
  <script type="text/javascript">
	  $(".row").hide();
	  $(".topRow2").show();	 
	  window.setTimeout(show,1000); 
	  function show() 
	  { 
	  	$(".topRow2").hide();
	  	$(".row").show();
	  }	
	  $(".topRow1").show();
	   
  </script>
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
