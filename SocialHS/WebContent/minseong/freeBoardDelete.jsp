<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<script>
function f_delete() {
	location.href = "../FreeController?type=freeDelete&bb_idx=${BoardVO.getBb_idx() }";
}
</script>	
</head>
<body onload="f_delete()">
</body>
</html>