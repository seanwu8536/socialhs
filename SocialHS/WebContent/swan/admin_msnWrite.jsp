<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../head.jsp"%>
<title> [관리자] 쪽지 작성</title>
<style type="text/css">
#idChk {
	font-size: 9px;
}

form {
	margin: auto;
}
</style>
</head>
<%@ include file="../Admin/A_loginheader.jsp"%>

<h1 class="display-4 my-5 text-center">쪽지 작성하기</h1>

<%
	String id = request.getParameter("id");
	System.out.println("id : " + id);
%>

<form action="MessengerController?type=writeOk">
	<div class="mx-auto my-2 bg-light p-2" style="width: 600px">

		<div class="input-group mb-3">
			<input type="text" value=<%=id %> class="form-control"
				id="recv_id" name="recv_id" aria-label="Recipient's username"
				aria-describedby="button-addon2" readonly/>
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">제목</span>
			</div>
			<input type="text" class="form-control" aria-label="Username"
				aria-describedby="basic-addon1" name="title">
		</div>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">내용</span>
			</div>
			<textarea class="form-control" aria-label="With textarea" rows="10"
				name="content"></textarea>
		</div>
		<div class="footer my-4" style="margin-left: 420px">
			<button type="submit" class="btn btn-danger" formmethod="post"
				id="subBtn" style="margin-left: 90px;">보내기</button>
		</div>
	</div>
</form>

<%@ include file="../jieun/footer.jsp"%>
