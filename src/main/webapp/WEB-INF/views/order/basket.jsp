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
					      <th scope="col"><input type="checkbox" class="check-all" checked="checked"/></th>
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
						      <td class="align-middle"><input type="checkbox" class="check-child" checked="checked"/></td>
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
						      	<button class="btn btn-outline-secondary btn-sm orderBtn" data-bno="${bas.bno }" data-amount="${bas.amount }" data-id="${bas.id }" data-pno="${bas.pno }">주문</button> 
						      	<button class="btn btn-secondary btn-sm removeBtn" data-bno="${bas.bno }" data-id="${bas.id }">삭제</button>
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
					      <c:if test="${empty list }">
						      <td><span class="pname cost">0원</span></td>
					      </c:if>
					      <c:if test="${not empty list }">
						      <td><span class="pname cost">2,500원</span></td>
					      </c:if>
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
					<button class="btn btn-outline-danger btn-lg" id="payment">상품결제하기</button>
					<button class="btn btn-danger btn-lg" onclick="location.href='/product/list?cate=all'">쇼핑계속하기</button>
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
	
<form action="/product/order" method="post">
	<input type="hidden" name="id"/>
	<input type="hidden" name="pno"/>
	<input type="hidden" name="amount"/>
	<input type="hidden" name="bno"/>
</form>	
<script>
$(function(){
	var sum = 0;
	var form = $("form");	
	var cost = parseInt(removeComma($(".cost").text()));
		
	$("tbody .plus").each(function(i, element) {		
		var value = $(this).text();
		sum += parseInt(removeComma(value));
	})
	
	$("#sum").text(addComma(sum)+"원");
	$("#total").text(addComma((sum+cost))+"원");
	
	
	$("tbody").on("click", ".removeBtn", function(){
		var flag = confirm("정말 삭제하시겠습니까?");
		
		if (!flag) return;
		
		var bno = $(this).data("bno");
		var id = $(this).data("id");
		
 		$.ajax({
			type : 'post',
			url : '/order/basket/remove?bno='+bno,
			contentType : 'application/json;charset=utf-8',
			success : function(result){
				location.href="/order/basket?id="+id;		
			}
		}); 
	})
	
	$("tbody").on("click", ".orderBtn", function(){

		var amount = $(this).data("amount");
		var pno = $(this).data("pno");
		var id = $(this).data("id");
		var bno = $(this).data("bno");
		
		form.find("input[name='id']").val(id);
		form.find("input[name='pno']").val(pno);
		form.find("input[name='amount']").val(amount);
		form.find("input[name='bno']").val(bno);
		
		form.submit();
	})
	
	$("#payment").on("click", function(){
		
	})
	
	$("input[type='checkbox']").on("click", function(){
		console.log("하핫");
	})
	
	
	//체크박스
	var selectAll = document.querySelector(".check-all");
    selectAll.addEventListener('click', function(){
        var objs = document.querySelectorAll(".check-child");
        for (var i = 0; i < objs.length; i++) {
          objs[i].checked = selectAll.checked;
        };
    }, false);
     
    var objs = document.querySelectorAll(".check-child");
    for(var i=0; i<objs.length ; i++){
      objs[i].addEventListener('click', function(){
        var selectAll = document.querySelector(".check-all");
        for (var j = 0; j < objs.length; j++) {
          if (objs[j].checked === false) {
            selectAll.checked = false;
            return;
          };
        };
        selectAll.checked = true;                                   
    }, false);
    } 


	
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

/* function check(){
	if ($(".check-all").is(':checked')){
		$("input[type='checkbox']").remove("checked");
		$("input[type='checkbox']").attr("checked", true);
	} else {
		$("input[type='checkbox']").remove("checked");
		$("input[type='checkbox']").attr("checked", false);
	}
} */
</script>	
<%@ include file="../include/footer.jsp" %>