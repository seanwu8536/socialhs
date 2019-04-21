<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<nav class="navbar navbar-dark fixed-top" style="background-color: #00AA7F">
		<a class="navbar-brand" href="index.jsp">
			<img src="imgs/github-sign.png">
		</a>
		<form class="form-inline my-2" method="post">
			<div class="form-group mx-sm-3">
				<label for="inputId" class="sr-only">Id</label> <input type="text"
					class="form-control" id="inputId" name="id" placeholder="아이디" onkeypress="enter(this.form)">
			</div>
			<div class="form-group mx-sm-3">
				<label for="inputPassword" class="sr-only">Password</label> <input
					type="password" class="form-control" id="inputPassword" name="pw"
					placeholder="비밀번호" onkeypress="enter(this.form)">
			</div>
			<button type="button" class="btn btn-light mr-3 border-0"
				onclick="login(this.form)">로그인</button>
			<button type="button" class="btn btn-light border-0" onclick="join(this.form)">회원가입</button>
		</form>
	</nav>
	<br><br><br>