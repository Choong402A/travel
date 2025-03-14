//아이디 중복체크
function midck(){
	var mid = document.getElementById('mid').value;
	
	http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		
		if(http.readyState == 4 && http.status == 200){
			if(this.response == "ok"){
				alert("사용 가능한 아이디입니다");
			}else{
				alert("이미 사용 중인 아이디입니다.");
			}
		} 
	}
	http.open("POST","./idcheck.do",true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded")
	http.send("mid=" + mid);
	
}

//비밀번호 확인
function pwck(){
	var pw = document.getElementById('mpass').value;
	var pwck = document.getElementById('mpassck').value;
	
	if(!pw){
		alert("비밀번호를 입력해주세요");
	} else if(!pwck){
			alert("동일한 비밀번호를 입력해주세요");	
	} else if(pw !== pwck){
			alert("동일한 비밀번호를 입력해주세요");	
	}
}



//전화번호
function combintel() {
    var hp1 = document.getElementById('hp1').value;
    var hp2 = document.getElementById('hp2').value;
    var hp3 = document.getElementById('hp3').value;
    var tel = hp1 + hp2 + hp3;
    document.getElementById('mtel').value = tel;
}



//회원가입 form없는 ajax
function join() {
	
	var mid = document.getElementById("mid").value; //id값 가져옴
	var mpass = document.getElementById("mpass").value;
	var mname = document.getElementById("mname").value;
	var memail = document.getElementById("memail").value;
	var mtel = document.getElementById("mtel").value;
	var mpart = document.getElementById("mpart").value;
	var mposition = document.getElementById("mposition").value;
	
	if(mid == ""){
		alert("아이디를 입력하세요!")
	} else if(mpass == ""){
		alert("비밀번호를 입력하세요!")
	}else if(mname == ""){
		alert("이름을 입력하세요!")
	}else if(memail == ""){
		alert("이메일을 입력하세요")
	}else if(mtel == ""){
		alert("전화번호를 확인해주세요")
	}else if(mpart == ""){
		alert("부서를 선택하세요")
	}else if(mposition == ""){
		alert("직급을 선택하세요")
	} else {//ajax post통신을 위한 함수 호출
		this.join_submit(mid,mpass,mname,mtel,memail,mpart,mposition);
	}

}


function join_submit(mid,mpass,mname,memail,mtel,mpart,mposition){ 
	var http, result; //http : back-end, result : backend에서 제공한데이터
http = new XMLHttpRequest(); // 통신시작
http.onreadystatechange = function(){ 
	if(http.readyState==4 && http.status == 200){
		
		if(this.response == "ok"){
			alert("회원가입이 완료되었습니다");
			window.location.href = "./tologin.do";
			
		}
	}else if(http.status==404){
		console.log("경로오류");
	}else if(http.status==405){
		console.log("통신 규격 오류 발생");// get-post 불일치
	}
}


http.open("POST","./join.do", true);
//ajax post 전송 시 contenttype을 적용하여 urlencode를 적용해야만 정상적으로 backend에게 값을 전송할 수 있다
http.setRequestHeader("content-type","application/x-www-form-urlencoded")
http.send("mid="+mid+"&mpass="+mpass+"&mname="+mname+"&memail="+memail+"&mtel="+mtel+"&mpart="+mpart+"&mposition="+mposition) //post 방식
// 한개 이상 부터는 && 사용필수

}