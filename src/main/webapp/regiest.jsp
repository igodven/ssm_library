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
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/bootstrap-3.3.7-dist/js/bootstrap.min.js" />
<script src="${APP_PATH}/js/jquery-1.12.4.min.js" type="text/javascript"
	charset="utf-8"></script>
	
<style type="text/css">
body, html {
	margin: 0px;
	padding: 0px;
	font-size: 20px;
}

input {
	display: inline-block;
	width: 250px;
	height: 30px;
	margin-bottom: 10px;
}

.submit {
	width: 60px;
	height: 30px;
	background-color: indianred;
	border: none;
	cursor: pointer;
	color: white;
	margin-left: 280px;
	opacity: 1;
}

.submit:hover {
	opacity: 0.7;
}
</style>
<script type="text/javascript">
	
	$(function(){
		
		$(".submit").click(function(){
			
			//把以前的错误信息清空
			$(".checkname").text("");
			$(".checkpassword").text("");
			$(".checkphone").text("");
			$(".checkemail").text("");
			var username=$(".username").val();
			var password=$(".password").val();
			var confirmPassword=$(".confirmPassword").val();
			var phone=$(".phone").val();
			var email=$(".email").val();
			var adress=$(".adress").val();
			
			//检验注册的信息是否合理
			//账号的检测
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			//邮箱的检测
			var regEmail=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			//手机号码的检测
			var regPhone=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
			if(!regName.exec(username)||username==""){
				$(".checkname").text("请输入正确的姓名!他可以包括2-5个汉字或者6-16个任意字符,并且姓名不能为空");
				return false;
			}
			if(password!=confirmPassword||password==""){
				$(".checkpassword").text("两次输入的密码不一致,请重新输入,并且密码不能为空");
				return false;
			}
			if(!regPhone.exec(phone)){
				$(".checkphone").text("请输入正确的电话号码!");
				return false;
			}
			if(!regEmail.exec(email)||email==""){
				$(".checkemail").text("请输入正确的邮箱的格式,并且不能为空!");
				return false;
			}
			$.ajax({
				url:"${APP_PATH}/regiest/saveUserMessage",
				type:"post",
				data:$("form").serialize(),
				success:function(result){
					if(result.state==1){
						alert("注册成功!");
						//注册成功后应该弹到主界面
						
					}else{
						$(".checkname").text("这个账号已经被注册!");
					}
				}
			});	
		});
	})
</script>
<body>
<h2>账户注册表</h2>
		<form action="">
			姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:
			<input type="text" name="username" placeholder="请填写真实姓名"  class="username"/>
			<span class="checkname" style="color:red;"></span>
			<br />
			密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:
			<input type="password" name="password" placeholder="设置密码" class="password"/>
			<br />
			确认密码:
			<input type="password" name="confirmPassword" placeholder="请再次输入你的密码" class="confirmPassword" />
			<span class="checkpassword" style="color:red;"></span>
			<br />
			电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:
			<input type="number" name="phone" placeholder="输入你的手机号码" class="phone" />
			<span class="checkphone"  style="color:red;"></span>
			<br />
			邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:
			<input type="email" name="email" placeholder="请输入你的邮箱账号" class="email" />
			<span class="checkemail"  style="color:red;"></span>
			<br />
			地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:
			<input type="text" name="adress" placeholder="请输入你的住址信息" class="adress"/>
			<span class="checkadress" style="color:red;"></span>
			<br />
			<button type="button" class="submit">注册</button>
		</form>
</body>
</html>