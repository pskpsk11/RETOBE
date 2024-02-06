<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.gray{
		height: 100%
	}
</style>
<div class="board_head">
	<c:if test="${not empty courseInfo}">
     		<p>${courseInfo.detail}</p>
	</c:if>
</div>
