<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>

	<form action="deleteform" method="post">
		<table style="width: 500px">
			<tr>
				<td>삭제할 회원의 ID를 입력하세요</td>
				<td><input type="text" name="id"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="삭제">
		<input type="button" value="취소" onclick="location.href='main'">
	</form>
	
</body>
</html>