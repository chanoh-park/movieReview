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
<h3>등록페이지</h3>
<form action="/movie/register" method="post">
영화이름:<input type = "text" name = 'movieName'><br>
등장인물:<input type = "text" name = "moviePerson"><br>
영화내용:<input type = "text" name = "movieContent"><br>
영화장르:<input type = "text" name = "movieGenre"><br>
나라:<input type = "text" name = "movieCountry"><br>
러닝타임:<input type = "text" name = "movieTime"><br>
별점:<input type = "text" name = "movieStar"><br>
년도:<input type = "text" name = "movieYear"><br>
<button type="submit">등록</button>
</form>

</body>
</html>