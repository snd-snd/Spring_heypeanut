<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<div class="main">
		<section>
			<div class="container">
				<div class="text-center">
					<h3><strong>글수정</strong></h3>
					<hr />
				</div>
				<div class="form-md">
					<form action="">
					  <div class="form-group">
					    <input type="text" class="form-control" name="title" placeholder="제목" value="${qna.title }">
					  </div>
					  <div class="form-group">
					    <textarea name="content" id="edit"></textarea>
					  </div>
					  <input type="hidden" name="qno" value="${qna.qno}" />
					  <div class="text-right">
						  <button type="button" class="btn btn-primary btn-lg" id="modify">수정</button>
						  <button type="button" class="btn btn-secondary btn-lg" id="list">목록으로</button>
					  </div>
					</form>
				</div>
			</div>
		</section>
	</div>
<form action="" method="post" id="form">
	<input type="hidden" name="qno" value="${qna.qno }">
	<input type="hidden" name="title">
	<input type="hidden" name="content">
	<input type="hidden" name="pageNum" value="${criteria.pageNum }"/>
	<input type="hidden" name="amount" value="${criteria.amount }"/>
	<input type="hidden" name="type" value="${criteria.type }" />
	<input type="hidden" name="keyword" value="${criteria.keyword }" />	
</form>
<script>
$(function(){
	
	var content = '${qna.content}';
	
	CKEDITOR.replace('edit', {
		height: 400
	});
	
	CKEDITOR.instances.edit.setData(content);
	
	var btnModify = $("#modify");
	var btnList = $("#list");
	var form = $("form");
	
	btnModify.on("click",function(){
		var title = $("#title").val();
		var modifyContent = CKEDITOR.instances.edit.getData();
		
		$("input[name='title']").val(title);
		$("input[name='content']").val(modifyContent);
		
		form.submit();
	})
})
</script>

<%@ include file="../include/footer.jsp" %>>