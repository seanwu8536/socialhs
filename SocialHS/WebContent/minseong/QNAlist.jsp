<%@page import="com.bc.minseong.command.QNA_DAO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.member.Paging"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.minseong.command.BullteinBoardDAO"%>
<%@page import="com.bc.study.vo.PagingVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Paging p = new Paging();

	p.setTotalRecord(BullteinBoardDAO.getTotalCount());
	p.setTotalPage();

	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	p.setEnd(p.getNowPage() * p.getNumPerpage());
	p.setBegin(p.getEnd() - p.getNumPerpage() + 1);

	p.setBeginPage((p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
%>
<%
	Map<String, Integer> map = new HashMap<>();
	map.put("beginPage", p.getBegin());
	map.put("endPage", p.getEnd());
	System.out.println("map : " + map);

	List<BoardVO> list = QNA_DAO.getMaplist(map);

	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);
%>

<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>
<%@ include file="../jieun/header_head.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>
<%@ include file="../head.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>
<%@ include file="../head.jsp"%>
<%
	}
%>

<title>Q&A 게시판</title>
<style>
.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: 1px solid black;
	font-weight: bold;
	color: black;
}

.paging li a:hover {
	background-color: grey;
	color: black;
}

.paging .disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.paging .now {
	padding: 3px 7px;
	border: 1px solid #9cf;
	background-color: #9cf;
	color: white;
	font-weight: bold;
}

a:hover {
	text-decoration: underline;
	color: #b30000;
}

#infohead {
	text-align: left;
	width: 1200px;
}
</style>
</head>

<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>
<%@ include file="../jieun/header.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>
<%@ include file="../jieun/loginheader.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>
<%@ include file="../Admin/A_loginheader.jsp"%>
<%
	}
%>

<!--  <BODY>  -->

<div id="container">
	<ul id="infohead" class="nav mx-auto my-4">
		<li class="nav-item"><a href="javascript:history.back()">뒤로가기</a></li>
	</ul>
	<h1 class="display-4 my-4 text-center">Q&A</h1>
	<hr>
	<p>
		<button type="button" class="btn btn-info"
			style="margin-left: 1400px;"
			onclick="location.href='/SocialHS/minseong/QNAwrite.jsp'">게시물
			작성하기</button>
	</p>
	<table class="table mx-auto" style="width: 1200px;">
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">조회수</th>
				<th scope="col">GOOD</th>
				<th scope="col">BAD</th>
			</tr>
		</thead>
		<tbody>

			<c:if test="${not empty list }">
				<c:forEach var="vo" items="${list }">
					<tr>
						<td scope="row">${vo.getBb_idx() }</td>
						<td><a href="QNA?type=QNAone&bb_idx=${vo.bb_idx }">${vo.getTitle() }</a></td>
						<td>${vo.getId() }</td>
						<td>${vo.getHit() }</td>
						<td>${vo.getGood() }</td>
						<td>${vo.getBad() }</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty list }">
				<tr scope="row">
					<td colspan="6">입력된 자료가 없습니다</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	
	
	<!-- 페이징  -->
	<table class="table mx-auto" style="width: 300px;">
		<tr>
			<%-- 이전으로(←) --%>
			<c:choose>
				<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
					<td class="disable">←</td>
				</c:when>
				<c:otherwise>
					<td><a
						href="/SocialHS/minseong/QNAlist.jsp?cPage=${pvo.beginPage - 1 }">
							← </a></td>
				</c:otherwise>
			</c:choose>


			<%-- 블록내 페이지 반복 --%>

			<c:forEach var="p" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:choose>
					<c:when test="${p == pvo.nowPage }">
						<td class="now">${p }</td>
					</c:when>
					<c:otherwise>
						<td><a href="/SocialHS/minseong/QNAlist.jsp?cPage=${p }">${p }</a></td>
					
						</c:otherwise>
					</c:choose>
					</c:forEach>
					
					<%-- 다음으로(→) --%>
					
					<c:choose>
						<c:when test="${pvo.endPage >= pvo.totalPage }">
							<td class="disable"> → </td>
						</c:when>
						<c:otherwise>	
							<td><a
						href="/SocialHS/minseong/QNAlist.jsp?cPage=${pvo.endPage + 1 }"> → </a></td>
						</c:otherwise>
					</c:choose>
			</tr>
	</table>
</div>


<%@ include file="../jieun/footer.jsp"%>










