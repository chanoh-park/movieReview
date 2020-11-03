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
		$('#pwCheckBtn').click(function() {
			
			if($('#pwCheckUserPw').val() == "") {
				$('#pwCheck-password-check').text("비밀번호를 입력하세요.");
				$("#pwCheck-password-check").css("color", "red");
				$("#pwCheckUserPw").css("border", "2px solid red");
			} else {
				$.ajax({
					url : "/pwCheck",
					type : "post",
					dataType : "json",
					data : $("form[name=pwCheck]").serialize(),
					success : function(data) {
						if (data == 0) {
							$("#pwCheck-password-check").text("비밀번호가 틀렸습니다.");
							$("#pwCheck-password-check").css("color", "red");
							$("#pwCheckUserPw").css("border", "2px solid red");
						} else {
							$("#pwCheck-password-check").text("");
							$("#pwCheck-password-check").css("color", "green");
							$("#pwCheckUserPw").css("border", "2px solid #19CE60");
							
							/* 비밀번호 확인 -> 회원탈퇴 확인 */
							$('#pwCheckForm').modal("hide");
							$('#deleteForm').modal("show");
							
						}
					}
				});
			}
		});
		
		/* 회원정보 수정 이름 체크 */
		$('#updateName').focusout(function() {
			if(this.value == "") {
				$("#update-name-check").text("이름을 입력하세요.");
				$("#update-name-check").css("color", "red");
				$("#updateName").css("border", "2px solid red");
				$("#submit").attr("disabled", true);
			}
			else {
				$("#update-name-check").text("");
				$("#updateName").css("border", "2px solid #19CE60");
				$("#submit").attr("disabled", false);
			}
		});
		
		/* 회원정보 수정 비밀번호 체크 */
		$('#updateUserPw').focusout(function() {
			if(this.value == "") {
				$('#update-password-check').text("비밀번호를 입력하세요.");
				$("#update-password-check").css("color", "red");
				$("#updateUserPw").css("border", "2px solid red");
				$("#submit").attr("disabled", true);
			}
			else {
				$('#update-password-check').text("");
				$("#updateUserPw").css("border", "2px solid #19CE60");
				$("#submit").attr("disabled", false);
			}
		});
		
		/* 다른 모달창 띄우면 현재 열려있는 모달창 닫기 */
		/* 설정 -> 회원정보 수정 */
		$('.userUpdate').click(function() {
			$('#settingForm').modal("hide");
			$('#updateForm').modal("show");
		});
		
		/* 설정 -> 회원탈퇴 */
		$('.userDelete').click(function() {
			$('#settingForm').modal("hide");
			$('#pwCheckForm').modal("show");
		});
		
	});
	
</script>

<body class="bg-light">

<%@ include file="../includes/navbar.jsp" %>

<div class="jumbotron jumbotron-fluid my-3 shadow p-3">
  <div class="container">
  	<!-- 설정 Button trigger modal -->
	<i class="fas fa-cogs" style="float: right; cursor:pointer;" data-toggle="modal" data-target="#settingForm"></i>
    <h1 class="display-4">Fluid jumbotron</h1>
    <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
  </div>
</div>

<!-- 설정 Modal -->
<div class="modal fade" id="settingForm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
        <div class="userUpdate" style="cursor: pointer" data-toggle="modal" data-target="#updateForm">회원정보 수정</div>
        <hr>
        <div class="userDelete" style="cursor: pointer" data-toggle="modal" data-target="#pwCheckForm">회원탈퇴</div>
        <hr>
        <div style="cursor: pointer" onclick="location.href='/logout'">로그아웃</div>
        <hr>
      </div>
    </div>
  </div>
</div>

<!-- 회원정보 수정 Modal -->
<div class="modal fade" id="updateForm" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="width: 375px; height: 619px;">
		<div class="modal-content">
		
			<div class="modal-title" id="exampleModalLabel">CHOONGANG<br /> PEDIA</div>
			
			<div class="part-title">회원정보 수정</div>
			
			<div class="modal-body">
				<div class="container">
					<form action="/memberUpdate" method="post" class="needs-validation" novalidate>
						<div class="form-group has-feedback">
							<input class="form-control" type="text" id="updateUserId" name="userId" value="${member.userId}" readonly="readonly" />
						</div>
						<div class="form-group has-feedback">
						 	<input class="form-control" type="text" id="updateName" name="name" placeholder="이름" autocomplete="off" required />
						 	<div id='update-name-check'>
						    </div>
						</div>
						<div class="form-group has-feedback">
							<input class="form-control" type="password" id="updateUserPw" name="userPw" placeholder="비밀번호" autocomplete="off" required />
							<div id='update-password-check'>
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
<div class="modal fade" id="pwCheckForm" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="width: 375px; height: 619px;">
		<div class="modal-content">
		
			<div class="modal-title" id="exampleModalLabel">CHOONGANG<br /> PEDIA</div>
			
			<div class="part-title">비밀번호 확인</div>
			
			<div class="modal-body">
				<div class="container">
					<form action="#" method="post" class="needs-validation" name="pwCheck" novalidate>
						<div class="form-group has-feedback">
							<input class="form-control" type="hidden" id="pwCheckUserId" name="userId" value="${member.userId }" />
							<input class="form-control" type="hidden" id="pwCheckName" name="name" value="${member.name }" />
							<input class="form-control" type="password" id="pwCheckUserPw" name="userPw" placeholder="비밀번호" autocomplete="off" required />
							<div id='pwCheck-password-check'>
						    </div>
						</div>
						<div class="form-group has-feedback">
							<button class="btn" type="button" id="pwCheckBtn" style="color: white; background: #19CE60; width: 311px; font-family: 'Do Hyeon', sans-serif;">확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 회원탈퇴 Modal -->
<div class="modal fade" id="deleteForm" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="width: 375px; height: 619px;">
		<div class="modal-content">
		
			<div class="modal-title" id="exampleModalLabel">CHOONGANG<br /> PEDIA</div>
			
			<div class="part-title">회원탈퇴</div>
			
			<div class="modal-body">
				<div class="container">
					<form action="/memberDelete" method="post" class="needs-validation" novalidate>
						<input class="form-control" type="hidden" id="deleteUserId" name="userId" value="${member.userId }" />
							<input class="form-control" type="hidden" id="deleteName" name="name" value="${member.name }" />
							<input class="form-control" type="hidden" id="pwCheckUserPw" name="userPw" value="${member.userPw }" />
						<div style="text-align: center; font-family: 'Do Hyeon', sans-serif; font-size: 25px; margin-bottom: 20px;">회원탈퇴 하시겠습니까?</div>
						<div class="form-group has-feedback">
							<button class="btn" type="submit" style="color: white; background: #19CE60; width: 311px; font-family: 'Do Hyeon', sans-serif; margin-bottom: 10px;">확인</button>
							<button class="btn btn-danger" type="button" id="cancle" style="color: white; width: 311px; font-family: 'Do Hyeon', sans-serif;" onclick="location.href='/member/user'">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>