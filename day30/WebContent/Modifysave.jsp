<%@ include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Score</title>
</head>
<body>
	<%!
		String m_no, m_name;
		int m_kor, m_eng, m_mat, m_tec;
	%>
	
	<%
		request.setCharacterEncoding("utf-8");
		m_no = request.getParameter("m_no");
		m_name = request.getParameter("m_name");
		m_kor = Integer.parseInt(request.getParameter("m_kor"));
		m_eng = Integer.parseInt(request.getParameter("m_eng"));
		m_mat = Integer.parseInt(request.getParameter("m_mat"));
		m_tec = Integer.parseInt(request.getParameter("m_tec"));
		String sql = "update score set kor=?, eng=?, mat=?, tec=?, tot='" + (m_kor+m_eng+m_mat+m_tec) + "', avg='" + (m_kor+m_eng+m_mat+m_tec)/4 + "'where no=? and name=?";
		psmt = con.prepareStatement(sql);
		psmt.setInt(1, m_kor);
		psmt.setInt(2, m_eng);
		psmt.setInt(3, m_mat);
		psmt.setInt(4, m_tec);
		psmt.setString(5, m_no);
		psmt.setString(6, m_name);
		int k = psmt.executeUpdate();
		if(k==1)
			response.sendRedirect("Output.jsp");
	%>
</body>
</html>