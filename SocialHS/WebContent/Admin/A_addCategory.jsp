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
<title>[A] 카테고리 추가</title>
<style>

</style>
<link href="css/A_morepage.css" rel="stylesheet" type="text/css">

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
				<a class="menuLink tablink" data-tab="allmemberInfo"
				href="AdminController?type=allmemberInfo">회원정보보기</a></li>
			<li class="topMenuLi nav-item">
				<a class="menuLink tablink current" data-tab="categoryAdd"
				href="AdminController?type=categoryAddPage">카테고리추가</a></li>
				<li class="topMenuLi nav-item"><a class="menuLink tablink" data-tab="chartpage"
				href="AdminController?type=googleChart">차트보기</a></li>
		</ul>
	</div>

   <%--카테고리 추가 --%>
	<div id="categoryAdd">
	<form method="post" class="form-horizontal" enctype="multipart/form-data">
		<table class="table my-2 mx-auto">
			<tr>
				<td>
					<select name = "bbs_type" id = "hobbyStudy" >
						<option value = "300">hobby</option>
						<option value = "700">study</option>
					</select>
					<input type="text" name="bbs_name" id = "bbs_name" size="25" placeholder="카테고리 이름">
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

</body>
</html>