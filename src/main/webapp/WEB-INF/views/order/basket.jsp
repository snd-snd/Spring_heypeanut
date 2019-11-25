<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<div class="main">
		<div class="container">
			<div class="text-center">
				<h3><strong>장바구니</strong></h3>
				<hr />
			</div>
			<section>
				<div class="">
					<table class="table">
					  <thead class="thead-dark">
					    <tr>
					      <th scope="col"><input type="checkbox" /></th>
					      <th scope="col">이미지</th>
					      <th scope="col">상품정보</th>
					      <th scope="col">판매가</th>
					      <th scope="col">수량</th>
					      <th scope="col">배송구분</th>
					      <th scope="col">합계</th>
					      <th scope="col">선택</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach items="${list }" var="bas">
						  	<tr>
						      <td class="align-middle"><input type="checkbox" /></td>
						      <td class="align-middle">
							      <a href="/product/detail?pno=${bas.pno }" class="">
									  <img src="/display?pno=${bas.pno }" alt="..." class="img-sample">
					   		 	  </a>
							  </td>
						      <td class="align-middle">${bas.pname }</td>
						      <td class="align-middle"><fmt:formatNumber pattern="#,###원" value="${bas.price }"/></td>
						      <td class="align-middle">${bas.amount }</td>
						      <td class="align-middle">기본배송</td>
						      <td class="align-middle plus"><fmt:formatNumber pattern="#,###원" value="${bas.price * bas.amount }"/></td>
						      <td class="align-middle">
						      	<button class="btn btn-outline-secondary btn-sm">주문</button> 
						      	<button class="btn btn-secondary btn-sm removeBtn" data-bno="${bas.bno }">삭제</button>
						      </td>     
						    </tr>
					  	</c:forEach>					    	   
					  </tbody>
					</table>		
				</div>
			</section>
			<section>
				<div class="text-right">
					<table class="table table-bordered">
					  <tbody>			 
					    <tr>
					      <th scope="col">총 상품금액</th>
					      <th scope="row">배송비</th>
					      <th scope="row">결제예정금액</th>
					    </tr>		  
					    <tr>
					      <td><span class="pname" id="sum"></span></td>
					      <td><span class="pname">2,500원</span></td>
					      <td><span class="pname" id="total"></span></td>
					    </tr>
					  </tbody>
					</table>
				</div>
				
				<!-- 장바구니가 비었다면 -->
				<!-- <div>
					<div class="text-center">
						<h6 class="text-muted" style="font-weight: bold">장바구니가 비어있습니다. 상품을 담아주세요.</h6>	
					</div>
				</div> -->
				
				<div class="text-center">
					<button class="btn btn-outline-danger btn-lg">상품결제하기</button>
					<button class="btn btn-danger btn-lg">쇼핑계속하기</button>
				</div>
				<hr/>		
			</section>
			<section>
				<div class="text-center">
					<div>
						<h6 class="text-muted" style="font-weight: bold">장바구니 이용안내</h6>
						<p class="text-muted">
							<small>
								선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.<br>
								[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.<br>
								장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.
							</small>
						</p>
						<h6 class="text-muted" style="font-weight: bold">무이자할부 이용안내</h6>
						<p class="text-muted">
							<small>
								상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.<br>
								[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.<br>
								단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.<br>
							</small>
						</p>
					</div>
				</div>
			</section>
		</div>
	</div>
<script>
$(function(){
	var sum = 0;
	
	$("tbody .plus").each(function(i, element) {		
		var value = $(this).text();
		sum += parseInt(removeComma(value));
	})
	
	$("#sum").text(addComma(sum)+"원");
	$("#total").text(addComma(sum+2500)+"원");
	
	
	$("tbody").on("click", ".removeBtn", function(){
		var bno = $(this).data("bno");
		
/* 		$.ajax({
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
		}); */
		
		
	})
	
	
})

function addComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

function removeComma(num) {
	var regexp = /\,/g;
	var temp = num.toString().replace(regexp, '');
	regexp = /\원/g;
	return temp.toString().replace(regexp, '');
}
</script>	
<%@ include file="../include/footer.jsp" %>