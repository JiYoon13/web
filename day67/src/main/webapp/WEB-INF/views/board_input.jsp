<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
	<form action="board_inputdata" method="post">
		<table style="width: 500px">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" value="${member.name }" readonly></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>