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
<h2>회원 매출 정보 목록</h2>
<table border=1>
<tr>
	<td>no</td>
	<td>회원번호</td>
	<td>회원이름</td>
	<td>판매번호</td>
	<td>단가</td>
	<td>수량</td>
	<td>가격</td>
	<td>상품코드</td>
	<td>상품명</td>
	<td>판매일자</td>
</tr>
<%@ include file="dbcon.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select a.custno,custname,c.saleno,c.pcost,c.amount,c.price,b.pcode,pname,sdate from member0320 a, product0320 b, money0320 c where a.custno=c.custno and b.pcode=c.pcode";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int no=0;
	while(rs.next()){
		String custno=rs.getString(1);
		String custname=rs.getString(2);
		String saleno=rs.getString(3);
		String pcost=rs.getString(4);
		String amount=rs.getString(5);
		String price=rs.getString(6);
		String pcode=rs.getString(7);
		String pname=rs.getString(8);
		String sdate=rs.getString(9);
		no++;
%>
<tr>
		<td><%=no %></td>
		<td><%=custno %></td>
		<td><%=custname %></td>
		<td><%=saleno %></td>
		<td><%=pcost %></td>	
		<td><%=amount %></td>
		<td><%=price %></td>
		<td><%=pcode %></td>
		<td><%=pname %></td>
		<td><%=sdate %></td>
</tr>
<%
	}
%>
</table>
</seciton>
</body>
</html>