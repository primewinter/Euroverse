<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 <div class="footerBar">
 		<div class="pushToast">
 		</div>
 		<div class="bottom-bar push-layer" >
				    <div class="deletePush" >
						    <span class = "totalCount" style="float:center;">내 소식 알림</span>
						    <a href='javascript:deletePush()'><i class="far fa-trash-alt" style="float:right;"></i></a><hr>
						    	<div class="pushList" style="overflow-y:auto; width:300px; height:350px;"></div>
				    </div>
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
						            		  const Toast = Swal.mixin({
						            			  toast: true,
						            			  position: 'top-end',
						            			  showConfirmButton: false,
						            			  timer: 5000,
						            			  timerProgressBar: true,
						            			  onOpen: (toast) => {
						            				  toast.addEventListener('click', function() {
							            				  self.location= "/plan/getPlan?planId="+obj.refId;
						            				  })
						            			  }
						            			})

						            			Toast.fire({
						            			  icon: 'success',
						            			  title: obj.pushMsg+', 잊지 않으셨나요?'
						            			});
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
 		<div class="bottom-bar chat-layer" id="slider-wrap" >
		          <ul id="slider">
			           <li data-color="#1abc9c" style="overflow-y:auto;">
				 				<!-- 채팅목록 -->
					 			<div class="accLobby container" >
					 			</div>
			 			</li>
	 				 	<li data-color="#3498db">
					 			<div id="accChat" style="width:300px; height:500px;">
					 				<div class="accChat-content">
					 						<div class="accChat info">
					 							<i class="fas fa-arrow-left fa-2x" style="float:left;margin:5px;"><span style="margin:5px;"></span></i>
					 							<p style="text-align:right;margin:5px;"><i class="fas fa-bars fa-2x" data-toggle="modal" data-target="#accModal"></i></p>
					 						</div>
					      				    <div class="accChat output"  style="overflow-y:auto;padding:5px"> </div>
					       				    <div class="accChat input" style="padding:5px">
													 <div class="input-group">
													      <input type="text" class="form-control" id="myAccChat" placeholder="메시지를 입력하세요">
													      <span class="input-group-btn">
													        	<button class="btn btn-default" type="button" onclick="sendAccMessage()"><i class="fab fa-telegram-plane"></i></button>
													      </span>
													 </div>
					        				</div>
				        				</div>
				   				</div>
		   				</li>
	   				</ul>
 		</div>
 		<div class="bottom-menu" >
		 		<i class="fas fa-bell"  style="margin:10px;"></i><span class="unreadCount" style="display:table-col;vertical-align:top;"></span>
		 		<i class="fas fa-comment-alt"  style="margin:10px;"></i>
 		</div>
 	</div>
 	<div class="modal fade" id="accModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
							        <h5 class="modal-title" id="accModalLabel">채팅방 제목</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
					      </div>
					      <div class="modal-body">
							        <form class="form-group accModal">
							     			채팅 참여자 목록
							        </form>
					      </div>
					    </div>
					  </div>
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
					 var totalCount = result.totalCount;
					 $(".totalCount").append(totalCount);
					 console.log("totalCount : "+totalCount);
					 console.log("list.size : "+list.size);
					 $(".pushList").html("");
					 $.each(list, function(index, vo){
						showList(vo, 0);
					 })
					
					console.log("resultPage : "+resultPage);
					console.log("search : "+search);
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
			 console.log("showList !")
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
				headers : {"Accept" : "application/json","Content-Type" : "application/json"},
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
		 
		 // 동행 채팅 관련 function ================================================
		var chatRoomId;
        var accChatSocket;
        var accChatLayer = $(".accChat.output");
        var myAccChat = $("#myAccChat");
        var chatRoomName;
			 
		  function getChatRoomList() {
    		$.ajax({
        		url : "/chat/json/getChatRoomList/"+userId ,
				type : "GET",
				dataType : "json",
				headers : { "Accept" : "application/json", "Content-Type" : "application/json" },
				success : function(result) {
					console.log("채팅방 조회 성공");
					showRoomList(result);
				},
				error : function(error) {
					console.log("채팅방 조회 실패");
					console.log(error);
				}
			 });
        }
        
        function showRoomList(list) {
        	var html = "";
        	console.log("채팅방 목록 개수 : "+list.length);
        	html += "<h5>동행 채팅 <i class=\"fas fa-comment-alt\"></i></h5><hr>"
        	html += "<table class='roomTable' style='border-spacing: 0 10px;width:100%;'>"
        	for(var i in list) {
        		html += "<tr onclick='enterRoom(\""+list[i].chatRoomId+"\")' style='height:60px;'>";
        		//html += "<input type='hidden' name='chatRoomId' value='"+list[i].chatRoomId+"'>";
        		html += "<td class='td1' style='text-align:left;width:40px;'>";
       			//=\"/resources/images/chatImg/"+list[i].chatImg+"\" 
       			html += "<img style='border: 2px solid #ccc;border-radius: 7px;-moz-border-radius: 7px;-khtml-border-radius: 7px; -webkit-border-radius: 7px;width:35px;height:35px;' src=\"/resources/images/userImages/defaultUserImage.jpg\">"
        		html += "</td>"
        		html += "<td class='td2' style='text-align:left;min-width:150px;'>";
        		html += "<b><font size='3'>"+list[i].chatRoomName +"&ensp;</font></b><font color=gray>"+list[i].chatMems.length+"</font><br/>";
        		html += "<font size=2 color=gray>";
        		try{
	        		if( list[i].lastChat.chatContent.length > 12 ) {
	        			html += list[i].lastChat.chatContent.substring(0, 12)+'..';
	        		} else {
	        			html += list[i].lastChat.chatContent
	        		}
	        		html += "</font>";
	        		html += "</td>";
	        		html += " <td class='td3' style='padding:4;text-align:left;' valign='top'>";
	        		html += "<font size=1 color=gray>"+ list[i].lastChat.sendTime+"</font>";
	        		html += "</td>";
        		}catch(e){
        			console.log(e)
        		}
        		html += "</tr>";
        	}
        	html += "</table>"
        	$(".accLobby").html(html);
        }
        
        
        function enterRoom(roomId) {
        	slideRight();
        	chatRoomId = roomId;
	  		console.log("입장한 채팅방 번호 : "+roomId);
	        var accChatAddr = "ws://192.168.0.82:8080/accSocket/"+roomId+"/"+userId;
	        accChatSocket = new WebSocket(accChatAddr);
	        //웹 소켓이 연결되었을 때 호출되는 이벤트
	        accChatSocket.onopen = function(message){
	              console.log('[accChat] : connection opened. || 방 번호 : '+roomId)
            	  accChatLayer.html("");
	              loadChat(roomId); // 웹소켓 연결 되면 이전 대화 내용 불러옴 
	              loadChatRoomInfo(roomId); // 채팅방 정보 불러옴
	              
	          	  //웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트
		          accChatSocket.onmessage = function(message){
	            	  console.log("메시지 날아옴 :: " + message)
	            	  var data = JSON.parse(message.data)
	            	  data.readers = [ userId ];
	                  receiveAccChat(data);
	                  //readChat(data);
	                  $(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
		        };
	        };
	        //웹 소켓이 닫혔을 때 호출되는 이벤트
	        accChatSocket.onclose = function(message){
	        	accChatLayer.value += "접속이 끊어졌습니다.\n";
	        };
	        //웹 소켓이 에러가 났을 때 호출되는 이벤트
	        accChatSocket.onerror = function(message){
	        	accChatLayer.value += "accChat 에러가 발생했습니다.\n";
	        };
  		}
        
        function receiveAccChat(chat) {
        	var html = "";
            if(chat.senderId == 'system'){
                html += "<div class='chat system'>";
                html += "<font color='white' size=1 class='msg content'>"+chat.chatContent+"</font>";
            } else if(chat.senderId == userId) {
                html += "<div class=\"chat mine container\">"
               	html += "<font size=1 class='msg nickname none'>"+chat.user.nickname+"</font>";
               	html += "<div class='row'><font color='#424242' size=1 class='mine msg sendTime'>"+chat.sendTime+"</font>";
                html += "<div class='bubble mine' style='text-align:right;'>";
              	html += "<font color='black' size=2 class='mine msg content'>"+chat.chatContent+"</font>";
              	html += "</div></div>"
            } else { 
                html += "<div class=\"chat others\" style=\"text-align:left;margin:3px;\">"
                if( $("div.chat font.msg.nickname").last().html() != chat.user.nickname ) {
                	html += "<div class=\"chat info\">";
                } else {
                	html += "<div class=\"chat info none\">";
                }
               	html += "<img  style='border: 2px solid gold;border-radius: 7px;-moz-border-radius: 7px;-khtml-border-radius: 7px; -webkit-border-radius: 7px;width:30px;height:30px;' src=\"/resources/images/userImages/"+chat.user.userImg+"\">";
                html += "<font size=1 class='other msg nickname'>"+chat.user.nickname+"</font><br/>";
                html += "</div>"
                html += "<div class='chat content container' style='margin:7px 0 7px; 2px;'><div class='row'>";
                html += "<div class='bubble other'>";
                html += "<font color='black' size=2 class='other msg content'>"+chat.chatContent +"</font>";
                html += "</div>"
                html += "<font color='#424242' size=1 class='other msg sendTime'>"+chat.sendTime+"</font>";
                html += "</div></div>"
            }
            html += "</div>"
            accChatLayer.append(html);
        }
        
	        function sendAccMessage(quitUser){
	        	 if(quitUser != null ){ 
	        		var chat = new Object();
                	chat.senderId = "system";
                	chat.chatContent = quitUser+"님이 동행에서 탈퇴하셨습니다."
                	chat.chatRoomId = chatRoomId;
                	accChatSocket.send(JSON.stringify({chat}));
                	console.log("탈퇴 메시지 송출 :: ");
                	console.log(chat);
	               	}
	        	
	        	if( myAccChat.val().trim() != "" ) {
	        		console.log("공백 입력 > 전송");
	                var chat = new Object();
	                chat.senderId = userId;
	                chat.chatContent = myAccChat.val();
	                chat.chatRoomId = chatRoomId;
	                accChatSocket.send(JSON.stringify({chat}));
	            	}
	                myAccChat.val('');
	                $(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
	        } 
	        function disconnectAcc(){
	        	accChatSocket.close();
	        }
	        
	        function loadChat(roomNo) {
				 console.log(roomNo +"번 방 채팅메시지 불러오기 시작")
				 $.ajax({
					url: "/chat/json/getChat/"+roomNo ,
				 	type: "GET",
				 	dataType : "json",
					headers : {	"Accept" : "application/json","Content-Type" : "application/json" },
					success : function(result) {
						var list = JSON.stringify({result});
						console.log("getChat() 성공 : "+result.length + " || "+result);
						if( result.length != 0 ) {
							var html = "";
							for(var i in result) {
								receiveAccChat(result[i]);
							}
						} else {
							var chat = new Object();
		                	chat.senderId = "system";
		                	chat.chatContent = "동행채팅이 개설되었습니다.";
		                	chat.chatRoomId = roomNo;
		                	accChatSocket.send(JSON.stringify({chat}));
						}
						$(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
					},
					error: function(error) {
						console.log("getChat() 실패")
						console.log(error);
					}
				 })
			 }
	        
	        function loadChatRoomInfo(roomId) {
	        	$.ajax({
	        		url : "/chat/json/getChatRoom/"+roomId,
	        		type : "GET",
	        		dataType : "json",
	        		headers : { "Accept" : "application/json", "Content-Type" : "application/json" },
	        		success : function(result) {
	        			var userList = result.userList;
	        			chatRoomName = result.chatRoomName;
	        			var html = "<b><font size=3 color=black>"+chatRoomName+"</font></b>";
	        			html += "<font size=3 color=gold>"+userList.length+"</font>";
	        			$(".accChat.info span").html(html);
	        			$("#accModalLabel").html(chatRoomName+"("+userList.length+")");
					    
	        			var tag = ""
	        			for(var i in userList){
	        				tag += "<div style='margin-bottom:20px;text-align:left;'>"
	        				tag += "<img  style='border: 2px solid gold;border-radius: 7px;-moz-border-radius: 7px;-khtml-border-radius: 7px; -webkit-border-radius: 7px;width:30px;height:30px;margin-right:10px;' src=\"/resources/images/userImages/"+userList[i].userImg+"\">";
	        				tag += userList[i].nickname;
	        				if(userId == result.creator && userId != userList[i].userId) {
	        					tag += "<button type='button' class='btn btn-outline-danger' style='float:right;' onclick='quitAcc(\""+userList[i].userId+"\")'>강퇴</button>";
	        				}
	        				tag += "</div>"
	        			}
        				$(".form-group.accModal").html(tag);
	        		},
	        		error : function(error) {
	        			console.log("채팅방 정보 조회 실패 :: "+error);
	        		}
	        	})

	        }
	        
	        function readChat(chat) {
	        	console.log("readChat 시작")
	        	 $.ajax({
					url: "/chat/json/readChat/",
				 	type: "POST",
				 	data : JSON.stringify(chat),
					headers : { "Accept" : "application/json", "Content-Type" : "application/json" },
					success : function() {
						console.log("readChat() 성공");
					},
					error: function(error) {
						console.log("readChat() 실패")
						console.log(error);
					}
				 })
	        	
	        }
	        
	        function quitAcc(quitId) {
	        	console.log("강퇴시킬 user : "+quitId);
	        	Swal.fire({
	        		  title: '정말 강제 퇴장 시키시겠습니까?',
	        		  text: "한 번 퇴장시키시면 채팅방뿐만 아니라 동행에서도 빠지게 됩니다.",
	        		  icon: 'warning',
	        		  showCancelButton: true,
	        		  confirmButtonColor: '#3085d6',
	        		  cancelButtonColor: '#d33',
	        		  confirmButtonText: '예, 강제 퇴장시키겠습니다.',
	        		  cancelButtonText: '아니오!',
	        		}).then((result) => {
	        		  if (result.value) {
	        			  var chatRoom = new Object();
	        			  chatRoom.chatRoomId = chatRoomId;
	        			  chatRoom.chatMems = [ quitId ];
	        			  $.ajax({
	      					url: "/chat/json/quitChatRoom/",
	      				 	type: "POST",
	      				 	data : JSON.stringify(chatRoom),
	      				 	dataType : "text",
	      					headers : { "Accept" : "application/json", "Content-Type" : "application/json" },
	      					success : function(result) {
	      						console.log(result);
	      						console.log("quitChatRoom() 성공 :: "+quitId+" || db에서 가져온 닉네임 : "+result);
	      						sendAccMessage(result);
	      						getChatRoomList();
	      						loadChatRoomInfo(chatRoomId);
			        		    Swal.fire(
			        		      '완료',
			        		      '해당 회원이 동행에서 제외되었습니다.'
			        		    )
	      					},
	      					error: function(error) {
	      						console.log("quitChatRoom() 실패")
	      						console.log(error);
	      					}
	      				 })
	        		  }
	        		})
	        }
	      
        var pos = 0;
        var totalSlides = 2;
        var sliderWidth = 300;
	 	 function slideLeft(){
		    pos--;
		    if(pos==-1){ pos = totalSlides-1; }
		    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
		}
		function slideRight(){
		    pos++;
		    if(pos==totalSlides){ pos = 0; }
		    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
		}
		 
		 
		 
		 
		  jQuery(document).ready(function($) {
			  console.log("현재 로그인한 회원 : "+userId);
			 
			  if(userId != null && userId != '' ) {
			  	setTimeout(() => getPushList(userId), 10);
			  	setTimeout(() => getUnreadCount(userId), 10);
			  	setTimeout(() => getChatRoomList(), 20);
			  }
			  
	            $(".footerBar .fa-bell").click(function() {
	            	// 로그인 했을 때만 실행
	            	if(userId != null && userId != '' ) {
	            		setTimeout(() => readPush(userId), 20);
						setTimeout(() => getUnreadCount(userId), 50);
	            	}
	                $(".chat-layer").removeClass('on');
	                $(".push-layer").toggleClass('on');
	            });
	            
	            $(".footerBar .fa-comment-alt").click(function() {
	            	$(".push-layer").removeClass('on');
	            	$(".chat-layer").toggleClass('on');
	            })
	            
	        	$(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
	        	$("#myAccChat").keydown(function (key) {
	                if(key.keyCode == 13){
	                	sendAccMessage();
	                	myAccChat.val();
	                }
	            });
	        	$(".fas.fa-arrow-left").on("click", function(){
	        		slideLeft();
	        		disconnectAcc();
	        	})
	        	
	        	 $('#slider-wrap ul#slider').width(600);
	        	
	        	$(".roomTable tr").mouseout( function() {
	         		$(this).css({'background-color':"white"});
	         	}).mouseover( function(){
	         		$(this).css({'background-color':'#ccc'});
	         	});
	        	
	        	
	        });



		
	</script>  
		<style>
		/* *{margin:0; padding:0; list-style:none;} */
        .footerBar {
        	position: fixed;
        	right: 50px;
        	bottom: 50px;
        	text-align: right;
        }
       
        .push-layer, .chat-layer {
       		background-color: white;
            opacity: 0;
            transition: all 0.3s;
            position: absolute;
            bottom: -600px;
			border: 1px solid gray;
			border-radius: 10px;
			margin-bottom:20px;
			
		}
		
		.push-layer {
			right: 50px;
			z-index: -10;
		}
		.chat-layer{
			right: 10px;
			z-index: -9;
		}
		
		.chat-layer.on, .push-layer.on {
            opacity: 1;
            bottom: 40px;
        }
        
        
        
        #wrapper{
		    width:300px;
		    height:500px;
		    position:relative;
		    color:#fff;
		}
		
		#slider-wrap{
		    width:300px;
		    height:500px;
		    overflow:hidden;
		}
		
		#slider-wrap ul#slider{
		    width:100%;
		    height:100%;
		    position:absolute;
		    margin:0; padding:0; list-style:none;
		}
		
		#slider-wrap ul#slider li{
		    float:left;
		    position:relative;
		    width:300px;
		    height:500px;   
		}
		
		#slider-wrap ul#slider li > div{
		    position:absolute;
		    top: 0px;
		    left:0px;  
		}
		
		#slider-wrap.active #next{right:0px;}
		#slider-wrap.active #previous{left:0px;}
        
        #slider-wrap ul, #pagination-wrap ul li{
		    -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
		    -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
		    -o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
		    -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
		    transition: all 0.3s cubic-bezier(1,.01,.32,1); 
		}
        
		

	</style>