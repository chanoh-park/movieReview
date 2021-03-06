<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 회원가입 Modal -->
<div class="modal fade" id="joinForm" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="width: 375px; height: 619px;">
		<div class="modal-content">
		
			<div class="modal-title" id="exampleModalLabel">MOVIE<br /> REVIEW</div>
			
			<div class="part-title">회원가입</div>
			
			<div class="modal-body">
				<div class="container">
					<form action="/register" method="post" class="needs-validation" novalidate>
						<div class="form-group has-feedback">
						 	<input class="form-control" type="text" id="joinName" name="name" placeholder="이름" autocomplete="off" required />
						 	<div id='join-name-check'>
						    </div>
						</div>
						<div class="form-group has-feedback">
							<input class="form-control" type="text" id="joinUserId" name="userId" placeholder="아이디" autocomplete="off" required />
							<div id='join-id-check'>
						    </div>
						</div>
						<div class="form-group has-feedback">
							<input class="form-control" type="password" id="joinUserPw" name="userPw" placeholder="비밀번호" autocomplete="off" required />
							<div id='join-password-check'>
						    </div>
						</div>
						<div class="form-group has-feedback">
							<button class="btn" type="submit" id="joinSubmit" style="color: white; background: #1A2F63; width: 311px; font-family: 'Do Hyeon', sans-serif;">회원가입</button>
						</div>
						<div class="userLogin">이미 가입 하셨나요?<button class="userLoginBtn" type="button" style="background: white; border: none; outline: none; color: #1A2F63">로그인</button></div>
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