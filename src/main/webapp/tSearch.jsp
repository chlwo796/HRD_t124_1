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
<style>
td{
text-align: center;
width: 100px;
}
td:last-child {
	/* 마지막 td, 처음 : first-child, 자식: nth-child(번호), 짝수: nth-child(2n), 홀수 : nth-child(2n+1) */
	width: 150px;
}
/*td:nth-child(2) {
color: red;
}
th:nth-child(2n) {
	background-color: blue;
}*/
</style>
</head>
<body>
	<jsp:include page="./include/header.jsp"></jsp:include>
	<section class="section">
		<h2>강사조회</h2>
		<table>
			<tr>
				<th>강사코드</th>
				<th>강사명</th>
				<th>강의명</th>
				<th>수강료</th>
				<th>강사자격취득일</th>
			</tr>
			<%
			String price = "";
			String regist_date = "";
			String sql = "SELECT TEACHER_CODE, TEACHER_NAME, CLASS_NAME, CLASS_PRICE, " +
			"TEACHER_REGIST_DATE FROM TBL_TEACHER_202201";
			Connection con = DBConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				int class_price = rs.getInt(4); // 수강료만 number
				DecimalFormat f = new DecimalFormat("￦#,##0"); // 패턴, # 숫자, 0 숫자
				price = f.format(class_price);
			
				String teacher_regist_date = rs.getString(5);
				regist_date = teacher_regist_date.substring(0, 4)+"년"+teacher_regist_date.substring(4, 6) + "월" +
				teacher_regist_date.substring(6, 8)+"일";
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=price%></td> <%-- rs.getString(4) --%>
				<td><%=regist_date%></td> <%-- rs.getString(5) --%>
			</tr>
			<%} %>
		</table>
	</section>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
<%
DBConnection.getClose(con, pstmt, rs);
%>
</html>