<%@page import="com.bc.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = request.getParameter("id");
	pageContext.setAttribute("id", id);
	System.out.println("받아온 id값: " + id);
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script>
	function selectOk() {
		//현재 아이디 사용하기
		window.opener.document.getElementById("id").value = "${id }";
		self.close();

	}
</script>
<style type="text/css">
.center {
	width: 300px;
	margin: auto;
	margin-top: 25px;
}

.blue {
	font-size: 1.5em;
	color: blue;
}
</style>
</head>
<body>
	<div>
		<form method="post">
			<%
				memberDAO dao = new memberDAO();
				boolean usingid = dao.idCheck(id);

				if (usingid == true) {
			%>
			<div class="center">
				<p class="lead text-center">
					<b>"${id }" </b>는 <br>사용중인 아이디입니다.<br>다시 입력해 주세요.
				</p>
				<div class="d-flex justify-content-center">
					<button type="button" class="btn btn-secondary mb-5"
						onclick="self.close();">닫기</button>
				</div>
			</div>
			<!-- 아이디 <input type="text" name="checkid">
		<input type="button" value="중복체크" onclick="checkfrm(this.form)"> -->

			<%
				} else {
			%>
			<div class="center">
				<p class="lead text-center">
					<b>"${id }" </b>는 <br>사용가능한 아이디입니다.
				</p>
				<button type="button" class="btn btn-secondary"
					onclick="self.close();">다른 아이디 사용</button>
				<button type="button" class="btn btn-danger" onclick="selectOk();">현재
					아이디 사용</button>
			</div>

			<%
				}
			%>

		</form>
	</div>
</body>
</html>