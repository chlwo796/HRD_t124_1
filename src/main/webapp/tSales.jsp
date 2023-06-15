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
	width: 110px;
	text-align: center;
}
td:nth-child(3), td:nth-child(4) {
	/* 3,4번째 칸 속성 */
	text-align: right;
	padding-right: 5px;
}
</style>
</head>
<body>
<jsp:include page="./include/header.jsp"></jsp:include>
	<section class="section">
		<h2>강사매출현황</h2>
		<table>
		<tr>
		<th>강사코드</th>
		<th>강의명</th>
		<th>강사명</th>
		<th>총매출</th>
		</tr>
		
		<%
		String sql="SELECT tt.TEACHER_CODE, tt.CLASS_NAME, tt.TEACHER_NAME, SUM(tc.TUITION) TUITION " +
		"FROM TBL_TEACHER_202201 tt, TBL_CLASS_202201 tc " +
		"WHERE tt.TEACHER_CODE = tc.TEACHER_CODE " +
		"GROUP BY tt.TEACHER_CODE, tt.CLASS_NAME, tt.TEACHER_NAME " + 
		"ORDER BY tt.TEACHER_CODE ASC";
		
		Connection con = DBConnection.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			int sum = rs.getInt(4);
			DecimalFormat f = new DecimalFormat("￦#,##0");
			String sum_price = f.format(sum);
		%>
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=sum_price %></td>
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