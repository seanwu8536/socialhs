<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header_head.jsp"%>
<%
	} else {
%>
<%@ include file="head.jsp"%>
<%
	}
%>

<%@ include file="wonho/sidebar_head.jsp"%>
<%@ include file="dongwu/content_head.jsp"%>

<title>소셜 하비 앤 스터디</title>

<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header.jsp"%>
<%
	} else {
%>
<%@ include file="jieun/loginheader.jsp"%>
<%
	}
%>
</head>

<!-- <body> -->
<%@ include file="dongwu/subnav.jsp"%>

<div class="row">
	<div class="col-2">
		<!-- aside -->
		<%@ include file="wonho/sidebar_body.jsp"%>
	</div>

	<div class="col-10">

		<!-- 이 밑에 DIV에 카테고리 출력 -->
		<div class="row d-flex justify-content-center">
			<!-- sub nav -->
			<%@ include file="dongwu/category_body.jsp" %>
		</div>

		<div class="row d-flex justify-content-center" style="width: 100%;">
			<%@ include file="dongwu/searchnwrite.jsp"%>
		</div>

		<!-- <div class="row d-flex justify-content-center"> -->
		<!-- content -->
		<div class="row d-flex justify-content-center" style="width: 100%;">
			<%@ include file="dongwu/content_body.jsp"%>
		</div>
	</div>

</div>

<%@ include file="jieun/footer.jsp"%>