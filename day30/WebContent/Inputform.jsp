<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/Style.css"/>
<title>Student Score</title>
</head>
<body>
	<div class="container">
	<h4><span>성적 입력 </span>페이지 입니다.</h4>
	<hr/>
	<form action="Input_dto.jsp" method="post" align="center">
			<table>
				<tr><td>학생 번호</td><td><input type="text" name="no"></td></tr>
				<tr><td>학생 이름</td><td><input type="text" name="name"></td></tr>
				<tr><td>국어 점수</td><td><input type="text" name="kor"></td></tr>
				<tr><td>영어 점수</td><td><input type="text" name="eng"></td></tr>
				<tr><td>수학 점수</td><td><input type="text" name="mat"></td></tr>
				<tr><td>과학 점수</td><td><input type="text" name="tec"></td></tr>
			</table>
			<p><p>
			<input type="submit" value="저장" class="submitbtn"><br>
			<input type="button" value="취소" onClick="location.href='Index.jsp'" class="submitbtn">
	</form>
	</div>
</body>
<%@ include file="Footer.jsp" %> 
</html>