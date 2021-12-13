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
	<h3><span id="sp">자료 출력</span> 페이지</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>과학</th>
			<th>총점</th>
			<th>평균</th>
			<th>학점</th>
		</tr>
		
		<c:forEach items="${list }" var="s">
			<tr>
				<td>${s.no }</td>
				<td>${s.name }</td>
				<td>${s.kor }</td>
				<td>${s.eng }</td>
				<td>${s.mat }</td>
				<td>${s.tec }</td>
				<td>${s.tot }</td>
				<td>${s.avg }</td>
				<td>${s.grade }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>