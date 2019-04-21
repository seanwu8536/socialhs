<%@page import="com.bc.main.dao.CommentDAO"%>
<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.minseong.command.BullteinBoardDAO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	String bb_idx = request.getParameter("bb_idx");
	BoardVO bbvo = BullteinBoardDAO.selectOne(bb_idx);
	System.out.println("bb_idx : " + bb_idx);

	List<CommentVO> cList = CommentDAO.getCommList(bb_idx);
	System.out.println("CommentDAO.getCommList(bb_idx) : " + bb_idx);
	System.out.println("cList : " + cList);

	pageContext.setAttribute("cList", cList);
	session.setAttribute("bbvo", bbvo);

	BullteinBoardDAO.updateHit(Integer.parseInt(bb_idx));
%>

<title>공지 사항</title>

<style>
th {
	width: 30%;
}

td {
	width: 70%;
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

<script>
	function update_go(frm) {
		//frm.action = "BullteinController?type=bullteinUpdate&bb_idx=${BoardVO.getBb_idx() }";
		frm.action = "minseong/bullteinBoardUpdate.jsp";
		frm.submit();
	}
	function delete_go(frm) {
		//frm.action = "BullteinController?type=bullteinDelete&bb_idx=${BoardVO.getBb_idx() }";
		//frm.action = "BullteinController?type=bullteinDelete";
		frm.action = "minseong/bullteinBoardDelete.jsp";
		frm.submit();
	}
	function good(frm) {
		frm.action = "BullteinController?type=bullteinGood&bb_idx=${BoardVO.getBb_idx() }"
		frm.submit();
	}
	function bad(frm) {
		frm.action = "BullteinController?type=bullteinBad&bb_idx=${BoardVO.getBb_idx() }"
		frm.submit();
	}
</script>
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

<div id="container" class="mx-auto" style="width: 1000px">
	<ul id="infohead" class="nav mx-auto my-4">
		<li class="nav-item"><a href="javascript:history.back()">뒤로가기</a></li>
	</ul>
	<h1 class="display-4 my-5 text-center">${BoardVO.getTitle() }</h1>
	<hr>
	<form method="post">
		<table class="table">
			<table class="table">
				<tr>
					<th scope="col" class="bg-light"><p class="lead text-center">글번호</p></th>
					<td scope="row"><p class="lead">${BoardVO.getBb_idx() }</p></td>

				</tr>
				<tr>
					<th scope="col" class="bg-light"><p class="lead text-center">작성자</p></th>
					<td><p class="lead">${BoardVO.getId() }</p></td>
				</tr>
				<tr>
					<th scope="col" class="bg-light"><p class="lead text-center">조회수</p></th>
					<td><p class="lead">${BoardVO.getHit() }</p></td>
				</tr>
				<tr>
					<th scope="col" class="bg-light"><p class="lead text-center">내용</p></th>
					<td><p class="lead">${BoardVO.getContent() }</p></td>
				</tr>
			</table>
			<div class="form-group">
				<div class="row">
					<input type="submit" class="btn btn-info mx-2 ml-auto"
						onclick="good(this.form)" value="좋아요">
					<p class="lead mx-2">${BoardVO.getGood() }</p>
					<input type="submit" class="btn btn-danger mx-2"
						onclick="bad(this.form)" value="별로에요">
					<p class="lead mx-2">${BoardVO.getBad() }</p>
				</div>
			</div>
			<div class="form-group">
				<input class="btn btn-warning" type="button"
					onclick="update_go(this.form)" value="수정하기"> <input
					class="btn btn-warning" type="button"
					onclick="delete_go(this.form)" value="삭제하기"> <input
					type="hidden" name="cPage" value="${cPage }">
			</div>
	</form>


	<%-- 댓글 입력 --%>
	<div class="card my-4">
		<h5 class="card-header">댓글 달기</h5>
		<div class="card-body">
			<form method="post" action="Comment?type=b_writeOk">
				<%
					if (session.getAttribute("memberVO") == null) {
				%>

				<p class="lead">작성자:</p>
				<input type="hidden" name="id" value="">

				<%
					} else {
				%>

				<p class="lead">작성자: ${memberVO.getId() }</p>
				<input type="hidden" name="id" value="${memberVO.getId() }">

				<%
					}
				%>

				<div class="form-group">
					<textarea class="form-control" rows="3" name="content"></textarea>
				</div>
				<input type="hidden" name="bb_idx" value="${bbvo.bb_idx }">
				<input type="hidden" name="bb_idx" value="${BoardVO.bb_idx }">
				<input type="hidden" name="cPage" value="${cPage }"> <input
					type="submit" class="btn btn-warning" value="댓글 저장하기">
			</form>
		</div>
	</div>

	<%-- 댓글 출력 --%>
	<c:choose>
		<c:when test="${empty cList}">
			<p class="lead">현재 등록된 댓글이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<c:forEach var="CommentVO" items="${cList }">
				<div class="card my-4">
					<h5 class="card-header">${CommentVO.id }</h5>
					<div class="card-body">
						<form method="post" action="Comment?type=b_deleteOk">
							<p class="lead">댓글번호 : ${CommentVO.bbc_idx }</p>
							<p class="lead">작성일 : ${CommentVO.regdate}</p>
							<p class="lead">내용 : ${CommentVO.content }</p>
							<button type="submit" class="btn btn-danger">삭제</button>
							<input type="hidden" name="bbc_idx" value="${CommentVO.bbc_idx }">
							<input type="hidden" name="content" value="${CommentVO.content }">
							<input type="hidden" name="bb_idx" value="${CommentVO.bb_idx }">
						</form>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

<%@ include file="../jieun/footer.jsp"%>

