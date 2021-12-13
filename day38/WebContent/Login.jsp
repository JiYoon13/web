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
	<h3><span>관리자 로그인</span> 페이지</h3>
	<hr width="100%">
	<p>
	<form action="Success.do" method="post">
		ID <input type="text" name="id"><p>
		PW <input type="password" name="pw"><p>
		<p><p>
		<input type="submit" value="로그인">
		<input type="reset" value="취소">
	</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>