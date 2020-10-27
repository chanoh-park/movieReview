<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- modal-title font -->
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
		color: #19CE60;
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

</style>

<script type="text/javascript">
	
	$( document ).ready( function() {
		
		/* 회원가입 이름 체크 */
		$('#name').focusout(function() {
			if(this.value == "") {
				$('#name-check').text("이름을 입력하세요.");
				$("#name-check").css("color", "red");
				$("#name").css("border", "2px solid red");
				$("#submit").attr("disabled", true);
			}
			else {
				$('#name-check').text("");
				$("#name").css("border", "2px solid #19CE60");
				$("#submit").attr("disabled", false);
			}
		});
		
		/* 회원가입 아이디 체크 */
		$('#userId').focusout(function() {
			
			var user_id = $("#userId").val();
			
			if(this.value == "") {
				$('#id-check').text("아이디를 입력하세요.");
				$("#id-check").css("color", "red");
				$("#userId").css("border", "2px solid red");
				$("#submit").attr("disabled", true);
			}
			else {
				/* ID 중복확인 */
				$.ajax({
					url : "/idCheck?userId=" + user_id,
					type : "get",
					dataType: "json",
					success : function(data) {
						console.log("hello");
						if (data == 1) {
							$("#id-check").text("이미 사용중인 아이디입니다.");
							$("#id-check").css("color", "red");
							$("#userId").css("border", "2px solid red");
							$("#submit").attr("disabled", true);
						}else {
							$("#id-check").text("사용 가능한 아이디입니다.");
							$("#id-check").css("color", "green");
							$("#userId").css("border", "2px solid #19CE60");
							$("#submit").attr("disabled", false);
						}
					}
				});
			}
		});
		
		/* login 아이디 체크 */
		$('#userId2').focusout(function() {
			if(this.value == "") {
				$('#id-check2').text("이름을 입력하세요.");
				$("#id-check2").css("color", "red");
				$("#userId2").css("border", "2px solid red");
				$("#submit").attr("disabled", true);
			}
			else {
				$('#id-check2').text("");
				$("#userId2").css("border", "2px solid #19CE60");
				$("#submit").attr("disabled", false);
			}
		});
		
		/* 회원가입 비밀번호 체크 */
		$('#userPw').focusout(function() {
			if(this.value == "") {
				$('#password-check').text("비밀번호를 입력하세요.");
				$("#password-check").css("color", "red");
				$("#userPw").css("border", "2px solid red");
				$("#submit").attr("disabled", true);
			}
			else {
				$('#password-check').text("");
				$("#userPw").css("border", "2px solid #19CE60");
				$("#submit").attr("disabled", false);
			}
		});
		
		/* login 비밀번호 체크 */
		$('#userPw2').focusout(function() {
			if(this.value == "") {
				$('#password-check2').text("비밀번호를 입력하세요.");
				$("#password-check2").css("color", "red");
				$("#userPw2").css("border", "2px solid red");
				$("#submit").attr("disabled", true);
			}
			else {
				$('#password-check2').text("");
				$("#userPw2").css("border", "2px solid #19CE60");
				$("#submit").attr("disabled", false);
			}
		});
		
		/* 다른 모달창 띄우면 현재 열려있는 모달창 닫기 */
		$('.userLoginBtn').click(function() {
			$('#exampleModal').modal("hide");
			$('#exampleModal2').modal("show");
		});
		
		$('.userJoinBtn').click(function() {
			$('#exampleModal2').modal("hide");
			$('#exampleModal').modal("show");
		});
		
	});
	
</script>

<body>

<%@ include file="includes/navbar.jsp" %>
<%@ include file="includes/login.jsp" %>
<%@ include file="includes/register.jsp" %>

</body>
</html>