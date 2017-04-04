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
    
    <title>My JSP 'caiwu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/top.css">
	<link rel="stylesheet" type="text/css" href="css/row.css">
	<script type="text/javascript">	
		 function  checkPno() {
			var val = $("#pno").val();
			if(val.match("^[0-9]*[1-9][0-9]*$")){
				return true;
			}else{			
				return false;
			}
		 }
		 
		 function checkInfo(){
			 var pno = $("#addPno").val();
			 var money = $("#money").val();
				if(pno.match("^[0-9]*[1-9][0-9]*$")&&money.match("^[0-9]*[1-9][0-9]*$")){
					$("#submit").removeAttr("disabled");
					$("#submit").css("background-color","#008B8B");
					
					return true;
				}else{					
					return false;
				}
		 }
		 //0 96 48
		 //1 97 49
		 //9 105 57
		 
		 function writeToSureMoney(){
			var money = $("#money").val();
			var pno = $("#addPno").val();
			if(pno.match("^[0-9]*[1-9][0-9]*$")&&money.match("^[0-9]*[1-9][0-9]*$")){
				$("#submit").removeAttr("disabled");
				$("#submit").css("background-color","#008B8B");
			}
			$(document).keyup(function(e){
			     var key =  e.which;
			     if(key==48||key==96) key=0;
			     if(key==49||key==97) key=1;
			     if(key==50||key==98) key=2;
			     if(key==51||key==99) key=3;
			     if(key==52||key==100) key=4;
			     if(key==53||key==101) key=5;
			     if(key==54||key==102) key=6;
			     if(key==55||key==103) key=7;
			     if(key==56||key==104) key=8;
			     if(key==57||key==105) key=9;			    
			     $("#sureMoney").html(money*10+key);
			     if(key==8) {
			    	 money = $("#money").val();
			    	 if(money=="") $("#sureMoney").html(0);
			    	 else $("#sureMoney").html(money);
			    }
			  });
			
		 }

	</script>
	<style type="text/css">
		.ColRed{
			color: red;
		}
		.ColGreen{
			color: green;
		}
		.col5{
			height: 40px;
			line-height: 40px;
			text-align: center;
			border: 2px solid gray;
			clear: both;
		}
		
		.col2{
			width: 50%;
			height: 40px;
			float:left;
			line-height: 40px;
			text-align: center;
			
		}
		input{
			height: 28px;
			width: 80px;
			font-size: large;
			color: red;
		}
		.sureMoney{
			color: red;
			font-size: 20px;
		}
		.col font{
			font-size: 20px;
		}	
		a{
			text-decoration: none;
		}
		a:HOVER {
			color: green;
			font-weight: bolder;
		}
	</style>
  	</head>
  	
  <body >
  <div class="top">城　乡　医　院　住　院　部</div>
  <div class="col5">
  姓名：${staff.name}　　性别：${staff.sex}　　单位：${staff.jobName}
  </div>
  <br>
 <c:if test="${!empty CheckOutForMoneyServlet}">
   <div style="text-align: center; font-size: 20px; color: red;">
   	${CheckOutForMoneyServlet}
   </div>
 </c:if>
  <c:if test="${!empty noMoneyFees || fn:length(noMoneyFees) != 0}">
  	 
	  <div class="row topRow1">
		<div class="col">住院号</div> 
		<div class="col">患者姓名</div>  
		<div class="col">住院缴费</div>  
		<div class="col">住院费用</div>
		<div class="col">费用结算</div>   		
	  </div>
	  <div class="col5 topRow">正在统计，请稍等．．． <img src="img/loading.gif"/></div>
	  <c:forEach items="${noMoneyFees}" var="item" varStatus="status">
		   <div class="row">
			<div class="col">${item.pno}</div> 
			<div class="col">${item.name}</div>  
			<div class="col">￥<font color="green">${item.jiaofei}</font></div>  
			<div class="col">￥<font color="red">${item.feiyong}</font></div>			
			<div class="col">￥<font color="red">${item.jieyu}</font></div>   		
		  </div>
	  </c:forEach>
	 <c:if test="${empty noMoneyFees || fn:length(noMoneyFees) == 0}">
	 	<div class="row">
			<div class="col5">目前没有患者欠费！</div> 		  		
	  	</div>
	 </c:if>
    </c:if>   
    <c:if test="${!empty moneyMenu || fn:length(moneyMenu) != 0}">
	  <div class="row topRow1">
		<div class="col">住院号</div> 
		<div class="col">患者姓名</div>  
		<div class="col">住院缴费</div>  
		<div class="col">住院费用</div>
		<div class="col">费用结算</div>   		
	  </div>
	  <div class="col5 topRow">正在统计，请稍等．．． <img src="img/loading.gif"/></div>
	  <c:forEach items="${moneyMenu}" var="item" varStatus="status">
		   <div class="row">
			<div class="col">${item.pno}</div> 
			<div class="col">${item.name}</div>  
			<div class="col">￥<font color="green">${item.jiaofei}</font></div>  
			<div class="col">￥<font color="red">${item.feiyong}</font></div>
			<div class="col">￥			
			  <script type="text/javascript">
					if("${item.jieyu}".substring(0,1)=="-"){
						document.write("<font color='red'>${item.jieyu}</font>");		
					}else{
						document.write("<font color='green'>${item.jieyu}</font>");
					}			
				</script>
   			</div>
			
		  </div>
	  </c:forEach>	 
    </c:if>
    
    <c:if test="${!empty MoneyByPnoServlet || fn:length(MoneyByPnoServlet) != 0}">
		<div class="row topRow1">
			<div class="col5">
				<form action="SelectMoneyByPno" method="post" onsubmit="return checkPno()">
					请输入患者住院号：<input type="text" name="pno" id="pno" value="${MoneyByOne.pno}">
					<input type="submit" value="查询" />
				</form>	
			</div>
		</div>
		
		<div>
			<c:choose>			
			<c:when test="${!empty MoneyByOne}">
				<div class="row">
					<div class="col">住院号</div> 
					<div class="col">患者姓名</div>  
					<div class="col">住院缴费</div>  
					<div class="col">住院费用</div>
					<div class="col">费用结算</div>   		
				</div>
				<div class="col5 topRow">正在统计，请稍等．．． <img src="img/loading.gif"/></div>
				<div class="row">
				<div class="col">${MoneyByOne.pno}</div> 
					<div class="col">${MoneyByOne.name}</div>  
					<div class="col">￥<font color="green">${MoneyByOne.jiaofei}</font></div>  
					<div class="col">￥<font color="red">${MoneyByOne.feiyong}</font></div>
					<div class="col">￥			
					  <script type="text/javascript">
							if("${item.jieyu}".substring(0,1)=="-"){
								document.write("<font color='red'>${MoneyByOne.jieyu}</font>");		
							}else{
								document.write("<font color='green'>${MoneyByOne.jieyu}</font>");
							}			
						</script>
		   			</div>
		   			
   				</div>
   				<div class="row">
   					<div class="col2" style="float: right;"><font size="5" color="green">
   						<a href="CheckOutForMoney?money=${MoneyByOne.jieyu}&pno=${MoneyByOne.pno}">结账出院</a></font>
   					</div>
   				</div>
   				
			</c:when>			
			<c:otherwise>	
				<div class="topRow2">																
					<div class="col5">
						<font color='red'>没有要查询的患者，或者该患者已经出院，不能查到结果！</font>
					</div>					
				</div>
			</c:otherwise>
			</c:choose>
		</div>
    </c:if>
    <c:if test="${!empty SelectMoneyByPno}">
    	<div class="topRow1 row">
    		<form action="AddMoneyByPno" method="post" onsubmit="return checkInfo()">
    			<div class="col2">
    				患者住院号：<input type="text" name="addPno" id="addPno">
    			</div>
    			<div class="col2">
    				缴费金额：<input type="text" name="money" id="money" onkeydown="writeToSureMoney()" onchange="checkInfo()">
    			</div>
    			<div class="col5">
	    			<div class="col2">
	    				￥ <span id="sureMoney" class="sureMoney">0</span><span class="sureMoney">.00</span> 元
	    			</div>
	    			<div class="col2">
	    				<button type="submit" id="submit" style="background-color: gray; font-size:x-large;" disabled="disabled">确定</button>
	    			</div>   				
    			</div>
    		</form>
    	</div>    	
    </c:if>
    <c:if test="${!empty AddMoneySuccess}">
    <div class="row">
    	<div class="col5" style="color: red; font-size: 20px;font-weight: 900;">缴费押金成功</div>
    </div>
    </c:if>
    <script type="text/javascript">
   	 	$(".row").hide();
   	 	$(".topRow1").show();
	    window.setTimeout(show,1000); 
	    function show() 
	    { 
	    	$(".topRow").hide();
	    	$(".row").show();
	    }
	   
    </script>
  </body>
  
</html>
