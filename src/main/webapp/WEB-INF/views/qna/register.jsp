<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<div class="main">
		<section>
			<div class="container">
				<div class="text-center">
					<h3><strong>글쓰기</strong></h3>
					<hr />
				</div>
				<div class="form-md">
					<form action="" method="post" id="form">
					  <div class="form-group">
					    <input type="text" class="form-control" name="title" placeholder="제목">
					  </div>
					  <div class="form-group">
					    <textarea name="content" id="edit"></textarea>
					  </div>
					  <input type="hidden" name="writer" value="${login.id }" />
					  <div class="text-right">
						  <button type="button" class="btn btn-primary btn-lg" id="register">글작성</button>
						  <button type="button" class="btn btn-secondary btn-lg" id="listBtn">목록으로</button>
					  </div>
					</form>
				</div>
			</div>
		</section>
	</div>
<form action="" id="form2">
	<input type="hidden" name="pageNum" value="${cri.pageNum }"/>
	<input type="hidden" name="amount" value="${cri.amount }"/>
	<input type="hidden" name="type" value="${cri.type }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />	
</form>
<script>
$(function(){		
	
	var form2 = $("#form2");
	
	CKEDITOR.replace('edit', {
		height: 400
	});	
	
	$("#register").on("click",function(){				
		var content = CKEDITOR.instances.edit.getData();

		$("#edit").val(content);		
		form2.submit();
	})
	
	$("#listBtn").click(function(){
		form2.attr("action", "/qna/list");	
		form2.submit();
	})

})
</script>

<%@ include file="../include/footer.jsp" %>>