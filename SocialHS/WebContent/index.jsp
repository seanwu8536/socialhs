<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>
<%@ include file="jieun/header_head.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>
<%@ include file="head.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>
<%@ include file="head.jsp"%>
<%
	}
%>

<title>소셜 하비 앤 스터디</title>
<style>
	.title { font-family: 'Nanum Gothic', sans-serif; }
	.sub { font-family: 'Nanum Gothic', sans-serif; }

</style>
</head>

<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>
<%@ include file="jieun/header.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>
<%@ include file="jieun/loginheader.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>
<%@ include file="Admin/A_loginheader.jsp"%>
<%
	}
%>



<!-- body -->
<div class="jumbotron jumbotron-fluid">

	<!-- picture slide -->
	<div id="carouselExampleSlidesOnly" class="carousel slide mx-auto"
		style="width: 800px;" data-ride="carousel" data-interval="3000">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="imgs/index1.jpg" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index2.jpg" alt="Third slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index3.jpg" alt="Fourth slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index4.jpg" alt="Fifth slide">
			</div>
						<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index5.jpg" alt="Fifth slide">
			</div>
						<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index6.jpg" alt="Fifth slide">
			</div>
						<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index7.jpg" alt="Fifth slide">
			</div>
		</div>
	</div>

	<!-- jumbotron -->
	<div class="container text-center mt-3">
		<h1 class="display-4 title"><b>소셜 하비 앤 스터디</b></h1>
		
		<hr class="my-4">
		<p class="lead sub">원하는 취미 모임, 필요한 스터디 모임이 여기에 있습니다.<br>
							참여하고 싶으시면 아래 버튼 중 하나를 클릭해 주세요.</p>
		<a class="mx-3 my-4"
			href="MainController?type=hobby">
			<img src="imgs/hobby-02.png" alt="취미" height="150" width="150"></a> 
		<a class="mx-3 my-4"
			href="MainController?type=study">
			<img src="imgs/study-01.png" alt="스터디" height="150" width="150"></a>
	</div>

</div>

<%@ include file="jieun/footer.jsp"%>