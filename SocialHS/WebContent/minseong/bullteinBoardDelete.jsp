<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<script>
function b_delete() {
	location.href = "../BullteinController?type=bullteinDelete&bb_idx=${BoardVO.getBb_idx() }";
	
}
</script>	
</head>
<body onload="b_delete()">
</body>
</html>