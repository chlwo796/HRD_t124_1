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
	width: 150px;
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="./include/header.jsp"></jsp:include>
	<section class="section">
		<h2>회원정보조회</h2>
		<table>
      <tr>
         <td>수강월</td>
         <td>회원번호</td>
         <td>회원명</td>
         <td>강의명</td>
         <td>강의장소</td>
         <td>수강료</td>
         <td>등급</td>
      </tr>
      <% 
      String sql = "select tc.regist_month, tm.c_no, tm.c_name, tt.class_name, " + 
      "tc.class_area, tc.tuition, tm.grade " + 
      "from tbl_teacher_202201 tt, tbl_member_202201 tm, tbl_class_202201 tc " + 
      "where tm.c_no = tc.c_no and tt.teacher_code=tc.teacher_code";
      /*  String sql ="select c.regist_month, m.c_no, m.c_name, t.class_name, c.class_area, c.tuition, m.grade from tbl_teacher_202201 T, tbl_member_202201 M, tbl_class_202201 C where T.teacher_code = C.teacher_code and C.c_no = M.c_no"; */
      Connection con = DBConnection.getConnection();
      PreparedStatement pstmt = con.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();
      
      while(rs.next()){
         String resgist_month = rs.getString(1);
         String date = resgist_month.substring(0,4)+"년"+resgist_month.substring(4,6)+"월"; 
         
         int class_price = rs.getInt(6);
         DecimalFormat f = new DecimalFormat("￦#,##0");
         String price = f.format(class_price);
      %>
      <tr>
         <td><%=date %></td>
         <td><%=rs.getString(2) %></td>
         <td><%=rs.getString(3) %></td>
         <td><%=rs.getString(4) %></td>
         <td><%=rs.getString(5) %></td>
         <td><%=price %></td>
         <td><%=rs.getString(7) %></td>
      </tr>
      <%
      }
      %>   
   </table>
	</section>
<jsp:include page="./include/footer.jsp"></jsp:include>
<%
DBConnection.getClose(con, pstmt, rs);
%>
</body>
</html>