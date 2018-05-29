<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bottom.jsp' starting page</title>
    
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
  			<tr>
				<td align="center"><img src="${pageContext.request.contextPath}/img/icon/bottom.jpg" width="1100px"/></td>
			</tr>	
			<!--8.友情链接和版权信息-->
			<tr height="30px">
				<td align="center">
					<a href="#" style="text-decoration: none;">关于我们</a>
					<a href="#" style="text-decoration: none;">联系我们</a>
					<a href="#" style="text-decoration: none;">支付方式</a>
					<a href="#" style="text-decoration: none;">配送方式</a>
					<a href="${pageContext.request.contextPath}/manage/login.jsp" style="text-decoration: none;">进入后台</a>
				</td>
			</tr>
			<tr height="50px" style="background-color: black;">
				<td align="center">
					<font color="white">版权所有:安阳工学院A06号楼604实验室程斌著</font><br/>
					<font color="white">豫XXXX号XXX</font>
				</td>
			</tr>
  </body>
</html>
