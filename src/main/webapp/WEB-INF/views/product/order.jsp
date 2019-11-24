<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<<div class="container">
	<div class="text-center">
		<h1>고객님의 결제를 처리하는 중입니다.</h1>
	</div>
</div>

<script>
$(function(){
	var pno = '${info.product.pno}';
	var pname = '${info.product.pname}';
	var price = '${info.product.price}';
	var total = '${info.product.price * info.amount + 2500}';
	
	var id = '${info.member.id}';
	var name = '${info.member.name}';
	var email = '${info.member.email}';
	var phone = '${info.member.phone}';
	
	var postcode = '${info.member.postcode}';
	var roadAddress = '${info.member.roadAddress}';
	var detailAddress = '${info.member.detailAddress}';
	var addr = roadAddress + " " + detailAddress;
	
	var amount = '${info.amount}';
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp91935239');  // 가맹점 식별 코드
	
	IMP.request_pay({
	    pg : 'kakao', // 결제방식
	    pay_method : 'card',	// 결제 수단
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : pname,	// order 테이블에 들어갈 주문명 혹은 주문 번호
	    amount : total,	// 결제 금액
	    buyer_email : email,	// 구매자 email
	    buyer_name :  name,	// 구매자 이름
	    buyer_tel :  phone,	// 구매자 전화번호
	    buyer_addr :  addr,	// 구매자 주소
	    buyer_postcode :  postcode	// 구매자 우편번호
/* 	    m_redirect_url : '/khx/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명 */
	}, function(rsp) {
		if ( rsp.success ) { // 성공시
			
			var param = {
				id:id,
				pno:pno,
				amount:amount,
				total:total
			};
			
			$.ajax({
				type : 'post',
				url : '/order/complete',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify(param),
				success : function(result){
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					alert(msg);
					location.href='/order/history?id='+id;			
				}
			});
			          
		} else { // 실패시
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
			location.href='/';  
		}
	});	
})
</script>
<%@ include file="../include/footer.jsp" %>