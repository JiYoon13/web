<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Score</title>
</head>
<body>
	<div class="container">
	<h4><span>성적 검색 </span>페이지 입니다.</h4>
	<hr/>
	<form action="Search.jsp" method="post" align="center">
			검색하고 싶은 이름을 입력하세요<p>
			<table align="center">
				<tr><td>이름 </td><td><input type="text" name="s_name"></td></tr>
			</table>
		<p><p>
		<input type="submit" value="검색" class="submitbtn">
		<input type="reset" value="취소" onClick="location.href='Index.jsp'" class="submitbtn">
	</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>