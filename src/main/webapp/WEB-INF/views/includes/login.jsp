<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="width: 375px; height: 619px;">
		<div class="modal-content">
		
			<div class="modal-title" id="exampleModalLabel">CHOONGANG<br /> PEDIA</div>
			
			<div class="part-title">로그인</div>
			
			<div class="modal-body">
				<div class="container">
					<form action="/login" method="post" class="needs-validation" novalidate>
						<c:if test="${member == null}">
							<div class="form-group has-feedback">
								<input class="form-control" type="text" id="userId2" name="userId" placeholder="아이디" autocomplete="off" required />
								<div id='id-check2'>
							    </div>
							</div>
							<div class="form-group has-feedback">
								<input class="form-control" type="password" id="userPw2" name="userPw" placeholder="비밀번호" autocomplete="off" required />
								<div id='password-check2'>
							    </div>
							</div>
							<div class="form-group has-feedback">
								<button class="btn" type="submit" id="submit" style="color: white; background: #19CE60; width: 311px; font-family: 'Do Hyeon', sans-serif;">로그인</button>
							</div>
							<div class="userJoin">계정이 없으신가요?<button class="userJoinBtn" type="button" style="background: white; border: none; outline: none; color: #19CE60">회원가입</button></div>
							<div class="hr-sect">OR</div>
							<a href = "https://kauth.kakao.com/oauth/authorize?client_id=295d53cb156ca5e83e6bb8370e8bcc18&redirect_uri=http://localhost:8080/kakaologin&response_type=code">
					        	<img src="/resources/images/kakao_login_medium_wide.png" alt="" style="width: 311px;"/>
						    </a>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>