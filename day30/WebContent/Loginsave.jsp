<%@ include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<%!
		String id, pw;
	%>
	
	<%
		request.setCharacterEncoding("utf-8");
		id=request.getParameter("id");
		pw=request.getParameter("pw");

		String sql = "select * from login where id=? and pw=?";
		psmt=con.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pw);
		
		res=psmt.executeQuery();
		
	%>
	<%
		while(res.next()){
			String id=res.getString("id");
			String pw=res.getString("pw");
		}
		if(res.isFirst()){
			response.sendRedirect("Index.jsp");
		}
		else{
			response.sendRedirect("Login.jsp");
		}
	%>
</body>
</html>