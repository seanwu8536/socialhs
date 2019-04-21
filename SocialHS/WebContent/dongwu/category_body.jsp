<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
<div id="category" class="m-0" style="width: 100%;">
	<!-- 여기에 카테고리 포문 출력 -->
	<c:forEach var="list" items="${hsList }" varStatus="status">
	<c:if test="${status.index % 5 == 0 }">
		<nav class="nav nav-pills nav-fill mb-1">
	</c:if>
		<a class="nav-item nav-link m-1 active" style="background-color: #2C4762;" href="LocationController?location=${l_idx}&bbs_idx2=${list.bbs_idx }">
		${list.bbs_name }&nbsp;
		</a>
	<c:if test="${(status.index+1) % 5 == 0 }">
		</nav>
	</c:if>
	</c:forEach>
</div>
