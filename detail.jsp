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
    
    <title>My JSP 'detail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script>
  	function submit(){
  		document.getElementById("form").submit();
  	}
  </script>
  <body>
  	 <form action="${pageContext.request.contextPath}/OrderAction_addToCart?bid=<s:property value="#book.bid"/>" method="post" id="form"> 
  	  <table  width="1100px" align="center" cellspacing="0" cellpadding="0">
			<jsp:include page="main.jsp" flush="true"/>
			<tr height="50px">
				<td>
					<a href="#"  style="color:black;"><strong>商城首页</strong></a>&nbsp;>&nbsp;<a href="#">二级目录</a>&nbsp;>&nbsp;<a href="#">图书详情</a>
				</td>
			</tr>
			<tr align="center">
				<td>
				<table  width="1000px" >
					<tr>
						<td rowspan="7" align="left" width="320px"><img src="${pageContext.request.contextPath}/<s:property value="#book.picture"/>" width="320px"height="300px" id="img"></td>
					</tr>
					<tr height="40px">
						<td><strong><font size="5"><s:property value="#book.bookname"/></font></strong><hr style="height:1px;border:none;border-top:1px dashed #0066CC;" /></td>
					</tr>
					
					<tr height="40px">
						<td><strong>累计销量:</strong><s:property value="#book.salecounts"/></td>
					</tr>
					<tr height="40px">
						<td><strong>作者:</strong><s:property value="#book.author"/></td>
					</tr>
					<tr height="40px">
						<td><strong>售价：</strong><s:property value="#book.bookprice"/>元<br/><hr style="height:1px;border:none;border-top:1px dashed #0066CC;" /></td>
					</tr>
					<tr height="40px">
						<td>
							<strong>数量:</strong>
							<select name="count" style="width:100px;height: 30px;" id="count">
								<option value="0">--请选择--</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>件
						</td>
					</tr>
					<tr height="40px">
						<td><img src="${pageContext.request.contextPath}/img/icon/addToCart.jpg"  id="img" onclick="submit()"></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr align="center">
				<td>
					<table>
						<tr height="60px" style="background-color:lightgray;">
							<td>
								<font size="5"><strong>商品详情</strong></font>
							</td>
						</tr>
						<tr>
							<td><img src="${pageContext.request.contextPath}/<s:property value="#book.introduce"/>" id="img" width="1000px"/></td>
						</tr>
					</table>
				</td>
			</tr>
			<jsp:include page="bottom.jsp" flush="true"/>
		</table>
		</form>
  </body>
</html>
