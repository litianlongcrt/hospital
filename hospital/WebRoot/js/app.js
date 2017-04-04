/**
 * 选择器的使用
 * 1、全部选择 *
 * 2、元素  span
 * 3、ID #id
 * 4、类选择 .class
 * 5、选择多个  用逗号隔开
 */
$(this).ready(function(){
	$("div p").click(function(){
		alert("您点击了laber")
	});
});
