<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
</head>
<body>
	<h3><span id="title">SELETE</span> PAGE</h3>
	<hr style="border: 2px solid #6E637A">
	<table border="1">
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>TEL</th>
			<th>ADDRESS</th>
			<th>EMAIL</th>
			<th>IMAGE</th>
		</tr>
		<c:set var="addr" value="0"/>
		<c:forEach items="${list }" var="m">
		<c:if test="${m.address eq '서울시'}"><c:set var="addr" value="seoul"/></c:if>
		<c:if test="${m.address eq '수원시'}"><c:set var="addr" value="suwon"/></c:if>
			<tr>
				<td><a href="modify?id=${m.id }">${m.id }</a></td>
				<td>${m.name }</td>
				<td>${m.tel }</td>
				<td>${m.address }</td>
				<td>${m.email }</td>
				<td><img src="./image/${addr }.jpg" width="50" height="40"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>