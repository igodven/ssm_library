$(function() {
		$(".submit").click(function() {
			document.cookie="userName="+"";
			document.cookie="password="+"";
			//把以前得出错误信息清空;
			$(".userName_tips").text("");
			$(".password_tips").text("");
			$(".error_messages").text("");
			var userName = $(".userName").val();
			var password = $(".password").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!regName.exec(userName) || userName == "") {
				$(".userName_tips").text("请输入正确的姓名!他可以包括2-5个汉字或者6-16个任意字符");
				return false;
			}
			if (password == "") {
				$(".password_tips").text("密码不能为空");
				return false;
			}
			//判断此用户是否存在于数据库中
			var url = 'login/loginCheck';
			var params = {'userName':userName,'password':password};
			$.post(url,params,function(result){
				if(result.state==1){   //用户校验成功，跳转到主页面
					//把登陆成功的账号信息以cookie的形式保存在页面,随时获取
					document.cookie="userName="+userName;
					document.cookie="password="+password;
					location.href='LibraryMessages/showPage';
				}else{
					$(".error_messages").text("请输入正确的账号和密码");
				}
			});
		});
	})