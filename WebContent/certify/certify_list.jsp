<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="euc-kr"
    %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="l" %>
    

<!DOCTYPE html>
<html>
<body>
<table border='1' cellpadding='12'>
	<l:forEach var="vo" items="${rl}">
		<tr>	
			<td>${vo.serialNo}</td>
			<td>${vo.helperID}</td>
			<td>${vo.details}</td>
			<td>${vo.housePlace}</td>
			<td>${vo.certify_photo_ofn}</td>
			<td>${vo.certify_photo_fsn}</td>
			<td>${vo.certify_day}</td>
			<td><a href="certify_delete2.do?serialNo=${vo.serialNo}">ªË¡¶</a></td>
			</tr>
	</l:forEach>
</table><br/><br/>
</body>
</html>