<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    
	<div class="main">	
		<div class="text-center">
			<h3>[ Q & A ]</h3>
			<p class="pname">Hey!Peanut!의 주문/결제/배송 관련된 문의사항을 남겨주세요. (_ _)</p>
			<hr />
		</div>
		<div class="container">
			<section>
				<table class="table table-hover">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">제목</th>
				      <th scope="col">작성자</th>
				      <th scope="col">작성일</th>
				      <th scope="col">조회수</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach items="${list }" var="qna">
				  		 <tr>
						     <td>${qna.qno }</td>
						     <td><a href="/qna/read?qno=${qna.qno }"></a>${qna.title }</td>
						     <td>${qna.name }</td>
						     <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${qna.regDate }"/></td>
						     <td>${qna.hit }</td>
					    </tr>
				  	</c:forEach>				   
				  </tbody>
				</table>				
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
					<div class="col-md-2">					
						<div>
							<div class="form-group">
								<div class="input-group">
									<select class="form-control" id="division">
										<option value="TCW">전체</option>
										<option value="TC">제목/내용</option>
										<option value="T">제목</option>
										<option value="C">내용</option>
										<option value="W">작성자</option>
									</select>								
								</div>
							</div>				
						</div>
					</div>
					<div class="col-md-3">					
						<form action="" id="searchForm2">
							<div class="form-group">
								<div class="input-group">
									<input type="hidden" class="form-control" name="type">
									<input type="text" class="form-control" name="keyword" placeholder="Search">
									<div class="input-group-append">
										<button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
									</div>
								</div>
							</div>				
						</form>
					</div>
					<div class="col-md-3 ml-auto">
						<button class="btn btn-primary btn-lg" style="width: 200px;" onclick="location.href='/qna/register'">글쓰기</button>
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
	var searchForm2 = $("#searchForm2");	
	var type = '${page.criteria.type}';
	var keyword = '${page.criteria.keyword}';
	
	$("#division").val(type||'TCW').attr('selected', true);
	searchForm2.find("input[name='keyword']").val(keyword);	
	
	$(".pagination a").click(function(e){
		e.preventDefault();
		form.find("input[name='pageNum']").val($(this).attr("href"));			
		form.submit();
	})
	
	searchForm2.find("button").click(function(e){
		e.preventDefault();
		
		if (!searchForm2.find("input[name='keyword']").val()){
			alert("검색어를 입력하시오.");
			searchForm2.find("input[name='keyword']").focus();
			return;
		}		
		searchForm2.find("input[type='hidden']").val($("#division").val());	
		searchForm2.submit();
	})		
})
</script>
<%@ include file="../include/footer.jsp" %>