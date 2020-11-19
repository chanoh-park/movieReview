<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>수정페이지</h3>

<form action="/movie/modify" method="post">
영화번호:<input type = "text" name = 'movieNum'  value='<c:out value="${movie.movieNum}"/>' readonly="readonly"> <br>
영화이름:<input type = "text" name = 'movieName'  value='<c:out value="${movie.movieName}"/>'> <br>
등장인물:<input type = "text" name = "moviePerson" value='<c:out value="${movie.moviePerson}"/>'><br>
영화내용:<input type = "text" name = "movieContent" value='<c:out value="${movie.movieContent}"/>'><br>
영화장르:<input type = "text" name = "movieGenre" value='<c:out value="${movie.movieGenre}"/>'><br>
나라:<input type = "text" name = "movieCountry" value='<c:out value="${movie.movieCountry}"/>'><br>
러닝타임:<input type = "text" name = "movieTime" value='<c:out value="${movie.movieTime}"/>'><br>
별점:<input type = "text" name = "movieStar" value='<c:out value="${movie.movieStar}"/>'><br>
년도:<input type = "text" name = "movieYear" value='<c:out value="${movie.movieYear}"/>'><br>
<button type="submit" data-oper='modify'>수정</button>
<button type="submit" data-oper='remove'>삭제</button>
<button type="submit" data-oper='list'>리스트</button>
</form>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/movie/remove");
		}else if(operation === 'list'){
			self.location = "/movie/list";
			return;
		}
		formObj.submit();
	});
});

</script>

</body>
</html>