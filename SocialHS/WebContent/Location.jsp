<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header_head.jsp" %>
<%
	} else {
%>
<%@ include file="head.jsp" %>
<% 
	}
%>
    <title>Social Hobby & Study</title>
    <!-- head 태그 -->

</head>
<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header.jsp" %>
<%
	} else {
%>
<%@ include file="jieun/loginheader.jsp" %>
<% 
	}
%>
<!-- body 태그 -->
	
	
    <!-- jumbotron -->
<style>
	.location {
		 margin: 10px;
	}
</style>
</head>

<!-- body -->
<div class="jumbotron jumbotron-fluid">
	<!-- jumbotron -->
	<div class="container text-center">
		<h1 class="display-4">원하는 지역을 선택해주세요.</h1>
		<p class="lead">해당 지역에 개설되어 있는 스터디 또는 취미 모임을 보실 수 있습니다.</p>
		<hr class="my-4">
		<div class="row">
			<div class="col px-0">
				<span class="align-text-bottom">
				<a class="location" href="LocationController?hs=${hs }&location=01">
					<img src="imgs/locationIcon-01.png" alt="서울" height="150" width="150"></a>
					</span>
			</div>
			<div class="col px-0">
				<a class="location" href="LocationController?hs=${hs }&location=02">
					<img src="imgs/locationIcon-02.png" alt="경기" height="150" width="150"></a>
			</div>
			<div class="col px-0">
				<a class="location" href="LocationController?hs=${hs }&location=03">
					<img src="imgs/locationIcon-03.png" alt="강원" height="150" width="150"></a>
			</div>
			<div class="col px-0">
				<a class="location" href="LocationController?hs=${hs }&location=04">
					<img src="imgs/locationIcon-04.png" alt="충북" height="150" width="150"></a>
			</div>
			<div class="col px-0">
				<a class="location" href="LocationController?hs=${hs }&location=05">
					<img src="imgs/locationIcon-05.png" alt="충남" height="150" width="150"></a>
			</div>
		</div>
		<div class="row">
			<div class="col px-0">
				<a class="location" href="LocationController?hs=${hs }&location=06">
					<img src="imgs/locationIcon-06.png" alt="전북" height="150" width="150"></a>
			</div>
			<div class="col px-0">
				<a class="location" href="LocationController?hs=${hs }&location=07">
					<img src="imgs/locationIcon-07.png" alt="전남" height="150" width="150"></a>
			</div>
			<div class="col px-0">
				<a class="location" href="LocationController?hs=${hs }&location=08">
					<img src="imgs/locationIcon-08.png" alt="경북" height="150" width="150"></a>
			</div>
			<div class="col px-0">
				<a class="blocation" href="LocationController?hs=${hs }&location=09">
				<img src="imgs/locationIcon-09.png" alt="경남" height="150" width="150"></a>
			</div>
			<div class="col px-0">
				<a class="location" href="LocationController?hs=${hs }&location=10">
					<img src="imgs/locationIcon-10.png" alt="제주" height="150" width="150"></a>
			</div>
		</div>
	</div>
</div>
    <%@ include file="jieun/footer.jsp" %>