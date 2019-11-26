<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<div class="main">
		<section>
			<div class="container">
				<div class="text-center">
					<h3><strong>${qna.title }</strong></h3>
					<hr />
				</div>
				<div class="form-md">
					<div class="content-div"></div>
						${qna.content }
					</div>
					<hr />
					<div class="text-right">
					    <c:if test="${qna.writer == login.id}">
					  		<button type="button" class="btn btn-primary btn-lg" id="modifyBtn">글수정</button>
					  		<button type="button" class="btn btn-danger btn-lg" id="removeBtn">글삭제</button>
					    </c:if>
					  <button type="button" class="btn btn-secondary btn-lg" id="listBtn">목록으로</button>
					</div>
				</div>			
		</section>
	</div>
<form action="" method="post" id="form2">
	<input type="hidden" name="qno" value="${qna.qno }">
	<input type="hidden" name="pageNum" value="${cri.pageNum }"/>
	<input type="hidden" name="amount" value="${cri.amount }"/>
	<input type="hidden" name="type" value="${cri.type }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />	
</form>
<script>
$(function(){	
	var listBtn = $("#listBtn");
	var removeBtn = $("#removeBtn");
	var modifyBtn = $("#modifyBtn");
	var form2 = $("#form2");
	
	listBtn.click(function(){
		form2.attr("action", "/qna/list");
		form2.attr("method", "get");
		
		form2.submit();
	})
	
	removeBtn.click(function(){
		form2.attr("action", "/qna/remove");		
		form2.submit();
	})
	
	modifyBtn.click(function(){	
		form2.attr("action", "/qna/modify");
		form2.attr("method", "get");
		form2.submit();
	})
	
	
	

})
</script>

<%@ include file="../include/footer.jsp" %>>