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
	
	<%! %>
	
	<%
		String sql = "select * from score";
		psmt=con.prepareStatement(sql);
		
		res = psmt.executeQuery();
	%>
	<div class="container">
	<h4><span>성적 조회 </span>페이지 입니다.</h4>
	<hr/>
	<table border="1">
		<thead>
		<tr><th>번호</th><th>이름</th><th>국어</th><th>영어</th><th>수학</th><th>과학</th><th>총점</th><th>평균</th><th>비고</th></tr>
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
		<tr><td><%=no %></td><td><%=name %></td><td><%=kor %></td><td><%=eng %></td><td><%=mat %></td><td><%=tec %></td><td><%=tot %></td><td><%=avg %></td>
		<td><a href="Delete.jsp?d_no=<%=no %>">삭제</a>&emsp;
		<a href="Modify.jsp?m_no=<%=no %>&m_name=<%=name%>">수정</a></td></tr>
		</tbody>
		<%
			}
		%>
	
	</table>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>