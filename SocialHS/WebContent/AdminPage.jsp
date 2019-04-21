<%@page import="com.bc.member.memberVO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="com.bc.admin.A_AllBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.admin.AdminDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.admin.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	if (session.getAttribute("AdminVO") == null) {
%>		<%@ include file="jieun/header_head.jsp"%>
<%	} else {
%>		<%@ include file="head.jsp"%>
<%	}
%> --%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<script src="//code.jquery.com/jquery.min.js"></script>

<%	// ***** ***** ***** ***** ***** ***** ***** *****
	AdminVO avo = (AdminVO) session.getAttribute("AdminVO");
	//5.현재 페이지 기준 게시글 가져오기
	Map<String, String> map = new HashMap<>();
	map.put("begin", "1");
	map.put("end", "10");
	
	List<A_AllBoardVO> A_list = AdminDAO.getAllList(map);
	pageContext.setAttribute("A_list", A_list);
	//System.out.println("A_list : " + A_list);
	
	List<memberVO> M_list = AdminDAO.getAllmemberList(map);
	pageContext.setAttribute("M_list", M_list);
	//System.out.println("M_list : " + M_list);
	
	List<A_AllBoardVO> H_list = AdminDAO.getAllhobbyList(map);
	pageContext.setAttribute("H_list", H_list);
	//System.out.println("H_list : " + H_list);
	
	List<A_AllBoardVO> S_list = AdminDAO.getAllstudyList(map);
	pageContext.setAttribute("S_list", S_list);
	//System.out.println("S_list : " + S_list);
	
	
%>

<title>[A] 소셜 하비 앤 스터디</title>

<%
	if (session.getAttribute("AdminVO") == null) {
%>		<%@ include file="jieun/header.jsp"%>
<%	} else {
%>		<%@ include file="Admin/A_loginheader.jsp"%>
<%	}
%>

<style>
	#infohead {
		width: 200px;
		height: 100%;
		background-color: #f9f9f9;
		margin-top: -9999px;
		margin-bottom: -9999px;
		padding-top: 9999px;
		padding-bottom: 9999px;
	}
	
	.menu { text-indent: 10px; }
	.topMenuLi {
		list-style: none;
		cursor: pointer;
	}
	.topMenuLi li { list-style: none; }
	.menuLink {
		height: 35px;
		line-height: 35px;
	}
	
	.submenuUl { display: none; }
	.submenuUl a {
		margin-bottom: 2px;
		height: 35px;
		line-height: 35px;
		cursor: pointer;
	}
	
	.submenuLink {
		display: block;
		height: 100%; width: 100%;
		cursor: pointer;
		background-color: #f1f1f1;
		text-decoration: none;
	}
	.submenuLink:hover {
		display: block;
		background-color: gold;
	}
	
	a { color: black; }
	a:hover {
		text-decoration: underline;
		color: forestgreen;
	}
	#adminPage table {
		/* border: 1px lightgray solid;
		border-collapse: collapse; */
		width: 1100px; margin: auto; padding: 50px; 
	}
	#allList, #hobbylist, #studylist, #allmemberInfo {
		padding-left: 50px; }
	#adminPage .center { text-align: center; }
	#adminPage .right { text-align: right; }
	#adminPage .left { text-align: left; }
	#adminPage { overflow: hidden; display: flex; }
	
	/* 탭 스타일 */
	
	.tabcontent { display: none; }
	.tabcontent.current { display: inherit; }
	#infohead .current { background-color: gold; } 

