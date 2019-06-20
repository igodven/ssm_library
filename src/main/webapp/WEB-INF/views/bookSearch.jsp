<%@page
	import="org.apache.taglibs.standard.lang.jstl.test.PageContextImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style type="text/css">
body,html{
	margin:0px;
	padding:0px;
}
.link{
width:60px;
}
</style>
</head>
<body>
<h2 style="color:pink;">搜索到的图书:</h2>
	<table border="1px"  cellspacing="0px" >
		<tr>
			<th>图片</th>
			<th>书名</th>
			<th>作者</th>
			<th>ISBN</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${bookAll }" var="book">
			<tr>
				<td><img src="${book.imageadress }"></td>
				<td>${book.bookname }</td>
				<td>${book.author }</td>
				<td>${book.isbn}</td>
				<td class="link"><a href="${APP_PATH }/MyLibrary/shoppingBook?id=${book.id}">购买</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>