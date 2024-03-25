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
<%@ include file="dbcon.jsp" %>
		<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int no=0;
		String sql="select max(custno) from member0320";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			no=rs.getInt(1)+1;
		}else{
			no=1;
		}
		
%>
<section>
<h2>홈쇼핑 회원 등록</h2>
<form name="form" method="post" action="memberProcess.jsp">
<table border=1>
<tr>
	<th>회원번호(자동발생)</th>
	<td><input type="text" name="custno" value="<%=no %>"></td>
</tr>
<tr>
	<th>회원성명</th>
	<td><input type="text" name="custname"></td>
</tr>
<tr>
	<th>회원전화</th>
	<td><input type="text" name="phone"></td>
</tr>
<tr>
	<th>회원주소</th>
	<td><input type="text" name="address"></td>
</tr>
<tr>
	<th>가입일자</th>
	<td><input type="text" name="joindate"></td>
</tr>
<tr>
	<th>고객등급</th>
	<td><select name="grade">
			<option value="A">A:VIP</option>
			<option value="B">B:일반</option>
			<option value="C">C:직원</option>
		</select>
	</td>
</tr>
<tr>
	<th>도시코드</th>
	<td><select name="city">
			<option value="01">01:서울</option>
			<option value="02">02:경기</option>
			<option value="10">10:대전</option>
			<option value="20">20:부산</option>
			<option value="30">30:광주</option>
			<option value="40">40:울산</option>
			<option value="50">50:대구</option>
			<option value="60">60:강원</option>
			<option value="70">70:경상</option>
			<option value="80">80:충청</option>
			<option value="90">90:제주</option>
		</select>
	</td>
</tr>
<tr>
	<th>관심상품</th>
	<td><input type="checkbox" name="goods" value="프로그램" >프로그램
		<input type="checkbox" name="goods" value="의류">의류
		<input type="checkbox" name="goods" value="식료품">식료품
		<input type="checkbox" name="goods" value="컴퓨터">컴퓨터
		<input type="checkbox" name="goods" value="공산품">공산품
		<input type="checkbox" name="goods" value="관광">관광
		<input type="checkbox" name="goods" value="전자제품">전자제품
		<input type="checkbox" name="goods" value="건강제품">건강제품
		<input type="checkbox" name="goods" value="운동기구">운동기구
	</td>
</tr>
<tr>
	<td align = "center" colspan="2" id=button>
	<input type="button" id=btn1 value="등록" onclick="check()">
	<input type="button" id=btn1 value="조회">		
	</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp"%>
<script>
function check(){
	if(document.form.custname.value==""){
		alert("회원성명이 입력되지 않았습니다.");
		document.form.custno.focus();
		return false;
	}
	if(document.form.phone.value==""){
		alert("회원전화가 입력되지 않았습니다.");
		document.form.phone.focus();
		return false;
	}
	if(document.form.address.value==""){
		alert("주소가 입력되지 않았습니다.");
		document.form.address.focus();
		return false;
	}
	if(document.form.joindate.value==""){
		alert("가입일자가 입력되지 않았습니다.");
		document.form.joindate.focus();
		return false;
    }
	document.form.submit();
}
</script>
</body>
</html>