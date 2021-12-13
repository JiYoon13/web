<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
</head>
<body>
	<h3><span id="title">INSERT</span> PAGE</h3>
	<hr style="border: 2px solid #6E637A">
	<form action="inputdata" method="post">
		<table>
			<tr>
				<th width="500" align="right">ID&emsp;</th>
				<td width="500" align="left"><input type="text" name="id"></td>
			</tr>
			<tr>
				<th width="500" align="right">NAME&emsp;</th>
				<td width="500" align="left"><input type="text" name="name"></td>
			</tr>
			<tr>
				<th width="500" align="right">TEL&emsp;</th>
				<td width="500" align="left"><input type="text" name="tel"></td>
			</tr>
			<tr>
				<th width="500" align="right">ADDRESS&emsp;</th>
				<td width="500" align="left"><input type="text" name="address"></td>
			</tr>
			<tr>	
				<th width="500" align="right">EMAIL&emsp;</th>
				<td width="500" align="left"><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="2">
				<p>
				<input type="submit" value="입력">
				<input type="button" value="취소" onclick="location.href='index'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>