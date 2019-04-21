<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.member.memberVO"%>
<%@page import="com.bc.member.memberDAO"%>
<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="com.bc.member.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
<%
	//페이징 처리 
	Paging p = new Paging();
	CommentVO cvo = new CommentVO();
	memberDAO dao = new memberDAO();
	
	memberVO mvo = (memberVO)session.getAttribute("memberVO");
	String id = mvo.getId();
	
	p.setTotalRecord(dao.getTotCommentCnt(id)); //(수정)게시판별 댓글 조회하는 메소드
	p.setTotalPage(); //전체 페이지 수 구하기
	
	System.out.println("전체 댓글 수 : " + p.getTotalRecord());
	System.out.println("전체 페이지 수 : " + p.getTotalPage());
	
	//2.현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	
	//3.현재 페이지의 시작번호와 끝 번호 
	p.setBegin((p.getNowPage() - 1) * p.getNumPerpage() +1);
	p.setEnd(p.getBegin() + p.getNumPerpage() -1);
	
	//4. 블록의 시작 페이지, 끝페이지 번호
	p.setBeginPage((p.getNowPage()-1) / p.getPagePerBlock() * p.getPagePerBlock() +1);
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock()-1);
	
	System.out.println("=============================");
	System.out.println("시작 페이지번호(댓글) : " + p.getBeginPage());
	System.out.println("끝 페이지번호(댓글) : " + p.getEndPage());
	System.out.println("=============================");
	
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}	
	
%>
<%
	//5.현재 페이지 기준 게시글 가져오기
	Map<String, String> map = new HashMap<>();
	String beginNum = String.valueOf(p.getBegin());
	String endNum = String.valueOf(p.getEnd());
	
	map.put("begin", beginNum);
	map.put("end", endNum);
	map.put("id", mvo.getId());
	
	System.out.println("시작" + beginNum);
	System.out.println("시작" + endNum);

	List<CommentVO> cList = memberDAO.getMypageCommList(map);
	pageContext.setAttribute("cList", cList);
	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);
	
	System.out.println("cList : " + cList); 
%>
<style>
	.commCnt {
		color: orangered;
		text-decoration: underline;
		font-weight: bold;
	}
	#container {
		padding: 25px;
	}
	.right { text-align: right; }
	a { color: black; }
	a:hover {
		text-decoration: underline;
		color: orangered;
	}
	#container {
		width: 800px; margin: auto;
	}
	#goodbad {
		border: none;
		background-color: white;
		font-weight: bold;
	}
	#goodbad:hover {
		color: orangered;
	}
	
	
	
</style>
<link href="css/Paging.css" rel="stylesheet" type="text/css">
<script>
	function update_go(frm) {
		//frm.action = "BullteinController?type=bullteinUpdate&bb_idx=${BoardVO.getBb_idx() }";
		frm.action = "BullteinController?type=bullteinUpdate";
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "BullteinController?type=bullteinDelete&bb_idx=${BoardVO.getBb_idx() }";
		frm.submit();
	}
</script>

</head>
<jsp:include page="jieun/loginheader.jsp"></jsp:include>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
<body>

