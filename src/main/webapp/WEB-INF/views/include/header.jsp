<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/sandstone/bootstrap.min.css" rel="stylesheet" integrity="sha384-G3Fme2BM4boCE9tHx9zHvcxaQoAkksPQa/8oyn1Dzqv7gdcXChereUsXGx6LtbqA" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<!-- 스위퍼 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	
	<!-- import -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<script src="/resources/ckeditor/ckeditor.js"></script>	
	<link rel="stylesheet" href="/resources/css/heypeanut.css" />
	

	<title>야! 땅콩! - 노화 방지, 성인병 예방, 항암 효과 등 몸에 좋은 식품</title>
</head>
<body>
<div class="wrapper">
	<!-- top menu -->
	<div class="container">
		<nav class="navbar navbar-default text-primary">
			<!-- left menu -->
			<ul class="nav">
			  <li class="nav-item">
			    <a class="nav-link active" href="/intro">소개</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
			  </li>
			</ul>
			<!-- right menu -->	
			<ul class="nav">		
				<c:if test="${empty login}">
				  <li class="nav-item">
				    <a class="nav-link" href="/member/login">로그인</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="/member/joinInfo">회원가입</a>
				  </li>						
				</c:if>
				
				<c:if test="${not empty login}">
				  <li class="nav-item">
					  <a class="nav-link" href="#">${login.name }님</a>		    
				  </li><li class="nav-item">
				    <a class="nav-link" href="/member/logout">로그아웃</a>
				  </li>
				  <c:if test="${login.id != 'admin' }">
					  <li class="nav-item">
					    <a class="nav-link" href="/order/history?id=${login.id }">주문내역</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/order/basket?id=${login.id }">장바구니</a>
					  </li>					  
				  </c:if>
				  <c:if test="${login.id == 'admin' }">
					  <li class="nav-item">
					    <a class="nav-link" href="/admin/customer/list">회원관리</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/admin/product/list">상품관리</a>
					  </li>					  
				  </c:if>  					
				</c:if>						  
				  <li class="nav-item">
				    <a class="nav-link" href="/qna/list">Q & A</a>
				  </li>						
			</ul>
		</nav>
	</div>
	
	<!-- logo and search -->
	<div class="main-control">
		<!-- header content -->
		<div class="container">		
			<div class="row">
				<div class="col">
					<a href="/">
						<img class="img-rounded" src="/resources/include/img/logo.png" alt="아꿍" width="250" height="83"/>
					</a>
				</div>			
				<div class="col-md-3 ml-auto">
					<div class="form-group">
						<label class="control-label"></label>
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search" id="search">
								<div class="input-group-append">
									<button class="btn btn-secondary" id="searchBtn"><i class="fas fa-search"></i></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- category -->
	<div class=main-features>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<div class="container">
			  <div class="collapse navbar-collapse" id="navbarColor">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item">
			        <a class="nav-link" href="/product/list?cate=all" style="font-size: 1.1em !important;">전체상품 <span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/product/list?cate=nuts" style="font-size: 1.1em !important;">견과류</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/product/list?cate=fruit" style="font-size: 1.1em !important;">건과류</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/product/list?cate=fish" style="font-size: 1.1em !important;">건어물</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/product/list?cate=powder" style="font-size: 1.1em !important;">건강분말</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/product/list?cate=snacks" style="font-size: 1.1em !important;">스낵류</a>
			      </li>			      
			    </ul>   
			  </div>
		  </div>
		</nav>
	</div>
	
	<form action="/product/list" id="searchForm">
		<input type="hidden" name="type" value="name" />
		<input type="hidden" name="keyword" value="" />
	</form>
	
	<script>
		$(function(){
			
			var search = $("#search");
			var searchBtn = $("#searchBtn");
			var searchForm = $("#searchForm");
			
			
			searchBtn.on("click", function(){
				var input = search.val();
				
				if (input == '' || input.length == 0){
					alert('검색어를 입력하세요.');
					return;
				}
				
				searchForm.find("input[name='keyword']").val(input);
				searchForm.submit();
			})
			
		})
		
	
	</script>	