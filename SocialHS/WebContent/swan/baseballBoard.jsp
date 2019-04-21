<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>야구 게시판</title>
</head>
<body>
	
	<h2>야구 모임</h2>
	<hr>
	<div>
	<table border="1">
		<thead>
			<tr>
				<th colspan="2">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list }">
			<tr>
				<td width="10%">${list.base_idx }</td>
				<td width="40%"><a href="#">${list.title }</a></td>
				<td>${list.id }</td>
				<td>${list.regdate.substring(0,10) }</td>
				<td>${list.hit }</td>
			</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
			<td colspan="5">
				<button>&lt;이전</button>
				1 2 3 
				<button>다음&gt;</button>
			</td>
			</tr>
		</tfoot>
	</table>
	</div>
	
	
</body>
</html>