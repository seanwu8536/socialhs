<%@page import="com.bc.member.memberVO"%>
<%@page import="com.bc.member.memberDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="com.bc.member.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 게시글 목록 화면에 표시 --%>
<%
	//페이징 처리 
	Paging p = new Paging();
	BoardVO bvo = new BoardVO();
	p.setTotalPage(); //전체 페이지 수 구하기

	System.out.println("전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("전체 페이지 수 : " + p.getTotalPage());

	//2.현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}

	//3.현재 페이지의 시작번호와 끝 번호 
	p.setBegin((p.getNowPage() - 1) * p.getNumPerpage() + 1);
	p.setEnd(p.getBegin() + p.getNumPerpage() - 1);

	//4. 블록의 시작 페이지, 끝페이지 번호
	p.setBeginPage((p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

	System.out.println("=============================");
	System.out.println("시작 페이지번호 : " + p.getBeginPage());
	System.out.println("끝 페이지번호 : " + p.getEndPage());
	System.out.println("=============================");

	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
%>
<%
	//5.현재 페이지 기준 게시글 가져오기
	Map<String, String> map = new HashMap<>();
	String beginNum = String.valueOf(p.getBegin());
	String endNum = String.valueOf(p.getEnd());

	map.put("begin", beginNum);
	map.put("end", endNum);

	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);
%>

<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="../jieun/header_head.jsp"%>
<%
	} else {
%>
<%@ include file="../head.jsp"%>
<%
	}
%>
<%@ include file="../wonho/sidebar_head.jsp"%>
<%@ include file="../dongwu/category_head.jsp"%>
<%@ include file="../dongwu/content_head.jsp"%>
<title>Social Hobby & Study</title>
<!-- head 태그 -->
<style>
#infohead {
	text-align: left;
	width: 800px;
	margin: auto;
}

a {
	color: black;
}

a:hover {
	text-decoration: underline;
	color: #b30000;
}

#mypage table {
	/* border: 1px lightgray solid;
		border-collapse: collapse; */
	width: 800px;
	margin: auto;
	padding: 50px;
}

#mypage .center {
	text-align: center;
}

#mypage .right {
	text-align: right;
}

/* 페이징 표시 시작 */
.paging {
	list-style: none;
	display: table;
	margin-left: auto;
	margin-right: auto;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	color: black;
}

.paging li a:hover {
	color: #b30000;
	font-weight: bold;
}

.paging .disable {
	color: silver;
}

.paging .now {
	font-weight: bold;
	color: #b30000;
	text-decoration: underline;
}

/* 페이징 표시 끝 */
</style>
</head>
<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="../jieun/header.jsp"%>
<%
	} else {
%>
<%@ include file="../jieun/loginheader.jsp"%>
<%
	}
%>
<!-- <body> -->
<%@ include file="../dongwu/subnav.jsp"%>

<div class="row">
	<div class="col-2" style="width: 100%;">
		<!-- aside -->
		<%@ include file="../wonho/sidebar_body.jsp"%>
	</div>

	<div class="col-10">

		
		<div id="mypage"
			class="container  text-black mx-auto mt-5 align-middle">
			<div class="container text-center">
				<ul id="infohead" class="nav mx-auto my-2">
					<li class="nav-item"><a href="javascript:history.back()">뒤로가기</a></li>
				</ul>

				<form method="post">

					<h2 class="display-4">검색 결과</h2>

					<table class="table my-5 mx-auto">
						<thead class="thead bg-dark text-white">
							<tr class="pagetitle">
								<th class="no">글번호</th>
								<th class="title">제목</th>
								<th class="writer">글쓴이</th>
								<th class="date">작성일</th>
								<th class="hit">조회</th>
							</tr>
						</thead>
						<tbody>
							<%-- 리스트에 데이터가 있을 때 --%>

							<c:if test="${not empty sessionScope.s_list }">
								<c:forEach var="e" items="${s_list }">
									<tr>
										<td class="center">${e.bb_idx }</td>
										<td class="clickTitle"><a href="HobbyController?type=view&bb_idx=${e.bb_idx }">${e.title }</a></td>
										<td>${e.id }</td>
										<td class="center">${e.regdate.substring(0, 10) }</td>
										<td class="center">${e.hit }</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty s_list }">
								<tr>
									<td colspan="5" class="center">검색 결과 게시글이 없습니다.<br>
									</td>
								</tr>
							</c:if>

						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">
									<ol class="paging">

										<%-- 이전페이지 사용여부 --%>
										<c:choose>
											<%-- 사용불가 (첫번째 블록) --%>
											<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
												<li class="disable">&lt;&nbsp;이전&nbsp;</li>
											</c:when>

											<%-- 사용가능 --%>
											<c:otherwise>
												<li><a
													href="MypageController?type=moreWrite&cPage=${pvo.beginPage-1 }">
														&lt;&nbsp;이전&nbsp;</a></li>
											</c:otherwise>
										</c:choose>

										<%-- 현재 블록의 시작페이지>끝 페이지 반복처리 --%>
										<c:forEach var="k" begin="${pvo.beginPage }"
											end="${pvo.endPage }">
											<c:choose>
												<c:when test="${k == pvo.nowPage }">
													<li class="now">${k }</li>
												</c:when>
												<c:otherwise>
													<li><a
														href="MypageController?type=moreWrite&cPage=${k }">${k }</a>
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
												<li><a
													href="MypageController?type=moreWrite&cPage=${pvo.endPage+1 }">
														&nbsp;다음&nbsp;&gt;</a></li>
											</c:otherwise>
										</c:choose>
									</ol>

								</td>
							</tr>
						</tfoot>
					</table>
				</form>
						<div class="row d-flex justify-content-center" style="width: 100%;">
			<%@ include file="../dongwu/searchnwrite.jsp"%>
		</div>
			</div>
		</div>

		<!-- <div class="row d-flex justify-content-center"> -->
		<!-- content -->
		<div class="row d-flex justify-content-center" style="width: 100%;">
			<%@ include file="../dongwu/content_body.jsp"%>
			<!-- </div> -->
		</div>
	</div>

</div>

<%@ include file="../jieun/footer.jsp"%>

