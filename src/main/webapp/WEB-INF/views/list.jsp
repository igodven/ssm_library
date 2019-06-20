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
</head>
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/bootstrap-3.3.7-dist/js/bootstrap.min.js" />
<script src="${APP_PATH}/js/jquery-1.12.4.min.js" type="text/javascript"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${APP_PATH}/css/list.css" />
<script type="text/javascript">
$(function(){
	var strArr=document.cookie;
	var arr=strArr.split(";")[0];
	var username=arr.split("=")[1];
	
	$("h2 span").text(username);
	page(1);
})
function page(pn){
	$(".library").empty().unbind();
	$.ajax({
		url:"${APP_PATH}/LibraryMessages/listAll",
		type:"get",
		data:"pn="+pn,
		success:function(result){
			$(".library").empty();
			//console.log(result.data.list);
			establish(result)//创建一个div用来保存图书的信息
			/* console.log(result);
			console.log(result.data.pageNum); */
			pageMessage(result);
			pageMessageNav(result);
		}
	})
	  function establish(result){
		var lib=result.data.list
		
		  $.each(lib,function(index,value){	
			  //绑上id的值,方便后续的操作,比如购买和加入购物车
			var library_messages=$("<div class=\"library_messages\" id="+value.id+">"+
			                       "<div class=\"book\">"+
			                       "<div class=\"book_image\">"+
                                   "<img src="+value.imageadress +" />"+
			                       "</div>"+
			                       "<span>作者:"+value.author +"</span>"+
			                       "<span>书名:"+value.bookname +"</span>"+
			                       /* ${APP_PATH}/LibraryMessages/shoppingCart */
			                       "<a href=\"#\" class=\"shopping_cart\">加入购物车</a>"+
			                       "<a href=\"#\" class=\"shopping\">购买</a>"+
		                           "</div>"+
	                               "</div>");
			
			$(".library").append(library_messages);
			});	
	}
	/* 展示图书的总信息 */
	 function pageMessage(result){
		 var page_num=$(".page_num");
		     page_num.empty();     
		var dataMessage=$("<span>图书总数"+result.data.total+"本</span>"+
				          "<span>总共"+result.data.pages+"页</span>"+
				          "<span>当前第"+result.data.pageNum+"页</span>"+
				          "<span>每页"+result.data.pageSize+"条数据</span>");
		page_num.append(dataMessage);
	 }
	 var pages;
	/* 展示页面查询的跳转信息 */
	function pageMessageNav(result){
		var page_nav=$(".page_nav");
		$(".page_nav").empty();
		//var lastPages=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
	   pages=result.data.pages;
		var firstPage=$("<a></a>").append("首页").attr("id",1);
		var prePage=$("<a></a>").append("上一页").attr("id",result.data.pageNum-1);
	
		var nextpage=$("<a></a>").append("下一页").attr("id",result.data.pageNum+1);
		var lastPage=$("<a></a>").append("末页").attr("id",result.data.pages);
		page_nav.append(firstPage);
		page_nav.append(prePage);
		$.each(result.data.navigatepageNums,function(index,value){
			var item=$("<a></a>").append(value).attr("id",value);
			page_nav.append(item);
		})
		page_nav.append(nextpage);
		page_nav.append(lastPage);	
	}

	$(".page_nav").delegate("a","click",function(event){
		
		//把以前绑定的事件给清理掉,否则会以倍数的方式增长
		$(".page_nav").empty().unbind();
		var id=$(this).attr("id");
		if(id<=0){
			id=1;
		}
		if(id>pages){
			id=pages;
		}
		page(id);
	});
	//给购物车绑定一个事件,点击后,会进行跳转,加载到另一个页面,那个页面将展示用户的加入购物车的商品
	$(".library").delegate(".shopping_cart","click",function(){
		
		var id=$(this).parents(".library_messages").attr("id");//获取id的值
		//根据id查询出,相关图书的信息,并把它加入到数据库,数据库在查询出,展示给用户,
		shopping_cart(id)
	})
	//加入购物车的具体的操作
	function shopping_cart(id){
		$.ajax({
			url:"${APP_PATH}/shoppingCart/joinShoppingCart",
			type:"post",
			data:"id="+id,
			success:function(result){
				if(result.state==1){
					
					alert("加入购物车成功!");
				}else{
					alert("加入购物车失败!");
				}
			}
		})
	}
	//给购买绑定一个事件,点击购买后,会弹出一个页面,里面会显示你购买的图书的信息
	$(".library").delegate(".shopping","click",function(){
		//把以前的绑定事件清理掉
		//$(".library").empty().unbind();
		var id=$(this).parents(".library_messages").attr("id");//获取id的值
		//根据id查询出,相关图书的信息,并把它加入到数据库,数据库在查询出,展示给用户,
		shopping(id)
	});
	function shopping(id){
		/* 
		1.发送一个请求,用来查询图书,
		2.查询后把购买了书籍的信息封装进我的图书的数据库中
		3.并且把购买图书的库存减去1*/
		
		$.ajax({
			url:"${APP_PATH}/MyLibrary/saveBook",
			type:"post",
			data:"id="+id,
			success:function(result){
				if(result.state!=0){
					alert("购买成功!")
				}else{
					alert("购买失败,可能库存不足!")
				}
			}
		});
	} 
	
}
</script>
<body>
	<h2>欢迎<span style="color:red;"></span>到来</h2>

<div class="shopping_carts">
 <a href="${APP_PATH}/shoppingCart/showPage">我的购物车</a>
 <a href="${APP_PATH}/MyLibrary/showPage">我的图书</a>
</div>
<div class="library">
</div>
<%--  <c:forEach items="${LibraryMessages.list }" begin="0" end="4" var="lib">
			 ${lib }
      <div class="library_messages">
	         <div class="book">
				<div class="book_image">
					<img src="${lib.imageadress }" > 
				</div>
				<span>作者:${lib.author }</span>
				<span>书名:${lib.bookname }</span>
				<a href="#" class="shopping_cart">加入购物车</a>
				<a href="#" class="shopping">购买</a>
				
			</div>
		</div>
</c:forEach> --%>
<div class="page_messages">
		<!--关于图书的总数据的信息,包含总数据,总页数,当前页,每页多少条数据  -->
		<div class="page_num">
			<!-- <span>图书总数16本</span>
			<span>总共4页</span>
			<span>当前第1页</span>
			<span>每页5条数</span> -->
		</div>
		<div class="page_nav">
		<!-- <a href=#>首页</a>
		<a href=#>上一页</a>
		<a href=#>1</a>
		<a href=#>2</a>
		<a href=#>下一页</a>
		<a href=#>末页</a> -->
		</div>
</div>
</body>
</html>