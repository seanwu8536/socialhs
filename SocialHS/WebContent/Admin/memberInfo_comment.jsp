<%@page import="com.bc.admin.AdminDAO"%>
<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="com.bc.member.memberVO"%>
<%@page import="com.bc.member.memberDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="com.bc.member.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//게시글 전체페이지 가져오기 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	System.out.println("id : " + id);
	
	memberVO mvo = memberDAO.selectId(id);
	System.out.println("mvo : " + mvo);
	pageContext.setAttribute("mvo", mvo);
	
	//페이징 처리 
	Paging p = new Paging();
	memberDAO mdao = new memberDAO();
	
	p.setTotalRecord(mdao.getTotCommentCnt(id));
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
	System.out.println("시작 페이지번호 : " + p.getBeginPage());
	System.out.println("끝 페이지번호 : " + p.getEndPage());
	System.out.println("=============================");

	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	
	//5.현재 페이지 기준 게시글 가져오기 
	Map<String, String> map = new HashMap<>();
	String beginNum = String.valueOf(p.getBegin());
	String endNum = String.valueOf(p.getEnd());
	
	map.put("begin", beginNum);
	map.put("end", endNum);
	map.put("id", mvo.getId());

	List<BoardVO> list = memberDAO.getMypageList(map);
	pageContext.setAttribute("list", list);

	List<CommentVO> commList = memberDAO.getMypageCommList(map);
	pageContext.setAttribute("commList", commList);
	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);
	
%>

<meta charset="UTF-8">
<title>[A] 회원정보 상세보기</title>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
        
<style>
	#infohead {
		text-align: left;
		width: 800px; margin: auto;
	}
	
	a { color: black; }
	a:hover {
		text-decoration: underline;
		color: #b30000;
	}
	
	#mypage table {
		/* border: 1px lightgray solid;
		border-collapse: collapse; */
		width: 800px; margin: auto; padding: 50px;
	}
	
	#mypage .center { text-align: center; }
	#mypage .right { text-align: right; }
	#mypage .left { text-align: left; }
	
	/* 탭 스타일 */
	ul.tab {
		width: 800px; margin: auto;
		float: left;
		list-style: none;
	}
	ul.tab li {
		background-color: none;
		color: black;
		display: inline-block;
		cursor: pointer;
	}
	
	ul.tab li.current {
		text-decoration: underline;
		color: #b30000;
	}
	
	.tabcontent {
		display: none;
		width: 800px; margin: auto;
		
	}
	.tabcontent.current {
		display: inherit;
	}
	
</style>
<link href="../css/Paging.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function messengerGo(frm) {
		frm.action = "../MessengerController?type=msnList";
		frm.submit();
	}
	
	function deleteInfo(frm) {
		if (confirm("회원 탈퇴를 하시겠습니까?") == true) {
			
			frm.action = "../MypageController?type=delete";
			frm.submit();
		} else {
			return;
		}
	}
</script>

<script type="text/javascript">
	//내가 쓴 게시글 / 댓글 탭 
	$(document).ready(function() {
		$('ul.tab li').click(function() {
			var tabid = $(this).attr('data-tab');
			
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			
			$(this).addClass('current');
			$("#"+tabid).addClass('current');
		})
	})
</script>

</head>

<!-- jumbotron -->
<div id="mypage"
	class="container text-black mx-auto mt-5 align-middle">
	<div class="container text-center">
		<ul id ="infohead" class="nav mx-auto my-2">
			<li class="nav-item" style="font-weight: bold">회원정보</li>&nbsp;|&nbsp;
			<li class="nav-item"><a href="../AdminPage.jsp">home</a></li>
		</ul>
	
	<form method="post">
		<table class="table my-2 mx-auto">
			<thead class="thead bg-dark text-white">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>등급</th>
					<th>포인트</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="center">${mvo.getId() }</td>
					<td class="center">${mvo.getName() }</td>
					<td class="center">${mvo.getRank() } 등급</td>
					<td class="center">${mvo.getPoint() } point</td>
					<td class="center">${mvo.getRegdate().substring(0, 10) }</td>
				</tr>
				<tr>
					<td colspan="5" class="right">
						<input type="button" name="sendMsg" class="btn btn-dark mb-2"
							value="쪽지" onclick="messengerGo(this.form)">
						<input type="button" name="delete" class="btn btn-dark mb-2"
							value="탈퇴" onclick="deleteInfo(this.form)">
						<input type="button" value="닫기" class="btn btn-dark mb-2" onclick="window.self.close()">
						
						<input type="hidden" name="id" value="${mvo.getId() }">
						<input type="hidden" name="infochk" value="chk">
					</td>
				</tr>
			</tbody>
		</table>
	</form>	
	
	<%-- 내가 쓴 게시글 / 내가 쓴 댓글 /  카페 활동 알림 --%>
		<div id ="infohead">
			<ul class="tab nav mx-auto my-2" >
				<li class="tablink nav-item" data-tab="allPage">
				<a href="../AdminController?type=info&id=${mvo.getId() }">작성한 게시글</a></li>
				<span>&nbsp;&nbsp;</span>
				<li class="tablink current nav-item" data-tab="allComment">작성한 댓글</li>
			</ul>
		</div>
		
		<%-- 댓글 --%>
		<div id="allComment" class="tabcontent current">
			<p>전체 댓글 : ${pvo.getTotalRecord() } 개</p>
			<table class="table my-2 mx-auto">
				<tbody>
				<%-- 데이터가 있을 때 --%>
				<c:if test="${not empty commList }">
					<c:forEach var="cvo" items="${commList }">
						<tr>
							<td colspan="2" class="left"><b>${cvo.getId() }</b>
								&nbsp;&nbsp;&nbsp;<font>${cvo.getRegdate() }</font></td>
						</tr>
						<tr>
							<td class="left">${cvo.getContent() }</td>
							<td class="left">${cvo.getTitle() }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty commList }">
					<tr>
						<th colspan="5">등록된 댓글이 없습니다.</th>
					</tr>
				</c:if>
				</tbody>
				<tfoot>
				<tr>
					<td colspan="5">
						<ol class="paging">
						
						<%-- 이전페이지 사용여부 --%>
						<c:choose>
							<%-- 사용불가 (첫번째 블록) --%>
							<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
								<li class="disable">&lt;&nbsp;이전&nbsp;</li>
							</c:when>
							
							<%-- 사용가능 --%>
							<c:otherwise>
								<li><a href="AdminController?type=info&id=${mvo.getId() }
										&cPage=${pvo.beginPage-1 }">
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
									<a href="AdminController?type=info&id=${mvo.getId() }
										&cPage=${k }">${k }</a>
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
								<li><a href="AdminController?type=info&id=${mvo.getId() }
										&cPage=${pvo.endPage+1 }">
									&nbsp;다음&nbsp;&gt;</a></li>
							</c:otherwise>
						</c:choose>
						</ol>
					
					</td>
				</tr>
			</tfoot>
			</table>
		</div>
		
	</div>
</div>

