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
					<div class="reply-content">
						
					</div>
					<div class="admin-reply">
						
					</div>
					<div class="text-right">
						<c:if test="${login.id == 'admin'}">
					  		<button type="button" class="btn btn-success btn-lg" id="replyBtn">답글</button>
					  	</c:if>
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
	var qno = '${qna.qno}';
	var id = '${login.id}';
	
	listBtn.click(function(){
		form2.attr("action", "/qna/list");
		form2.attr("method", "get");
		
		form2.submit();
	})
	
	removeBtn.click(function(){
		var flag = confirm("정말 삭제하시겠습니까?");
		if (!flag) return;
		form2.attr("action", "/qna/remove");		
		form2.submit();
	})
	
	modifyBtn.click(function(){	
		form2.attr("action", "/qna/modify");
		form2.attr("method", "get");
		form2.submit();
	})
	
	var replyBtn = $("#replyBtn");
	var admin_reply = $(".admin-reply");
	var reply_content = $(".reply-content");
	
	replyBtn.click(function(){
		
		var html = ""
		html += "<div class='form-group'>";
		html += "<textarea class='form-control' rows='5'></textarea>";
		html += "</div>";
		html += "<div class='form-group text-right'>";
		html += "<button type='button' class='btn btn-info btn-lg' data-oper='register'>등록</button>";
		html += "<button type='button' class='btn btn-dark btn-lg' data-oper='cancel'>취소</button>";
		html += "</div>";
		
		admin_reply.html(html);	
	});
	
	select(qno);
	
	admin_reply.on("click", "button", function(){
		var oper = $(this).data("oper");
		
		if (oper == 'register'){
			var content = admin_reply.find("textarea").val();
			
			var reply = {
				content : content,
				qno : qno
			};
			
			$.ajax({
				type : 'post',
				url : '/reply/add',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify(reply),
				success : function(data){
					admin_reply.html("");
					select(qno);
				}
			});
			
			
		} else if (oper == 'cancel'){
			admin_reply.html("");
		}
	})
	
	reply_content.on("click", "a", function(e){
		e.preventDefault();
		
		var rno = $(this).attr("href");		 
		$.ajax({
				type : 'delete',
				url : '/reply/delete/'+rno,
				success : function(data){				
					select(qno);
				}
		});		 
	})
	
	function select(qno){
				
		$.getJSON({
			type : 'get',
			url : '/reply/select?qno='+qno,
			success : function(data){
				var html = "";
				
				html += "<table class='table table-borderless'>";
				
				for (var i=0; i<data.length; i++){
					html += "<tr>";
					html += "<td>관리자</td>";
					html += "<td>"+data[i].content+"</td>";
					if (id == 'admin'){
						html += "<td><a href='"+data[i].rno+"'><i class='fas fa-times'></i></a></td>";
					}
					html += "</tr>";					
				}
				html += "</table>";
				
				reply_content.html(html);
			}
		});
	};

})
</script>

<%@ include file="../include/footer.jsp" %>>