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
	<form action="replyform" method="post">
		<c:forEach items="${list }" var="b">			
		<table border="1" style="width: 500px">	
			<tr>
				<td>글번호</td>
				<td><input type="hidden" name="num" value="${b.num }">${b.num }</td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td>${b.writeday }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${b.writer }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${b.title }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${b.content }</td>
			</tr>
			
		</table>
		</c:forEach>
		<br>
		<input type="submit" value="답변글">
		<input type="button" value="목록" onclick="location.href='board_list'">
	</form>
</body>
</html>