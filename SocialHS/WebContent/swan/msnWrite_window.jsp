<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
<title>쪽지 작성</title>
<script>
	function checkId() {
		var recv_id = document.getElementById("recv_id").value;
		$.ajax({
			url : "/SocialHS/MsnIdCheckController?&id=" + recv_id,
			type : "get",
			dataType : "text",
			success : function(data) {
				var chk = false;
				if (data == 1) { // id가 존재함
					chk = true;
					alert("id 확인 완료");
					$("#subBtn").css("display", "block");
				} else if (data == 0) {
					chk = false;
					alert("존재하지 않는 ID입니다");
					$("#subBtn").css("display", "none");
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("실패: \n" + "jqXHR.readyState: " + jqXHR.readyState
						+ "\n" + "textStatus: " + textStatus + "\n"
						+ "errorThrown: " + errorThrown);
			}
		});
		
	}
	
	
</script>
<style type="text/css">
#idChk {
	font-size: 9px;
}

form {
	margin: auto;
}
</style>
</head>
<body>
<h1 class="display-4 my-5 text-center">쪽지 작성하기</h1>

<form action="MsnCloseController">
	<div class="mx-auto my-2 bg-light p-2" style="width: 600px">

		<div class="input-group mb-3">
			<input type="text" class="form-control" placeholder="받는 사람"
				id="recv_id" name="recv_id" aria-label="Recipient's username"
				aria-describedby="button-addon2" value="${recv_id }" readonly="readonly">
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
</body>
</html>