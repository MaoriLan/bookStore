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
    
    <title>My JSP 'topic1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <style>
	 	a{
	 		text-decoration:none;
	 		color: dimgrey;
	 	}
	 	a:hover{
			color:crimson;
		}
		#div1{
		/* 	border:1px solid red; */
			width:1100px;
		}
		#div2{
		/* 	border:1px solid blue; */
			width:250px;
			height:250px;
			margin-left:10px;
			margin-top:10px;
			float:left;
			text-align:center;
		}
	 </style>
  </head>
  <body>
  	  	<table  width="1100px" align="center" cellspacing="0" cellpadding="0">
			<jsp:include page="main.jsp" flush="true"/>
			<tr height="50px">
				<td>
					<strong>当前路径:&nbsp;>&nbsp;</strong><a href="${pageContext.request.contextPath}/BookAction_findIndex" style="color:black;"><strong>书城首页</strong></a>&nbsp;>&nbsp;二级目录
				</td>
			</tr>
			<tr>
				<td width="10%"><font><a href="${pageContext.request.contextPath}/BookAction_findCs?cid=<s:property value="#session.cid"/>"><strong>全部</strong></a></font>
				<s:iterator value="#session.cslist" var="cs">
				<font><a href="${pageContext.request.contextPath}/BookAction_findBookByCs?csid=<s:property value="#cs.csid"/>"><strong>&nbsp;&nbsp;&nbsp;<s:property value="#cs.csname"/></strong></a></font>
				</s:iterator>
				<br/><hr/>
				</td>
			</tr>
			<tr>
				<td>
					<div id="div1">
					<s:iterator value="#booklist" var="book">
						<div id="div2">
							<a href="${pageContext.request.contextPath}/BookAction_findBookById?bid=<s:property value="#book.bid"/>"><img src="${pageContext.request.contextPath}/<s:property value="#book.picture"/>" width="200px" height="200px"></a><br/>
							<strong><s:property value="#book.bookname"/></strong><br/>
							<font color="red" size="4"><strong>售价:￥<s:property value="#book.bookprice"/></strong></font>
						</div>
					</s:iterator>
					</div>
				</td>
			</tr>
			<jsp:include page="bottom.jsp" flush="true"/>
		</table>
  </body>
</html>
