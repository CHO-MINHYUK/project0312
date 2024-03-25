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
	String sql="insert into product0320 values(?,?,?,?)";
	String pcode=request.getParameter("pcode");
	String pname=request.getParameter("pname");
	String price=request.getParameter("price");
	String stockQty=request.getParameter("stockQty");
	PreparedStatement pstmt=null;
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, pcode);
	pstmt.setString(2, pname);
	pstmt.setString(3, price);
	pstmt.setString(4, stockQty);
	pstmt.executeUpdate();
%>
<script>
	alert("상품 테이블 등록 성공");
	location.href="goodsselect.jsp";
</script>
</body>
</html>