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
}

.shopping_cart_messages {
	margin: 50px auto;
	width: 60%;
	background-color: gainsboro;
}

.image_message {
	float: left;
	
}

.book_messages {
	float: left;
	width: 500px;
	height: 150px;
	background-color:rosybrown;
	border-bottom:1px black solid;
	

}

.book_messages span {
	font-size: 20px;
	line-height: 150px;
	margin-left: 10px;
	
}

.book_handel {
	float: left;
	width: 202px;
	height: 150px;
	background-color:lightpink;
}

.book_handel button {
	float: left;
	font-size: 24px;
	background-color: cyan;
	border: none;
	color: red;
	margin: 75px auto;
	margin-right: 10px;
	cursor: pointer;
	opacity: 1;
}

.book_handel button:hover {
	opacity: 0.5;
}

.page_message {
	width: 45%;
	margin: 10px auto;
	
}

.page_message_nav {
	margin-left: 200px;
   /*  background-color:red; */
	height:50px;
	
}

.page_message_nav a {
	display: inline-block;
	width: 50px;
	text-align: center;
	color: darkorange;
	opacity: 1;
	background-color: brown;
	text-decoration: none;
	margin-left: 5px;
}

.page_message_nav a:hover {
	opacity: 0.5;
}
</style>
<script type="text/javascript">
	$(function() {

		var strArr=document.cookie;
		var arr=strArr.split(";")[0];
		var username=arr.split("=")[1];
		if(!strArr||username==""){
			location.href="${APP_PATH}/firstPage.jsp"
			alert("请先登录!");
			return;
		}
		page(1);
		function page(pn) {
			$.ajax({
				url : "${APP_PATH}/shoppingCart/listAll",
				type : "get",
				data : "pn=" + pn,
				success : function(result) {
					$(".shopping_cart_message").empty();
					//console.log(result);
					upload_book_message(result);
					pageMessageNav(result);
				}
			});
		}
		var pagenum;
		function upload_book_message(result) {
			pagenum=result.data.pageNum
			var book_messages = result.data.list;
			var shopping_cart_message = $(".shopping_cart_message");
			$.each(book_messages, function(index, value) {
				//console.log(value);
			
				var bookMessages = $("<div class=\"image_message\">"
						+ "<img src="+value.imageadress+">" + "</div>"
						+ "<div class=\"book_messages\">"
						+ "<span class=\"authod\">作者:" + value.author
						+ "</span>" + "<span class=\"bookName\">书名:"
						+ value.bookname + "</span>" + "</div>"
						+ "<div class=\"book_handel\">"
						+ "<button class=\"book_shopping\" id="+value.id+">购买</button>"
						+ "<button class=\"book_delete\" id="+value.id+">删除</button>"
						+ "</div>");
				shopping_cart_message.append(bookMessages);
			})
		}

		var pages;
		function pageMessageNav(result) {
			var page_nav = $(".page_message_nav");
			$(".page_message_nav").empty();
			//var lastPages=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			pages = result.data.pages;
			//alert(pages)
			var firstPage = $("<a></a>").append("首页").attr("id", 1);
			var prePage = $("<a></a>").append("上一页").attr("id",
					result.data.pageNum - 1);

			var nextpage = $("<a></a>").append("下一页").attr("id",
					result.data.pageNum + 1);
			var lastPage = $("<a></a>").append("末页").attr("id",
					result.data.pages);
			page_nav.append(firstPage);
			page_nav.append(prePage);
			$.each(result.data.navigatepageNums, function(index, value) {
				var item = $("<a></a>").append(value).attr("id", value);
				page_nav.append(item);
			})
			page_nav.append(nextpage);
			page_nav.append(lastPage);
		}

		$(".page_message_nav").delegate("a", "click", function(event) {

			//把以前绑定的事件给清理掉,否则会以倍数的方式增长
			//$(".page_message_nav").empty().unbind();
			var id = $(this).attr("id");
			if (id <= 0) {
				id = 1;
			}
			if (id > pages) {
				id = pages;
			}
			page(id);
		});
		
		$(".shopping_cart_message").delegate(".book_shopping","click",function(){
			var id=$(this).attr("id");
			$.ajax({
				url:"${APP_PATH}/shoppingCart/searchToShopping",
				type:"get",
				data:"id="+id,
				success:function(result){
					if(result.state==1){
						alert("购买成功!");
					}else{
						alert("购买失败!");
					}
				}
			})
		});
		
		$(".shopping_cart_message").delegate(".book_delete","click",function(){
			var id=$(this).attr("id");
			$.ajax({
				url:"${APP_PATH}/shoppingCart/bookDelete",
				type:"get",
				data:"id="+id,
				success:function(result){
					if(result.state==1){
						alert("删除成功!");
						page(parseInt(pagenum));
					}else{
						alert("删除失败!");
					}
				}
			})
		});

	});
</script>
<body>
<h2 style="color:red;">我的购物车</h2>
	<div class="shopping_cart_messages">
		<div class="shopping_cart_message">
			<!-- <div class="image_message">
				<img src="http://img3m5.ddimg.cn/31/23/25308985-1_l_8.jpg">
			    <div class="book_messages">
				<span class="authod">作者:丰子恺</span> <span class="bookName">书名:天真</span>
			     </div>
			    <div class="book_handel">
				<button class="book_shopping">购买</button>
				<button class="book_delete">删除</button>
			</div>  -->
		</div>
	</div>
	<div class="page_message">
		<div class="page_message_nav">
			<!-- <a href=#>首页</a> <a href=#>上一页</a> <a href=#>1</a> <a href=#>2</a> <a
					href=#>下一页</a> <a href=#>末页</a> -->
		</div>
	</div>

</body>
</html>