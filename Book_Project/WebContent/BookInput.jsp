<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book</title>
<link href="css/Style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
		<h3><span>도서 추가</span> 페이지</h3>
		<hr width="700px" color="black">
		<p>
		<form action="Input.do" method="post">
			<table>
				<tr><th>책 이름</th><td><input type="text" name="bname" size=48></td></tr>
				<tr><th>저자</th><td><input type="text" name="bauthor" size=48></td></tr>
				<tr><th>줄거리</th><td><textarea rows="10" cols="50" name="bstory"></textarea></td></tr>
				<tr><th>출판사</th><td><input type="text" name="bpublisher" size=48></td></tr>
				<tr><th>가격</th><td><input type="text" name="bprice" size=48></td></tr>
			</table>
		<p>
		<input type="submit" value="추가">
		<input type="button" value="취소" onclick="location.href='Main.jsp'">
		</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>