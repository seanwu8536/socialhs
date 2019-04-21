<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../head.jsp"%>
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
<%@ include file="../jieun/loginheader.jsp"%>
<h1 class="display-4 my-5 text-center">쪽지 작성하기</h1>

<form action="MessengerController?type=writeOk">
	<div class="mx-auto my-2 bg-light p-2" style="width: 600px">

		<div class="input-group mb-3">
			<input type="text" class="form-control" placeholder="받는 사람"
				id="recv_id" name="recv_id" aria-label="Recipient's username"
				aria-describedby="button-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-dark" type="button"
					id="button-addon2" onClick="checkId()">수신자 여부 확인</button>
			</div>
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
