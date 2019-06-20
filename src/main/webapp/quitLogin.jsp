<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<script type="text/javascript">
	window.onload=function(){
		document.cookie="userName="+"";
		document.cookie="password="+"";
		location.href="${APP_PATH}/firstPage.jsp"
			alert("你已经退出登录!");
	}
</script>
<body>

</body>
</html>