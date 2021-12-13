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
	<h3><span>도서 추가</span> 페이지</h3>
	<hr width="100%">
	<p>
	<form action="Insert.do" method="post">
		<table>
			<tr><td>도서번호</td><td><input type="text" name="bno"></td></tr>
			<tr><td>도서명</td><td><input type="text" name="bname"></td></tr>
			<tr><td>저자</td><td><input type="text" name="author"></td></tr>
			<tr><td>출판사</td><td><input type="text" name="publisher"></td></tr>
			<tr><td>가격</td><td><input type="text" name="price"></td></tr>
			<tr><td>수량</td><td><input type="text" name="cnt"></td></tr>
		</table>
		<p><p>
		<input type="submit" value="추가">
		<input type="reset" value="취소">
	</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>