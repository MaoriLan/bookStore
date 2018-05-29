<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  		<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
		<script>
			$(function(){
				$("#bbb").validate({
					rules:{
						username:{
							required:true,
							minlength:3,
							/* digits:true */
						},
						password:{
							required:true,
							minlength:5
						},
						repassword:{
							required:true,
							equalTo:"[name='password']"
						},
						email:{
							required:true,
							email:true
						},
						sex:{
							required:true
						}
					},
					messages:{
						username:{
							required:"请输入用户名!",
							minlength:"输入长度至少为3位!",
							digits:"输入类型为数字!"
						},
						password:{
							required:"请输入密码!",
							minlength:"输入长度至少为5位!"
						},
						repassword:{
							required:"请确认密码!",
							equalTo:"两次密码不一致!"
						},
						email:{
							required:"邮箱不能为空!",
							email:"邮箱格式不正确!"
						},
						sex:{
							required:"请勾选你的性别!"
						}
					},
					errorElement:"label",
					success:function(label){
						label.text(" ").addClass("success");
					}
				});
			});
		</script>
  <script type="text/javascript">
  	 	function search(){
  			document.getElementById("sub1").submit();
  		}
  	 	function getBook(){
  	 		var bookname=$("#bookname").val();
  	 		$.post("${pageContext.request.contextPath}/BookAction_getBookListByBookName",
  	 			   {"bookname":bookname},
  	 			   function(data){
  	 				   var im="";
  	 				   for(var i=0;i<data.length;i++){
  	 					   im+="<a href='${pageContext.request.contextPath}/BookAction_findBookById?bid="+data[i].bid+"'><div>";
  	 					   im+=data[i].bookname;
  	 					   im+="</div></a>";
  	 				   }
  	 				   $("#bookspan").html(im);
  	 			   },
  	 			   "json"
  	 		);
  	 	}
  		function checkUsername(){
  			var username=$("#checkname").val();
  	 		$.post("${pageContext.request.contextPath}/UserAction_checkUsername",{"name":username},
  			function(data) {
  	 			$("#namespan").html(data);
  			}, "json");
  		}
  </script>

  	 <style>
	 	a{
	 		text-decoration:none;
	 		color: black;
	 	}
	 	a:hover{
			color:crimson;
		}
		#d1{
			float:right;
			float:left;
			position:relative;
			
		}
		#d2{
			 width:419px;
			 height:33px;
			 position:absolute;
			 top:0px;
			 left:0px;
		}
		#type1{
			 width:60px;
			 height:33px;
		}
	 </style>
  <body>
  			<tr>
				<td>
					<form action="${pageContext.request.contextPath}/BookAction_getBookByBookName" id="sub1" method="post">
					<table width="100%">
						<tr height="50px">
							<td width="300px"><img src="${pageContext.request.contextPath}/img/icon/logo.jpg" width="250px" height="80px"/></td>
							<td align="center"><div id="d1"><img src="${pageContext.request.contextPath}/img/icon/searctext.gif"/><img src="${pageContext.request.contextPath}/img/icon/search.gif" onclick="search()" id="ss"/><div id="d2"><div><input type="text" placeholder="请输入搜索条件" style="width:419px;height:33px;border:2px solid dodgerblue;" name="bookname" id="bookname" onkeyup="getBook()"/></div><div id="bookspan"></div></div></div></td>
							<s:if test="#session.user==null">
							<td>
								<a href="${pageContext.request.contextPath}/user/login.jsp" style="text-decoration:none;"><strong>[登录]</strong></a>
								<a href="${pageContext.request.contextPath}/user/registe.jsp" style="text-decoration:none;"><strong>[注册]</strong></a>
								<a href="${pageContext.request.contextPath}/OrderAction_getOrderItem"	style="text-decoration:none;"><img src="${pageContext.request.contextPath}/img/icon/cart.jpg" width="40px" height="40px"/></a>
							</td>
							</s:if>
							<s:else>
 							<td>
								<strong><font color="red"><s:property value="#session.user.username"/>欢迎你!</font></strong>
								<a href="${pageContext.request.contextPath}/UserAction_cancelUser" style="text-decoration:none;"><strong>[注销]</strong></a><br/>
								<a href="${pageContext.request.contextPath}/OrderAction_getOrderItem"	style="text-decoration:none;"><img src="${pageContext.request.contextPath}/img/icon/cart.jpg" width="30px" height="30px"/></a>
								<a href="${pageContext.request.contextPath}/OrderAction_getOrderByUid" style="text-decoration:none;"><strong>[我的订单]</strong></a>
							</td>
							</s:else>
						</tr>
					</table>
					</form>
				</td>
			</tr>
			<!--2.导航栏-->
			<tr>
				<td bgcolor="black" height="50px">
					&nbsp;
					<a href="${pageContext.request.contextPath}/BookAction_findIndex"><font color="white" size="5">首页</font></a>&nbsp;&nbsp;&nbsp;
					<s:iterator value="#session.clist" var="c">
					<a href="${pageContext.request.contextPath}/BookAction_findCs?cid=<s:property value="#c.cid"/>"><font color="white"><s:property value="#c.cname"></s:property></font></a>&nbsp;&nbsp;&nbsp;
					</s:iterator>
				</td>
			</tr>
  </body>
</html>
