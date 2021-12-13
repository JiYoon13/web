<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
	<table style="border-collapse: collapse; text-align:left">
		<tr style="border-bottom: 1px solid slategray">
			<th>글번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일자</th>
			<th>조회수</th>
			<th>비고</th>
		</tr>
		<c:forEach items="${list }" var="b">
		<tr style="border-bottom: 1px solid slategray">
			<td>${b.num }</td>
			<td>${b.writer }</td>
			<td>
				<c:forEach begin="1" end="${b.indent }">&emsp;</c:forEach>
				<c:if test="${b.indent > 0}">ㄴ</c:if>
				<a href="detail?num=${b.num}">${b.title }</a></td>
			<td>${b.writeday }</td>
			<td>${b.readcnt }</td>
			<td><a href="board_delete?num=${b.num }">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>