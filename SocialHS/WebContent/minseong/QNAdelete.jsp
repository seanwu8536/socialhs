<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<script>
function q_delete() {
	location.href = "../QNA?type=QNAdelete&bb_idx=${BoardVO.getBb_idx() }";
	
}
</script>	
</head>
<body onload="q_delete()">
</body>
</html>