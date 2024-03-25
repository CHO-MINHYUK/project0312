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
<%@ include file="dbcon.jsp" %>
<%
	String pcode = request.getParameter("pcode");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select pname,price,stockQty from product0320 where pcode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, pcode);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String pname = rs.getString("pname");
		String price = rs.getString("price");
		String stockQty = rs.getString("stockQty");	
%>
<h2>상품 등록 화면</h2>
<form name="form" method="post" action="goodsUpdateProcess.jsp">
<table border=1>
<tr>
	<th>상품코드</th>
	<td><input type="text" name="pcode" value="<%=pcode %>"></td>
</tr>
<tr>
	<th>상품명</th>
	<td><input type="text" name="pname" value="<%=pname %>"></td>
</tr>
<tr>
	<th>단가</th>
	<td><input type="text" name="price" value="<%=price %>"></td>
</tr>
<tr>
	<th>재고수량</th>
	<td><input type="text" name="stockQty" value="<%=stockQty %>"></td>
</tr>
<tr>
		<td align = "center" colspan="2" id=button>
		<input type="button" id=btn1 value="등록" onclick="check()">
		<input type="reset" id=btn1 value="취소">		
		</td>
</tr>
<%
	}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp"%>
<script>
function check(){
	if(document.form.pcode.value==""){
		alert("상품코드가 입력되지 않았습니다.");
		document.form.pcode.focus();
		return false;
	}
	if(document.form.pcode.value.length != 4 ||isNaN(document.form.pcode.value)){
		alert("상품코드는 문자 4자리만 가능합니다.")
		document.form.pcode.focus();
		return false;	
	}
	if(document.form.pname.value==""){
		alert("상품명이 입력되지 않았습니다.");
		document.form.m_no.focus();
		return false;
	}
	if(document.form.price.value==""){
		alert("단가가 입력되지 않았습니다.");
		document.form.price.focus();
		return false;
    }
	if(document.form.stockQty.value==""){
		alert("재고수량이 입력되지 않았습니다.");
		document.form.stockQty.focus();
		return false;
    }
	document.form.submit();
}
</script>
</body>
</html>