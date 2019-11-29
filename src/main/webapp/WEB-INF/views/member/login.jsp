<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<div class="main">
		<div class="container">
			<div class="text-center">
				<h3><strong>로그인</strong></h3>
			</div>
			<hr />
			<section>
				<div class="login-form">
					<form method="post">
					  <div class="form-group">
					    <input type="text" class="form-control" id="id" name="id" aria-describedby="idHelp" placeholder="아이디">
					    <small id="idHelp" class="form-text text-muted"></small>
					  </div>
					  <div class="form-group">
					    <input type="password" class="form-control" id="password" name="password" aria-describedby="passwordHelp" placeholder="비밀번호">
					    <small id="passwordHelp" class="form-text text-muted"></small>
					  </div>
					  <div class="form-group">
					  	<button type="submit" class="btn btn-primary btn-block">로그인</button>
					  </div>
					</form>		
					<div>						
					  	<button type="button" class="btn btn-outline-secondary login-button" onclick="location.href='/member/joinInfo'">회원가입</button>
					  	<button type="button" class="btn btn-outline-secondary login-button" onclick="alert('구현준비중')">아이디/비밀번호 찾기</button>						
					</div>	
				</div>
			</section>
			<section>
				<div class="text-center">		
					<h3><strong>SNS 로그인</strong></h3>
					<a href="#" onclick="alert('구현준비중')"><img src="/resources/img/facebook.png" alt="" width="50" height="50"/></a>
					<a href="#" onclick="alert('구현준비중')"><img src="/resources/img/naver.png" alt="" width="50" height="50"/></a>
					<a href="#" onclick="alert('구현준비중')"><img src="/resources/img/kakao.png" alt="" width="50" height="50"/></a>
				</div>
			</section>
		</div>
	</div>
<script>
	$(function(){
		var authmsg = '${authmsg}';
		if (authmsg.length != 0){
			alert(authmsg);
		}
	})
</script>
<%@ include file="../include/footer.jsp" %>