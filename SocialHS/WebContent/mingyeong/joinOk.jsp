<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../jieun/header_head.jsp" %>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<style>
	#joinok {
		padding: 150px;
	
	}
	a { color: black; }
	a:hover {
		text-decoration: underline;
		color: orangered;
	}


</style>
</head>
<%@ include file="../jieun/header.jsp" %>

<!-- jumbotron -->
<div >
	<div id="joinok" class="container text-center">
		<img src="imgs/github.png" style="width: 256px; margin-bottom: 40px;">
		<h1 class="display-3 my-2">${joinInfo.getName() }&nbsp;님<br>가입을 축하드립니다!</h1>
		<hr>
		<p class="lead mt-4">
			회원가입이 완료되었습니다. 다시 로그인 해주세요.</p>
		<hr>
		
		<form method="post">
			<input type="hidden" name="id" value="${joinInfo.id }">
		</form>
		<button class="btn btn-lg btn-danger" onclick="location.href='index.jsp'">메인화면으로 가기</button>
	</div>
	
</div>

<%@ include file="../jieun/footer.jsp" %>