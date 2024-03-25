<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbcon.jsp" %>
<%
	PreparedStatement pstmt=null;
	String custno=request.getParameter("custno");
	String custname=request.getParameter("custname");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String joindate=request.getParameter("joindate");
	String grade=request.getParameter("grade");
	String city=request.getParameter("city");
	String goods=request.getParameter("goods");
	String sql="update member0320 set custname=?,phone=?,address=?,joindate=?,grade=?,city=?,goods=? where custno=?";
	pstmt=conn.prepareStatement(sql);
	
	pstmt.setString(1, custname);
	pstmt.setString(2, phone);
	pstmt.setString(3, address);
	pstmt.setString(4, joindate);
	pstmt.setString(5, grade);
	pstmt.setString(6, city);
	pstmt.setString(7, goods);
	pstmt.setString(8, custno);
	
	pstmt.executeUpdate();	
%>
<script>
	alert("회원 수정 성공");
	location.href="memberselect.jsp";
</script>
</body>
</html>