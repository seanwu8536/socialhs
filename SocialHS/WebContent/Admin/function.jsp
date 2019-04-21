<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	//내가 쓴 게시글 / 댓글 탭 
	$(document).ready(function() {
		$('.tab a').click(function() {
			var tabid = $(this).attr('data-tab');
			
			$('.tab a').removeClass('current');
			$('.tabcontent').removeClass('current');
			
			$(this).addClass('current');
			$("#"+tabid).addClass('current');
		})
	})
	
	//사이드바 
	$(document).ready(function() {
		$(".topMenuLi>a").click(function() {
			var submenu = $(this).next("div");
			if( submenu.is(":visible") ) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});
	
	//카테고리 추가 
	function file_up(form){
		alert(form);
		form.action = 'AdminController?type=categoryAdd';
		form.submit(); 
	}
	
</script>

