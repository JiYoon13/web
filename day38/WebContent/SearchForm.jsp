<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H BookStore</title>
<link href="css/Style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
	<h3><span>도서 검색</span> 페이지</h3>
	<hr width="100%">
	<p>
	<form action="Search.jsp" method="post">
			검색할 도서의 이름을 입력하세요<br><br>
			도서명: <input type="text" name="s_bname">
		<p>
		<input type="submit" value="검색">
		<input type="reset" value="취소">
	</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>