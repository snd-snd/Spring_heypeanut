<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
	<div class="main">
		<div class="container">
			<h3><strong>상품등록</strong></h3>
			<hr />
			<div class="form-md">
				<form action="" method="post">
					<div class="form-group">
						<select class="form-control" name="category">
							<option value="견과류">견과류</option>
							<option value="건과류">건과류</option>
							<option value="건어물">건어물</option>
							<option value="건강분말">건강분말</option>
							<option value="스낵류">스낵류</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="pname"  placeholder="상품명">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="price"  placeholder="가격">
					</div>
					<div class="form-group dragzone">
						
					</div>
					<div class="form-group text-center" style="width:200px;">
						<small class="text-muted">이미지를 올려주세요</small>
					</div>
					<div class="form-group text-right">
						<button type="submit" class="btn btn-danger btn-lg">상품등록</button>
					</div>
				</form>
			</div>		
		</div>
	</div>

<script>
$(function(){
	var form = $("form");
	
	$("button").on("click", function(e){
		e.preventDefault();
		
		var formData = new FormData();		
		formData.append("uploadFile", file);
				
		//ajax를 이용하여 form 보내기
		$.ajax({
			url:'/upload',
			processData:false,
			contentType:false,
			type:'post',
			data:formData,
			dataType:'json',
			success:function(file){
				var content = "";
				
				content += "<input type='hidden' name='attach.uuid' value='"+file.uuid+"'>";
				content += "<input type='hidden' name='attach.uploadPath' value='"+file.uploadPath+"'>";
				content += "<input type='hidden' name='attach.fileName' value='"+file.fileName+"'>";
			
				form.append(content);				
				form.submit();
			},
			error:function(request,status,error){
				alert(status);
			}
		});
		
		
	})	
})
</script>
<script>
var file;

$('.dragzone')
.on("dragover", dragOver)
.on("dragleave", dragOver)
.on("drop", uploadFiles);

function dragOver(e) {
    e.stopPropagation();
    e.preventDefault();
    if (e.type == "dragover") {
        $(e.target).css({
            "background-color": "black",
            "outline-offset": "-0px"
        });
    } else {
        $(e.target).css({
            "background-color": "white",
            "outline-offset": "0px"
        });
    }
}

function uploadFiles(e) {
    e.stopPropagation();
    e.preventDefault();
    dragOver(e); //1
 
    e.dataTransfer = e.originalEvent.dataTransfer; //2
    var files = e.target.files || e.dataTransfer.files;
 	console.log(files);
    if (files.length > 1) {
        alert('하나만 올려라.');
        return;
    }
    
    if (files[0].type.match(/image.*/)) {
        $(e.target).css({
            "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
            "outline": "none",
            "background-size": "100% 100%"
        });
        
        file = files[0];
        
    }else{
      alert('이미지가 아닙니다.');
      return;
    }
}
</script>

<%@ include file="../../include/footer.jsp" %>