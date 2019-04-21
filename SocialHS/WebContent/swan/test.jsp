<%@page import="com.bc.main.dao.SubLocationDAO"%>
<%@page import="com.bc.member.Paging"%>
<%@page import="com.bc.member.memberVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bc.member.memberDAO"%>
<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.main.vo.SubLocationVO"%>
<%@page import="com.bc.main.vo.LocationVO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>		<%@ include file="../jieun/header_head.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>		<%@ include file="../head.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>		<%@ include file="../head.jsp"%>
<%
	} 
%>
<%@ include file="../wonho/sidebar_head.jsp"%>
<%@ include file="../dongwu/content_head.jsp"%>
<title>게시판</title>

<link href="css/Paging.css" rel="stylesheet" type="text/css">
<style>
	#infohead {
		text-align: left;
		width: 800px; margin: auto;
	}
	
	a { color: black; }
	a:hover {
		text-decoration: underline;
		color: orangered;
	}
	
	#mypage table {
		/* border: 1px lightgray solid;
		border-collapse: collapse; */
		width: 800px; margin: auto; padding: 50px;
	}
	
	#mypage .center { text-align: center; }
	#mypage .right { text-align: right; }
	#mypage .left { text-align: left; }
	
	/* 탭 스타일 */
	ul.tab {
		width: 800px; margin: auto;
		float: left;
		list-style: none;
	}
	ul.tab li {
		background-color: none;
		color: black;
		display: inline-block;
		cursor: pointer;
	}
	
	ul.tab li.current {
		text-decoration: underline;
		color: orangered;
	}
	
	.tabcontent {
		display: none;
		width: 800px; margin: auto;
		
	}
	.tabcontent.current {
		display: inherit;
	}
	
	h3 {
		text-align : center;
	}
	
	.form-inline {
		width : 800px;
		margin : auto;
	}
	
</style>
</head>
<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>		<%@ include file="../jieun/header.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>		<%@ include file="../jieun/loginheader.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>		<%@ include file="../Admin/A_loginheader.jsp"%>
<%
	} 
%>
<!-- ------------------------------------------------------------------------------------ -->
		<h3>
			&lt;${l_name }  
					${sl_name }
			&gt;
		</h3>

		<div id="allPage" class="tabcontent current">
			<table class="table my-2 mx-auto">
				<thead>
					<tr>
						<th class="no">BB_IDX</th>
						<th class="title">TITLE</th>
						<th class="writer">Content</th>
						<th class="date">Time</th>
						<th class="hit">Place</th>
					</tr>
				</thead>
			<tbody>
					<%-- 리스트에 데이터가 있을 때 --%>
					<c:if test="${not empty subBoard }">
						<c:forEach var="sbl" items="${subBoard }">
					  		<tr>
					  			<td>${sbl.getBb_idx() }</td>
					  			<td>${sbl.getTitle() }</td>
					  			<td>${sbl.getContent() }</td>
					  			<td>${sbl.getTime() }</td>
					  			<td>${sbl.getPlace() }</td>
					  		</tr>
					  	</c:forEach>	
					</c:if>
					<c:if test="${empty subBoard }">
						<tr>
							<td colspan="5" class="center">
								등록된 게시글이 없습니다.<br>
								지금 바로 새로운 게시글을 등록해 보세요!
							</td>
						</tr>
					</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<ol class="paging">
						
						<%-- 이전페이지 사용여부 --%>
						<c:choose>
							<%-- 사용불가 (첫번째 블록) --%>
							<c:when test="${pvo.beginPage < pvo.cntPerPage }">
								<li class="disable">&lt;&nbsp;이전&nbsp;</li>
							</c:when>
							
							<%-- 사용가능  --%>
							<c:otherwise>
								<li>
								<a href="SubLocationController?type=sub&sl_idx=${sl_idx }&cPage=${pvo.begin-1 }&cntPerPage=${pvo.cntPerPage}">&lt;&nbsp;이전&nbsp;</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						<%-- 현재 블록의 시작페이지>끝 페이지 반복처리 --%>
						<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:choose>
							<c:when test="${k == pvo.cPage }">
								<li class="now">${k }</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="SubLocationController?type=sub&sl_idx=${sl_idx }&cPage=${k }&cntPerPage=${pvo.cntPerPage}">${k }</a>
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
								<li>
								<a href="SubLocationController?type=sub&sl_idx=${sl_idx }&cPage=${pvo.end+1 }&cntPerPage=${pvo.cntPerPage}">&nbsp;다음&nbsp;&gt;</a>
									</li>
							</c:otherwise>
						</c:choose>
						</ol>
					
					</td>
				</tr>
			</tfoot>
			</table>
		</div> 
				<div class="row d-flex justify-content-center" style="width: 100%;">
			<%@ include file="../dongwu/searchnwrite.jsp"%>
		</div>

<%@ include file="../jieun/footer.jsp"%>