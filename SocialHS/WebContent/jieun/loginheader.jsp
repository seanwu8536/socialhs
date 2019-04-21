<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body class="bg-light text-dark">

    <nav class="navbar navbar-dark py-3" style="background-color: #00AA7F">
		<a class="navbar-brand" href="index.jsp">
			<img src="imgs/github-sign.png">
		</a>
        <span class="text-light ml-auto mx-2">
        	<b>${memberVO.id }</b>&nbsp;님 환영합니다.
        </span>
        <input type="hidden">
        <div id="almOutter">
        <button id="almBtn" type="button" class="btn text-white" style="background-color: #00AA7F">
            알림 <span id="almCnt" class="badge badge-dark">0</span>
        </button>
        <div id="newAlm">
        	
        </div>
        </div>
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link text-light" href="MypageController?type=myPage">마이페이지</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-light" href="memberController?type=logout">로그아웃</a>
            </li>
        </ul>
    </nav>