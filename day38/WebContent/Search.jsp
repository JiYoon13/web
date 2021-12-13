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
	<h3><span>도서 검색</span> 페이지</h3>
	<hr width="100%">
	<p>
	<%! 
		String s_bname, bno, author, publisher, bname;
		int price, cnt; 
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
		s_bname = request.getParameter("s_bname");
		
		String sql = "select * from bookstore where bname like ?";
		psmt=con.prepareStatement(sql);
		psmt.setString(1, "%" + s_bname + "%");
		res=psmt.executeQuery();
	%>
	
	<table border="1">
		<tr><th>번호</th><th>도서명</th><th>저자</th><th>출판사</th><th>가격</th><th>수량</th></tr>
		<%
			while(res.next()){
				bno = res.getString("bno");
				bname = res.getString("bname");
				author = res.getString("author");
				publisher = res.getString("publisher");
				price = res.getInt("price");
				cnt = res.getInt("cnt");
		%>
		<tr><td><%=bno %></td><td><%=bname %></td><td><%=author %></td><td><%=publisher %></td><td><%=price %></td><td><%=cnt %></td></tr>
		<%
			}
		%>
	</table>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>