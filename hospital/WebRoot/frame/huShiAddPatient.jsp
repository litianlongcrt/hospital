<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String d = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'huShiAddPatient.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/top.css">
	
	<script type="text/javascript">
		function getRandomBno() {
			var bnos = new Array();   
			bnos = "${bnos}".replace('[','').replace(']','').split(',');
			document.getElementById("bno").value=(""+bnos[Math.floor(Math.random()*(bnos.length))]).replace(" ","");
		}
		function checkInfoHasEmpty() {
			if(document.getElementById("name").value==""||
					document.getElementById("age").value==""||
					document.getElementById("address").value==""||
					document.getElementById("tel").value==""||
					document.getElementById("bing").value==""||
					document.getElementById("time").value==""||
					document.getElementById("bno").value==""
					){
				alert("信息填写不完整！！！");
				return false;
			}else{
				return true;
			}
			
		}
	</script>
	
  </head>
  
  <body>
  <div class="top">城　乡　医　院　住　院　部</div>
 <div style="width: 600px; margin: 50 auto;">
 	<div style="margin-left: 60px">
 		<h3>增　　加　　病　　人</h3>
 	</div>
 	<div>
    <form action="AddPatient" method="post" onsubmit="return checkInfoHasEmpty()">
    	姓　　名：<input type="text" name="name" id="name"/><br/>
    	性　　别：<input type="radio" name="sex" value="男" checked="checked"/>男
    		    <input type="radio" name="sex" value="女"/>女<br/>
    	年　　龄：<input type="text" name="age" id="age"/><br/>
    	住　　址：<input type="text" name="address" id="address"/><br/>
    	电　　话：<input type="text" name="tel" id="tel"/><br/>
    	病　　因：<input type="text" name="bing" id="bing"/><br/>
    	住院时间：<input type="text" name="time" value="<%=d%>" id="time"/><br/>
    	床　　位：<input type="text" name="bno" id="bno" readonly="readonly"/><button type="button" onclick="getRandomBno()">床位安排</button><br/>
    	<input type="hidden" name="sno" value="${staff.sno}" />
    	<input type="submit" value="添加" /><br/>
    </form>
    </div>
 	</div>
 </body>
 
</html>
