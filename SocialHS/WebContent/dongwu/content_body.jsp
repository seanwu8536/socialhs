<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="empty"></div>
<style>
	.picture{
		
	}
</style>
<c:forEach var="list" items="${MainList }">
	<div class="card text-center my-2 mx-2 positionTop box_width" style="width: 23%;">
		<div class="card-header">${list.bbs_name }</div>
		<div><img class="img-thumbnail picture" alt="${list.bbs_name }" src="imgs/${list.bbs_name}.png"
				 style = "width:100%; height : 200px"></div>
		<div class="card-body">
			<h5 class="card-title">${list.title }</h5>
			<p class="card-text">${list.id }</p>
			<hr>
			<p class="d-inline card-text">${list.cur_member }&nbsp;[현재인원]&nbsp;</p>&nbsp;/&nbsp;
			<p class="d-inline card-text">${list.req_member }&nbsp;[모집인원]&nbsp;</p>
			<hr>
			<p class="card-text">${list.place }</p>
			<p class="card-text">${list.time }</p>
			<a href="HobbyController?type=view&bb_idx=${list.bb_idx }"
				class="btn btn-secondary">상세보기</a>
		</div>
		<div class="card-footer bg-light"></div>
	</div>
</c:forEach>