<div id="container">
	<h3><b>공지사항</b></h3>
	<hr>
	<div>
		<ul class="nav mx-auto my-2" class="title">
			<li class="nav-item">
				<h5>${BoardVO.getTitle() }</h5>
			</li>
		</ul>
		
		<ul class="nav mx-auto my-2">
			<li class="nav-item">
				<font><b>${BoardVO.getId() }</b></font>
			</li>
			<span>&nbsp;|&nbsp;</span>
			
			<li class="nav-item">조회&nbsp;${BoardVO.getHit() }</li>
			<span>&nbsp;|&nbsp;</span>
			
			<li class="nav-item">
				<font style="color: red">${BoardVO.getRp() }</font>
			</li>
			<span>&nbsp;|&nbsp;</span>
			<li class="nav-item">${BoardVO.getRegdate().substring(0, 16) }</li>
		</ul>
	</div>
	<div>
		<p>${BoardVO.getContent() }</p>
	</div>
	<br>
	<br>
	
	<div>
		<ul class="nav mx-auto my-2">
			<li class="nav-item">
				<button id="goodbad" onclick="good()">^0^</button>
				<font style="color: orangered">&nbsp;︎${BoardVO.getGood() }</font>
			</li>
			<span>&nbsp;&nbsp;</span>
			<li class="nav-item">
				<button id="goodbad" onclick="bad()">T_T</button>
				<font style="color: blue">&nbsp;${BoardVO.getBad() }</font>
			</li>
		</ul>
	</div>
	<hr>
	
	<div>
		<%-- <a href="BullteinController?type=bullteinUpdate">수정</a>
		<a href="BullteinController?type=bullteinDelete&bb_idx=${BoardVO.getBb_idx() }">삭제</a>
		<br> --%>
		<input type="button" value="수정" onclick="update_go(this.form)">
		<input type="button" value="삭제" onclick="delete_go(this.form)">
	</div>
	<hr>

	<%-- 댓글 목록 --%>
	<div class="comment">
		<form action="cDelete.jsp" method="post">
			<p class="commCnt">댓글&nbsp;(달린 댓글 수 조회용메소드)</p>
			<%-- 댓글 데이터가 있을 시 --%>
			<c:if test="${not empty cList}">
				<c:forEach var="CommentVO" items="${cList }">
					<ul class="nav mx-auto my-2">
						<li class="nav-item">
							<b>${CommentVO.getId() }</b>
						</li>
						
						<span>&nbsp;&nbsp;</span>
						<li class="nav-item">
							<font size="2">${CommentVO.getRegdate().substring(0, 16) }</font>
						</li>
					</ul>
					<table style="width: 100%" class="EditDel">
						<tr style="width: 90%">
							<td>${CommentVO.content }</td>
							<td style="width: 10%">
								<a href="#" style="color: black">수정</a>&nbsp;|&nbsp;
								<a href="#" style="color: black">삭제</a>
								
								<input type="hidden" name="bbc_idx" value="${CommentVO.bbc_idx }">
								<input type="hidden" name="content" value="${CommentVO.content }">
								<input type="hidden" name="bb_idx" value="${CommentVO.bb_idx }">
							</td>
						</tr>
					</table>
					<hr>
				</c:forEach>
			</c:if>
			<table class="mx-auto">
			<tfoot>
				<tr>
					<td>
						<ol class="paging">
						
						<%-- 이전페이지 사용여부 --%>
						<c:choose>
							<%-- 사용불가 (첫번째 블록) --%>
							<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
								<li class="disable">&lt;&nbsp;이전&nbsp;</li>
							</c:when>
							
							<%-- 사용가능 --%>
							<c:otherwise>
								<li><a href="MypageController?type=moreComment&cPage=${pvo.beginPage-1 }">
								&lt;&nbsp;이전&nbsp;</a></li>
							</c:otherwise>
						</c:choose>
						
						<%-- 현재 블록의 시작페이지>끝 페이지 반복처리 --%>
						<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:choose>
							<c:when test="${k == pvo.nowPage }">
								<li class="now">${k }</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="MypageController?type=moreComment&cPage=${k }">${k }</a>
								</li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						
						<%-- 다음페이지 --%>
						<c:choose>
							<%-- 사용불가 --%>
							<c:when test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable" id="next">&nbsp;다음&nbsp;&gt;</li>
							</c:when>
							<c:otherwise>
								<li><a href="MypageController?type=moreComment&cPage=${pvo.endPage+1 }">
									&nbsp;다음&nbsp;&gt;</a></li>
							</c:otherwise>
						</c:choose>
						</ol>
					
					</td>
				</tr>
			</tfoot>
		</table>
			<%-- 댓글 데이터가 없을 시 --%>
			<div>
			<textarea name="content " row="4" cols="75"
				placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다.				
									댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
			<br><input type="submit" value="등록">
			<input type="hidden" name="bb_idx" value="${bbvo.bb_idx }">
			</div>
			<br>
		</form>
		
	</div>
</div>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

</body>
</html>

