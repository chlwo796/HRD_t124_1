
function inCheck(){
	// 전체적으로 입력이 되었는지 안되었는지 체크
	let fr = document.classAppFrm;
	if(fr.regist_month.value==''){
		alert('수강월이 입력되지 않았습니다.');
		fr.regist_month.focus();
		return false;
	}
	if(fr.c_name.value==''){
		alert('회원명이 입력되지 않았습니다.');
		fr.c_name.focus();
		return false;
	}

	let result = fr.class_place[0].checked==false && fr.class_place[1].checked==false && 
	             fr.class_place[2].checked==false && fr.class_place[3].checked==false &&
	             fr.class_place[4].checked==false;
	console.log(result);
	if(result){
		console.log(result);
		alert('강의 장소를 선택하지 않았습니다.');
		fr.class_place.focus();
		return false;
	}
	
	alert('수강신청이 정상적으로 완료되었습니다.');
	return true;
}

function cnoInput(cno){
	// 이름을 선택하면 회원번호에 회원의 번호 넣기
	// select태그에서 이름을 선택하면 이름의 value값을 가지고 매개값으로 전달
	// id="c_no"인 것의 매개값으로 전달받은 value를 넣는다.
	document.querySelector('#c_no').value=cno;
}
function cnameTuition(cnameValue){
	// 강의명을 선택하면 강의료를 넣기
	// cnameValue = 강의명에 따른 수강료
	// c_no 가져온 후 20000이상이면 id="#tuition"의 값으로 cnameValue*0.5를 해서 대입
	let c_no=document.querySelector('#c_no').value;
	if(c_no>=20000){
		document.querySelector('#tuition').value = cnameValue * 0.5;
	}else{
		// c_no 20000이상이 아닌경우 정상 수강료 대입
		document.querySelector('#tuition').value = cnameValue;
	}
}
function resetCheck(){
	// 다시쓰기 버튼을 클릭하면 폼에 입력된 내용을 초기화 하기
	alert('정보를 지우고 처음부터 다시 입력합니다!');
	document.classAppFrm.reset(); // 폼 네임에 있는 내용 전부 리셋
	document.classAppFrm.regist_month.focus(); // 수강월로 포커스
}