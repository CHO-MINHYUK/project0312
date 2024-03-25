<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<seciton>
<h2>투표검수조회</h2>
<table border=1>
<tr>
	<td>no</td>
	<td>상품번호</td>
	<td>상품명</td>
	<td>단가</td>
	<td>재고</td>
	<td>구분</td>
</tr>
<%@ include file="dbcon.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from product0320";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int no=0;
	while(rs.next()){
		String pcode=rs.getString("pcode");
		String pname=rs.getString("pname");
		String price =rs.getString("price");
		String stockQty=rs.getString("stockQty");
		no++;
%>
<tr>
	<td><%=no %></td>
	<td><%=pcode %></td>
	<td><%=pname %></td>
	<td><%=price %></td>
	<td><%=stockQty %></td>
	<td><a href="goodsUpdate.jsp?pcode=<%=pcode %>">수정</a> /
		<a href="goodsDelete.jsp?pcode=<%=pcode %> >"
		onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;">삭제</a>
	</td>
</tr>
<%
	}
%>
</table>
</seciton>
</body>
</html>