<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="com.bc.member.memberVO"%>
<%@page import="com.bc.member.memberDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="com.bc.member.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 게시글 목록 화면에 표시 --%>

<%
	memberVO mvo = (memberVO)session.getAttribute("memberVO");
	//5.현재 페이지 기준 게시글 가져오기 
	Map<String, String> map = new HashMap<>();
	map.put("begin", "1");
	map.put("end", "5");
	map.put("id", mvo.getId());

	List<BoardVO> list = memberDAO.getMypageList(map);
	pageContext.setAttribute("list", list);

	List<CommentVO> commList = memberDAO.getMypageCommList(map);
	pageContext.setAttribute("commList", commList);
	
%>

<%@ include file="../head.jsp" %>

<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
	#infohead {
		text-align: left;
		width: 800px; margin: auto;
	}
	
	a { color: black; }
	a:hover {
		text-decoration: underline;
		color: #b30000;
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
		color: #b30000;
	}
	
	.tabcontent {
		display: none;
		width: 800px; margin: auto;
		
	}
	.tabcontent.current {
		display: inherit;
	}
	
</style>
<script>
	function editInfo(frm) {
		frm.action = "MypageController?type=update";
		frm.submit();
		
	}
	function messengerGo(frm) {
		frm.action = "MessengerController?type=msnList";
		frm.submit();
		
	}
	function deleteInfo(frm) {
		if (confirm("회원 탈퇴를 하시겠습니까?") == true) {
			
			frm.action = "MypageController?type=delete";
			frm.submit();
		} else {
			return;
		}
		
	}
	
</script>
<script type="text/javascript">
	//내가 쓴 게시글 / 댓글 탭 
	$(document).ready(function() {
		$('ul.tab li').click(function() {
			var tabid = $(this).attr('data-tab');
			
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			
			$(this).addClass('current');
			$("#"+tabid).addClass('current');
		})
	})
</script>

</head>
<%@ include file="../jieun/loginheader.jsp" %>
<!-- jumbotron -->
<div id="mypage"
	class="container text-black mx-auto mt-5 align-middle">
	<div class="container text-center">
		<ul id ="infohead" class="nav mx-auto my-2">
			<li class="nav-item" style="font-weight: bold">내 정보</li>&nbsp;|&nbsp;
			<li class="nav-item"><a href="index.jsp">home</a></li>
		</ul>
	
	<form method="post">
		<table class="table my-2 mx-auto">
			<thead class="thead bg-dark text-white">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>등급</th>
					<th>포인트</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="center">${memberVO.getId() }</td>
					<td class="center">${memberVO.getName() }</td>
					<td class="center">${memberVO.getRank() } 등급</td>
					<td class="center">${memberVO.getPoint() } point</td>
					<td class="center">${memberVO.getRegdate().substring(0, 10) }</td>
				</tr>
				<tr>
					<td colspan="5" class="right">
						<input type="button" name="edit" class="btn btn-dark mb-2"
							value="내 정보 수정" onclick="editInfo(this.form)">
						<input type="button" name="sendMsg" class="btn btn-dark mb-2"
							value="쪽지" onclick="messengerGo(this.form)">
						<input type="button" name="delete" class="btn btn-dark mb-2"
							value="탈퇴하기" onclick="deleteInfo(this.form)">
						
						<input type="hidden" name="id" value="${memberVO.getId() }">
						<input type="hidden" name="infochk" value="chk">
					</td>
				</tr>
			</tbody>
		</table>
	</form>	
		<%-- 최신 글 목록/댓글 목록 보이기(제일 위에 글/댓글 5개만) --%>
		<%-- 내가 쓴 게시글 / 내가 쓴 댓글 /  카페 활동 알림 --%>
		<div id ="infohead">
			<ul class="tab nav mx-auto my-2" >
				<li class="tablink current nav-item" data-tab="allPage">내가 쓴 게시글</li>
				<span>&nbsp;&nbsp;</span>
				<li class="tablink nav-item" data-tab="allComment">내가 쓴 댓글</li>
			</ul>
		</div>
		
		<div id="allPage" class="tabcontent current">
			<table class="table my-2 mx-auto">
				<thead class="bg-dark text-white">
					<tr>
						<th class="no">글번호</th>
						<th class="title">제목</th>
						<th class="writer">글쓴이</th>
						<th class="date">작성일</th>
						<th class="hit">조회</th>
					</tr>
				</thead>
				<tbody>
					<%-- 리스트에 데이터가 있을 때 --%>
					<c:if test="${not empty list }">
						<c:forEach var="vo" items="${list }">
							<tr>
								<td class="center">${vo.getBb_idx() }</td>
								<td class="clickTitle">
									<a href="BullteinController?type=bullteinOne&bb_idx=${vo.getBb_idx() }">
									${vo.getTitle() }</a>
								</td>
								<td>${vo.getId() }</td>
								<td class="center">${vo.getRegdate().substring(0, 10) }</td>
								<td class="center">${vo.getHit() }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list }">
						<tr>
							<td colspan="5" class="center">등록된 게시글이 없습니다.<br>
								지금 바로 새로운 게시글을 등록해 보세요!</td>
						</tr>
					</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" class="right">
						<a href="MypageController?type=moreWrite&id=${memberVO.getId() }">
						<b>더보기&gt;</b></a></td>
				<tr>
			</tfoot>
			</table>
		</div>
		
		
		<%-- 댓글 --%>
		<div id="allComment" class="tabcontent">
			<table class="table my-2 mx-auto">
				<tbody>
				<%-- 데이터가 있을 때 --%>
				<c:if test="${not empty commList }">
					<c:forEach var="cvo" items="${commList }">
						<tr>
							<td colspan="2" class="left"><b>${cvo.getId() }</b>
								&nbsp;&nbsp;&nbsp;<font>${cvo.getRegdate() }</font></td>
						</tr>
						<tr>
							<td class="left">${cvo.getContent() }</td>
							<td class="left">${cvo.getTitle() }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty commList }">
					<tr>
						<th colspan="5">등록된 댓글이 없습니다.</th>
					</tr>
				</c:if>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" class="right">
						<a href="MypageController?type=moreComment&id=${memberVO.getId() }">
						<b>더보기&gt;</b></a></td>
					<tr>
				</tfoot>
			
			</table>
		
		</div>
		
	</div>
</div>

<%@ include file="../jieun/footer.jsp" %>