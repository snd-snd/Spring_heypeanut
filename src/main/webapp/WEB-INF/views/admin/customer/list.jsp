<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
	<div class="main">
		<div class="container">
			<div class="text-center">
				<h3><strong>회원관리</strong></h3>
				<hr />
			</div>
			<section>
				<div class="">
					<table class="table">
					  <thead class="thead-dark">
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">아이디</th>
					      <th scope="col">이름</th>
					      <th scope="col">이메일</th>
					      <th scope="col">전화번호</th>
					      <th scope="col">우편번호</th>
					      <th scope="col">주소</th>
					      <th scope="col">가입날짜</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach items="${list }" var="member" varStatus="status">
					  		<tr>
						      <td class="align-middle">${status.count }</td>
						      <td class="align-middle">${member.id }</td>
						      <td class="align-middle">${member.name }</td>
						      <td class="align-middle">${member.email }</td>
						      <td class="align-middle">${member.phone }</td>
						      <td class="align-middle">${member.postcode }</td>  
						      <td class="align-middle">${member.roadAddress } ${member.detailAddress }</td>  
						      <td class="align-middle"><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate }"/></td>  
						    </tr>
					  	</c:forEach>				    	   
					  </tbody>
					</table>		
				</div>
			</section>
		</div>
	</div>
<%@ include file="../../include/footer.jsp" %>