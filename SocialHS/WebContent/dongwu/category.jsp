<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<script>
		window.onload = function() {
			/* alert("TEst"); */
			var request = new XMLHttpRequest();
			request.onreadystatechange = function() {
				if (request.readyState == 4 && request.status == 200) {
					var json = JSON.parse(request.responseText);
					/* alert("json check");
					alert(json); */
					console.log(json);
					var output = "<br><br>";
					console.log("asdfadsf");
					var count = 0;
					console.log(json["list"]);
					
					var list = json["list"];
					
					output += "<table class=\"table \">";

					for (var i = 0; i < list.length; i++) {

						if (count % 5 == 0) {
							output += "<tr class=\"text-center\">";
						}
						output += "<td class=\"border border-white\"><a href=\"#\">";
						for ( var key in list[i]) {
							output += list[i][key] + "&nbsp;";
						}
						count++;
						console.log("cnt : " + count);
						output += "</a></td>";
						//output += "&nbsp;&nbsp;&nbsp;&nbsp;";
						//console.log("output "+output);

						if (count % 5 == 0) {
							output += "</tr>";
						}

					}
					output += "</table>";
					
					var test = document.getElementById("test");
					//category.innerHTML(output);
					document.getElementById("category").innerHTML = output;
					//document.body.innerHTML += output;
				}
			};
			var hs = "${hs}";
			console.log(hs);
			if (hs == "hobby") {
				request.open("GET", "HSList?type=hobby", true);
				request.send();
			} else if (hs == "study") {
				request.open("GET", "HSList?type=study", true);
				request.send();
			}
		}
	</script>

	<!-- <div id="category" class="m-0" style="width: 100%;"></div> -->
