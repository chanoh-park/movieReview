<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">Container</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExample07">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="dropdown07" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
          <div class="dropdown-menu" aria-labelledby="dropdown07">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
      </ul>
      <form class="form-inline my-2 my-md-0">
        <input class="form-control" type="text" placeholder="Search" aria-label="Search">
        
        <c:if test="${member == null }">
        	<!-- 로그인 Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#loginForm" style="margin-left: 10px; font-family: 'Do Hyeon', sans-serif; background: white; border: none; color: #74747B">로그인</button>
	
			<!-- 회원가입 Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#joinForm" style="margin-left: 10px; font-family: 'Do Hyeon', sans-serif; background: white; border: 1px solid #74747B; color: #353535">회원가입</button>
		</c:if>
		
		<c:if test="${member != null }">
			<c:if test="${member.memberType == 'a' }">
			
				<a href="/member/admin">관리자 페이지</a>
				<a href="/logout">로그아웃</a>
			
			</c:if>
			<c:if test="${member.memberType == 'p' }">
			
				<div style="margin-left: 20px; font-family: 'Do Hyeon', sans-serif; color: white">${member.userId } 님</div>
				<i class="fas fa-user-circle fa-2x" style="margin-left: 20px; background: white; cursor:pointer;" onclick="location.href='/member/user'"></i>
				
			</c:if>			
		</c:if>
      </form>
    </div>
  </div>
</nav>