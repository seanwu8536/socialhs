<%@page import="java.util.ArrayList"%>
<%@page import="com.bc.admin.A_AllBoardVO"%>
<%@page import="com.bc.admin.AdminDAO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="com.bc.member.Paging"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.admin.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 게시글 목록 화면에 표시 --%>

<!DOCTYPE html>
<html>
<head>
<%
	if (session.getAttribute("AdminVO") == null) {
%>		<%@ include file="../jieun/header.jsp"%>
<%	} else {
%>		<%@ include file="A_loginheader.jsp"%>
<%	}
%>

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
<meta charset="UTF-8">
<title>[A] 검색결과(제목/내용)</title>
<style>

</style>
<link href="css/A_Paging.css" rel="stylesheet" type="text/css">
<link href="css/A_morepage.css" rel="stylesheet" type="text/css">

<script>
	function search_go(frm) {
		frm.action = "AdminController?type=search";
		frm.submit();
	}
</script>
	<jsp:include page="function.jsp"></jsp:include>
</head>
<body>
<div id="adminPage" class="jumbotron jumbotron-fluid">
	
	<jsp:include page="infohead.jsp"></jsp:include>
	
	<div id="allList">
	
	<form method="post">
		<div id="searchmenu">
			<select name="select">
				<option value="1">제목/내용</option>
				<option value="2">아이디</option>
			</select>
			<input type="text" size="50px" name="search" placeholder="검색어 입력">&nbsp;&nbsp;
			<input type="button" value="검색" onclick="search_go(this.form)">
			<input type="button" value="뒤로가기" onclick="history.back()">
		</div>
	</form>
	
	<form method="post">
		<p class="text-center">총 <font style="color: forestgreen"><b>${cnt.size() }</b></font> 건 검색되었습니다.</p>
		<table class="table my-2 mx-auto text-center">
			<thead class="thead bg-success text-white">
				<tr class="pagetitle">
					<th>NO</th>
					<th class="no">게시판번호</th>
					<th class="category">카테고리</th>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="date">작성일</th>
					<th>모집여부</th>
					<th>모집인원</th>
				</tr>
			</thead>
			<tbody>
			<%-- 데이터가 있을 때 --%>
			<c:if test="${not empty searchlist}">
			<c:forEach var="search" items="${searchlist }" varStatus="status">
				<tr>
					<td>${pvo.totalRecord - ((pvo.nowPage -1) * pvo.numPerpage + status.index) }</td>
					<td>${search.getBb_idx() }</td>
					<td>${search.getBbs_name() }</td>
					<td><a href="BullteinController?type=bullteinOne&bb_idx=${search.getBb_idx() }">
					${search.getTitle() }</a></td>
					<td>${search.getId() }</td>
					<td>${search.getRegdate().substring(0, 10) }</td>
					<td>${search.getRp() }</td>
					<td>${search.getCur_member() }&nbsp;/&nbsp;${search.getReq_member() }</td>
				</tr>
			</c:forEach>	
			</c:if>
			
			<c:if test="${empty searchlist}">
				<tr>
					<td colspan="8" class="center">등록된 게시글이 없습니다.<br>
						지금 바로 새로운 게시글을 등록해 보세요!</td>
				</tr>
			</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8">
						<ol class="paging">
						
						<%-- 이전페이지 사용여부 --%>
						<c:choose>
							<%-- 사용불가 (첫번째 블록) --%>
							<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
								<li class="disable">&lt;&nbsp;이전&nbsp;</li>
							</c:when>
							
							<%-- 사용가능 --%>
							<c:otherwise>
								<li><a href="AdminController?type=search&select=1&search=${search }
								cPage=${pvo.beginPage-1 }">
								&lt;&nbsp;이전&nbsp;</a></li>
							</c:otherwise>
						</c:choose>
						
						<%-- 현재 블록의 시작페이지>끝 페이지 반복처리 --%>
						<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:choose>
							<c:when test="${k == pvo.nowPage }">
								<li class="now">${k }</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="AdminController?type=search&select=1&search=${search }
									&cPage=${k }">${k }</a>
								</li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						
						<%-- 다음페이지 --%>
						<c:choose>
							<%-- 사용불가 --%>
							<c:when test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable" id="next">&nbsp;다음&nbsp;&gt;</li>
							</c:when>
							<c:otherwise>
								<li><a href="AdminController?type=search&select=1&search=${search }
								&cPage=${pvo.endPage+1 }">
									&nbsp;다음&nbsp;&gt;</a></li>
							</c:otherwise>
						</c:choose>
						</ol>
					
					</td>
				</tr>
			</tfoot>
		</table>
	
	</form>
	</div>
</div>

</body>
</html>