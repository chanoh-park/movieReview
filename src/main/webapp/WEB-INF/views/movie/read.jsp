<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>조회페이지</title>
</head>
<body>
<label>영화번호</label>
<input name="movieNum" value=${movie.movieNum } readonly="readonly"><br>
<label>영화제목</label>
<input name="movieName" value=${movie.movieName } readonly="readonly"><br>
<label>등장인물</label>
<input name="moviePerson" value=${movie.moviePerson } readonly="readonly"><br>
<label>영화내용</label>
<input name="movieContent" value=${movie.movieContent } readonly="readonly"><br>
<label>영화장르</label>
<input name="movieGenre" value=${movie.movieGenre } readonly="readonly"><br>
<label>나라</label>
<input name="movieCountry" value=${movie.movieCountry } readonly="readonly"><br>
<label>영화시간</label>
<input name="movieTime" value=${movie.movieTime } readonly="readonly"><br>
<label>별점</label>
<input name="movieStar" value=${movie.movieStar } readonly="readonly"><br>
<label>상영년도</label>
<input name="movieYear" value=${movie.movieYear } readonly="readonly"><br>
<button data-oper='modify' onclick="location.href='/movie/modify?movieNum=<c:out value="${movie.movieNum }"/>'">modify</button>

<button data-oper='list' onclick="location.href='/movie/list'">list</button>
</body>
</html>