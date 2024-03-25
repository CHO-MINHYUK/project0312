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
	String sql="delete from member0320 where custno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	pstmt.executeUpdate();
%>
<script>
	alert("삭제 완료");
	location.href="memberselect.jsp";
</script>
</body>
</html>