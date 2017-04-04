<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <div>
    	<form action="Login" method="post">
    		<label>工　号：</label><input type="text" name="sno" value="20160004"/>　${loginMsg}<br/>
    		<label>密　码：</label><input type="password" name="pwd" value="123456" /><br/>
    		<label>服务器：</label><select>
    				<option selected="selected">127.0.0.1</option>
    				<option>localhoat</option>
    			  </select><br/>
    		<input type="reset" value="重置" />
    		<input type="submit" value="登录" /><br/>
    	</form>
    </div>
  </body>
</html>
