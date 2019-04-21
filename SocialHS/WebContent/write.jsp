<%@page import="com.bc.main.vo.SubLocationVO"%>
<%@page import="com.bc.main.vo.LocationVO"%>
<%@page import="com.bc.main.vo.BbsCodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<BbsCodeVO> bbs_code_list = (List<BbsCodeVO>)request.getAttribute("bbs_code_list");
	pageContext.setAttribute("bbs_code_list", bbs_code_list);
	System.out.println("test:"+bbs_code_list);
	
	List<LocationVO> LocationAll = (List<LocationVO>)request.getAttribute("LocationAll");
	pageContext.setAttribute("LocationAll", LocationAll);
	System.out.println("test2:"+LocationAll);
	
	List<SubLocationVO> SubLocationAll  = (List<SubLocationVO>)request.getAttribute("SubLocationAll");
	pageContext.setAttribute("SubLocationAll", SubLocationAll );
	System.out.println("test3:"+SubLocationAll );
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5jEX8e7bvKVZGhXBRBn9&submodules=geocoder"></script>
    
    <title>insert</title>
    <script>
    	//var subLocation = "${SubLocationAll }";
    	var subLocation = new Array();
    	<c:forEach items = "${SubLocationAll}" var = "info">
    		var json = new Object();
    		json.sl_idx = "${info.sl_idx}";
    		json.serverName = "${info.sl_name}";
    		json.l_idx = "${info.l_idx}";
    		subLocation.push(json);
    	</c:forEach>
    	
    	console.log(subLocation);
    	
    	function setName(){
    		var target = document.getElementById("sl_idx");
    		var temp_idx = target.value;
    		var setname;
    		
    		for(var i = 0; i < subLocation.length; i++){
    			if(temp_idx == subLocation[i]["sl_idx"]){
    				setname = subLocation[i]["serverName"];
    			}
    		}
    		console.log(setname);
    		
    		var tempName = "["+setname+"]";
    		
    		document.getElementById("title").value = tempName;
    		
    		
    	}
    	
    	function send_go(frm){
    		frm.method = "post";
    		frm.action = "HobbyController?type=writeOk";
    		frm.submit();	
    	}
    	function moveMap(){
    		var l_value = document.getElementById("l_idx").value;
    			
    		console.log(subLocation);
    		var temp = "";
    		temp += "<select id = 'sl_idx' name = 'sl_idx'>";
    		for(var i = 0; i < subLocation.length; i++){
    			if(l_value ==  subLocation[i]["l_idx"]){
    				temp += "<option class='form-control' value = '"+subLocation[i]["sl_idx"]+"'>"+subLocation[i]["serverName"]+"</option>";
    			}
    		}
    		temp += "</select>";
    		document.getElementById("sl_idx").innerHTML = temp ;
    		
    		var info = {
    				1 : {"y" : 37.3595704, "x" : 127.105399},
    				2 : {"y" : 37.302805, "x" : 127.565128},
    				3 : {"y" : 37.791067, "x" : 128.219262},
    				4 : {"y" : 36.979019, "x" : 127.898464},
    				5 : {"y" : 36.659744, "x" : 126.783483},
    				6 : {"y" : 35.695390, "x" : 126.862480},
    				7 : {"y" : 34.556921, "x" : 126.576899},
    				8 : {"y" : 36.567617, "x" : 128.806883},
    				9 : {"y" : 35.143085, "x" : 129.009648},
    				10 : {"y" : 33.344617, "x" : 126.549618}
    		};
    		
    		console.log(info);
    		console.log(info[l_value]);
    		console.log(info[l_value]["y"]);
    		
    		moveFocus(info[l_value]); //use the method to move the focus in the map wherever u wanna go
    	
    		setName();
    	}
    </script>
    
</head>

