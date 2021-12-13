<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
	<form action="modifydata" method="post">
		<table style="width: 400px">
		<c:forEach items="${list }" var="m">
			<tr><td>아이디</td><td><input type="text" name="id" value="${m.id }" readonly></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pw" value="${m.pw }"></td></tr>
			<tr><td>이름</td><td><input type="text" name="name" value="${m.name }"></td></tr>
			<tr><td>전화번호</td><td><input type="text" name="tel" value="${m.tel }"></td></tr>
			<tr><td>이메일</td><td><input type="text" name="email" value="${m.email }"></td></tr>
			<tr><td>거주지</td><td><input type="text" name="address" value="${m.address }"></td></tr>
			<tr><td>생년월일</td><td><input type="date" name="birth" value="${m.birth }"></td></tr>
		</c:forEach>
		</table>
		<br>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</form>
</body>
</html>