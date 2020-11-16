<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 로그인 Modal -->
<div class="modal fade" id="loginForm" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="width: 375px; height: 619px;">
		<div class="modal-content">
		
			<div class="modal-title" id="exampleModalLabel">CHOONGANG<br /> PEDIA</div>
			
			<div class="part-title">로그인</div>
			
			<div class="modal-body">
				<div class="container">
					<c:if test="${member == null}">
						<form action="/login" method="post" class="needs-validation" id="login" name="loginCheck" novalidate>
								<div class="form-group has-feedback">
									<input class="form-control" type="text" id="loginUserId" name="userId" placeholder="아이디" autocomplete="off" required />
									<div id='login-id-check'>
								    </div>
								</div>
								<div class="form-group has-feedback">
									<input class="form-control" type="password" id="loginUserPw" name="userPw" placeholder="비밀번호" autocomplete="off" required />
									<div id='login-password-check'>
								    </div>
								</div>
								<div class="form-group has-feedback">
									<button class="btn" type="button" id="loginBtn" style="color: white; background: #19CE60; width: 311px; font-family: 'Do Hyeon', sans-serif;">로그인</button>
								</div>
								<div class="userJoin">계정이 없으신가요?<button class="userJoinBtn" type="button" style="background: white; border: none; outline: none; color: #19CE60">회원가입</button></div>
								<div class="hr-sect">OR</div>
								<a href = "https://kauth.kakao.com/oauth/authorize?client_id=ecdfdd7e0768f74be3f2fac07b9da53b&redirect_uri=http://localhost:8080/kakaologin&response_type=code">
						        	<img src="/resources/images/kakao_login_medium_wide.png" alt="" style="width: 311px;"/>
							    </a>
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 로그인 실패 Modal -->
	<div class="modal fade" id="loginFailForm" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" style="width: 375px; height: 619px;">
			<div class="modal-content">
		
				<div class="part-title">로그인 실패</div>
			
				<div class="modal-body">
					<div class="container">
						<div style="text-align: center; font-family: 'Do Hyeon', sans-serif; font-size: 25px; margin-bottom: 20px;">
							아이디 혹은 비밀번호가 틀렸습니다.</div>
						<button class="btn" type="button" id="loginFailBtn" style="color: white; background: #19CE60; width: 311px;
							font-family: 'Do Hyeon', sans-serif; margin-bottom: 10px;">확인</button>						
					</div>
				</div>
			</div>
		</div>
	</div>							
