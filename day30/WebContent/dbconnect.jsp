<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Score</title>
</head>
<body>
	<%
		Connection con;
		PreparedStatement psmt;
		ResultSet res;
		
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		Class.forName(driver);
		con = DriverManager.getConnection(url, "ez311", "12345");
	%>
</body>
</html>