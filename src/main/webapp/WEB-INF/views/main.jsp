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
	
	.userLogin {
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
	<%--
	function fn_idChk() {
		$.ajax({
			url : "/member/idChk",
			type : "post",
			dataType : "json",
			data : {"userId" : $("#userId").val()},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.")
				}
			}
		});
	}
	--%>
	
	<%-- feedback form --%>
	(function() {
	  'use strict';
	  window.addEventListener('load', function() {
	    // Fetch all the forms we want to apply custom Bootstrap validation styles to
	    var forms = document.getElementsByClassName('needs-validation');
	    // Loop over them and prevent submission
	    var validation = Array.prototype.filter.call(forms, function(form) {
	      form.addEventListener('submit', function(event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	        }
	        form.classList.add('was-validated');
	      }, false);
	    });
	  }, false);
	})();
</script>

<body>

	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModal">회원가입</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" style="width: 375px; height: 619px;">
			<div class="modal-content">
			
				<div class="modal-title" id="exampleModalLabel">CHOONGANG<br /> PEDIA</div>
				
				<div class="part-title">회원가입</div>
				
				<div class="modal-body">
					<div class="container">
						<form action="/main" method="post" id="regForm" class="needs-validation" novalidate>
							<div class="form-group has-feedback">
							 	<input class="form-control" type="text" id="name" name="name" placeholder="이름" autocomplete="off" required />
							 	<div class="invalid-feedback">
							        이름을 입력하세요.
							    </div>
							</div>
							<div class="form-group has-feedback">
								<input class="form-control" type="text" id="userId" name="userId" placeholder="아이디" autocomplete="off" required />
								<div class="invalid-feedback">
							        아이디를 입력하세요.
							    </div>
								<!-- <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>  -->
							</div>
							<div class="form-group has-feedback">
								<input class="form-control" type="password" id="userPw" name="userPw" placeholder="비밀번호" autocomplete="off" required />
								<div class="invalid-feedback">
							        비밀번호를 입력하세요.
							    </div>
							</div>
							<div class="form-group has-feedback">
								<button class="btn" type="submit" id="submit" style="color: white; background: #19CE60; width: 311px;">회원가입</button>
 							</div>
 							<div class="userLogin">이미 가입 하셨나요?<a href="" style="color: #19CE60;">로그인</a></div>
 							<div class="hr-sect">OR</div>
 							<a href = "https://kauth.kakao.com/oauth/authorize?client_id=295d53cb156ca5e83e6bb8370e8bcc18&redirect_uri=https://localhost:8080/kakaologin&response_type=code">
						        <img src="/resources/images/kakao_login_medium_wide.png" alt="" style="width: 311px;"/>
						    </a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>