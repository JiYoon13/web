<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
</head>
<body>
	<h3><span id="title">DELETE</span> PAGE</h3>
	<hr style="border: 2px solid #6E637A">
	<p>
	<form action="deletedata" method="post">
		삭제할 자료의 ID를 검색하세요 <input type="text" name="id"><p>
		<input type="submit" value="삭제">
		<input type="button" value="취소" onclick="location.href='index'">
	</form>
</body>
</html>