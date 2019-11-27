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
					    <input type="text" class="form-control" id="title" placeholder="제목" value="${qna.title }">
					  </div>
					  <div class="form-group">
					    <textarea name="content" id="edit"></textarea>
					  </div>
					  <input type="hidden" name="qno" value="${qna.qno}" />
					  <div class="text-right">
						  <button type="button" class="btn btn-primary btn-lg" id="modifyBtn">수정</button>
						  <button type="button" class="btn btn-secondary btn-lg" id="listBtn">목록으로</button>
					  </div>
					</form>
				</div>
			</div>
		</section>
	</div>
<form action="" method="post" id="form2">
	<input type="hidden" name="qno" value="${qna.qno }">
	<input type="hidden" name="title">
	<input type="hidden" name="content">
	<input type="hidden" name="pageNum" value="${cri.pageNum }">
	<input type="hidden" name="amount" value="${cri.amount }">
	<input type="hidden" name="type" value="${cri.type }">
	<input type="hidden" name="keyword" value="${cri.keyword }">	
</form>
<script>
$(function(){
	
	var content = '${qna.content}';
	var form2 = $("#form2");
	
	CKEDITOR.replace('edit', {
		height: 400
	});
	
	CKEDITOR.instances.edit.setData(content);
	
	var btnModify = $("#modify");
	var btnList = $("#list");
	var form = $("form");
	
	$("#modifyBtn").on("click",function(){
		var title = $("#title").val();
		var modifyContent = CKEDITOR.instances.edit.getData();
		
		$("input[name='title']").val(title);
		$("input[name='content']").val(modifyContent);
		
		form2.submit();
	})
	
	$("#listBtn").click(function(){
		form2.attr("action", "/qna/list");
		form2.attr("method", "get");
		form2.submit();
	})
})
</script>

<%@ include file="../include/footer.jsp" %>>