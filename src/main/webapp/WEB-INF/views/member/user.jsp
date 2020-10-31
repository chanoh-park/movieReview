<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<title>회원정보</title>
</head>

<style type="text/css">

	.jumbotron {
	
		width: 640px;
		height: 618px;
		margin-left: 35%;
	
	}
	
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

</style>

<script type="text/javascript">
	
	$( document ).ready(function() {
		
		/* 비밀번호 확인 */
		$('#userPw5').focusout(function() {
			
			if(this.value == "") {
				$('#password-check5').text("비밀번호를 입력하세요.");
				$("#password-check5").css("color", "red");
				$("#userPw5").css("border", "2px solid red");
				$("#pwCheck").attr("disabled", true);
			}
			else {
				$.ajax({
					url : "/pwCheck",
					type : "post",
					dataType : "json",
					data : $("#exampleModal5").serializeArray(),
					success : function(data) {
						if (data == 0) {
							$("#password-check5").text("비밀번호가 틀렸습니다.");
							$("#password-check5").css("color", "red");
							$("#userPw5").css("border", "2px solid red");
							$("#pwCheck").attr("disabled", true);
						} else {
							$("#password-check5").text("");
							$("#password-check5").css("color", "green");
							$("#userPw5").css("border", "2px solid #19CE60");
							$("#pwCheck").attr("disabled", false);
						}
					}
				});
			}
		});
		
		/* 회원정보 수정 이름 체크 */
		$('#name4').focusout(function() {
			if(this.value == "") {
				$("#name-check4").text("이름을 입력하세요.");
				$("#name-check4").css("color", "red");
				$("#name4").css("border", "2px solid red");
				$("#submit").attr("disabled", true);
			}
			else {
				$("#name-check4").text("");
				$("#name4").css("border", "2px solid #19CE60");
				$("#submit").attr("disabled", false);
			}
		});
		
		/* 회원정보 수정 비밀번호 체크 */
		$('#userPw4').focusout(function() {
			if(this.value == "") {
				$('#password-check4').text("비밀번호를 입력하세요.");
				$("#password-check4").css("color", "red");
				$("#userPw4").css("border", "2px solid red");
				$("#submit").attr("disabled", true);
			}
			else {
				$('#password-check4').text("");
				$("#userPw4").css("border", "2px solid #19CE60");
				$("#submit").attr("disabled", false);
			}
		});
		
		/* 다른 모달창 띄우면 현재 열려있는 모달창 닫기 */
		/* 설정 -> 회원정보 수정 */
		$('.userUpdate').click(function() {
			$('#exampleModal3').modal("hide");
			$('#exampleModal4').modal("show");
		});
		
		/* 설정 -> 회원탈퇴 */
		$('.userDelete').click(function() {
			$('#exampleModal3').modal("hide");
			$('#exampleModal5').modal("show");
		});
		
		/* 비밀번호 확인 -> 회원탈퇴 확인 */
		$('#pwCheck').click(function() {
			$('#exampleModal5').modal("hide");
			$('#exampleModal6').modal("show");
		});
		
	});
	
</script>

<body class="bg-light">

<%@ include file="../includes/navbar.jsp" %>

<div class="jumbotron jumbotron-fluid my-3 shadow p-3">
  <div class="container">
  	<!-- 설정 Button trigger modal -->
	<i class="fas fa-cogs" style="float: right; cursor:pointer;" data-toggle="modal" data-target="#exampleModal3"></i>
    <h1 class="display-4">Fluid jumbotron</h1>
    <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
  </div>
</div>

<!-- 설정 Modal -->
<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-size: 30px; font-family: 'Do Hyeon', sans-serif;">설정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="font-size: 20px; font-family: 'Do Hyeon', sans-serif;">
      	<!-- 회원정보 수정 Button trigger modal -->
        <div class="userUpdate" style="cursor: pointer" data-toggle="modal" data-target="#exampleModal4">회원정보 수정</div>
        <hr>
        <div class="userDelete" style="cursor: pointer" data-toggle="modal" data-target="#exampleModal5">회원탈퇴</div>
        <hr>
        <div style="cursor: pointer" onclick="location.href='/logout'">로그아웃</div>
        <hr>
      </div>
    </div>
  </div>
</div>

<!-- 회원정보 수정 Modal -->
<div class="modal fade" id="exampleModal4" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="width: 375px; height: 619px;">
		<div class="modal-content">
		
			<div class="modal-title" id="exampleModalLabel">CHOONGANG<br /> PEDIA</div>
			
			<div class="part-title">회원정보 수정</div>
			
			<div class="modal-body">
				<div class="container">
					<form action="/memberUpdate" method="post" class="needs-validation" novalidate>
						<div class="form-group has-feedback">
							<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly" />
						</div>
						<div class="form-group has-feedback">
						 	<input class="form-control" type="text" id="name4" name="name" placeholder="이름" autocomplete="off" required />
						 	<div id='name-check4'>
						    </div>
						</div>
						<div class="form-group has-feedback">
							<input class="form-control" type="password" id="userPw4" name="userPw" placeholder="비밀번호" autocomplete="off" required />
							<div id='password-check4'>
						    </div>
						</div>
						<div class="form-group has-feedback">
							<button class="btn" type="submit" id="submit" style="color: white; background: #19CE60; width: 311px; font-family: 'Do Hyeon', sans-serif;">회원정보 수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 비밀번호 확인 Modal -->
<div class="modal fade" id="exampleModal5" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="width: 375px; height: 619px;">
		<div class="modal-content">
		
			<div class="modal-title" id="exampleModalLabel">CHOONGANG<br /> PEDIA</div>
			
			<div class="part-title">비밀번호 확인</div>
			
			<div class="modal-body">
				<div class="container">
					<form action="/memberDelete" method="post" class="needs-validation" novalidate>
						<div class="form-group has-feedback">
							<input class="form-control" type="hidden" id="userId5" name="userId" value="${member.userId }" />
							<input class="form-control" type="hidden" id="name5" name="name" value="${member.name }" />
							<input class="form-control" type="password" id="userPw5" name="userPw" placeholder="비밀번호" autocomplete="off" required />
							<div id='password-check5'>
						    </div>
						</div>
						<div class="form-group has-feedback">
							<button class="btn" type="submit" id="pwCheck" style="color: white; background: #19CE60; width: 311px; font-family: 'Do Hyeon', sans-serif;"
								data-toggle="modal" data-target="#exampleModal6">확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 회원탈퇴 Modal 
<div class="modal fade" id="exampleModal6" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="width: 375px; height: 619px;">
		<div class="modal-content">
		
			<div class="modal-title" id="exampleModalLabel">CHOONGANG<br /> PEDIA</div>
			
			<div class="part-title">회원탈퇴</div>
			
			<div class="modal-body">
				<div class="container">
					<form action="/memberDelete" method="post" class="needs-validation" novalidate>
						<div style="text-align: center; font-family: 'Do Hyeon', sans-serif;">회원탈퇴 하시겠습니까?</div>
						<div class="form-group has-feedback">
							<button class="btn" type="submit" style="color: white; background: #19CE60; width: 311px; font-family: 'Do Hyeon', sans-serif;">확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>-->

</body>
</html>