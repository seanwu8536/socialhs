<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body class="bg-light text-dark">

    <nav class="navbar navbar-dark bg-success py-3">
		<a class="navbar-brand" href="AdminPage.jsp">
			<img src="imgs/github-sign.png">
		</a>
        <span class="text-light bg-success ml-auto mx-2">
        	<b>${AdminVO.id }</b>&nbsp;님 환영합니다.
        </span>
        <input type="hidden">
        <div id="almOutter">
        <button id="almBtn" type="button" class="btn btn-success">
<!--         <button id="almBtn" type="button" class="btn btn-light">
            알림<span id="almCnt" class="badge badge-light">0</span>
        </button> -->
        <div id="newAlm">
        	
        </div>
        </div>
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link text-light" href="memberController?type=logout">로그아웃</a>
            </li>
        </ul>
    </nav>