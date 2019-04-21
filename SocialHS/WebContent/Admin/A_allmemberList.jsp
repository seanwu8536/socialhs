<%@page import="com.bc.member.memberDAO"%>
<%@page import="com.bc.member.memberVO"%>
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
<%
	//페이징 처리 
	Paging p = new Paging();
	AdminDAO adao = new AdminDAO();
	
	AdminVO avo = (AdminVO) session.getAttribute("AdminVO");
	
	p.setTotalRecord(adao.getMemberCount());
	p.setTotalPage(); //전체 페이지 수 구하기
	
	System.out.println("전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("전체 페이지 수 : " + p.getTotalPage());
	
	//2.현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	
	//3.현재 페이지의 시작번호와 끝 번호 
	p.setBegin((p.getNowPage() - 1) * p.getNumPerpage() +1);
	p.setEnd(p.getBegin() + p.getNumPerpage() -1);
	
	//4. 블록의 시작 페이지, 끝페이지 번호
	p.setBeginPage((p.getNowPage()-1) / p.getPagePerBlock() * p.getPagePerBlock() +1);
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock()-1);
	
	System.out.println("=============================");
	System.out.println("시작 페이지번호 : " + p.getBeginPage());
	System.out.println("끝 페이지번호 : " + p.getEndPage());
	System.out.println("=============================");
	
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}	
	
%>
<%	// ***** ***** ***** ***** ***** ***** ***** *****
	//5.현재 페이지 기준 게시글 가져오기
	Map<String, String> map = new HashMap<>();
	String beginNum = String.valueOf(p.getBegin());
	String endNum = String.valueOf(p.getEnd());
	map.put("begin", beginNum);
	map.put("end", endNum);
	
	System.out.println("beginNum : " + beginNum + "endNum : " + endNum);
	
	List<memberVO> M_list = AdminDAO.getAllmemberList(map);
	pageContext.setAttribute("M_list", M_list);
	System.out.println("M_list : " + M_list);
	System.out.println("확인 !! : " + M_list.size());
	
	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);
	
%>
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
<title>[A] 전체 회원 목록</title>
<style>

</style>
<link href="css/A_Paging.css" rel="stylesheet" type="text/css">
<link href="css/A_morepage.css" rel="stylesheet" type="text/css">

<script>
	//아이디/이름으로 검색 
	function search_go(frm) {
		frm.action = "AdminController?type=search";
		frm.submit();
	}
</script>
	<jsp:include page="function.jsp"></jsp:include>
</head>
<body>
<div id="adminPage" class="jumbotron jumbotron-fluid">
	
	<div id="infohead">
		<ul class="menu tab">
			<li class="topMenuLi">
				<a class="menuLink tablink" data-tab="allList">전체 글목록</a>
				<div class="submenuUl nav-item">
					<a class="submenuLink tablink" data-tab="allList"
					href="AdminController?type=allList">전체보기</a>
					<a class="submenuLink tablink" data-tab="hobbylist" 
					href="AdminController?type=hobbylist">취미</a>
					<a class="submenuLink tablink" data-tab="studylist"
					href="AdminController?type=studylist">스터디</a>
				</div>
			</li>
			<li class="topMenuLi nav-item">
				<a class="menuLink tablink current" data-tab="allmemberInfo"
				href="AdminController?type=allmemberInfo">회원정보보기</a></li>
			<li class="topMenuLi nav-item">
				<a class="menuLink tablink" data-tab="categoryAdd"
				href="AdminController?type=categoryAddPage">카테고리추가</a></li>
				<li class="topMenuLi nav-item"><a class="menuLink tablink" data-tab="chartpage"
				href="AdminController?type=googleChart">차트보기</a></li>
		</ul>
	</div>
	
	<div class="container">
	<div id="allmemberInfo" class="center-block">
	
	<form method="post">
		<div id="searchmenu">
			<select name="select">
				<option value="2">아이디</option>
			</select>
			<input type="text" size="50px" name="search" placeholder="검색어 입력">&nbsp;&nbsp;
			<input type="button" value="검색" onclick="search_go(this.form)">
		</div>
	</form>
	
	<form method="post">
		<table class="table my-2 mx-auto text-center">
			<thead class="thead bg-success text-white">
				<tr class="pagetitle">
					<th>NO</th>
					<th>아이디</th>
					<th>이름</th>
					<th>가입날짜</th>
					<th>등급</th>
					<th>포인트</th>
					<th>회원정보</th>
				</tr>
			</thead>
			<tbody>

			<%-- 데이터가 있을 때 --%>
			<c:if test="${not empty M_list}">
				<c:forEach var="allMember" items="${M_list }" varStatus="status">
					<tr>
					<%-- 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) --%>
						<td>${pvo.totalRecord - ((pvo.nowPage -1) * pvo.numPerpage + status.index) }</td>
						<td>${allMember.getId() }</td>
						<td>${allMember.getName() }</td>
						<td>${allMember.getRegdate().substring(0, 10) }</td>
						<td>${allMember.getRank() }&nbsp;등급</td>
						<td>${allMember.getPoint() }&nbsp;Point</td>
						<td><input type="button" value="상세보기"
							onclick="window.location.href='AdminController?type=info&id=${allMember.getId() }'">
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty M_list }">
				<tr>
					<td colspan="7" class="center">가입된 회원이 없습니다.</td>
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
								<li><a href="AdminController?type=allmemberInfo&cPage=${pvo.beginPage-1 }">
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
									<a href="AdminController?type=allmemberInfo&cPage=${k }">${k }</a>
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
								<li><a href="AdminController?type=allmemberInfo&cPage=${pvo.endPage+1 }">
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
</div>

</body>
</html>