</style>
<script type="text/javascript">
	//내가 쓴 게시글 / 댓글 탭 
	$(document).ready(function() {
		$('.tab a').click(function() {
			var tabid = $(this).attr('data-tab');
			
			$('.tab a').removeClass('current');
			$('.tabcontent').removeClass('current');
			
			$(this).addClass('current');
			$("#"+tabid).addClass('current');
		})
	})
	
	//사이드바 
	$(document).ready(function() {
		$(".topMenuLi>a").click(function() {
			var submenu = $(this).next("div");
			if( submenu.is(":visible") ) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});
	function file_up(form){
		alert(form);
		form.action = 'AdminController?type=categoryAdd';
		form.submit(); 
	}	
</script>


</head>

<!-- body -->
<div id="adminPage" class="jumbotron jumbotron-fluid">

	<!-- jumbotron -->
	<div id="infohead">
		<ul class="menu tab">
			<li class="topMenuLi">
				<a class="menuLink tablink current" data-tab="allList">전체 글목록</a>
				<div class="submenuUl nav-item">
					<a class="submenuLink tablink" data-tab="allList">전체보기</a>
					<a class="submenuLink tablink" data-tab="hobbylist">취미</a>
					<a class="submenuLink tablink" data-tab="studylist">스터디</a>
				</div>
			</li>
			<li class="topMenuLi nav-item">
				<a class="menuLink tablink" data-tab="allmemberInfo">회원정보보기</a></li>
			<li class="topMenuLi nav-item"><a class="menuLink tablink" data-tab="categoryAdd">카테고리추가</a></li>
			<li class="topMenuLi nav-item"><a class="menuLink tablink" data-tab="chartpage"
				href="AdminController?type=googleChart">차트보기</a></li>
		</ul>
	</div>
	
	<div class="container">
	<%-- 글목록 --%>
	<div id="allList" class="tabcontent current center-block">
		<table class="table my-2 mx-auto text-center">
			<thead>
				<tr>
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
			<c:if test="${not empty A_list}">
			<c:forEach var="allList" items="${A_list }">
				<tr>
					<td>${allList.getBb_idx() }</td>
					<td>${allList.getBbs_name() }</td>
					<td>${allList.getTitle() }</td>
					<td>${allList.getId() }</td>
					<td>${allList.getRegdate().substring(0, 10) }</td>
					<td>${allList.getRp() }</td>
					<td>${allList.getCur_member() }&nbsp;/&nbsp;${allList.getReq_member() }</td>
				</tr>
			</c:forEach>	
			</c:if>
			
			<c:if test="${empty A_list}">
				<tr>
					<td colspan="7" class="center">등록된 게시글이 없습니다.<br>
						지금 바로 새로운 게시글을 등록해 보세요!</td>
				</tr>
			</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7" class="right">
						<a href="AdminController?type=allList"><b>더보기&gt;</b></a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div> <%-- 전체 글목록 끝 --%>
	
	<%-- 취미 --%>
	<div id="hobbylist" class="tabcontent center-block">
		<table class="table my-2 mx-auto text-center">
			<thead>
				<tr>
					<th>게시판번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>모집여부</th>
					<th>모집인원</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${not empty H_list}">
			<c:forEach var="hobby" items="${H_list }">
				<tr>
					<td>${hobby.getBb_idx() }</td>
					<td>${hobby.getBbs_name() }</td>
					<td>${hobby.getTitle() }</td>
					<td>${hobby.getId() }</td>
					<td>${hobby.getRegdate().substring(0, 10) }</td>
					<td>${hobby.getRp() }</td>
					<td>${hobby.getCur_member() }&nbsp;/&nbsp;${hobby.getReq_member() }</td>
				</tr>
			</c:forEach>	
			</c:if>
			
			<c:if test="${empty H_list}">
				<tr>
					<td colspan="7" class="center">등록된 게시글이 없습니다.<br>
						지금 바로 새로운 게시글을 등록해 보세요!</td>
				</tr>
			</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7" class="right">
						<a href="AdminController?type=hobbylist"><b>더보기&gt;</b></a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div> <%-- 취미목록 끝 --%>
	
	<%-- 스터디 --%>
	<div id="studylist" class="tabcontent center-block">
		<table class="table my-2 mx-auto text-center">
			<thead>
				<tr>
					<th>게시판번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>모집여부</th>
					<th>모집인원</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${not empty S_list}">
			<c:forEach var="study" items="${S_list }">
				<tr>
					<td>${study.getBb_idx() }</td>
					<td>${study.getBbs_name() }</td>
					<td>${study.getTitle() }</td>
					<td>${study.getId() }</td>
					<td>${study.getRegdate().substring(0, 10) }</td>
					<td>${study.getRp() }</td>
					<td>${study.getCur_member() }&nbsp;/&nbsp;${study.getReq_member() }</td>
				</tr>
			</c:forEach>	
			</c:if>
			
			<c:if test="${empty S_list}">
				<tr>
					<td colspan="7" class="center">등록된 게시글이 없습니다.<br>
						지금 바로 새로운 게시글을 등록해 보세요!</td>
				</tr>
			</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7" class="right">
						<a href="AdminController?type=studylist"><b>더보기&gt;</b></a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div> <%-- 스터디 목록 끝 --%>
	
	<%-- 회원정보 --%>
	<div id="allmemberInfo" class="tabcontent center-block">
		<table class="table my-2 mx-auto text-center">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>가입날짜</th>
					<th>등급</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${not empty M_list}">
				<c:forEach var="allMember" items="${M_list }">
					<tr>
						<td>${allMember.getId() }</td>
						<td>${allMember.getName() }</td>
						<td>${allMember.getRegdate().substring(0, 10) }</td>
						<td>${allMember.getRank() }</td>
						<td>${allMember.getPoint() }&nbsp;Point</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty M_list }">
				<tr>
					<td colspan="5" class="center">가입된 회원이 없습니다.</td>
				</tr>
			</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" class="right">
						<a href="AdminController?type=allmemberInfo"><b>더보기&gt;</b></a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div> <%-- 회원정보 보기 끝 --%>
	
	<%--카테고리 추가 --%>
	<div id="categoryAdd" class="tabcontent">
		
		<form method="post" class="form-horizontal" enctype="multipart/form-data">
		 <table class="table my-2 mx-auto">
				<tr>
					<td>
						<select name = "bbs_type" id = "hobbyStudy" >
							<option value = "300">hobby</option>
							<option value = "700">study</option>
						</select>
						<input type="text" name="bbs_name" id = "bbs_name" placeholder="카테고리 이름">
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">사진파일 선택 <input type="file" name="f_name" id= "f_name"></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" class="btn btn-primary" value="카테고리 추가" onclick="file_up(this.form)">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	</div>
</div>

<%@ include file="jieun/footer.jsp"%>