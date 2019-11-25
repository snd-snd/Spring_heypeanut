<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
	<div class="main">
		<div class="container">
			<div class="text-center">
				<h3><strong>상품관리</strong></h3>
				<hr />
			</div>
			<section>
				<div class="">
					<table class="table">
					  <thead class="thead-dark">
					    <tr>
					      <th scope="col">상품번호</th>
					      <th scope="col">이미지</th>
					      <th scope="col">카테고리</th>
					      <th scope="col">이름</th>
					      <th scope="col">가격</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach items="${list }" var="pro">
						  	<tr>
						      <td class="align-middle">${pro.pno }</td>
						      <td class="align-middle">
							      <a href="/product/detail?pno=${pro.pno }" class="">
									  <img src="/display?pno=${pro.pno }" alt="..." class="img-sample">
					   		 	  </a>
							  </td>
						      <td class="align-middle">${pro.category }</td>
						      <td class="align-middle">${pro.pname }</td>
						      <td class="align-middle"><fmt:formatNumber pattern="#,###원" value="${pro.price }"/></td>
						    </tr>	
					  	</c:forEach>				    					      	   
					  </tbody>
					</table>		
				</div>
			</section>
			<section>
				<!-- 페이징 처리 -->
				<div class="">
					<ul class="pagination justify-content-center">
						<c:if test="${page.prev }">
							<li class="page-item">
								<a class="page-link" href="${page.startPage-1 }">&laquo;</a>
							</li>
						</c:if>
						<c:forEach begin="${page.startPage }" end="${page.endPage }" var="idx">
	                		<li class="page-item ${page.criteria.pageNum==idx?'active':'' }">
	                			<a class="page-link" href="${idx }">${idx }</a>
	                		</li>
                		</c:forEach>
                		<c:if test="${page.next }">
							<li class="page-item">
								<a class="page-link" href="${page.endPage+1 }">&raquo;</a>
							</li>
						</c:if>	
					</ul>
				</div>
			</section>
			<section>
				<div class="row">
					<div class="col-md-3">					
						<form action="" method="get" id="search">
							<div class="form-group">
								<div class="input-group">
									<input type="hidden" class="form-control" name="type" value="name">
									<input type="text" class="form-control" name="keyword" placeholder="Search">
									<div class="input-group-append">
										<button class="btn btn-danger" type="submit"><i class="fas fa-search"></i></button>
									</div>
								</div>
							</div>				
						</form>
					</div>
					<div class="col-md-3 ml-auto">
						<button class="btn btn-danger btn-lg" style="width: 200px;" onclick="location.href='/admin/product/register'">상품등록</button>
					</div>
				</div>
			</section>
		</div>
	</div>
	
	<form action="" id="form">
		<input type="hidden" name="pageNum" value="${page.criteria.pageNum }" />
		<input type="hidden" name="amount" value="${page.criteria.amount }" />
		<input type="hidden" name="type" value="${page.criteria.type }" />
		<input type="hidden" name="keyword" value="${page.criteria.keyword }" />
	</form>
	
<script>
$(function(){
	var form = $("#form");
	
	$(".page-item a").click(function(e){
		e.preventDefault(); //a태그의 동작을 막는 함수
		
		form.find("input[name='pageNum']").val($(this).attr("href"));			
		form.submit();
	})
})
</script>
<%@ include file="../../include/footer.jsp" %>