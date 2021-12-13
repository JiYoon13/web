<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H BookStore</title>
<link href="css/Style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
	<h3><span>구입 목록</span> 페이지</h3>
	<hr width="100%">
	<p>
	<%!
		int price, cnt, tot;
		String bdate, bname;
	%>
	
	<%
		request.setCharacterEncoding("utf-8");
		Connection con;
		PreparedStatement psmt;
		ResultSet res;
		
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		Class.forName(driver);
		con=DriverManager.getConnection(url, "ez311", "12345");
		
		String sql="select * from booklist order by bdate desc";
		psmt=con.prepareStatement(sql);
		res=psmt.executeQuery();
	%>
	
	<table border="1">
		<tr><th>날짜</th><th>도서명</th><th>가격</th><th>수량</th><th>합계</th></tr>
		<%
			while(res.next()){
				bdate = res.getString("bdate");
				bname = res.getString("bname");
				price = res.getInt("price");
				cnt = res.getInt("cnt");
				tot = res.getInt("tot");
				
		%>
		<tr><td><%=bdate %></td><td><%=bname %></td><td><%=price %></td><td><%=cnt %></td><td><%=tot %></td></tr>
		<%
			}
		%>
	</table>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>