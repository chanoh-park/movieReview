<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- modal-title font, navbar-brand font -->
<link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&display=swap" rel="stylesheet">

<!-- 기본 font -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<!-- bootstrap -->
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
	
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
	
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
	
<script
	src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>

<title>중앙피디아</title>
</head>

<style>
	
	.modal-title {
		font-family: 'Luckiest Guy', cursive;
		font-size: 40px;
		color: #1A2F63;
		margin-top: 20px; 
		text-align: center;
	}
	
	.part-title {
		font-family: 'Do Hyeon', sans-serif;
		font-size: 20px;
		font-weight: bold;
		color: black;
		margin-top: 10px;
		margin-bottom: 10px;
		text-align: center;
	}
	
	.form-control {
		font-family: 'Do Hyeon', sans-serif;
		background: #F5F5F5;
	}
	
	.userLogin, .userJoin {
		font-family: 'Do Hyeon', sans-serif;
		font-size: 15px;
		text-align: center;
	}
	
	.hr-sect {
		display: flex;
		flex-basis: 100%;
		align-items: center;
		color: rgba(0, 0, 0, 0.35);
		font-size: 12px;
		margin: 8px 0px;
	}
	
	.hr-sect::before,
	.hr-sect::after {
		font-family: 'Do Hyeon', sans-serif;
		content: "";
		flex-grow: 1;
		background: rgba(0, 0, 0, 0.35);
		height: 1px;
		font-size: 0px;
		line-height: 0px;
		margin: 0px 16px;
	}
	
	.navbar-brand {
		font-family: 'Luckiest Guy', cursive;
	}
	
</style>

<script type="text/javascript">
	
	$( document ).ready(function() {
		
		/* 회원가입 이름 체크 */
		$('#joinName').focusout(function() {
			if(this.value == "") {
				$('#join-name-check').text("이름을 입력하세요.");
				$("#join-name-check").css("color", "red");
				$("#joinName").css("border", "2px solid red");
				$("#joinSubmit").attr("disabled", true);
			}
			else {
				$('#join-name-check').text("");
				$("#joinName").css("border", "2px solid #19CE60");
				$("#joinSubmit").attr("disabled", true);
			}
		});
		
		/* 회원가입 아이디 체크 */
		$('#joinUserId').focusout(function() {
			
			var user_id = $("#joinUserId").val();
			
			if(this.value == "") {
				$('#join-id-check').text("아이디를 입력하세요.");
				$("#join-id-check").css("color", "red");
				$("#joinUserId").css("border", "2px solid red");
				$("#joinSubmit").attr("disabled", true);
			}
			else {
				/* ID 중복확인 */
				$.ajax({
					url : "/idCheck?userId=" + user_id,
					type : "get",
					dataType: "json",
					success : function(data) {
						if (data == 1) {
							$("#join-id-check").text("이미 사용중인 아이디입니다.");
							$("#join-id-check").css("color", "red");
							$("#joinUserId").css("border", "2px solid red");
							$("#joinSubmit").attr("disabled", true);
						}else {
							$("#join-id-check").text("사용 가능한 아이디입니다.");
							$("#join-id-check").css("color", "green");
							$("#joinUserId").css("border", "2px solid #19CE60");
							$("#joinSubmit").attr("disabled", true);
						}
					}
				});
			}
		});
		
		/* 회원가입 비밀번호 체크 */
		$('#joinUserPw').focusout(function() {
			if(this.value == "") {
				$('#join-password-check').text("비밀번호를 입력하세요.");
				$("#join-password-check").css("color", "red");
				$("#joinUserPw").css("border", "2px solid red");
				$("#joinSubmit").attr("disabled", true);
			}
			else {
				$('#join-password-check').text("");
				$("#joinUserPw").css("border", "2px solid #19CE60");
				$("#joinSubmit").attr("disabled", false);
			}
		});
		
		/* 회원가입 버튼 눌렀을 때 이름, 아이디, 비밀번호 체크 */
		$('#joinSubmit').click(function() {
			if($('#joinName').val() == "") {
				$('#join-name-check').text("이름을 입력하세요.");
				$("#join-name-check").css("color", "red");
				$("#joinName").css("border", "2px solid red");
				$("#joinSubmit").attr("disabled", true);
			}
		});
		
		/* login 아이디 체크 */
		$('#loginUserId').focusout(function() {
			if(this.value == "") {
				$('#login-id-check').text("아이디를 입력하세요.");
				$("#login-id-check").css("color", "red");
				$("#loginUserId").css("border", "2px solid red");
				$("#submit").attr("disabled", true);
			}
			else {
				$('#login-id-check').text("");
				$("#loginUserId").css("border", "2px solid #19CE60");
				$("#submit").attr("disabled", false);
			}
		});
		
		/* login 비밀번호 체크 */
		$('#loginUserPw').focusout(function() {
			if(this.value == "") {
				$('#login-password-check').text("비밀번호를 입력하세요.");
				$("#login-password-check").css("color", "red");
				$("#loginUserPw").css("border", "2px solid red");
				$("#submit").attr("disabled", true);
			}
			else {
				$('#login-password-check').text("");
				$("#loginUserPw").css("border", "2px solid #19CE60");
				$("#submit").attr("disabled", false);
			}
		});
		
		/* login 할 때 아이디와 비밀번호 맞는지 확인 */
		$('#loginBtn').click(function() {
			$.ajax({
				url : "/loginCheck",
				type : "post",
				dataType : "json",
				data : $("form[name=loginCheck]").serialize(),
				success : function(data) {
					if (data == 0) {
						$('#loginForm').modal("hide");
						$('#loginFailForm').modal("show");
					} else {
						$('#login').submit();
					}
				}
			});
		});
		
		/* 모달창 닫으면 입력값 초기화 */
		$('.modal').on('hidden.bs.modal', function (e) {
			$(this).find('form')[0].reset()
			
			$('#join-name-check').text("");
			$("#joinName").css("border", "");
			
			$('#join-id-check').text("");
			$("#joinUserId").css("border", "");
			
			$('#join-password-check').text("");
			$("#joinUserPw").css("border", "");
			
			$('#login-id-check').text("");
			$("#loginUserId").css("border", "");
			
			$('#login-password-check').text("");
			$("#loginUserPw").css("border", "");
		});
		
		/* 다른 모달창 띄우면 현재 열려있는 모달창 닫기 */
		/* 로그인 -> 회원가입 */
		$('.userLoginBtn').click(function() {
			$('#joinForm').modal("hide");
			$('#loginForm').modal("show");
		});
		
		/* 회원가입 -> 로그인 */
		$('.userJoinBtn').click(function() {
			$('#loginForm').modal("hide");
			$('#joinForm').modal("show");
		});
		
		/* 로그인 실패 -> 로그인 */
		$('#loginFailBtn').click(function() {
			$('#loginFailForm').modal("hide");
			$('#loginForm').modal("show");
		});
		
	});
	
</script>

<body>

<%@ include file="includes/navbar.jsp" %>
<%@ include file="includes/login.jsp" %>
<%@ include file="includes/register.jsp" %>
<%@ include file="includes/footer.jsp" %>

</body>
</html>