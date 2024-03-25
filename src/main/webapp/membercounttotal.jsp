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
<h2>회원 목록</h2>
<table border=1>
<tr>
	<td>no</td>
	<td>회원번호</td>
	<td>회원이름</td>
	<td>고객등급</td>
	<td>매출</td>
</tr>
<%@ include file="dbcon.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select a.custno,a.custname,a.grade,sum(b.price) from member0320 a,money0320 b where a.custno=b.custno group by a.custno,a.custname,a.grade order by sum(b.price) desc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int no=0;
	while(rs.next()){
		String custno=rs.getString(1);
		String custname=rs.getString(2);
		String grade=rs.getString(3);
		String price=rs.getString(4);
		no++;
%>
<tr>
	<td><%=no %></td>
	<td><%=custno %></td>
	<td><%=custname %></td>
	<td><%=grade %></td>
	<td><%=price %></td>
	</td>
</tr>
<%
	}
%>
</table>
</seciton>
</body>
</html>