<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("memberVO") == null) {
%>
<jsp:include page="../jieun/header_head.jsp"></jsp:include>
<%
	} else {
%>
<jsp:include page="../head.jsp"></jsp:include>
<% 
	}
%>
    <title>Social Hobby & Study</title>
    <!-- head 태그 -->

</head>
<%
	if (session.getAttribute("memberVO") == null) {
%>
	<jsp:include page="../jieun/header.jsp"></jsp:include>
<%
	} else {
%>
	<jsp:include page="../jieun/loginheader.jsp"></jsp:include>
<% 
	}
%>
<!-- body 태그 -->

<script>
	$(document).ready(function() {
		setInterval(
			function MSNAlm() {
				$.ajax({
					url: "../AlarmController",
					type: "get",
					dataType: "text",
					success: function(data){
						/* alert("가져온 데이터: "+ data); */
						$("#alarm").html(data);
					},
					error: function(jqXHR, textStatus, errorThrown){
  						alert("실패: \n"
    							+ "jqXHR.readyState: "+ jqXHR.readyState+ "\n"
    							+ "textStatus: "+ textStatus+ "\n"
    							+ "errorThrown: "+ errorThrown);
					}
				});
			}, 3000
		);
	});	
</script>
	<div id="alarm"></div>
	
	
	
	<jsp:include page="../jieun/footer.jsp"></jsp:include>