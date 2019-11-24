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
						    </tr>					  	
					  	</c:forEach>					     	   
					  </tbody>
					</table>		
				</div>
			</section>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>