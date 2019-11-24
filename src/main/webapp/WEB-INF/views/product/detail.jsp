<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %> 
	<div class="main">
		<section>
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<div class="img">
							<div class="scale">
								<a href="#" class="">
					      			<img src="/display?pno=${pro.pno }" alt="..." class="img-thumbnail">
					  			</a>
				  			</div>
			  			</div>
					</div>
					<div class="col-md-7">
						<h4 style="font-weight: bold;">${pro.pname }</h4>
						<hr />
						<table class="table table-hover">
							<tbody>			 
							    <tr>
							      <th scope="col">판매가</th>
							      <td><fmt:formatNumber pattern="#,###원" value="${pro.price }"/></td>
							    </tr>		  
							    <tr>
							      <th scope="row">배송비정책</th>
							      <td>2,500원 (5만원 이상 무료, 단 무료배송 상품 금액 제외)</td>
							    </tr>
							    <tr>
							      <th scope="row">유통기한</th>
							      <td>제조일로부터 24개월(제품 별도 표시일까지)</td>
							    </tr>
							    <tr>
							      <th scope="row">도착예정일</th>
							      <td>지금 주문하면 1~3일 소요 예정(결제 완료 기준, 제주 및 도서/산간 지역 제외)</td>
							    </tr>
							</tbody>
						</table>
						<hr />
						<div class="form-group">
							<input class="form-control" type="number" value="1" min="1" max="100"/>
						</div>
						<div class="form-group text-right">
							<p>합계: <span class="pname" id="total"><fmt:formatNumber pattern="#,###원" value="${pro.price+2500 }"/></span></p>
						</div>			
						<div class="">
							<button class="btn btn-outline-danger btn-lg" id="basketBtn">장바구니 담기</button>
							<button class="btn btn-danger btn-lg" id="orderBtn">바로 구매하기</button>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section>
			<div class="container">
				<hr/>
				<!-- content -->
				<div class="text-center">
					<h1>상품설명</h1>
					<h1>상품설명</h1>
					<h1>상품설명</h1>
					<h1>상품설명</h1>
					<h1>상품설명</h1>
					<h1>상품설명</h1>
				</div>
				<hr/>
			</div>
		</section>
		<section>
			<div class="container">			
				<!-- 리뷰 게시판 -->
				<div>
					<h6>REVIEW</h6>            
					<table class="table table-sm">
					    <thead>
					    	<tr>
						        <th>번호</th>
						        <th>제목</th>
						        <th>작성자</th>
						        <th>평점</th>
					    	</tr>
					    </thead>
					    <tbody>
					    	<tr>
						        <td>1</td>
						        <td>최고의 주전부리</td>
						        <td>김태호</td>
						        <td>★★★★★</td>
					    	</tr>
						    <tr>
						        <td>2</td>
						        <td>맛있다.</td>
						        <td>이규호</td>
						        <td>★★★</td>
						    </tr>
						    <tr>
						        <td>3</td>
						        <td>킹갓드</td>
						        <td>최성호</td>
						        <td>★★★★</td>
						    </tr>
						    <tr>
						        <td>4</td>
						        <td>재주문하려구요.</td>
						        <td>박찬호</td>
						        <td>★★★★</td>
						    </tr>
						    <tr>
						        <td>5</td>
						        <td>비피더스 명장</td>
						        <td>이재영</td>
						        <td>★★</td>
						    </tr>     
					    </tbody>
					</table>
				 
					<!-- 페이징 처리 -->
					<div class="">
						<ul class="pagination pagination-sm justify-content-center">
						  	<li class="page-item">
						    	<a class="page-link" href="#">&laquo;</a>
						    </li>
						    <li class="page-item active">
						    	<a class="page-link" href="#">1</a>
						    </li>
						    <li class="page-item">
						    	<a class="page-link" href="#">2</a>
						    </li>
						    <li class="page-item">
						    	<a class="page-link" href="#">3</a>
						    </li>
						    <li class="page-item">
						    	<a class="page-link" href="#">4</a>
						    </li>
						    <li class="page-item">
						    	<a class="page-link" href="#">5</a>
						    </li>
						    <li class="page-item">
						    	<a class="page-link" href="#">&raquo;</a>
						    </li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		
		<!-- Q & A -->
		<section>
			<div class="container">		
				<div>
					<h6>Q & A</h6>            
				  	<table class="table table-sm">
					  	<thead>
					      <tr>
					        <th>번호</th>
					        <th>제목</th>
					        <th>작성자</th>
					        <th>작성일</th>
					      </tr>
					    </thead>
					    <tbody>
							<tr>
								<td>1</td>
								<td>상품문의</td>
								<td>김태호</td>
								<td>2019-11-11</td>
							</tr>
							<tr>
								<td>2</td>
								<td>상품문의</td>
								<td>이규호</td>
								<td>2019-11-11</td>
							</tr>
							<tr>
								<td>3</td>
								<td>상품문의</td>
								<td>최성호</td>
								<td>2019-11-11</td>
							</tr>
							<tr>
								<td>4</td>
								<td>상품문의</td>
								<td>박찬호</td>
								<td>2019-11-11</td>
							</tr>
							<tr>
								<td>5</td>
								<td>상품문의</td>
								<td>이재영</td>
								<td>2019-11-11</td>
							</tr>     
					    </tbody>
					</table>
				 
				 <!-- 페이징 처리 -->
					<div class="">
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item">
								<a class="page-link" href="#">&laquo;</a>
							</li>
							<li class="page-item active">
								<a class="page-link" href="#">1</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">2</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">3</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">4</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">5</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">&raquo;</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</section>			
	</div>	
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h6 class="modal-title" id="exampleModalCenterTitle">장바구니에 상품이 정상적으로 담겼습니다.</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
      	<button type="button" class="btn btn-danger btn-lg" onclick="location.href='/order/basket?id=${login.id}'">장바구니 보기</button>
      	<button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">쇼핑 계속하기</button>     
      </div>  
    </div>
  </div>
</div>
<form action="/product/order" method="post" id="form">
	<input type="hidden" name="id" value="${login.id }"/>
	<input type="hidden" name="pno" value="${pro.pno }"/>
	<input type="hidden" name="price" value="${pro.price }"/>
	<input type="hidden" name="amount" value=""/>
</form>	
<script>
$(function(){
	var amount = $("input[name='amount']");
	var form = $("#form");
	
	var modal = $(".modal");
	
	$("input[type='number']").on("change", function(){		
		var price = '${pro.price }';
		var amount = $(this).val();
		var result = (price * amount) + 2500;
		$("#total").html(addComma(result)+"원");
	})
		
	$("#orderBtn").on("click", function(){
		var number = $("input[type='number']").val();
		
		amount.val(number);
		form.submit();
	})
	
	$("#basketBtn").on("click", function(){
 		var id = form.find("input[name='id']").val();
		var pno = form.find("input[name='pno']").val();
		var price = form.find("input[name='price']").val();
		var number = $("input[type='number']").val();
		
		var param = {
			id:id,
			pno:pno,
			price:price,
			amount:number
		};
			
 		$.ajax({
			type : 'post',
			url : '/order/basket',
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify(param),
			success : function(result){
				modal.modal("show");
			}
		}); 	 
	})
})

function addComma(num) {
  var regexp = /\B(?=(\d{3})+(?!\d))/g;
  return num.toString().replace(regexp, ',');
}
</script>
<%@ include file="../include/footer.jsp" %>     
