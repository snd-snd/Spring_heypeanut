<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- footer -->
	<hr class=""/>
	<div class="main-control">
		<div class="container">
			<div class="row">	
				<div class="col-xs-6 col-md-6">
					<div class="">
						<h4><strong>고객센터</strong></h4>
						<br/>
						<div>02-1234-5678</div>
						<div>평일 10:00 ~ 18:00 / 주말 휴무</div>
						<br/>
						<div>이메일 : hyssop9734@naver.com</div>					
					</div>
				</div>
				<div class="col-xs-6 col-md-6">
					<div class="">			
						<h4><strong>입금계좌  (예금주: 김태호)</strong></h4>
						<br/>
						<div>국민은행: 481233-01-518291</div>
						<div>우리은행: 1002-390-423491</div>
						<div>하나은행: 231-938711-12361</div>
						<div>농협: 841-51-839102</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<footer class="py-4 bg-light text-center">
		     <p class="m-0 text-muted">(주)야땅콩 139-240 서울시 노원구 공릉1동 동일로 1082 &emsp; 대표이사: 김태호 &emsp; 개인정보보호책임자: 박진경</p>
		     <p class="m-0 text-muted"><a href="#" class="text-muted alert-link">이용약관</a>&emsp;<a href="#" class="text-muted alert-link">개인정보처리방침</a>&emsp;사업자 등록번호: 123-45-67890 &emsp; 통신판매업 신고번호: 제2019-서울-1234 &emsp; 건강기능식품판매업신고번호: 제2019-1234567호</p>
		     <p class="m-0 text-muted">Copyright (c) Hey! Peanut!, Inc. All Rights Reserved.</p>
		 </footer>
	 </div>	
	<!-- footer end -->
</div>
<!-- wrapper end -->
<script>
$(document).ready(function () {

	var menu = $('.main-features');
	var menuOffset = menu.offset().top;

	function scroll() {
	    if ($(window).scrollTop() >= menuOffset) {
	        $('.main-features').addClass('fixed-top');
	    } else {
	        $('.main-features').removeClass('fixed-top');
	    }
	}
	document.onscroll = scroll;	
});
</script>

</body>
</html>