<body class="bg-light text-dark">
   
    <div class="container">
        <h1 class="display-4 text-center my-5">모집 글 작성하기</h1>
    </div>
    <form action = "#">
        <div class="row my-3">
            <div class="col ml-4">
                <label for="bbs_idx">카테고리</label>
                <select class="form-control" id="bbs_idx" name = "bbs_idx">
                    <c:forEach var = "bbsCodeVO" items = "${hsList }">
                    	<option value = "${bbsCodeVO.bbs_idx }">${bbsCodeVO.bbs_name }</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col ml-4">
                <label for="l_idx">지역</label>
                <select class="form-control" id="l_idx" name = "l_idx" onchange = "moveMap()">
                    <c:forEach var = "LocationVO" items = "${LocationAll }">
                    	<option value = "${LocationVO.l_Idx }">${LocationVO.l_Name }</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col mx-4">
                <label for="sl_idx">서브지역</label>
                <select class="form-control" id="sl_idx" name = "sl_idx" onchange = "setName()">
                    <c:forEach var = "SubLocationVO" items = "${SubLocationAll }">
                    	<c:if test = "${SubLocationVO.l_idx eq 1 }">
                    		<option value = "${SubLocationVO.sl_idx }">${SubLocationVO.sl_name }</option>
                    	</c:if>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group mx-5">
            <label for="title2">제목</label>
            <input type="text" class="form-control" id="title" name = "title">
        </div>
        <div class="row">
            <div class="col ml-5">
                <label for="req_member">모집인원</label>
                <input id="req_member" type="number" min=0 class="form-control" name = "req_member">
            </div>
            <div class="col mr-5">
                <label for="time">시간</label>
                <input id="time" type="text" class="form-control" placeholder="구체적인 시간을 필수적으로 입력해주세요." name = "time">
            </div>
        </div>
        <div class="map container my-5" style="width: 600px; height: 500px;">
            <div id="map" style="width:100%; height:500px;"></div>
            <div><button type = "button" class="btn btn-dark mt-2" onclick = "removeMark()">위치 바꾸기</button></div>
        </div>
        <div class="form-group mx-5">
            <label for="place">장소</label>
            <input type="text" class="form-control" id="place" name = "place" placeholder="구체적인 장소를 필수적으로 입력해주세요.">
        </div>

        <div class="form-group mx-5">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name = "content" rows="30"></textarea>
        </div>
        
        <div class="form-group" style="margin-left: 1600px;">
             <button type="reset" class="btn btn-danger">다시 작성하기</button>
             <button type="button" class="btn btn-danger" onclick = "send_go(this.form)">작성 완료</button>
        </div>
        <input type = "hidden" name = "latitude" id = "latitude" value="0">
        <input type = "hidden" name = "longitude" id = "longitude" value="0">
        <input type = "hidden" name = "id" value = "${memberVO.id }">
    </form>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script>
	
		var firstY = 37.3595704;
		var firstX = 127.105399;
		var mapOptions = {
		    center: new naver.maps.LatLng(firstY, firstX),
		    zoom: 5,
		    maxzoom : 0, 
		    zoomControl: false,
		    mapTypeControl: true
		};
		
		var map = new naver.maps.Map('map', mapOptions);
		
		map.setCursor('pointer');
		
		
		
		var markTest;
		function marker(y,x){
		    // markTest.setDraggable(true);
		    markTest = new naver.maps.Marker({ 
		        position: new naver.maps.LatLng(0,  0),
		        map: map,
		    });
		    markTest.setTitle("host 장소");
		    markTest.position["y"] = y;
		    markTest.position["x"] = x;
		    console.log(markTest.position["y"]);
		    console.log(markTest.position["x"]);
		}
		var flag = true;
		var conf;
		var y;
		var x;
		
		function moveFocus(info){
			var y1 = info.y;
			var x1 = info.x;
			console.log("focus시작");
			console.log(y1);
			console.log(x1);
			var focus = new naver.maps.LatLng(y1, x1);
			map.setCenter(focus);
			map.setZoom(4, true);
		    console.log("focus움직임");
		}
		
		naver.maps.Event.addListener(map, 'click', function(e) {
		    if(flag){
		       conf = confirm("이곳을 호스트 장소로 입력하겠습니까?!");
		    }
		    if(conf){
		        flag = false;
		        console.log(e);
		        console.log("위도 : "+e["coord"]["y"] + " 경도 : "+e["coord"]["x"]);
		        y = e["coord"]["y"];
		        x = e["coord"]["x"];
		        marker(y,x);
		        document.getElementById("latitude").value = x;
                document.getElementById("longitude").value = y;
		        conf = false;
		    }
		    // console.log("위도 :"+e.lating["x"]+", 경도 : "+e.lating["y"]);
		});//map 클릭시 위도와 경도 받기
		function removeMark(){
		    markTest.setMap(null);
		    flag = true;
		}
</script>
</body>

</html>
