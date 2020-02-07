<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
    <div class="footerBar">
 		<div class="pushToast">
 		ㅋㅋㅋ
 		</div>
 		<div class="footerBar-content">
 			 
				    <!-- 결과 메시지 보여주는 창 -->
				    <div class="pushList" style="overflow-y:auto; width:200px; height:220px;">
				    </div>
				    <br />
				    
				    <script type="text/javascript">
				        var pushAddr = "ws://192.168.0.82:8080/websocket/${user.userId}";
				        var webSocket = new WebSocket(pushAddr);
				        if( userId != null && userId != '' ) {
				        
				        var userId = '${user.userId}';
				        //웹 소켓이 연결되었을 때 호출되는 이벤트
				        webSocket.onopen = function(message){
				              console.log('[push] : connection opened.')
				          	  //웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트
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
 		<h4>알림 내역</h4>
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
					 var resultPage = result.resultPage;
					 var search = result.search;
					 console.log("list.size : "+list.size);
					 
					 var tag = "<div class='chkPushList'>"
					 tag += "<a href='javascript:deletePush()'>삭제</a><hr>";
					 for(var i = 0 in list) {
					 	tag += "<input type='checkbox' name='chk' id='"+list[i].pushId+"' value='"+list[i].pushId+"'>";
					 	tag += "<a href='/board/getBoard?boardNo="+list[i].refId+"'>";
					 	tag += list[i].pushMsg+"</a><br>";
					 }
					 
					 tag += "</div>"
					 
					 $('.pushList').html(tag);
					 console.log("resultPage : "+resultPage);
					 console.log("search : "+search);
				 },
				 error : function(error) {
					 console.log("알림 내역 출력 실패");
					 console.log(error);
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
		 function showList(vo) {
			 var tag = "";
			 tag += "<input type='checkbox' name='chk' id='"+vo.pushId+"' value='"+vo.pushId+"'>";
			 tag+= "<a href='/board/getBoard?boardNo="+vo.refId+"'>";
			 tag +=vo.pushMsg+"</a><br>";
		  	 $(".chkPushList").append(tag);
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
					 var h = "<h4>알림 내역<font color='red'>"+result+"</font></h4>";
					 $(".footerBar h4").html(h);
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
			
			  if(userId != null && userId != '' ) {
			  	getPushList(userId);
			  	getUnreadCount(userId);
			  	
			  }
	            // hide the menu when the page load
	            $(".footerBar-content").hide();

	            // when .menuBtn is clicked, do this
	            $(".footerBar h4").click(function() {

	            	readPush(userId);
					setTimeout(() => getUnreadCount(userId), 50);
					
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
        	background-color: lightpink;
        }
        

	</style>