<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bc.hobby.vo.HobbyBoardVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<HobbyBoardVO> mainList = (List<HobbyBoardVO>) request.getAttribute("MainList");
	System.out.println("mainList check : " + mainList);
	pageContext.setAttribute("mainList", mainList);
%>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<style type="text/css">
	.positionTop{
		top : 50px;
	}
	.box_width{
		width : 300px;
	}
</style>
</head>
<body>
	<div class="empty">
	</div>
	<div><a href = "HobbyController?type=write">글작성</a></div>
	<c:forEach var="list" items="${mainList }">
		<div class="card text-center my-2 mx-2 positionTop box_width" >
			<div class="card-header">${list.bbs_name }</div>
			<div class="card-body">
				<h5 class="card-title">${list.title }</h5>
				<p class="card-text">${list.id }</p>
				<hr>
				<p class="card-text">${list.req_member }</p>
				<p class="card-text">${list.cur_member }</p>
				<hr>
				<p class="card-text">${list.place }</p>
				<p class="card-text">${list.time }</p>
				<a href="HobbyController?type=view&bb_idx=${list.bb_idx }" class="btn btn-primary">상세보기</a>
			</div>
			<div class="card-footer text-muted">2 days ago</div>
		</div>
	</c:forEach>