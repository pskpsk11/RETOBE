<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	<c:if test="${cmd eq 'move'}"> // == 는 eq와 같다. 비교할 떄 사용
	   alert("${msg}");
	   location.href="${url}";
	</c:if>
	<c:if test="${cmd == 'back'}">
	   alert("${msg}");
	   history.back();
	</c:if>
</script>

</head>
<body>

</body>
</html>