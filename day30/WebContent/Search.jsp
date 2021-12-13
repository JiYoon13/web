<%@ include file="dbconnect.jsp" %>
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
	<%! 
		String s_name;
	%>
	
	<%
		request.setCharacterEncoding("utf-8");
		s_name = request.getParameter("s_name");
		
		String sql = "select * from score where name=?";
		psmt = con.prepareStatement(sql);
		psmt.setString(1, s_name);
		
		res = psmt.executeQuery();
	%>
	<div class="container">
	<h4><span>성적 검색 </span>페이지 입니다.</h4>
	<hr/>
	<table border="1">
		<thead>
		<tr><th>번호</th><th>이름</th><th>국어</th><th>영어</th><th>수학</th><th>과학</th><th>총점</th><th>평균</th></tr>
		</thead>
		<%
			while(res.next()){
				String no = res.getString("no");
				String name = res.getString("name");
				int kor = res.getInt("kor");
				int eng = res.getInt("eng");
				int mat = res.getInt("mat");
				int tec = res.getInt("tec");
				int tot = res.getInt("tot");
				double avg = res.getDouble("avg");
		%>
		<tbody>
		<tr><td><%=no %></td><td><%=name %></td><td><%=kor %></td><td><%=eng %></td><td><%=mat %></td><td><%=tec %></td><td><%=tot %></td><td><%=avg %></td></tr>
		</tbody>
		<%
			}
		%>
	</table>
	</div>
</body>
<%@ include file="Footer.jsp" %> 
</html>