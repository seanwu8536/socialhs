<%@page import="com.bc.minseong.command.BullteinBoardDAO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	List<BoardVO> list = BullteinBoardDAO.getList();
	System.out.println("list : " + list);
	pageContext.setAttribute("list", list);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	function roll() {
		$('#notice li:first').slideUp(function(){
			$(this).appendTo($('#notice')).slideDown();
		});
	}
	setInterval(function(){ roll() }, 3000);

</script>
<style>
	
	#wrap { position: relative; }
	#fix { position: absolute; top: 6px;}
	#rolling { position: absolute; left: 100px; }
	
	.notice {
		height: 30px;
		overflow: hidden;
		list-style: none;
		margin: 0; padding: 0;
		/* border: 1px solid black; */
		
	}
	.notice li {
		padding: 5px;
		margin: 0px;
	}
	

</style>
</head>
<body>
	<div id="wrap">
		<div id="fix">
			<span>공지사항 ></span>
		</div>	
		
		<div id="rolling">
			<ul id="notice" class="notice">
				<c:if test="${not empty list }">
					<c:forEach var="vo" items="${list }">
						<li>
							<a href="/SocialHS/BullteinController?type=bullteinOne&bb_idx=${vo.bb_idx }">
							${vo.getTitle() }</a>
						</li>
				</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<li>입력된 자료가 없습니다.</li>
				</c:if>
			</ul>
		</div>
		
	</div>

</body>
</html>