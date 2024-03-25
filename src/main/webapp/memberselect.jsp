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
<section>
<h2>회원목록조회/수정</h2>
	<table border="1">
		<tr>
			<th>no</th>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
			<th>관심상품</th>
			<th>구분</th>
		</tr>
		<%@ include file="dbcon.jsp" %>
		<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd'),grade,city,goods from member0320";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int no=0;
		while(rs.next()){
			String custno = rs.getString("custno");
			String custname = rs.getString("custname");
			String phone = rs.getString("phone");
			String address = rs.getString("address");
			String joindate = rs.getString(5);
			String grade = rs.getString("grade");
			switch(grade){
			case "A":
				grade="VIP"; break;
			case "B":
				grade="일반"; break;
			case "C":
				grade="직원"; break;
			}
			String city = rs.getString("city");
			String goods = rs.getString("goods");
			no++;
		%>
		<tr>
			<td><%=no %></td>
			<td><a href="memberUpdate.jsp?custno=<%=rs.getString("custno") %>"><%=rs.getString("custno") %></a></td>
			<td><%=custname %></td>
			<td><%=phone %></td>
			<td><%=address %></td>
			<td><%=joindate %></td>
			<td><%=grade %></td>
			<td><%=city %></td>
			<td><%=goods %></td>
			<td>
			<a href="memberDelete.jsp?custno=<%=custno %>" 
			onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;">삭제
			</a></td>
		</tr>
		<%
		}
		%>
	</table>
</section>
</body>
</html>