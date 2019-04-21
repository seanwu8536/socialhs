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


<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<script src="//code.jquery.com/jquery.min.js"></script>


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
		width: 500px; margin: auto; padding: 50px;
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
	th {
		text-align:center;
	}
</style>
<script>
	function go_write(){
		location.href="MessengerController?type=memWrite&recv_id=${writer.getId() }"
	}
</script>

</head>
<body>
<!-- jumbotron -->
<div id="mypage"
	class="container text-black mx-auto mt-5 align-middle">
	<div class="container text-center">
		<ul id ="infohead" class="nav mx-auto my-2">
			<li class="nav-item" style="font-weight: bold">회원 정보</li>&nbsp;|
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
					<td class="center">${writer.getId() }</td>
					<td class="center">${writer.getName() }</td>
					<td class="center">${writer.getRank() } 등급</td>
					<td class="center">${writer.getPoint() } point</td>
					<td class="center">${writer.getRegdate().substring(0, 10) }</td>
				</tr>
				<tr>
					<td colspan="5" class="right">
						<input type="button" name="sendMsg" class="btn btn-dark mb-2"
							value="쪽지 보내기" onclick="go_write()">
						
						<input type="hidden" name="id" value="${writer.getId() }">
						<input type="hidden" name="infochk" value="chk">
					</td>
				</tr>
			</tbody>
		</table>
	</form>	
		
		
		
	</div>
</div>
</body>
</html>
