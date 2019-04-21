<%@page import="com.bc.hobby.vo.BasketballBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
	//DB에 있는 테이블 전체 데이타 가져오기
	//1. SqlSession 객체 만들기
	SqlSession ss = DBService.getFactory().openSession();
	
	//2. 매퍼의 SQL문 실행
	List<GuestbookVO> list = ss.selectList("all");
	ss.close();
	
	//-------------------------------
	//EL, JSTL사용을 위해 추가 : list를 scope에 등록
	pageContext.setAttribute("attr_list", list);
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
<style>
	#container {
		width: 512px; margin: auto;
	}
	#container h2 { text-align: center; }
	#container p { text-align: center; }
	#container table {
		width: 500px; padding: 0 5px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	#container th, td { border: 1px solid black; }
	#container table th {
		background-color: #9cf;
	}
	#container table td {
		text-align: left;
	}
	#container p > a {
		text-decoration: none;
		font-weight: bold;
	}
	#container .center { text-align: center; }
	
</style>
</head>
<body>

<div id="container">
	<h2>BasketBall BBS</h2>
	<hr>
	<p>[<a href="MyCon?type=write">방명록 쓰기</a>]</p>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
<%--
		<%
		if (list.size() > 0) { 
			for (GuestbookVO vo : list) { %>
			<tr>
				<td  class="center"><%=vo.getIdx() %></td>
				<td><%=vo.getName() %></td>
				<td>
					<a href="onelist.jsp?idx=<%=vo.getIdx() %>"><%=vo.getSubject() %></a>
				</td>
				<td><%=vo.getRegdate() %></td>
			</tr>

		<%
			}
		} %>
--%> 			
		<c:if test="${not empty basket_list }">	
			<c:forEach var="vo" items="${basket_list }">
			<tr>
				<td  class="center">${vo.getBask_idx() }</td>
				<td>${vo.getId() }</td>
				<td>
					<a href="MyCon?type=one&idx=${vo.getBask_idx() }">${vo.getTitle() }</a>
				</td>
				<td>${vo.getRegdate() }</td>
			</tr>
			</c:forEach>
		</c:if>			
<%--	
		<%		
		else { %>
			<tr>
				<td colspan="4">입력된 자료가 없습니다</td>
			</tr>
		<%
		} %>
--%>	
		<c:if test="${empty basket_list }">		
			<tr>
				<td colspan="4">입력된 자료가 없습니다</td>
			</tr>
		</c:if>		
		</tbody>
	</table>
</div>

</body>
</html>










