<%@page import="com.bc.member.memberVO"%>
<%@page import="com.bc.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../jieun/header_head.jsp"%>
<meta charset="UTF-8">
<title>회원가입</title>

<style>
</style>

<script>
	function joinOk(frm) {

		var pw1 = frm.pw.value;
		var pw2 = frm.pwchk.value;

		if (!frm.id.value) {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		}

		if (!frm.pw.value) {
			alert("비밀번호를 입력하세요.");
			frm.pw.focus();
			return false;
		}

		if (pw1 != pw2) {
			alert("암호가 일치하지 않습니다.");
			frm.pw.value = "";
			frm.pw.focus();
			return false;
		}

		if (!frm.name.value) {
			alert("이름을 입력하세요.");
			frm.name.focus();
			return false;
		}

		if (!frm.birthday.value) {
			alert("생년월일을 입력하세요.");
			frm.birthday.focus();
			return false;
		}
		if (!frm.birthmm.value) {
			alert("생년월일을 입력하세요.");
			return false;
		}
		if (!frm.birthdd.value) {
			alert("생년월일을 입력하세요.");
			return false;
		}

		if (!frm.email.value) {
			alert("이메일을 입력하세요.");
			frm.email.focus();
			return false;
		}
		if (!frm.phone.value) {
			alert("전화번호를 입력하세요.");
			frm.phone.focus();
			return false;
		}
		if (!frm.addr.value) {
			alert("주소를 입력하세요.");
			frm.addr.focus();
			return false;
		}

		frm.action = "memberController?type=joinOk";
		frm.submit();
	}

	function idchk(frm) {

		var id1 = frm.id.value;

		if (id1 == "") {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		} else {
			window.open("mingyeong/usingIdchk.jsp?id=" + id1, "아이디 중복 확인",
					"width=450, height=200, left=300, top=200");
		}

		frm.submit();

	}

	function main(frm) {

		frm.action = "index.jsp";
		frm.submit();
	}
</script>
</head>
<%@ include file="../jieun/header.jsp"%>

<div id="join" style="padding: 20px;" class="my-2 pt-5 bg-light">
	<h1 class="display-3 text-center mb-5">회원가입</h1>

	<form method="post" style="width: 600px;" class="mx-auto">
		<div class="row mb-4">
			<div class="col-9">
				<input type="text" class="form-control" id="id" name="id"
					maxlength="50" placeholder="아이디">
			</div>
			<div class="col-3">
				<input type="button" class="btn btn-dark" value="중복확인"
					onclick="idchk(this.form)">
			</div>
		</div>
		<div class="row mb-4">
			<div class="col">
				<input type="password" class="form-control" name="pw" maxlength="50"
					placeholder="비밀번호">
			</div>
			<div class="col">
				<input type="password" class="form-control" name="pwchk"
					maxlength="50" placeholder="비밀번호 확인">
			</div>
		</div>
		<div class="row mb-4">
			<div class="col">
				<input type="text" class="form-control" name="name" maxlength="50"
					placeholder="이름">
			</div>
		</div>
		<div class="row mb-4">
			<div class="col">
				<input class="mx-2" type="radio" name="gender" value="남" checked>남
				<input class="mx-2" type="radio" name="gender" value="여">여
			</div>
		</div>
		<div class="row mb-4">
			<div class="col">
				<input type="text" name="birthday" class="form-control mb-2"
					maxlength="4" placeholder="년(4자)" size="6">
			</div>
		</div>
		<div class="row mb-4">
			<div class="col">
				<select name="birthmm" class="custom-select mb-2"
					id="inlineFormCustomSelect">
					<option value="">월</option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
			</div>
		</div>
		<div class="row mb-4">
			<div class="col">
				<input type="text" name="birthdd" class="form-control mb-2"
					maxlength="2" placeholder="일" size="4">
			</div>
		</div>
		<div class="row mb-4">
			<div class="col-7">
				<input type="text" class="form-control mb-2" placeholder="이메일"
					name="email" maxlength="50">
			</div>
			<div class="col-1">
				<span>&nbsp;@&nbsp;</span>
			</div>
			<div class="col-4">
				<select name="com" class="custom-select mb-2">
					<option>naver.com</option>
					<option>daum.com</option>
					<option>nate.com</option>
					<option>gmail.com</option>
				</select>
			</div>
		</div>
		<div class="row mb-4">
			<div class="col">
				<input type="text" class="form-control" placeholder="휴대전화번호"
					name="phone">
			</div>
		</div>
		<div class="row mb-4">
			<div class="col">
				<input type="text" class="form-control" placeholder="주소" name="addr"
					size="50">
			</div>
		</div>
		<div class="row" style="margin-left: 290px">
			<div class="col">
				<input type="button" class="btn btn-danger mb-2 mx-2" value="가입하기"
					onclick="joinOk(this.form)"> <input type="hidden"
					name="joinchk" value="chk"> <input type="reset"
					class="btn btn-danger mb-2 mx-2" value="취소"> <input
					type="button" class="btn btn-danger mb-2 mx-2" value="메인화면"
					onclick="main(this.form)">
			</div>
		</div>
	</form>
</div>


<%@ include file="../jieun/footer.jsp"%>