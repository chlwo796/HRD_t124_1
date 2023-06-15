<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프연습장 회원관리 프로그램</title>
<link rel="stylesheet" href="./css/basic.css" />
<script src="./js/basic.js"></script>
<style>
th{
	width: 100px;
}
td{
	padding-left: 2px;
}
input{
	height: 35px;
}
select{
height: 35px;
width: 90px;
text-align: center;
}
.ra{
vertical-align: -12px;
}
.ra1{
display: inline-block;
padding: 0px 5px;
}
</style>
</head>
<body>
	<jsp:include page="./include/header.jsp"></jsp:include>
	<section class="section">
		<h2>수강신청</h2>
		<form action="classAppProcess.jsp" method="POST" name="classAppFrm" onsubmit="return inCheck()">
		<table>
		<tr>
		<th>수강월</th>
		<td><input type="text" name="regist_month"> 2022년 3월 예)202203</td>
		</tr>
		<tr>
		<th>회원명</th>
		<td><select name="c_name" onchange="cnoInput(this.value)">
			<option value ="">회원명</option>
			<option value ="10001">홍길동</option>
			<option value ="10002">장발장</option>
			<option value ="10003">임꺽정</option>
			<option value ="20001">성춘향</option>
			<option value ="20002">이몽룡</option>
		</select></td>
		</tr>
		<tr>
		<th>회원번호</th>
		<td><input type="text" name="c_no" id="c_no" readonly = "readonly"> 예)1001</td>
		</tr>
		<tr>
		<th>강의장소</th>
		<td><input type="radio" name="class_place" value="서울본원" class="ra"><span class="ra1">서울본원</span>
		<input type="radio" name="class_place" value="성남본원" class="ra"><span class="ra1">성남본원</span>
		<input type="radio" name="class_place" value="대전분원" class="ra"><span class="ra1">대전분원</span>
		<input type="radio" name="class_place" value="부산분원" class="ra"><span class="ra1">부산분원</span>
		<input type="radio" name="class_place" value="대구분원" class="ra"><span class="ra1">대구분원</span>
		</td>
		</tr>
		<tr>
		<th>강의명</th>
		<td><select name = "class_name" onchange="cnameTuition(this.value)">
		<option value="">강의명</option>
		<option value="100000">초급반</option>
		<option value="200000">중급반</option>
		<option value="300000">고급반</option>
		<option value="400000">심화반</option>
		</select>
		</td>
		</tr>
		<tr>
		<th>수강료</th>
		<td><input type="text" name="tuition" id="tuition" readonly="readonly">원</td>
		</tr>
		<tr>
		<th colspan="2">
		<input type="submit" value="수강신청">
		<input type="button" value="다시쓰기" onclick="return resetCheck()">
		</th>
		</tr>
		</table>
		</form>
	</section>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>