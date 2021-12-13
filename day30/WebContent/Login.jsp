<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<style>
	h2{ text-align: center;}
	h2 span{color: teal;}
	.container{
		width: 800px;
		line-height: 50px;
		margin: 40px auto;	
	}
	.login{
		background-color: #1F88DF;
		color: white;
		border-radius: 5px;
		border: 0;
		padding: 10px 172px;
	}
</style>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div class="container">
	<h2><span>로그인 </span>페이지 입니다.</h2>
	<hr/>
	<form action="Loginsave.jsp" method="post" width="800px" align="center">
		<table align="center">
			<tr><td>ID</td><td><input type="text" placeholder="아이디" name="id" required style="height: 30px"></td></tr>
			<tr><td>PW</td><td><input type="password" placeholder="비밀번호" name="pw" required style="height: 30px"></td></tr>
		</table>
		<p><p>
		<input type="submit" value="LOGIN" class="login"><br>
		<input type="button" value="HOME" onClick="location.href='Index.jsp'" class="login">
	</form>
	</div>
</body>
</html>