<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
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
  	<script>
		function init(){
			setInterval("change()",3000);
		}
		var i=1;
		function change(){
			i++;
			document.getElementById("img").src="${pageContext.request.contextPath}/img/top/"+i+".jpg";
			if(i==4){
				i=0;
			}
		}
 
	</script>
  <body onload="init()">
  		<table  width="1100px" align="center" cellspacing="0" cellpadding="0">
			<!--1.logo-->
			<jsp:include page="main.jsp" flush="true"/>
			<!--3.轮播图-->
			<tr>
				<td align="center"><a href="${pageContext.request.contextPath}/BookAction_findBookById?bid=1"><img src="${pageContext.request.contextPath}/img/top/1.jpg" id="img" width="1100px"></a></td>
			</tr>
			<!--4.最新图书-->
			<tr>
				<td>
					<table  width="1100px" cellspacing="0" cellpadding="0">
						<tr height="50px">
							<td colspan="7"><font size="6" color="black"><strong>1F最新图书TOP</strong></font><hr size="4" color="black"/></td>
						</tr>
						<tr align="center">
							<s:iterator value="#newlist" var="book">
							<td><a href="${pageContext.request.contextPath}/BookAction_findBookById?bid=<s:property value="#book.bid"/>"><img src="${pageContext.request.contextPath}/<s:property value="#book.picture"/>" width="230px" height="230px"><br/><br/><strong><s:property value="#book.bookname"/></strong></a></td>
							</s:iterator>
						</tr>
						<tr align="center"  height="80px">
						<s:iterator value="#newlist" var="book">
							<td><font color="red" size="4"><strong>售价:￥<s:property value="#book.bookprice"/></strong></font></td>
						</s:iterator>
						</tr>
					</table>
				</td>
			</tr>
			<!--6.热门商品-->
			<tr>
				<td>
				<table width="1100px" cellspacing="0" cellpadding="0">
					<tr height="50px">
						<td colspan="7"><font size="6" color="black"><strong>2F畅销图书TOP</strong></font>
						<hr size="4" color="black" /></td>
					</tr>
					<tr align="center">
						<s:iterator value="#hotlist" var="book">
							<td><a href="${pageContext.request.contextPath}/BookAction_findBookById?bid=<s:property value="#book.bid"/>"><img
									src="${pageContext.request.contextPath}/<s:property value="#book.picture"/>"
									width="230px" height="230px"><br />
								<br />
								<strong><s:property value="#book.bookname" /></strong></a></td>
						</s:iterator>
					</tr>
					<tr align="center" height="80px">
						<s:iterator value="#hotlist" var="book">
							<td><font color="red" size="4"><strong>售价:￥<s:property
											value="#book.bookprice" /></strong></font></td>
						</s:iterator>
					</tr>
				</table>
			</td>
			</tr>
			<!--7.广告图片-->
			<jsp:include page="bottom.jsp" flush="true"/>
		</table>
  </body>
</html>
