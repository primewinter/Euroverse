<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 <div class="footerBar">
 		<div class="pushToast">
 		pushToast 자리
 		</div>
 		<div class="footerBar-content">
 			 
				    <!-- 결과 메시지 보여주는 창 -->
				     <div class="deletePush" >
				    <span class = "totalCount" style="float:center;">내 소식 알림</span>
				    <a href='javascript:deletePush()'><i class="far fa-trash-alt" style="float:right;"></i></a><hr>
				    	<div class="pushList" style="overflow-y:auto; width:300px; height:350px;">
				    	</div>
				    </div>
				    <br />
				    
				    <script type="text/javascript">
				        var pushAddr = "ws://192.168.0.82:8080/userSocket/";
				        var webSocket;
				        var userId = '${user.userId}';
				        
				        if( userId != null && userId != '' ) { // 로그인 했을 때만 웹소켓 연결
					        	pushAddr += userId;
					        	webSocket = new WebSocket(pushAddr);
					        	
						        //웹 소켓이 연결되었을 때 호출되는 이벤트
						        webSocket.onopen = function(message){
						              console.log('[push] : connection opened.')
						          	  //웹 소켓에서 메시지가 날아 왔을 때 호출되는 이벤트
							          webSocket.onmessage = function(message){
						            	  console.log("push 왔다 ::: "+message.data)
						            	  var obj = JSON.parse(message.data);
						            	  var pushType = obj.pushType;
						            	  console.log("pushType :: "+pushType);
						            	  if(pushType=='P') {
						            		  var pushMsg = obj.pushMsg+" 잊지 않으셨나요?";
						            		  console.log(pushMsg);
						            		  console.log(obj.refId)
						            		  /* var html = '<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">';
						            		  html += '<div class="toast-header">';
						            		  html += '!';
						            		  //<img src="..." class="rounded mr-2" alt="...">
						            		  html += '<strong class="mr-auto">Bootstrap</strong>';
						            		  html += '<small>'+obj.pushTime+'</small>';
						            		  html += '<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">';
						            		  html += '<span aria-hidden="true">모지?</span>';
						            		  html += '</button>';
						            		  html += '</div>';
						            		  html += '<div class="toast-body">';
						            		  html += obj.pushMsg
						            		  html += '</div>';
						            		  html += '</div>';  */
						            		  $('.pushToast').html(pushMsg);
						            		  //$('.pushToast').html(html);
						            		  
						            	  } else {
						            		
							        	  	getPushList(userId);
							        	  	getUnreadCount(userId);
						            	  }
							        };
						            
						        };
					        
						        //웹 소켓이 닫혔을 때 호출되는 이벤트
						        webSocket.onclose = function(message){
						            console.log("push 접속이 끊어졌습니다.\n");
						        };
						        //웹 소켓이 에러가 났을 때 호출되는 이벤트
						        webSocket.onerror = function(message){
						            console.log("push 에러가 발생했습니다.\n");
						        };
				        }
				        //웹소켓 종료
				        function disconnect(){
				            webSocket.close();
				        }
				        
				        function sendPush(receiverId, pushType) {
				        	var push = new Object();
				        	console.log("[sendPush] receiverId : "+receiverId+" || pushType : "+pushType);
							push.receiverId = receiverId;
							push.pushType = pushType;
						  	webSocket.send(JSON.stringify({push}));
							console.log("push 보냈음 ::"+JSON.stringify({push}));
				        }
				        
				    </script>
 		</div>
 		<i class="fas fa-bell fa-2x"></i><span class="unreadCount" style="display:table-col;vertical-align:top;"></span>
 	</div>
 	
 	<script type="text/javascript">
     var userId = '${user.userId}';
     function getPushList(userId) {
			 $.ajax({
				 url : "/push/json/getPushList/"+userId,
				 type : "GET",
				 dataType : "json",
				 headers : {
					 "Accept" : "application/json",
					 "Content-Type" : "application/json"
				 },
				 success : function(result) {
					 console.log(result);
					 var list = result.list;
					 //var resultPage = result.resultPage;
					 //var search = result.search;
					 var totalCount = result.totalCount;
					 $(".totalCount").append(totalCount);
					 console.log("totalCount : "+totalCount);
					 console.log("list.size : "+list.size);
					 $(".pushList").html("");
					 $.each(list, function(index, vo){
						showList(vo, 0);
					 })
					
					//console.log("resultPage : "+resultPage);
					//console.log("search : "+search);
				 },
				 error : function(error, status) {
					 console.log("알림 내역 출력 실패");
					 console.log(error.responseText);
					 console.log(status);
				 }
			 })
		 }
		 
		 // <무한스크롤 ----------------------------------------------------------------------------
		var pushPage = 2;
	    var end = false;
	    
	    // 스크롤 감지
	    $(".pushList").scroll(function(){
	    	var scrollTop = $(this).scrollTop(); // 현재 스크롤의 위치
	    	var innerHeight = $(this).innerHeight(); // 패딩값을 포함한 현재 .pushList 구역의 높이
	    	var scrollHeight = $(this).prop('scrollHeight'); // 스크롤 시키지 않았을 때의 전체 높이
	    	//console.log("ScrollTop : "+scrollTop+"|| innerHeight : "+innerHeight+"|| scrollHeight : "+scrollHeight);
	    	if( scrollTop + innerHeight >= scrollHeight ) { // scrollTop() 과 innerHeight() 값을 더한 값이 scrollHeight() 보다 같거나 크게 되면 맨 아래 감지 가능
	    		console.log("스크롤 최하단에 위치")
				scrollList();
	    	}
	    })
	    
		 // 스크롤 최하단에 위치 시 작동할 function(무한스크롤) : 리스트 호출
		 function scrollList() {
			 if(end == true){  //더 이상 불러올 data가 없는 경우 return
				 console.log("if(end == true) 들어옴")
				 return;
			 }
			console.log("scrollList 시작")
			 
			 var search = new Object();
			 search.currentPage = pushPage;
			 
			 $.ajax({
				url : "/push/json/getPushList/"+userId,
				type : "POST",
				data : JSON.stringify({search}),
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(list) {
					console.log(list);
					
					var length = list.length;
					console.log("받아온 data의 길이 : "+length);
					console.log("currentPage : "+pushPage)
				
					if( length < 5 ){
						isEnd = true;
						console.log("남은 데이터가 5개 미만이므로 isEnd = true;")
					}
					
					 $.each(list, function(index, vo){
						showList(vo);
					})
					
					pushPage++;
				},
				error : function(error){
					console.log("fetchList 실패");
					console.log(error);
				}
			 })
		 }
		 
		 // 리스트 호출 시 작동할 function : 리스트 화면에 출력
		 function showList(vo, type) {
			 var tag = "";
				tag += "<table width=95%>"
			 	tag += "<tr>"
			 	tag += "<td style='margin:auto;text-align:center' width='10%'>"
				tag += "<input type='checkbox' name='chk' id='"+vo.pushId+"' value='"+vo.pushId+"'>"; // style='display:none;'
				tag += "</td>"
				tag += "<td style='margin:auto;text-align:center' width='10%'>"
				if(vo.pushType.trim()=='C' || vo.pushType.trim()=='R') {
			 		tag += "<img src='/resources/images/icon/push_reply9.png'>";
			 		tag += "</td>"
		 			tag += "<td style='text-align:left;margin-left:10'>"
	 				tag += "<font size='2'  font color='black'>"
	 				tag += "<a href='/board/getBoard?boardNo="+vo.refId+"'>";
			 	} else if (vo.pushType.trim() == 'I' ) {
			 		tag += "<img src='/resources/images/icon/push_invite.png'>";
			 		tag += "</td>";
			 		tag += "<td style='text-align:left;margin-left:10'>"
	 				tag += "<font size='2'  font color='black'>"
			 		tag += "<a href='/myPage' >"; // 초대 목록 리스트 링크
			 	} else if (vo.pushType.trim() == 'A') {
			 		tag += "<img src='/resources/images/icon/push_acc.png'>";
			 		tag += "</td>";
			 		tag += "<td style='text-align:left;margin-left:10'>"
	 				tag += "<font size='2'  font color='black'>"
			 		tag += "<a href='/myPage/' >" // 동행 신청 목록 리스트 링크
			 	}
			 		tag += vo.pushMsg+"</font>";
			 		tag += "</td>";
			 		tag += "<tr>";
			 		tag += "<td></td><td></td><td style='vertical-align: middle;'>";
			 		tag += "<font size='1' font color='gray'>"+vo.pushTime+"</font></a>";
			 		tag += "</td>";
			 		tag += "</tr>";
			 
			  tag += "</table>"
			  tag += "<style>"
			  tag += "label { font-weight: normal; font-color: white; }"
			  tag += "</style>";  
			  
			  $(".pushList").append(tag);
		 }
		 
		// ----------------------------------------------------------------------------------------- 무한스크롤>
		
		 function getUnreadCount(userId) {
			 $.ajax({
				 url : "/push/json/getUnreadCount/"+userId,
				 type : "GET",
				 dataType : "json",
				 headers : {
					 "Accept" : "application/json",
					 "Content-Type" : "application/json"
				 },
				 success : function(result) {
					 console.log("안 읽은 알림 개수 출력 성공 : "+result+"개")
					 var h = "<font color='red'>"+result+"</font>";
					 $(".unreadCount").html(h);
				 },
				 error : function(error) {
					 console.log("안 읽은 알림 개수 출력 실패");
					 console.log(error);
				 }
			 })
		 }
		 
		 function readPush(userId) {
			 $.ajax({
				 url : "/push/json/readPush/"+userId,
				 type : "GET",
				 headers : {
					 "Accept" : "application/json",
					 "Content-Type" : "application/json"
				 },
				 success : function() {
					 console.log("알림 읽기 성공")
				 },
				 error : function(error) {
					 console.log("알림 읽기 실패");
					 console.log(error);
				 }
			 })
		 }
		 
		 function deletePush() {
			 console.log("삭제 시작")
			 
			// 배열 선언
			 var arrayParam = new Array();
			 //each로 loop를 돌면서 checkbox의 check된 값을 가져와 담아준다.
			 $("input:checkbox[name='chk']:checked").each(function(){
			 	arrayParam.push($(this).val());
			 });
			 console.log("배열!!! \n");
			 console.log(arrayParam);
			 
			  var formData = JSON.stringify(arrayParam);
		       
			 $.ajax({
				url : "/push/json/deletePush",
				type : "POST",
				data : formData,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function() {
					console.log("알림 삭제 성공");
					getPushList(userId);
				},
				error : function(error) {
					console.log("알림 삭제 실패");
					console.log(error);
				}
			 })
			 
		 }
		 
		  jQuery(document).ready(function($) {
			  console.log("현재 로그인한 회원 : "+userId);
			 
			  if(userId != null && userId != '' ) {
			  	getPushList(userId);
			  	getUnreadCount(userId);
			  	
			  }
	            // hide the menu when the page load
	            $(".footerBar-content").hide();

	            // when .menuBtn is clicked, do this
	            $(".footerBar .fa-bell").click(function() {
	            	// 로그인 했을 때만 실행
	            	if(userId != null && userId != '' ) {
	            		readPush(userId);
						setTimeout(() => getUnreadCount(userId), 50);
	            	}
	                // open the menu with slide effect
	                $(".footerBar-content").slideToggle(300);
	                
	            	

	            });

	        });


		
	</script>  
		<style>
        .footerBar {
        	position: fixed;
        	right: 50px;
        	bottom: 50px;
        	text-align: right;
        }
        
        .footerBar-content {
        	background-color: white;
        }
        
        

	</style>