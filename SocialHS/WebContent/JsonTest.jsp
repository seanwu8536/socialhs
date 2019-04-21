<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>

window.onload = function(){
	alert("TEst");
	var request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(request.readyState == 4 && request.status == 200){
			var json = JSON.parse(request.responseText);
			alert("json check");
			alert(json);
			console.log(json);
			var output = "";
			console.log("asdfadsf");
			var count = 0;
			console.log(json["list"]);
			var list = json["list"];
			for(var i = 0; i < list.length; i++){
				count++;
				console.log("cnt : "+count);
				output += "<p>";
				for(var key in list[i]){
					output += list[i][key] + ",";
				}
				output += "</p>";
				console.log("output "+output);
			}
			var test = document.getElementById("test");
			document.body.innerHTML += output;
		}
	};
	request.open("GET","HSList?type=study",true);
	request.send();
}
</script>
<body>
Json TEst
<div id = "test">as</div>
</body>
</html>