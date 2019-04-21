<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진 게시판</title>
</head>
<body>
<div id="container">
	<h2>사진 게시판입니다.</h2>
	<hr>
	${list }
	<p><input type="button" name="photWrite" value="글쓰기"></p>
<form>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>모집인원</th>
				<th>rp</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty list }">
				<c:forEach var="p" items="${list }">
					<tr>
						<td>${p.phot_idx }</td>
						<td>${p.id }</td>
						<td><a href="../PhotoController?type=photoOne">${p.title }</a></td>
						<td>${p.req_member }</td>
						<td>${p.rp }</td>
						<td>${p.regdate }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="6">작성된 글이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</form>

</div>
</body>
</html>