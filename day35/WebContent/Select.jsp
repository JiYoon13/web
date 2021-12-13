<%@ include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Score</title>
<link rel="stylesheet" href="css/Style.css" type="text/css" />
</head>
<body>
	<%! %>
	<%
		request.setCharacterEncoding("utf-8");
		String sql = "select * from score30 order by tot desc";
		psmt=con.prepareStatement(sql);
		res=psmt.executeQuery();
	%>
	<div class="container">
	<h3><span>성적 조회</span> 페이지</h3>
	<hr width="500px" align="left">
	<table border="1" width="500px">
		<tr><th>석차</th><th>이름</th><th>국어</th><th>영어</th><th>수학</th><th>총점</th><th>평균</th><th>학점</th><th>비고</th></tr>
	<%
		int rank = 1;
		while(res.next()){
			String name = res.getString("name");
			int kor = res.getInt("kor");
			int eng = res.getInt("eng");
			int mat = res.getInt("mat");
			int tot = res.getInt("tot");
			double avg = res.getDouble("avg");
			String grade = res.getString("grade");
			
	%>
		<tr><td><%=rank %></td><td><%=name %></td><td><%=kor %></td><td><%=eng %></td><td><%=mat %></td><td><%=tot %></td><td><%=avg %></td><td><%=grade %></td>
		<td><a href="UpdateForm.jsp?u_name=<%=name %>">수정</a></td>
		</tr>
	<%
		rank ++;
		}
		
	%>
	</table>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>