<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="dao.*"%>

<%
// 웹브라우저에서 작성한 자료를 db로 넘겨줌
request.setCharacterEncoding("UTF-8"); // 한글처리
String tuition = request.getParameter("tuition"); // 수강료로 선생코드 구하기
String c_no = request.getParameter("c_no"); // c_no>=20000이상인경우 수강료 재수정
int intTuition = 0;
if (Integer.parseInt(c_no) >= 20000) {
	intTuition = Integer.parseInt(tuition) * 2;
}
String sql = "SELECT TEACHER_CODE FROM TBL_TEACHER_202201 WHERE CLASS_PRICE = " + intTuition;
Connection con = DBConnection.getConnection();
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
String teacher_code = "";
if (rs.next()) {
	teacher_code = rs.getString(1);
}

String regist_month = request.getParameter("regist_month");
String class_name = request.getParameter("class_name"); // 수강료와 동일
String class_place = request.getParameter("class_place");
// 실제 db 삽입쿼리문
sql = "INSERT INTO TBL_CLASS_202201 VALUES (?, ?, ?, ?, ?)";
con = DBConnection.getConnection();
pstmt = con.prepareStatement(sql);

pstmt.setString(1, regist_month);
pstmt.setString(2, c_no);
pstmt.setString(3, class_place);
pstmt.setString(4, tuition);
pstmt.setString(5, teacher_code); // TEACHER_CODE

pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프연습장 회원관리 프로그램</title>
<link rel="stylesheet" href="./css/basic.css" />
<script src="./js/basic.js"></script>
</head>
<body>
	<jsp:include page="./include/header.jsp"></jsp:include>
	<jsp:forward page="index.jsp"></jsp:forward>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
<%
DBConnection.getClose(con, pstmt, rs);
%>
</html>