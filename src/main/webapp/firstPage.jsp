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
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/firstPage.css" />
<script src="js/index.js" type="text/javascript"></script> 
<body>
	<div class="library">
		<div class="left">
			<div class="left_top">
				<div class="left_top_left">
					<span>通知公告:</span> <a href="#">星星市第四届少儿故事大王比赛方案</a>
				</div>
				<div class="left_top_right">
					<button data-toggle="modal" data-target="#myModal">登录</button>
					<a href="regiest.jsp">注册</a> <a
						href="${APP_PATH }/MyLibrary/showPage">个人图书馆</a> <a
						href="${APP_PATH }/LibraryMessages/showPage">星星之窗</a>
				</div>
			</div>
			<div class="left_center">
				<div class="left_center_content">
					<h2>星星图书馆</h2>
					<div class="left_center_content_form">
						<form action="${APP_PATH }/BookSearch/listAll" method="get">
							<span>图书搜索:</span><input type="text" name="bookName" id="bookName" />
							<input class="submit1" type="submit" value="搜索" />
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="right">
			<h2>星星图书馆</h2>
			<a href="${APP_PATH }/LibraryMessages/showPage">所有图书</a>
			<a href="${APP_PATH }/MyLibrary/showPage">个人图书</a>
			<a href="${APP_PATH }/shoppingCart/showPage">我的购物车</a>
			<a href="#">资源搜索</a>
			<a href="#">电子资源</a>
			<a href="#">读者服务</a>
			<a href="${APP_PATH }/quitLogin.jsp">退出登录</a>
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">登录界面</h4>
				</div>
				<form action="">
		账号:<input type="text" name="userName" class="userName"><span class="userName_tips" style="color: red"></span><br>
	        密码:<input type="password"name="password" class="password"><span class="password_tips" style="color: red"></span><br>
			<span class="error_messages" style="color: red"></span><br>
		<button type="button" class="submit" id="btn-login">登录</button>
	</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

</body>
</html>