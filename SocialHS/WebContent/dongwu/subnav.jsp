<%@page import="com.bc.minseong.command.BullteinBoardDAO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<BoardVO> list = BullteinBoardDAO.getList();
	System.out.println("list : " + list);
	pageContext.setAttribute("list", list);
%>

<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function roll() {
		$('#notice li:first').slideUp(function() {
			$(this).appendTo($('#notice')).slideDown();
		});
	}
	setInterval(function() {
		roll()
	}, 3000);
</script>
<style>
	.notice {
		height: 30px;
		overflow: hidden;
		list-style: none;
		margin: 0;
		padding: 0;
		/* border: 1px solid black; */
	}
	
	.notice li {
		padding: 5px;
		margin: 0px;
	}
</style>
</head>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="navbar">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="minseong/bullteinBoardIndex.jsp">공지사항</a></li>
			<li class="nav-item">
				<div id="wrap">
					<div id="rolling">
						<ul id="notice" class="notice">
							<c:if test="${not empty list }">
								<c:forEach var="vo" items="${list }">
									<li class="nav-item mr-auto"><a
										href="/SocialHS/BullteinController?type=bullteinOne&bb_idx=${vo.bb_idx }">
											${vo.getTitle() }</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty list }">
								<li class="nav-item mr-auto">입력된 자료가 없습니다.</li>
							</c:if>
						</ul>
					</div>
				</div>
			</li>
			<li class="nav-item ml-auto"><a class="nav-link"
				href="minseong/freeBoardIndex.jsp">자유게시판</a></li>
			<li class="nav-item"><a class="nav-link"
				href="minseong/QNAindex.jsp">Q&A</a></li>
		</ul>
	</div>
</nav>