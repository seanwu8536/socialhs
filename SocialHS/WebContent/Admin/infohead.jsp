<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="infohead">
		<ul class="menu tab">
			<li class="topMenuLi">
				<a class="menuLink tablink current" data-tab="allList">전체 글목록</a>
				<div class="submenuUl nav-item">
					<a class="submenuLink tablink" data-tab="allList"
					href="AdminController?type=allList">전체보기</a>
					<a class="submenuLink tablink" data-tab="hobbylist" 
					href="AdminController?type=hobbylist">취미</a>
					<a class="submenuLink tablink" data-tab="studylist"
					href="AdminController?type=studylist">스터디</a>
				</div>
			</li>
			<li class="topMenuLi nav-item">
				<a class="menuLink tablink" data-tab="allmemberInfo"
				href="AdminController?type=allmemberInfo">회원정보보기</a></li>
			<li class="topMenuLi nav-item">
				<a class="menuLink tablink" data-tab="categoryAdd"
				href="AdminController?type=categoryAddPage">카테고리추가</a></li>
			<li class="topMenuLi nav-item"><a class="menuLink tablink" data-tab="chartpage"
				href="AdminController?type=googleChart">차트보기</a></li>
		</ul>
</div>