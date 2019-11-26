<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<div class="main">
		<div class="container">
			<div class="text-center">
				<h3><strong>주문내역</strong></h3>
				<hr />
			</div>
			<section>
				<div class="">
					<table class="table">
					  <thead class="thead-dark">
					    <tr>
					      <th scope="col">이미지</th>
					      <th scope="col">상품정보</th>
					      <th scope="col">수량</th>
					      <th scope="col">합계</th>
					      <th scope="col">주문일자</th>
					      <th scope="col">상태</th>
					      <th scope="col">비고</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach items="${list }" var="order">
						    <tr>
						      <td class="align-middle">
							      <a href="/product/detail?pno=${order.pno }">
									  <img src="/display?pno=${order.pno }" alt="..." class="img-sample">
					   		 	  </a>
							  </td>
						      <td class="align-middle">
							      <a href="/product/detail?pno=${order.pno }">${order.pname }</a>
						      </td>
						      <td class="align-middle">${order.amount }</td>
						      <td class="align-middle"><fmt:formatNumber pattern="#,###원" value="${order.total }"/></td>
						      <td class="align-middle"><fmt:formatDate pattern="yyyy-MM-dd" value="${order.regDate }"/></td>
						      <c:choose>
						      	<c:when test="${order.status == 0 }">
							      <td class="align-middle">배송준비중</td>  
						      	</c:when>
						      	<c:when test="${order.status == 1 }">
							      <td class="align-middle">배송중</td>  
						      	</c:when>
						      	<c:when test="${order.status == 2 }">
							      <td class="align-middle">배송완료</td>  
						      	</c:when>
						      </c:choose>
							  <td class="align-middle">
						      	<button class="btn btn-outline-secondary btn-sm reviewBtn" data-pno="${order.pno }" data-id="${order.id }">리뷰작성</button> 
						      </td>						        
						    </tr>					  	
					  	</c:forEach>					     	   
					  </tbody>
					</table>		
				</div>
			</section>
		</div>
	</div>
	
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Review</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="form-group">
      		<input class="form-control" type="text" placeholder="제목"/>
      	</div>
      	<div class="form-group">
	        <textarea class="form-control" rows="4" placeholder="내용"></textarea>
      	</div>
      	<div class="form-group">
      		<div class="starRev">
			  <span class="starR on">별1</span>
			  <span class="starR">별2</span>
			  <span class="starR">별3</span>
			  <span class="starR">별4</span>
			  <span class="starR">별5</span>
			</div>
      	</div>
      	<input class="form-control" type="hidden"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="registerBtn">작성</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
	
<script>
$(function(){
	var reviewBtn = $(".reviewBtn");
	var modal = $(".modal");
	var registerBtn = $("#registerBtn");
	
	reviewBtn.on("click", function(){
		modal.attr("data-id", $(this).data("id"));
		modal.attr("data-pno", $(this).data("pno"));
		modal.modal("show");
	})
	
	$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
	
	registerBtn.on("click", function(){
		var title = modal.find("input[type='text']").val();
		var content = modal.find("textarea").val();
		var writer = modal.data("id");
		var score = $(".on").length;
		var pno = modal.data("pno");

		if (title == '' || title.length == 0){
			alert("제목을 입력해주세요.");
			modal.find("input[type='text']").focus();
			return;
		}
		if (content == '' || content.length == 0){
			alert("제목을 입력해주세요.");
			modal.find("textarea").focus();
			return;
		}
		
		var param = {
			title:title,
			content:content,
			writer:writer,
			score:score,
			pno:pno
		};
		
		$.ajax({
			type : 'post',
			url : '/review/add',
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify(param),
			success : function(result){
				modal.find("input").val("");
				modal.find("textarea").val("");
				modal.modal("hide");
				var flag = confirm("후기가 작성되었습니다. 확인하시겠습니까?");
				if (flag){
					location.href = '/product/detail?pno='+pno+"&message=true";
				}
				
			}
		});
	})
	
})
</script>
<%@ include file="../include/footer.jsp" %>