<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		*{
			margin: 0px ;
			padding:0px;
		}
		a{
			text-decoration: none;
		}
		.diva{
			padding:5px 10px ;
		}
		.div6{
			padding:5px 10px ;
		}
		.div11 .div12{
			margin-left: 30px;
			font-size: 5px;
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
		function yuzhang(){
			window.open("frame/other.jsp","main",'');
			$(".div01").toggle();		
		}
		function yiyuan() {	
			window.open("frame/patients.jsp","main",'');
			$(".div11").toggle();
			$(".div12").toggle();
		}
		function hushi() {
			window.open("frame/hushi.jsp","main",'');
			$(".div21").toggle();
			$(".div22").toggle();
			$(".div23").toggle();
		} 
		
		function yaofangBu() {
			window.open("frame/yaofang.jsp","main",'');
			$(".div31").toggle();
			$(".div32").toggle();
		}
		function feiyong(){
			window.open("frame/feiyong.jsp","main",'');
			$(".div41").toggle();
			$(".div42").toggle();
			$(".div43").toggle();
			$(".div44").toggle();
		}
		
	</script>
	<script type="text/javascript">
		function addPatient() {
			window.open("HuShiAddPatientJSP",'main','');
		}
		function selectEmptyBed() {
			window.open("EmptyBedServlet",'main','');			
		}
		function selectAllMakeDrug() {
			//window.open("TodayAllDrug?date=2017-02-18",'main','');
			window.open("TodayAllDrug",'main','');
		}
		function getDrugByPno() {
			window.open("frame/yaofang.jsp",'main','');
		}
		//护士对于病人药物费用查询
		function selectDrugFee(){
			window.open("SelectDrugFeeMenuByPno",'main','');
		}
		
		//欠费查询
		function selectNoMoney(){
			window.open("NoMoney",'main','');	
		}
		//个人账单
		function selectMoneyMenu() {
			window.open("MoneyMenu",'main','');
		}
		//结账
		function selectMoneyByPno() {
			window.open("SelectMoneyByPno",'main','');
		}
		//个人缴费
		function selectAddMoneyByPno() {
			window.open("AddMoneyByPno",'main','');
		}
		//doctorAddPatient
		function doctorAddPatient() {
			window.open("DoctorAddPatientDiv",'main','');
		}
		//软件描述
		function softDesc() {
			window.open("frame/softDesc.jsp","main",'');
		}
		//病案室
		function binganshi() {
			window.open("frame/bingAnShi.jsp","main",'');
		}
		//
		function yuZhangAddStaff() {
			window.open("frame/other.jsp","main",'');
		}
	</script>
  </head>
  
  <body>
  	<div class="diva div0">
    	<a href="javascript:void(0)" target="main" onclick="yuzhang()">院长管理</a>   
		<div class="diva div01"><button type="button" onclick="yuZhangAddStaff()">增加员工</button> </div>	  			  
    </div>
    <div class="diva div1" id="d1">
    	<a href="javascript:void(0)" target="main" onclick="yiyuan()">医生管理</a>   
		<div class="diva div11"><button type="button" onclick="doctorAddPatient()">增加病人</button> </div>	  			  
    </div>
    <div class="diva div2"><a href="javascript:void(0)" target="main" onclick="hushi()">护士管理</a>   
    	<div class="diva div21"><button type="button" onclick="addPatient()">增加病人</button> </div>	  
		<div class="diva div22"><button type="button" onclick="selectEmptyBed()">空床查询</button> </div>	 
		<div class="diva div23"><button type="button" onclick="selectDrugFee()">患者费用查询</button> </div>	
    </div>
    <div class="diva div3"><a href="javascript:void(0)" target="main" onclick="yaofangBu()">药房管理</a>   
    	<div class="diva div31"><button type="button" onclick="selectAllMakeDrug()">所有患者用药查询</button> </div>	  
		<div class="diva div32"><button type="button" onclick="getDrugByPno()">患者药物查询</button></div>	
    </div>
    <div class="diva div4"><a href="javascript:void(0)" target="main" onclick="feiyong()">费用管理</a>   
    	<div class="diva div41"><button type="button" onclick="selectNoMoney()">欠费查询</button></div>	  
		<div class="diva div42"><button type="button" onclick="selectMoneyMenu()">费用统计</button></div> 
		<div class="diva div43"><button type="button" onclick="selectMoneyByPno()">个人费用</button></div> 
		<div class="diva div44"><button type="button" onclick="selectAddMoneyByPno()">个人缴费</button></div>
    </div>
    <div class="diva div5"><a href="javascript:void(0)" target="main" onclick="binganshi()">病案室管理</a>   </div>
    <div class="div6"><a href="javascript:void(0)" target="main" onclick="softDesc()">软件介绍</a>   </div>
  
  </body>
  <script type="text/javascript">
		if("${staff.jobCode}" == "1001"){
			$(".diva").hide();
			$(".div0").show();
		}
		if("${staff.jobCode}" == "2001"){
			$(".diva").hide();
		}
		if("${staff.jobCode}" == "3001"){
			$(".diva").hide();
			$(".div1").show();		
		}
		if("${staff.jobCode}" == "4001"){
			$(".diva").hide();
			$(".div2").show();
		}
		if("${staff.jobCode}" == "5001"){
			$(".diva").hide();
			$(".div3").show();
		}
		if("${staff.jobCode}" == "6001"){
			$(".diva").hide();
			$(".div4").show();
		}
		if("${staff.jobCode}" == "7001"){
			$(".diva").hide();
			$(".div5").show();		
		}
	</script>
</html>
