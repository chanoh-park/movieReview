<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- BootStrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<title>회원가입</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cancel").on("click", function(){
			
			location.href = "/login";
					    
		});
	
		$("#submit").on("click", function(){
			if($("#name").val()==""){
				alert("성명을 입력해주세요.");
				$("#name").focus();
				return false;
			}
			
			if($("#userId").val()==""){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			
			if($("#userPw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPw").focus();
				return false;
			}
			
			<%--
			var idChkVal = $("#idChk").val();
			
			if (idChkVal == "N") {
				alert("중복확인 버튼을 눌러주세요.");
			} else if (idChkVal == "Y") {
				$("#regForm").submit();
			}
			--%>
		});	
	});
	
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
</script>
<body>
<div class="container">
	<form action="/member/register" method="post" id="regForm">
		<div class="form-group has-feedback">
			<label class="control-label" for="name">성명</label>
			<input class="form-control" type="text" id="name" name="name" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userId">아이디</label>
			<input class="form-control" type="text" id="userId" name="userId" />
			<!-- <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>  -->
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userPw">비밀번호</label>
			<input class="form-control" type="password" id="userPw" name="userPw" />
		</div>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="submit" id="submit">회원가입</button>
			<button class="cancel btn btn-danger" type="button">취소</button>
		</div>
	</form>
</div>
</body>
</html>