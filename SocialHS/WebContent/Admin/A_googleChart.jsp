<%@page import="com.bc.main.vo.googleChartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% List<googleChartVO> googleHobbyList = (List<googleChartVO>)request.getAttribute("googleHobbyList"); 
	pageContext.setAttribute("googleHobbyList", googleHobbyList);
	
	List<googleChartVO> googleStudyList = (List<googleChartVO>)request.getAttribute("googleStudyList"); 
	pageContext.setAttribute("googleStudyList", googleStudyList);
%>

<!DOCTYPE html>
<html>
<head>
<%
	if (session.getAttribute("AdminVO") == null) {
%>		<%@ include file="../jieun/header.jsp"%>
<%	} else {
%>		<%@ include file="A_loginheader.jsp"%>
<%	}
%>

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
<meta charset="UTF-8">
<title>[A] 구글차트</title>
<style>

</style>
<link href="css/A_morepage.css" rel="stylesheet" type="text/css">

	<jsp:include page="function.jsp"></jsp:include>
<script>
	//구글차트 
	var hobbyObj;
	window.onload = function() {
	
		console.log("${googleHobbyList}");
		hobbyObj = new Array();
		hobbyObj.push([ "location", "호스팅", "스터디" ]);
		<c:forEach items = "${googleHobbyList}" var = "vo">
			var l_idx = "${vo.l_idx}";
			var l_name = "${vo.l_name}";
			var number = "${vo.number}";
	
			var tempObj = [ l_name, Number(number) ];
			hobbyObj.push(tempObj);
			</c:forEach>
	
			var i = 1;
	
		<c:forEach items = "${googleStudyList}" var = "vo">
		
		var number = "${vo.number}";
	
		hobbyObj[i].push(Number(number));
		i++;
		</c:forEach>
	
		console.log(hobbyObj);
		console.log(hobbyObj.toString());
	
	}
	
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	
	function drawChart() {
	
		var data = google.visualization.arrayToDataTable(hobbyObj);
		var options = {
			chart : {
				title : '비트주세요 호스팅 차트',
				subtitle : 'Location, Hobby, and Study: 2018-2019',
				animation : {
					duration : 1000,
					easing : 'out',
				}
			}
		};
	
		var chart = new google.charts.Bar(document
				.getElementById('columnchart_material'));
		google.visualization.events.addListener(chart, 'ready', function() {
			//alert("animation");
		});
	
		setTimeout(function() {
			data.setValue(0, 1, 3);
			data.setValue(1, 1, 4);
			data.setValue(2, 1, 5);
			console.log(data);
			chart.draw(data, google.charts.Bar.convertOptions(options));
		}, 1000)
	
		setTimeout(function() {
			data.setValue(0, 0, 0);
			data.setValue(1, 0, 0);
			data.setValue(2, 0, 0);
			chart.draw(data, google.charts.Bar.convertOptions(options));
		}, 1000)
	
	}
</script>

</head>
<body>
<div id="adminPage" class="jumbotron jumbotron-fluid">
	
	<div id="infohead">
		<ul class="menu tab">
			<li class="topMenuLi">
				<a class="menuLink tablink" data-tab="allList">전체 글목록</a>
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
			<li class="topMenuLi nav-item"><a class="menuLink tablink current" data-tab="chartpage"
				href="AdminController?type=googleChart">차트보기</a></li>
		</ul>
	</div>

	<div class="container">
		<%-- 구글차트 --%>
		<div id="chartpage" class="center-block">
			<input type="button" class="btn btn-primary" id="btn"
				onclick="drawChart()" value="chart"> <br>
			<div id="columnchart_material" style="width: 1100px; height: 500px;"></div>

		</div>
	</div>
	</div>

</body>
</html>