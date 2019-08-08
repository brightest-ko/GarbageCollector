<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="customer.CustomerApplyVO"
    %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cd" %>
    <%
    String year = request.getParameter("year").trim();
    System.out.println(year);
	String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head> 
	<meta charset = "UTF-8">
</head>

<body>
	<input type="button" id="go_list" value="메인으로"/>
	
	<table border="1" cellpadding="12">
		<tr>
			<td>고객신청번호</td>
			<td>핸드폰번호</td>
			<td>인근주소</td>
			<td>대행자ID</td>
			<td>둘째주소</td>
			<td>상세주소</td>
			<td>가방갯수</td>
			<td>분리수거종류</td>
			<td>원하는수거시간대</td>
			<td>가격</td>
			<td>카드번호</td>
			<td>작성일자</td>
		</tr>
		<cd:forEach var="vo" items="${rl}">
			<tr>
				<td>${vo.serialNo}</td>
				<td>${vo.customer_phone}</td>
				<td>${vo.customer_addr_first}</td>
				<td>${vo.helperID}</td>
				<td>${vo.customer_addr_second}</td>
				<td>${vo.customer_addr_third}</td>
				<td>${vo.bag_num}</td>
				<td>${vo.trash_type}</td>
				<td>${vo.wanted_time}</td>
				
				<td>${vo.price}</td>
				<td>${vo.card_num}</td>
				<td>${vo.customer_apply_day}</td>
			</tr>
		</cd:forEach>
	</table>
	</body>
</html>