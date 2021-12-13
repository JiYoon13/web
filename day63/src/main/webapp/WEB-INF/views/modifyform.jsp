<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Score</title>
</head>
<body>
	<h3><span id="sp">자료 수정</span> 페이지</h3>
	<form action="modifydata" method="post">
	<table>
		<c:forEach items="${list }" var="s">
			<tr><td width="300px" align="right">번호</td><td align="left"><input type="text" name="no" value="${s.no }"></td></tr>
			<tr><td width="300px" align="right">이름</td><td align="left"><input type="text" name="name" value="${s.name }"></td></tr>
			<tr><td width="300px" align="right">국어</td><td align="left"><input type="text" name="kor" value="${s.kor }"></td></tr>
			<tr><td width="300px" align="right">영어</td><td align="left"><input type="text" name="eng" value="${s.eng }"></td></tr>
			<tr><td width="300px" align="right">수학</td><td align="left"><input type="text" name="mat" value="${s.mat }"></td></tr>
			<tr><td width="300px" align="right">과학</td><td align="left"><input type="text" name="tec" value="${s.tec }"></td></tr>
		</c:forEach>
	</table>
	<input type="submit" value="수정">
	</form>
</body>
</html>