<%@page import="com.bc.main.vo.PopUpVO"%>
<%@page import="com.bc.main.vo.ApplyVO"%>
<%@page import="com.bc.hobby.vo.HobbyBoardVO"%>
<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% List<CommentVO> commentList = (List<CommentVO>)request.getAttribute("commentList");
   pageContext.setAttribute("commentList", commentList);
   System.out.println("view Page comment : "+commentList);
%>
<%
   if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header_head.jsp"%>
<%
   } else {
%>
<%@ include file="head.jsp"%>
<%
   }
%>
<!-- Required meta tags -->
<meta charset="utf-8">
<!-- NaverMap API -->
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5jEX8e7bvKVZGhXBRBn9&submodules=geocoder"></script>


<title>${viewVO.title }</title>
</head>

<%
   if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header.jsp"%>
<%
   } else {
%>
<%@ include file="jieun/loginheader.jsp"%>
<%
   }
%>
<!-- <body>있음 -->
   <!-- Page Content -->
   <div class="container mt-4">
      
      <div class="row">

         <!-- Post Content Column -->
         <div class="col-lg">

         <!-- 카테고리                -->
            <p>${viewVO.bbs_name }</p>

            <hr>

            <!-- Title -->
            <h1 class="mt-4">${viewVO.title }</h1>

            <!-- Author -->
            <p class="lead">
               by <a href="#"
               onClick="window.open('MessengerController?type=memInfo&writer=${viewVO.id }','쪽지창', 'width=600px, height=670px, scrollbars=no')"
               >${viewVO.id }</a>
            </p>

            <hr>

            <!-- Date/Time -->
            <p>${viewVO.regdate }</p>

            <hr>

            <!-- reg_member, cur_member                -->
            <p>현재인원 : ${viewVO.cur_member } / 모집인원 : ${viewVO.req_member}</p>

            <hr>

            <!-- time, place                -->
            <p>${viewVO.time }, ${viewVO.place }</p>

            <hr>

            <!-- Preview Image -->
            <!--  <img class="img-fluid rounded" src="#" alt="img" width="900"
               height="900"> -->
      
             <div class="img-fluid rounded" id="map" style="width:40%;height:600px;"></div>
             

            <hr>

            <!-- Post Content -->
            <p class="lead">${viewVO.content }</p>

            <!-- ----------------------------------------------------------------------------------------- -->
            <%
               if(session.getAttribute("memberVO") == null)
               {
            %>
                  <p class = 'text-primary'>로그인시에만 신청이 가능합니다.</p>
            <%       
               }
               else{
                  
            %>
            <c:set var="loop_flag" value="false" />
            
            
            <%
            	HobbyBoardVO viewVO = (HobbyBoardVO)session.getAttribute("viewVO");
            	memberVO memberVO = (memberVO)session.getAttribute("memberVO");
            	List<ApplyVO> applyList = (List<ApplyVO>)session.getAttribute("applyList");
            	System.out.println("===================================");
            	System.out.println("viewVO : "+viewVO);
            	System.out.println("memberVO : "+memberVO);
            	System.out.println("applyList : "+applyList);
            	System.out.println("===================================");
            %>
            <c:if test="${viewVO.id ne memberVO.id }">
            <%! boolean flag = true; %>
            <% 	
            		for(int i = 0; i < applyList.size(); i++){
            			System.out.println("applyList.get(i).getId() : "+applyList.get(i).getId());
            			System.out.println("memberVO.getId() : "+memberVO.getId());
            			
            			if(applyList.get(i).getId().equals(memberVO.getId())){
           					 flag = false;
            			}else{
            				 flag = true;
            			}
            		}
            if(applyList.size() == 0){
            	flag = true;
            }
            System.out.println("applyList.size() : "+applyList.size());
            System.out.println("flag 찍어보자!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            System.out.println("Flag : "+flag);
            System.out.println("flag 찍어보자!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            if(flag == false)
            {
            %> 	    
           		<button type="button" class="btn btn-outline-danger" 
                          onclick = "cancel()">신청취소</button>
            <%
            }else if(flag == true){
            %>
            	 <button type="button" class="btn btn-outline-primary" 
                           onclick = "apply()">신청하기</button>
            <%
            }
            %>
            </c:if>
            
            
            <c:if test="${viewVO.id eq memberVO.id }">
	            <button type="button" class="btn btn-outline-primary" 
	               onclick = "update_main()">수정</button>
	            <button type="button" class="btn btn-outline-danger" 
	            onclick = "delete_main()">삭제</button>
	            <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#myModal" onclick = "popUp()">
				  	인원보기 	
				</button>
            </c:if>
            <%
               }
            %>
            
            <button type="button" class="btn btn-outline-info" onclick = "back()">
				  	뒤로가기 	
				</button>
            <hr>

            <!-- Comments Form -->
            <%
            if(session.getAttribute("memberVO") == null)
            {
            %>
               <p class = 'text-primary'>로그인시에만 댓글작성이 가능합니다.</p>
            <%       
            }
            else{
            %>
            <div class="card my-4">
               <h5 class="card-header">Leave a Comment:</h5>
               <div class="card-body">
                  <form action = "Comment?type=writeOk" method = "post">
                     <div class="form-group">
                        <textarea class="form-control" rows="3" name = "content"></textarea>
                     </div>
                     <button type="submit" class="btn btn-primary">Submit</button>
                     <input type = "hidden" name = "bb_idx" value = "${viewVO.bb_idx }">
                     <input type = "hidden" name = "id" value = "${memberVO.id }">
                     
                  </form>
               </div>
            </div>
            <%
            }
            %>

            <!-- Single Comment -->
         
            <c:forEach var = "commentList" items = "${commentList }">
               <!-- Comment with nested comments -->
               <div class="media mb-4">
                  <img class="d-flex mr-3 rounded-circle"
                     src="http://placehold.it/50x50" alt="">
                  <div class="media-body">
                     <h5 class="mt-0">${commentList.id }</h5>
                     ${commentList.content }
                  </div>
                  <input type="button" class="btn btn-outline-secondary"  name = "${commentList.id }" id = "${commentList.bbc_idx }"onclick="delete_comment(this)" value = "삭제">
               </div>
            </c:forEach>
            
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel">인원보기</h4>
               	 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
      
                  </div>
                  <div class="modal-body" id = "modal-body">
               		 	인원 현황
                  </div>
                  <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>

         </div>
         </div>
         </div>
         
         <!-- memberId 비교해서 수정 삭제하는 코드 작성 -->
         <script>
         	function back(){
         		var hs = "${hs}".toString().substring(0,1);
         		var flag = confirm("뒤로 이동 하시겠습니까?!");
         		var locat = "${location.get(0).getL_Idx()}";
                if(flag){
                	location.href = 'LocationController?hs='+hs+"&location="+locat;
                }		
         	}
      		function delete_main(){
      			var flag = confirm("정말 삭제 하시겠습니까?!");
                if(flag){
                	location.href = 'HobbyController?type=deleteOk&bb_idx=${viewVO.bb_idx}';
                }
      		}
            function update_main(){
               location.href = 'HobbyController?type=update';
            }
            function apply(){
               var flag = confirm("정말 신청하시겠습니까?!");
               if(flag){
                  if("${viewVO.req_member}" == "${viewVO.cur_member}"){
                     alert("자리가 꽉 찼습니다.");
                     return false;
                  }
                  location.href = "HobbyController?type=apply";
               }
            }
            function cancel(){
               var flag = confirm("정말 신청취소 하시겠습니까?!");
               if(flag){
                  location.href = "HobbyController?type=cancel";
               }
            }
            //여기 수정해야함!!! memberVO가 안들어왔을때 오류뜨니까!!
            <%	
           		if(session.getAttribute("memberVO") == null){
           	%>
	           	function delete_comment(self){
	           		alert("작성자만 삭제할 수 있습니다");
	           	}
	           	function popUp(){
	           		alert("인원 현황보기!!");
	           	}
           	<%
           		}else{
            %>
             function delete_comment(self){
                if(self.name == "${memberVO.id}"){
                   var flag = confirm("정말 댓글을 삭제 하시겠습니까?!");
                  if(flag){
                     location.href = 'Comment?type=deleteOk&bbc_idx='+self.id;
                  }
                }else{
                   alert("작성자만 삭제할 수 있습니다");
                }
             }
             <%
            }
             %>
             <%
             	List<PopUpVO> popupList = (List<PopUpVO>)request.getAttribute("popupList");
             	pageContext.setAttribute("popupList", popupList);
             %>
             <%
             	if(popupList == null){
             			
             	}else {
             %>
             function popUp(){
            	 var writer = "";
            	 var obj2 = new Array();
            	 <c:forEach var = "popupList" items = "${popupList}">
            	 	var id = "${popupList.id}";
            	 	var name = "${popupList.name}";
            	 	var phone = "${popupList.phone}";
            	 	var email = "${popupList.email}";
            	 	var regdate = "${popupList.regdate}";
            	 	var bb_idx = "${popupList.bb_idx}";
            	 	var infoSave = {"id" : id,
            	 					"name" : name,
            	 					"phone" : phone,
            	 					"email" : email,
            	 					"regdate" : regdate,
            	 					"bb_idx" : bb_idx};
            	 	obj2.push(infoSave);
            	 </c:forEach>
            	 console.log(obj2);
            	 writer += "<table class='table table-hover'>";
            	 writer += "<thead class = 'bg-dark' style='color : white;'><tr><th scope='col'>id</th><th scope='col'>name</th><th scope='col'>phone</th>";
            	 writer += "<th scope='col'>email</th><th scope='col'>regdate</th></thead>";
            	 writer += "<tbody>";
            	 for(var i = 0; i < obj2.length; i++){
            		 writer += "<tr>";
            		 writer += "<th scope='row'>"+obj2[i]["id"]+"</th>";
            		 writer += "<td>"+obj2[i]["name"]+"</td>";
            		 writer += "<td>"+obj2[i]["phone"]+"</td>";
            		 writer += "<td>"+obj2[i]["email"]+"</td>";
            		 writer += "<td>"+obj2[i]["regdate"]+"</td>";
            		 writer += "</tr>";
            	 }
            	 writer += "</tbody></table>";
            	 
            	 console.log(writer);
            	 document.getElementById("modal-body").innerHTML = writer;
             }
             <%
             	}
             %>

         
         
         
         
         </script>

      <!-- naver map api등록 -->
         <script>
         var latitude = ${viewVO.latitude};
         var longitude = ${viewVO.longitude};
         var mapOptions = {
                center: new naver.maps.LatLng(longitude, latitude),
                zoom: 10,
                maxzoom : 0, 
                zoomControl: false,
                mapTypeControl: true
            };

         var infoWindow = new naver.maps.InfoWindow({
             anchorSkew: true
         });
         var map = new naver.maps.Map('map', mapOptions);

         map.setCursor('pointer');

         var marker1 = new naver.maps.Marker({ //seoul
             position: new naver.maps.LatLng(longitude, latitude),
             map: map
         });
         marker1.setTitle("host장소");      
            
      </script>

      
      </div>
      </div>
<%@ include file="jieun/footer.jsp"%>
