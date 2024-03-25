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
	String pcode=request.getParameter("pcode");
	String sql="delete from product0320 where pcode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, pcode);
	pstmt.executeUpdate();
%>
<script>
	alert("삭제 완료");
	location.href="goodsselect.jsp";
</script>
</body>
</html>