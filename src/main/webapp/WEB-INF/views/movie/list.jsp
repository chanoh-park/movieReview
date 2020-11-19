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
<h3>리스트페이지</h3>

<button data-oper='register' onclick="location.href='/movie/register'">register</button>
<table>
	<tr>
		<th>영화번호</th>
		<th>영화제목</th>
		<th>영화장르</th>
		<th>별점</th>
		<th>상연연도</th>
		
	</tr>
	
	<c:forEach items="${list }" var="movie">
		<tr>
			<td><c:out value="${movie.movieNum }"></c:out>
			<td><a href='/movie/read?movieNum=<c:out value="${movie.movieNum }"/>'><c:out value="${movie.movieName }"/></a>
			<td><c:out value="${movie.movieGenre }"></c:out>
			<td><c:out value="${movie.movieStar }"></c:out>
			<td><c:out value="${movie.movieYear}"></c:out>
		</tr>
	</c:forEach>
	
	
	
	
</table>
</body>
</html>