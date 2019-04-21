<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function write_go() {
		location.href = "Search?type=write";
	}
	
	function search_go(frm){
		frm.action = "Search?type=search";
		frm.submit();
	}
</script>
<form class="form-inline my-3" method="post">
	<div class="form-group">
		<select class="form-control mr-2" name="category">
			<option value="0">전체</option>
		<c:forEach var="cat" items="${hsList }" varStatus="status">
			<option value="${cat.bbs_idx }">${cat.bbs_name }</option>
		</c:forEach>
		</select> 
		<select class="form-control mr-2" name="select">
			<option value="0">제목</option>
			<option value="1">작성자</option>
			<option value="2">내용</option>
			<option value="3">제목 + 내용</option>
		</select> 
		
		<input class="form-control mr-sm-2" type="search" placeholder="검색"
			style="width: 600px;" aria-label="Search" name="keyword">
		<button class="btn bg-success text-white my-2 mr-sm-2" onclick="search_go(this.form)">검색</button>
		
	</div>
	

	<input type = "button" class="btn bg-warning text-white my-2 my-sm-2"
		onclick="write_go()" value = "글 작성하기">

</form>