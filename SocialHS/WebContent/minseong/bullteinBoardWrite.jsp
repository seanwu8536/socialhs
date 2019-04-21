<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../head.jsp"%>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<script>
	function write_go(frm) {
		frm.action = "BullteinController?type=bullteinWrite";
		frm.submit();
	}
</script>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style>
a:hover {
	text-decoration: underline;
	color: #b30000;
}

#infohead {
	text-align: left;
	width: 1000px;
}
</style>
</head>

<%@ include file="../jieun/header.jsp"%>


<div class="bg-light p-4">
	<ul id="infohead" class="nav mx-auto my-2">
		<li class="nav-item"><a href="javascript:history.back()">뒤로가기</a></li>
	</ul>
	<h1 class="display-4 text-center my-4">공지사항 작성</h1>
	<hr>
	<form method="post" style="width: 600px;" class="mx-auto" border="1">
		<table class="table">
			<tbody class="tbody-light">
				<tr>
					<div class="form-group">
						<label for="exampleFormControlInput1">작성자</label>
						<p class="lead">${memberVO.id }</p>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<label for="exampleFormControlInput1">제목</label> <input
							class="form-control" id="exampleFormControlInput1" class="input"
							type="text" name="title">
					</div>
				</tr>

				<tr>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">내용</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="10" name="content"></textarea>
					</div>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"><input class="btn btn-warning" type="button"
						value="작성 완료" onclick="write_go(this.form)"> <input
						class="btn btn-warning" type="reset" value="초기화"> <!--  <input type="hidden" name="id" value="${memberid }"> -->
						<input type="hidden" name="chk" value="1"></td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
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


<%@ include file="../jieun/footer.jsp"%>