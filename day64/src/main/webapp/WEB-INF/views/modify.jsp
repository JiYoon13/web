<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><span id="title">MODIFY</span> PAGE</h3>
	<hr style="border: 2px solid #6E637A">
	<form action="modifydata" method="post">
		<table>
			<c:forEach items="${list }" var="p" >
			<tr>
				<th width="500" align="right">ID&emsp;</th>
				<td width="500" align="left"><input type="text" name="id" value="${p.id }"></td>
			</tr>
			<tr>
				<th width="500" align="right">NAME&emsp;</th
				><td width="500" align="left"><input type="text" name="name" value="${p.name }"></td>
			</tr>
			<tr>
				<th width="500" align="right">TEL&emsp;</th>
				<td width="500" align="left"><input type="text" name="tel" value="${p.tel }"></td>
			</tr>
			<tr>
				<th width="500" align="right">ADDRESS&emsp;</th>
				<td width="500" align="left"><input type="text" name="address" value="${p.address }"></td>
			</tr>
			<tr>	
				<th width="500" align="right">EMAIL&emsp;</th>
				<td width="500" align="left"><input type="text" name="email" value="${p.email }"></td>
			</tr>
			<tr>
				<td colspan="2">
				<p>
				<input type="submit" value="전송">
				<input type="reset" value="취소">
				</td>
			</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>