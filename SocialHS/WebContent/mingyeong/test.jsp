<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<a href="../HobbyController?type=photo"><button>테스트</button></a>
	<a href="/error/error.jsp"><button>테스트2</button></a>
	<% session.getAttribute("joinInfo"); %>
	${joinInfo.name }<br>
	${joinInfo.getName() }
	<hr>
	${mylist }
	<hr>
	
	<select name="select">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select>
	
</body>
</html>