<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
	<!-- main -->
	<div class="">
		<div class="swiper-container">
			<!-- 슬라이드 -->
			<div class="swiper-wrapper">
				<div class="swiper-slide"><a href="#"><img src="/resources/include/img/image1.jpg"></a></div>
				<div class="swiper-slide"><a href="#"><img src="/resources/include/img/image2.jpg"></a></div>
				<div class="swiper-slide"><a href="#"><img src="/resources/include/img/image3.jpg"></a></div>
				<div class="swiper-slide"><a href="#"><img src="/resources/include/img/image4.jpg"></a></div>
				<div class="swiper-slide"><a href="#"><img src="/resources/include/img/image5.jpg"></a></div>
			</div>
			<!-- 네비게이션 -->
			<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>
	</div>
	<section>
		<div class="container">
		</div>
	</section>
	<!-- main end -->

<script>
new Swiper('.swiper-container', {
	loop : true, // 무한 반복
	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
	autoplay: {
	    delay: 2000,
	    disableOnInteraction : false
	}
});
</script>
<%@ include file="include/footer.jsp" %>