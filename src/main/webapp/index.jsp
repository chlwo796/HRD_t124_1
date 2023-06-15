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
</head>
<body>
<jsp:include page="./include/header.jsp"></jsp:include>
	<section class="section">
		<h2>골프연습장 회원관리</h2>
		<div>
			골프연습장 회원관리와 강사정보, 수강신청 데이터베이스를 구출하고 회원관리 프로그램을 작성하는 프로그램<br>
			프로그램 순서<br> 1. 회원정보 테이블을 생성한다.<br> 2. 강사정보 테이블을 생성한다.<br>
			3. 수강신청 테이블을 생성한다.<br>
		</div>
	</section>
<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>