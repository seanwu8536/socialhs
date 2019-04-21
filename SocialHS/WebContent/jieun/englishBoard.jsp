<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("memberVO") == null) {
%>
<jsp:include page="../jieun/header_head.jsp"></jsp:include>
<%
	} else {
%>
<%-- <%@ include file="head.jsp" %> --%>
<jsp:include page="../head.jsp"></jsp:include>
<% 
	}
%>
<!-- <html> ~ <head> -->

<!-- **여기에 타이틀 넣기 -->
<title> 영어 스터디 게시판 </title>

<!-- **여기에 </head> 넣기 --> 
</head>

<%
	if (session.getAttribute("memberVO") == null) {
%>
	<jsp:include page="../jieun/header.jsp"></jsp:include>
<%
	} else {
%>
	<jsp:include page="../jieun/loginheader.jsp"></jsp:include>
<% 
	}
%>

<!-- <body> 태그 포함 -->

<!-- 밑에서 부터 body 임 -->

		<h2>englishBoard.jsp</h2>
	<hr>
	<div>
		${list }
	
	</div>

<!-- </body> </html> 포함 -->
<jsp:include page="../jieun/footer.jsp"></jsp:include>