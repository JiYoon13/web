/**
 * 
 */
function check(){
	var f = document.fname;
	
	var rname = /^[가-힁]{2,5}$/; // 한글2-5글자
	var sname = f.name.value;
	if(sname==""){
		alert("이름은 필수 항목입니다");
		f.name.select();
		return false;
	}
	if(!rname.test(sname)){
		alert("이름은 한글 2~5자를 입력하세요");
		f.name.select();
		return false;
	}
	
	var skor = f.kor.value;
	if(skor==""){
		alert("국어 점수는 필수 항목입니다");
		f.kor.select();
		return false;
	}
	if(skor>100 || skor<0){
		alert("국어 점수는 0~100사이의 숫자를 입력하세요");
		f.kor.select();
		return false;
	}
	
	var seng = f.eng.value;
	if(seng==""){
		alert("영어 점수는 필수 항목입니다");
		f.eng.select();
		return false;
	}
	if(seng>100 || seng<0){
		alert("영어 점수는 0~100사이의 숫자를 입력하세요");
		f.eng.select();
		return false;
	}
	
	var smat = f.mat.value;
	if(smat==""){
		alert("수학 점수는 필수 항목입니다");
		f.eng.select();
		return false;
	}
	if(smat>100 || seng<0){
		alert("수학 점수는 0~100사이의 숫자를 입력하세요");
		f.mat.select();
		return false;
	}
	f.submit();
}

function checkname(){
	var f = document.fname;
	var rname = /^[가-힁]{2,5}$/;
	var sname = f.s_name.value;
	if(sname==""){
		alert("이름은 필수 항목입니다");
		f.s_name.select();
		return false;
	}
	if(!rname.test(sname)){
		alert("이름은 한글 2~5글자를 입력하세요");
		f.s_name.select();
		return false;
	}
	
	f.submit();
}
function checkname2(){
	alert("이름이 존재하지 않습니다");
	document.location.href="SearchForm.jsp";
	return false;
}