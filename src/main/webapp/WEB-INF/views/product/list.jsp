<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    
	<div class="main">	
		<div class="text-center">
			<h3>${cate.category }</h3>
			<hr />
		</div>
		<section>
			<div class="container">
				<div class="row">
					<c:forEach items="${list }" var="pro">
						<div class="col-md-3">
							<div class="img">
								<div class="scale">
									<a href="/product/detail?pno=${pro.pno }" class="">
						      			<img src="/display?pno=${pro.pno }" alt="..." class="img-thumbnail">
						  			</a>
					  			</div>
				  			</div>
				  			<div class="text-center">
				  				<p class="">${pro.pname }<br/><span class="pname"><fmt:formatNumber pattern="#,###원" value="${pro.price }"/></span></p>
				  			</div>
						</div>		
					</c:forEach>								
				</div>	
			</div>
		</section> 
	</div>
<%@ include file="../include/footer.jsp" %>