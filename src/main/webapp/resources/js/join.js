/**
 * join.jsp 유효성 검증
 */

$(function(){
	$("#join").validate({
		//규칙지정
		rules:{			
			//userid : 필수요소, 입력값 검증(영대소문자,숫자를 사용해서 5~12까지 허용)
			id:{
				required: true,
				validId : true,
				remote:{ //$.ajax({})
					url : '/member/checkId',
					type : 'post',
					data:{
						id : function(){
							return $("#id").val();
						}
					}
				}
			},
			//password : 필수요소, 입력값 검증(영대소문자, 숫자, 특수문자 8~15까지 허용)
			password:{
				required: true,
				validPwd : true				
			},
			//confirm_password : password 검증규칙과 동일, password 입력값과 동일한지 검증
			confirmPassowrd:{
				required: true,
				validPwd : true,			
				equalTo: "#password"
			},
			//name : 필수요소, 2~4자리 허용
			name:{
				required: true,
				rangelength: [2,4]
			},
			//phone: 필수요소, 전화번호 검증
			phone:{
				required: true,
				validPhone: true
			},
			//email: 필수요소, 이메일 검증
			email:{
				required: true,
				validEmail: true
			},
			postcode:{
				required: true,
			},
			roadAddress:{
				required: true,
			},
			jibunAddress:{
				required: true,
			},
			detailAddress:{
				required: true,
			},
			consent:{
				required: true,
			}
		},
		//규칙에 위배되는 경우 보여줄 메세지 작성
		messages:{
			id:{
				required: "아이디를 기입해주세요.",	
				remote : "이 아이디는 사용중입니다." //false, null, undefined
			},
			password:{
				required:"비밀번호를 기입해주세요..",				
			},
			confirmPassowrd:{
				required : "비밀번호를 확인해주세요.",
				equalTo : "비밀번호와 일치하는지 확인해주세요."
			},
			name:{
				required : "이릉을 기입해주세요.",
				rangelength : "이름은 2~4자리로 입력해야 합니다."
			},
			phone:{
				required : "전화번호를 기입헤주세요"			
			},
			email:{
				required : "이메일을 기입해주세요."				
			},
			postcode:{
				required: "우편번호를 기입해주세요",
			},
			roadAddress:{
				required: "도로명 주소를 기입해주세요",
			},
			jibunAddress:{
				required: "지번 주소를 기입해주세요.",
			},
			detailAddress:{
				required: "상세 주소를 기입해주세요.",
			},
			consent:{
				required: "약관에 동의해주세요.",
			}
		},
		//에러 보여주는 위치 지정
		errorPlacement:function(error,element){
			$(element).closest("form").find("small[id='"+element.attr("id")+"Help"+"']").append(error);
		}
	});
});

$.validator.addMethod("validId", function(value) {
	var regId=/[A-Za-z\d]{5,12}/;
	return regId.test(value);
}, '아이디는 영문자, 숫자를 사용하여 5~12자리까지 사용가능합니다.');
$.validator.addMethod("validEmail", function(value) {
	var regEmail=/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	return regEmail.test(value);
}, '이메일 형식이 아닙니다.');
$.validator.addMethod("validPwd", function(value) {
	var regPwd=/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,14}$/;
	return regPwd.test(value);
}, '비밀번호는 영문자, 숫자 또는 특수문자를 사용하여 6~14자리까지 사용가능합니다.');
$.validator.addMethod("validPhone", function(value) {
	var regPhone=/(\d{3}).*(\d{3}).*(\d{4})/;
	return regPhone.test(value);
}, '전화번호 형식이 아닙니다.');



