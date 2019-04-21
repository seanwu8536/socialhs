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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
	<%--구글차트 --%>
	<style>
	
#bar-chart {
  width: 500px;
  height: 300px;
  position: relative;
}
#bar-chart::before {
  content: "";
  position: absolute;
  display: block;
  width: 240px;
  height: 30px;
  left: 155px;
  top: 254px;
  background: #FAFAFA;
  box-shadow: 1px 1px 0 0 #DDD;
}


	</style>
	
	<%--구글차트 스크립트 --%>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
	    var hobbyObj;
	    window.onload = function(){
	    	 
	    	  console.log("${googleHobbyList}");
	    	  hobbyObj = new Array();
    	  	  hobbyObj.push(["location","호스팅","스터디"]);
	    	  <c:forEach items = "${googleHobbyList}" var = "vo">
	    		var l_idx = "${vo.l_idx}";
	    		var l_name = "${vo.l_name}";
	    		var number = "${vo.number}";
	    		
	    		var tempObj = [l_name, Number(number)];
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
	    </script>
	   <script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
	google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawCharts);
function drawCharts() {
  
  // BEGIN BAR CHART
  /*
  // create zero data so the bars will 'grow'
  var barZeroData = google.visualization.arrayToDataTable([
    ['Day', 'Page Views', 'Unique Views'],
    ['Sun',  0,      0],
    ['Mon',  0,      0],
    ['Tue',  0,      0],
    ['Wed',  0,      0],
    ['Thu',  0,      0],
    ['Fri',  0,      0],
    ['Sat',  0,      0]
  ]);
	*/
  // actual bar chart data
  var barData = google.visualization.arrayToDataTable(hobbyObj);
  // set bar chart options
  var barOptions = {
    focusTarget: 'category',
    backgroundColor: 'transparent',
    colors: ['cornflowerblue', 'tomato'],
    fontName: 'Open Sans',
    chartArea: {
      left: 50,
      top: 10,
      width: '100%',
      height: '70%'
    },
    bar: {
      groupWidth: '80%'
    },
    hAxis: {
      textStyle: {
        fontSize: 11
      }
    },
    vAxis: {
      minValue: 0,
      maxValue: 5,
      baselineColor: '#DDD',
      gridlines: {
        color: '#DDD',
        count: 4
      },
      textStyle: {
        fontSize: 11
      }
    },
    legend: {
      position: 'bottom',
      textStyle: {
        fontSize: 12
      }
    },
    animation: {
      duration: 1200,
      easing: 'out',
			startup: true
    }
  };
  // draw bar chart twice so it animates
  var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
  //barChart.draw(barZeroData, barOptions);
  barChart.draw(barData, barOptions);

  var lineData = google.visualization.arrayToDataTable(hobbyObj);

}

</script>
	  <div id="bar-chart"></div>
	  

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>