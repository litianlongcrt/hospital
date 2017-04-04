<%@ page language="java" import="java.util.*,crt.bean.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addDrug.jsp' starting page</title>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="css/top.css">
     <link rel="stylesheet" type="text/css" href="css/row.css">
    <style type="text/css">
    *{
    margin: 0px;
    padding: 0px;
    }
    	.div0{ 		
    		margin: 0 auto;
    		border: 1px solid gray;
    		clear: both;
    		height: 30px;
    		
    	}
    	.div0 div{
    		width: 18%;
    		float: left;
    		border: 1px solid gray;
    		text-align: center;
    	}
    	.div0 div input, #date1, .option{
    		width: 100px;
			height: 27px;
			font-size: large;
			
    	}
    	.div00{
    		width: 150px;
    		height: 27px;
    	}
    	.table1 td{
    		width: 20%;
    	}
    	.bt{
    		width: 500px;
    	}
    </style>
    <script type="text/javascript"> 
		function today(){ 
		    var today=new Date(); 
		    var h=today.getFullYear(); 
		    var m=today.getMonth()+1; 
		    var d=today.getDate();
		    if(m<10) m = "0"+m;
		    if(d<10) d = "0"+d;
		    return h+"-"+m+"-"+d; 
		}
		function getToday(obj){
			obj.value = today();
		}
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
		function getTomorrow(obj){
			obj.value = tomorroy();
		}
		
	</script> 
    
    <script type="text/javascript">
    	var index = 1;
		function addDiv(){
			var to = tomorroy();
			var div = "<div class='div0 div"+index++ +"'><div><input type='text' name='dno'></div><div><input type='text' name='dname' class='dname'></div><div><select name=count class='option'><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option></select></div><div><input type='text' name='date' value='"+to+"' onfocus='getTomorrow(this)'/></div><div><button type='button' onclick='addDiv()'>添加</button></div></div>";
			$(".form_all").append(div);
		}
		</script>
	<script type="text/javascript">
		function checkInfo() {
			if(document.getElementById("dno1").value==""){
				return false;
			}else{
				true;
			}
		}
	</script>

  </head>
  <body>
  <div class="top">城　乡　医　院　住　院　部</div>
  <div>
  	<%
  		String d = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
  	%>

	  <div class="row" style="margin: 0 auto;width: 70%;text-align: center;">
	  	患者姓名：${sessionScope.patient.name}　　　性别：${sessionScope.patient.sex}　　　　年龄：${sessionScope.patient.age}	  	
	  </div>
	  <div style="text-align: center; width: 70%; margin: 0px auto; border: 1px solid gray;">
		  	<form action="SelectMakeDrugByPnoAndDate" method="post">
			  	<input type="text" name="date" value="<%=d%>" id="date1" onfocus="getTomorrow(this)"/>
			  	<input type="hidden" name="pno" value="${patient.pno}">
			  	<input type="submit" value="查询"/>
		  	</form>
		  	<%
		  		List<MakeDrug> mds = (List<MakeDrug>)request.getAttribute("SelectMakeDrugByPnoAndDate");
		  		if(mds!=null&&mds.size()!=0){	
		  			%>
		  				<div class="table1">
		  				<table border="1">
		  					<tr><td>药品名称</td><td>药品数量</td><td>开药时间</td><td>用药时间</td><td>药品是否已送</td><td></td></tr>
		  					<%
		  					Iterator<MakeDrug> it = mds.iterator();
				  			while(it.hasNext()) {
				  				MakeDrug md = it.next();
				  				%>
				  				<tr><td><%=md.getDname() %></td><td><%=md.getCount() %></td><td><%=md.getMakeDrugDate() %></td><td><%=md.getUseDrugDate() %></td><td><%=md.getSend() %></td></tr>			
				  				<%
				  			}	  			
				  			%>
				  			</table>
		  				</div>
		  			<%
		  			
		  		}else{
		  			%>
		  			<div class="table1">
	  				<table border="1">
	  					<tr><td>药品名称</td><td>药品数量</td><td>开药时间</td><td>用药时间</td><td>药品是否已送</td><td></td></tr>
	  					<tr><td colspan="6" style="text-align: center;">没有要查询的药品</td></tr>
	  				</table>
	  					<%
		  		}
		  	%>
	  </div>
	  </div>
	  
	<div style="text-align: center; width: 70%; margin: 30px auto; border: 1px solid gray;">
	  	<form action="SureAddDrug" method="post" onsubmit="return checkInfo()">
		  	<div class="form_all">
		  		<div style="text-align: center;">${makeDrug}</div>
		  		<div class="div0"><div class="div00">药　品　　ID</div><div class="div00">药　品　名　称</div><div class="div00">药　品　数　量</div><div class="div00">用　药　时　间</div><div class="div00">操　　　　　　作</div></div>
		  		<div class="div0"><div><input type="text" name="dno" id="dno1"></div>
		  						  <div><input type="text" name="dname" class="dname"></div>	  						 
		  						  <div><select name="count" class="option">
					  						<option value="1">1</option>
					  						<option value="2">2</option>
					  						<option value="3">3</option>
					  						<option value="4">4</option>
					  						<option value="5">5</option>
					  						<option value="6">6</option>	  						
				  						</select>
				  				  </div>
				  				  <div><input type="text" name="date" value="<%=d%>" id="date2" onfocus="getTomorrow(this)"/></div>
				  				  <div class="bt"><button type="button" onclick="addDiv()">添加</button></div>
			   </div>
		  	   
		  	</div>
		  	<div class="div0">
		  		<input type="hidden" name="sno" value="${staff.sno}">
		  		<input type="hidden" name="pno" value="${patient.pno}">
		  		<input type="hidden" name="patient" value="${patient}">
		  								<input type="submit" value="确定开药">
		  	   </div>
	  							
	</form>
	<script type="text/javascript">
		getTomorrow(document.getElementById("date1"));
		getTomorrow(document.getElementById("date2"));
	</script>
	</div>
	</div>
  </body>
</html>
