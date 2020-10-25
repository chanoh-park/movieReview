<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	
	
	$( document ).ready( function() {
		
		/* 빈 값 체크 */
		$('#name').focusout(function() {
			if(this.value == "") {
				$('#name-check').text("이름을 입력하세요.");
				$("#name-check").css("color", "red");
			}
			else {
				$('#name-check').text("");
			}
		});
		
		$('#userId').focusout(function() {
			
			var user_id = $("#userId").val();
			
			if(this.value == "") {
				$('#id-check').text("아이디를 입력하세요.");
				$("#id-check").css("color", "red");
			}
			else {
				$.ajax({
					url : "/idCheck?userId=" + user_id,
					type : "get",
					dataType: "json",
					success : function(data) {
						console.log("hello");
						if (data == 1) {
							$("#id-check").text("이미 사용중인 아이디입니다.");
							$("#id-check").css("color", "red");
						}else {
							$("#id-check").text("사용 가능한 아이디입니다.");
							$("#id-check").css("color", "green");
						}
					}
				});
			}
		});
		
		$('#userPw').focusout(function() {
			if(this.value == "") {
				$('#password-check').text("비밀번호를 입력하세요.");
				$("#password-check").css("color", "red");
			}
			else {
				$('#password-check').text("");
			}
		});
		
	});
	
</script>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal"
	data-target="#exampleModal">회원가입</button>
	<a href = "/logout">로그아웃</a>

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
						 	<div id='name-check'>
						    </div>
						</div>
						<div class="form-group has-feedback">
							<input class="form-control" type="text" id="userId" name="userId" placeholder="아이디" autocomplete="off" required />
							<div id='id-check'>
						    </div>
						    <div id="temp"></div>
						</div>
						<div class="form-group has-feedback">
							<input class="form-control" type="password" id="userPw" name="userPw" placeholder="비밀번호" autocomplete="off" required />
							<div id='password-check'>
						    </div>
						</div>
						<div class="form-group has-feedback">
							<button class="btn" type="submit" id="submit" style="color: white; background: #19CE60; width: 311px; font-family: 'Do Hyeon', sans-serif;">회원가입</button>
						</div>
						<div class="userLogin">이미 가입 하셨나요?<a href="" style="color: #19CE60;">로그인</a></div>
						<div class="hr-sect">OR</div>
						<a href = "https://kauth.kakao.com/oauth/authorize?client_id=295d53cb156ca5e83e6bb8370e8bcc18&redirect_uri=http://localhost:8080/kakaologin&response_type=code">
				        	<img src="/resources/images/kakao_login_medium_wide.png" alt="" style="width: 311px;"/>
					    </a>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>