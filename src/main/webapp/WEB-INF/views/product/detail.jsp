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
					    <!-- 리뷰가 들어오는 곳 스크립트 처리 -->
					    <tbody class="reviewContent">
					    </tbody>
					</table>			 
					<!-- 페이징 스크립트 처리-->
					<div class="reviewPage">										
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
	<input type="hidden" name="bno" value="0"/>
</form>
<script src="/resources/js/review.js"></script>
<script>
$(function(){
	var amount = $("input[name='amount']");
	var form = $("#form");	
	var modal = $(".modal");
	var pno = '${pro.pno }';
	
	var login = '${login.id}';
	
	reviewList(1); //리뷰 보여주기
	
	$("input[type='number']").on("change", function(){		
		var price = '${pro.price }';
		var amount = $(this).val();
		var result = (price * amount) + 2500;
		$("#total").html(addComma(result)+"원");
	})
		
	$("#orderBtn").on("click", function(){
		if (login.length == 0 || login == ""){
			alert("로그인 후 사용가능합니다.");
			location.href="/member/login";
			return;
		}
		
		var number = $("input[type='number']").val();
		
		amount.val(number);
		form.submit();
	})
	
	$("#basketBtn").on("click", function(){
		if (login.length == 0 || login == ""){
			alert("로그인 후 사용가능합니다.");
			location.href="/member/login";
			return;
		}
		
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
	
	var reviewContent = $(".reviewContent");
	var reviewPage = $(".reviewPage");
	var pageNum = 1;
	
	
	var message = '${message}';
	
	if (message == 'true'){
		var offset = reviewContent.offset();
		$('html').animate({scrollTop : offset.top}, 400);
	}
	
	// 개별 리뷰 클릭시 이벤트
	reviewContent.on("click", "tr", function(){
		var rno = $(this).data("rno");
		var trTag = $(this);
		var html = "";		
		reviewService.read(rno, function(result){
			reviewContent.find(".node").remove();
	
			html += "<tr class='node'>";
			html += "<td colspan='4'>";
			html += "<div class='review-content'>"+result.content+"</div>";
			html += "</td>";
			html += "</tr>";

			trTag.after(html);
		});
		
	})
		
	// 리뷰 리스트 보여주기
	function reviewList(page){
		reviewService.getList({pno:pno,page:page}, function(reviews,total){
			reviewContent.html("");
			if (reviews == null || reviews.length == 0){
				return;
			}			
			if (page == -1){
				pageNum=Math.ceil(total/5.0);
				reviewList(pageNum)
				return;
			}
			
			var html = "";
			
			for (var i=0, len=reviews.length||0; i<len; i++){				
				html += "<tr data-rno='"+reviews[i].rno+"'>";
				html += "<td>"+reviews[i].rno+"</td>";
				html += "<td>"+reviews[i].title+"</td>";								
				html += "<td>"+reviews[i].name+"</td>";
				html += "<td>"+star(reviews[i].score)+"</td>";
				html += "</tr>";
			}
			reviewContent.html(html);
			reviewPaging(total);
		});		
	}

	// 리뷰 페이징 생성
	function reviewPaging(total){
		
		var endPage = Math.ceil(pageNum / 5.0)*5; //마지막 페이지 계산
		var startPage = endPage-4; //시작 페이지
		var prev = startPage != 1; //이전 버튼
		var next = false; //다음 버튼
		
		if (endPage*5 >= total){
			endPage = Math.ceil(total/5.0);
		}
		if (endPage*5 < total){
			next = true;
		}
			
		var html = "<ul class='pagination pagination-sm justify-content-center'>";

		if (prev){
			html += "<li class='page-item'><a class='page-link' href='"+(startPage-1)+"'>&laquo;</a></li>";
		}		
		for (var i=startPage; i<=endPage; i++){
			var active = pageNum == i? "active":"";		
			html += "<li class='page-item "+active+"'>";
			html += "<a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}			
		if (next){
			html += "<li class='page-item'><a class='page-link' href='"+(endPage+1)+"'>&laquo;</a></li>";
		}			
		html += "</ul>";			
		reviewPage.html(html);
	}
		
	// 리뷰 페이지 이동
	reviewPage.on("click", "li a", function(e){
		e.preventDefault();	
		pageNum = $(this).attr("href");
		reviewList(pageNum);
	})

})

function addComma(num) {
  var regexp = /\B(?=(\d{3})+(?!\d))/g;
  return num.toString().replace(regexp, ',');
}

function star(num) {
	var str = "";
	for (var i=0; i<num; i++){
		str += "★";  
	}
	return str.toString();
}
</script>
<%@ include file="../include/footer.jsp" %>     
