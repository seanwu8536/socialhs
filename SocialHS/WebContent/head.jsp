<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<script>
	$(document).ready(function() {
		almFnc();
	});

	function almFnc() {
		console.log("알람함수 시작");
		$.ajax({
			url : "AlarmController",
			type : "get",
			dataType : "JSON",
			success : function(data) {
				console.log("알람 가져오기 성공")
				var msnList = data.msnAlm;
				var memList = data.memAlm;
				var comList = data.comAlm;
				var newAlm = "";
				if (memList == undefined) {
				} else {
					newAlm += "<p class=\"lead\">모집 알람</p>";
					newAlm += "<hr>";
					$.each(memList, function(member) {
						newAlm += "<a class='ajaxLink' href='AlarmCheck?type=mem&bb_idx="+this.bb_idx+"'>" + '"<span class="ajaxTitle">' + this.title + '</span>"' + "모집글에 신청자가 나타났습니다.<br><br></a>";
					});
					newAlm += "<br><br>";
				}
				if (msnList == undefined) {
				} else {
					newAlm += "<p class=\"lead\">쪽지 알람</p>";
					newAlm += "<hr>";
					$.each(msnList,
							function(member) {
								newAlm += "<a class='ajaxLink' href='MessengerController?type=msnList'>"
									    + '"<span class="ajaxTitle">' + this.send_id + '</span>"'
										+ "님께서 쪽지를 보냈습니다.<br></a>";
							});
					newAlm += "<br><br>";
				}
				if (comList == undefined) {
				} else {
					newAlm += "<p class=\"lead\">댓글 알람</p>";
					newAlm += "<hr>";
					$.each(comList, function(member) {
						newAlm += "<a class='ajaxLink' href='AlarmCheck?type=com&bbc_idx="+this.bbc_idx+"&bb_idx="+this.bb_idx+"'>"; 
						newAlm += '"<span class="ajaxTitle">' + this.title + '</span>"';
						newAlm += "글에 \"<span class='ajaxId'>"+this.id+"</span>\"님이 댓글을 달았습니다.<br><br></a>";
					});
					newAlm += "";
				}
				newAlm += "<div id='rightdiv'><a id='delAll' href='AlarmCheck?type=delAll'>전체 삭제</a></div>";

				if (data.almCnt == '0') {
					$("#almCnt").attr("class", "badge badge-dark");
					$("#almCnt").html(data.almCnt);
				} else {
					$("#almCnt").attr("class", "badge badge-danger");
					$("#almCnt").html(data.almCnt);
				$("#newAlm").html(newAlm);
				}

				var btnChk = true;
				$("#almBtn").on("click", function() {
					if (btnChk == true) {
						$("#newAlm").css("display", "block");
						btnChk = false;
					} else {
						$("#newAlm").css("display", "none");
						btnChk = true;
					}
				});
				setTimeout(almFnc, 30000);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("실패: \n" + "jqXHR.readyState: " + jqXHR.readyState
						+ "\n" + "textStatus: " + textStatus + "\n"
						+ "errorThrown: " + errorThrown);
			}
		});
	}
</script>
<style>
.ajaxLink{
	text-decoration: none;
	color: black;
}
.ajaxTitle{
	font-size: 1.1em;
	color: #7BB31A;
}
.ajaxId{
	font-size: 1.1em;
	color: #FF9C00;
}
#rightdiv{
	text-align: right;
}
#delAll{
	text-decoration: none;
	color: red
}
#newAlm {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	width: 250px;
	height: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
	overflow: auto;
	word-wrap: break-word;
	text-size: 9px;
}

#almOutter {
	position: relative;
	display: inline-block;
}

#inner {
	display: block;
}
</style>