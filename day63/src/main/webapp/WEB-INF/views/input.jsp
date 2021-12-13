<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Score</title>
<script type="text/javascript">
	function check(){
		var f = document.fname;
		var cno = f.no.value;
		var cname = f.name.value;
		var ckor = f.kor.value;
		var ceng = f.eng.value;
		var cmat = f.mat.value;
		var ctec = f.tec.value;
		var vno = /^[0-9]{0,6}$/;
		var vname = /^[가-힁]{3,5}$/;
		
		if(cno==""){
			alert("번호는 필수항목입니다");
			f.no.select();
			return false;
		}
		if(!vno.test(cno)){
			alert("번호는 숫자 6자리만 입력 가능합니다");
			f.no.select();
			return false;
		}
		if(cname==""){
			alert("이름은 필수항목입니다");
			f.name.select();
			return false;
		}
		if(!vname.test(cname)){
			alert("이름은 한글 3-5자만 입력 가능합니다");
			f.name.select();
			return false;
		}
		if(ckor==""){
			alert("국어점수는 필수항목입니다");
			f.kor.select();
			return false;
		}
		if(ckor<0 || ckor>100){
			alert("국어점수는 0~100점 사이만 입력 가능합니다");
			f.kor.select();
			return false;
		}
		if(ceng==""){
			alert("영어점수는 필수항목입니다");
			f.eng.select();
			return false;
		}
		if(ceng<0 || ceng>100){
			alert("영어점수는 0~100점 사이만 입력 가능합니다");
			f.eng.select();
			return false;
		}
		if(cmat==""){
			alert("수학점수는 필수항목입니다");
			f.mat.select();
			return false;
		}
		if(cmat<0 || cmat>100){
			alert("수학점수는 0~100점 사이만 입력 가능합니다");
			f.mat.select();
			return false;
		}
		if(ctec==""){
			alert("과학점수는 필수항목입니다");
			f.tec.select();
			return false;
		}
		if(cmet<0 || cmet>100){
			alert("과학점수는 0~100점 사이만 입력 가능합니다");
			f.tec.select();
			return false;
		}
		f.submit();
	}
</script>
</head>
<body>
	<h3><span id="sp">자료 입력</span> 페이지</h3>
	<form name="fname" action="inputdata" method="post">
		<table>
			<tr>
				<td width="300px" align="right">번호</td>
				<td align="left"><input type="text" name="no"></td>
			</tr>
			<tr>
				<td width="300px" align="right">이름</td>
				<td align="left"><input type="text" name="name"></td>
			</tr>
			<tr>
				<td width="300px" align="right">국어</td>
				<td align="left"><input type="text" name="kor"></td>
			</tr>
			<tr>
				<td width="300px" align="right">영어</td>
				<td align="left"><input type="text" name="eng"></td>
			</tr>
			<tr>
				<td width="300px" align="right">수학</td>
				<td align="left"><input type="text" name="mat"></td>
			</tr>
			<tr>
				<td width="300px" align="right">과학</td>
				<td align="left"><input type="text" name="tec"></td>
			</tr>
		</table>
		<input type="submit" value="입력" onclick="return check()" >
	</form>
</body>
</html>