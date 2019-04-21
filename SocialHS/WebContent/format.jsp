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
<!-- body 태그 시작 -->













<%@ include file="jieun/footer.jsp" %>
<!-- body, html 태그 끝 -->