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

h2 {
	margin: 0px auto;
}

.shopping_messages {
	height: 450px;
}
.shopping_message{
height:150px;
width:500px
border:1px black solid;
margin-top:5px;
}
.shopping_message img {
	display: block;
	float: left;
	width: 150px;
	height: 150px;
}

.shopping_message .book_messages {
	float: left;
	width: 350px;
	height: 150px;
	margin: 0px auto;
	background-color: gainsboro;
}

.book_messages span {
	font-size: 18px;
	display: inline-block;
	padding-top: 75px;
}

.page_message {
	margin-top: 5px;
	width: 500px;
	height: 50px;
}

.page_message_nav a {
	width: 50px;
	background-color: #A52A2A;
	display: inline-block;
	text-decoration: none;
	color: whitesmoke;
	text-align: center;
	opacity: 1;
}

.page_message_nav a:hover {
	opacity: 0.5;
}
</style>

<script type="text/javascript">
$(function(){
	
	var strArr=document.cookie;
	var arr=strArr.split(";")[0];
	var username=arr.split("=")[1];
	if(!strArr||username==""){
		location.href="${APP_PATH}/firstPage.jsp"
		alert("请先登录!");
		return;
	}
	page(1);
	function page(pn){
		$.ajax({
			url : "${APP_PATH}/MyLibrary/listAll",
			type : "get",
			data : "pn=" + pn,
			success : function(result) {
				$(".shopping_messages").empty();
				//console.log(result);
				upload_book_message(result);
				pageMessageNav(result);
				console.log(result);
			}
		});
	}
	
	function upload_book_message(result) {
		var book_messages = result.data.list;
		var shopping_cart_message = $(".shopping_messages");
		$.each(book_messages, function(index, value) {
			//console.log(value);
			var bookMessages = $("<div class=\"shopping_message\">"+
			                     "<img src="+value.imageadress+">"+
			                     "<div class=\"book_messages\">"+
				                 "<span class=\"authod\">作者:"+value.author+"</span>"+
				                 "<span class=\"bookName\">书名:"+value.bookname+"</span>"+
			                     "</div>"+
		                         "</div>");
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
})
</script>
<body>
	<h2>我的图书</h2>
	<div class="shopping_messages">
		<!-- <div class="shopping_message">
			<img src="http://img3m5.ddimg.cn/31/23/25308985-1_l_8.jpg">
			<div class="book_messages">
				<span class="authod">作者:丰子恺</span> <span class="bookName">书名:天真</span>
			</div>
		</div> -->
	</div>
	<div class="page_message">
		<div class="page_message_nav">
			<!-- <a href=#>首页</a> <a href=#>上一页</a> <a href=#>1</a> <a href=#>2</a> <a
				href=#>下一页</a> <a href=#>末页</a> -->
		</div>
	</div>
</body>
</html>