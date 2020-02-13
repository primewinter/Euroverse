<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- 부트스트랩 4.4 쓰려다가 빠꾸...............................했다가 다시 4.4로..  -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	
	
	<!-- Use Swiper from CDN -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	
	
	<!-- FontAwesome CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
           .wrapper {
            display: grid;
            grid-template-columns: repeat(5, 250px);
            grid-gap: 10px;
            grid-auto-rows: minmax(100px, auto);
            margin: 20px;
        }

        .one {
            grid-column: 2 / 4;
            grid-row: 1;
            text-align:center;
        }

        .two {
            grid-column: 2 / 4;
            grid-row: 2 ;
            background-color: powderblue;
        }
        

		body {
            padding-top : 90px;
            font-family:  'Noto Sans KR', sans-serif;
        }
         #accChat {
            height: 90%;
            width: 20%;
            color: #555;
            font-size: 12px;
            position: fixed;
            right: 20px;
            z-index: 999;
            top: 20px;
            bottom: 20px;
            -webkit-box-shadow: 0 1px 2px 0 #777;
            box-shadow: 0 1px 2px 0 #777;
            background-color: cornsilk;
        }

        .accChat.output {
            float: inherit;
            margin-top: 20%;
            height: 70%;
            background-color: white;
            overflow:auto;
        }

        .accChat.input {
            float: inherit;
            margin-top: 20px;
            margin-bottom: 20px;
            height: auto%;
            background-color: cornsilk;
        }
        
        .accLobby {
            margin-top: 5%;
            width: 30%;
        }
        .accRoom {
            margin-bottom: 5px;
        }

     </style>
	
</head>

<body>

	<jsp:include page="/toolbar/toolBar.jsp" />
				
				<!-- 채팅목록 -->
				<div class="accLobby container">
       			</div>

				<!-- 채팅창 -->
 				<div id="accChat">
      				   <div class="accChat output" style="padding:5px">
     				   </div>
       				   <div class="accChat input" style="padding:5px">
								 <div class="input-group">
								      <input type="text" class="form-control" id="myAccChat" placeholder="메시지를 입력하세요">
								      <span class="input-group-btn">
								        	<button class="btn btn-default" type="button" onclick="sendAccMessage()"><i class="fab fa-telegram-plane"></i></button>
								      </span>
								 </div>
        				</div>
   				  </div>
    <script type="text/javascript">
    	var userId = '${user.userId}';
    	var chatRoomId;
        var accChatSocket;
        var accChatLayer = $(".accChat.output");
        var myAccChat = $("#myAccChat");

        
        function getChatRoomList() {
    		$.ajax({
        		url : "/chat/json/getChatRoomList/"+userId ,
				type : "GET",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
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
        	for(var i in list) {
        		html += "<div class=\"accRoom row\" onclick='enterRoom(\""+list[i].chatRoomId+"\")'>";
        		html += "<input type='hidden' name='chatRoomId' value='"+list[i].chatRoomId+"'>";
        		html += "<div class='col-3' style='background-color: antiquewhite'>";
        		html += "</div>"
        		html += "<div class='col-7'>";
        		html += list[i].chatRoomName +"&ensp;"+list[i].chatMems.length+"<br/>";
        		html += list[i].chatMems;
        		html += "</div>";
        		html += " <div class='col-2' style='background-color: antiquewhite'>";
        		html += "시간";
        		html += "</div>";
        		html += "</div>";
        	}
        	$(".accLobby").html(html);
        }
        
        
        function enterRoom(roomId) {
        	chatRoomId = roomId;
	  		console.log("입장한 채팅방 번호 : "+roomId);
	        var accChatAddr = "ws://localhost:8080/accSocket/"+roomId+"/"+userId;
	        accChatSocket = new WebSocket(accChatAddr);
	        //웹 소켓이 연결되었을 때 호출되는 이벤트
	        accChatSocket.onopen = function(message){
	              console.log('[accChat] : connection opened. || 방 번호 : '+roomId)
            	  accChatLayer.html("");
	              getChat(roomId);
	          	  //웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트
		          accChatSocket.onmessage = function(message){
	            	  console.log("accChat 왔다 ::: "+message.data);
	            	  var data = JSON.parse(message.data)
	            	  data.readers = [ userId ];
	                  receiveAccChat(data);
	                  readChat(data);
	            	  console.log(data);
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
            console.log("받은 메시지 : "+chat);
        	var html = "";
            if(chat.senderId == 'system'){
                html += "<div class=\"card-body\" style=\"text-align:center;margin: 10px;border:1px solid gray;border-radius:10px;\">";
                html += "<font color='black' size=2>"+chat.chatContent+"</font>";
            } else if(chat.senderId == userId) {
                html += "<div class=\"card-body\" style=\"text-align:right;\">"
                html += "<font color='#cccccc' size=1>"+chat.sendTime+"&ensp;</font>";
              	html += "<font color='black' size=2>"+chat.chatContent+"</font>";
            } else { 
                html += "<div class=\"card-body\" style=\"text-align:left;\">"
                html += chat.senderId+"<br/>";
                /*html += "<img class=\"imgFile\" src=\"/resources/images/userImages/"+chat.user.userImg+"\">";*/
                html += "<font color='black' size=2>"+chat.chatContent+"&ensp;</font>";
                html += "<font color='#cccccc' size=1> "+chat.sendTime+"</font>";
            }
            html += "</div>"
            
            accChatLayer.append(html);
            
        }
        
        
	        //Send 버튼을 누르면 실행되는 함수
	        function sendAccMessage(){
	        	if( myAccChat.val().trim() != "" ) {
	                var chat = new Object();
	                chat.senderId = userId;
	                chat.chatContent = myAccChat.val();
	                chat.chatRoomId = chatRoomId;
	                            
	                accChatSocket.send(JSON.stringify({chat}));
	            	}
	                myAccChat.val('');
	                $(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
	        } 
	        //웹소켓 종료
	        function disconnectAcc(){
	        	accChatSocket.close();
	        }
	        
	        function getChat(roomNo) {
				 console.log(roomNo +"번 방 채팅메시지 불러오기 시작")
				 $.ajax({
					url: "/chat/json/getChat/"+roomNo ,
				 	type: "GET",
				 	dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(result) {
						console.log("getChat() 성공");
						console.log(result);
						var list = JSON.stringify({result});
						var html = "";
						for(var i in result) {
							receiveAccChat(result[i]);
							/* html += "<br/>"+result[i].senderId+" : "+result[i].chatContent +" (보낸 시간 : "+result[i].chatDate+") ";
							console.log( result[i].senderId+" : "+result[i].chatContent +" (보낸 시간 : "+result[i].chatDate+")"); */
						}
						$(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
						//$(".planChat.output").append(html);
						
					},
					error: function(error) {
						console.log("getChat() 실패")
						console.log(error);
					}
				 })
			 }
	        
	        function readChat(chat) {
	        	console.log("readChat 시작")
	        	 $.ajax({
					url: "/chat/json/readChat/",
				 	type: "POST",
				 	data : JSON.stringify(chat),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function() {
						console.log("readChat() 성공");
						console.log(result);
					},
					error: function(error) {
						console.log("readChat() 실패")
						console.log(error);
					}
				 })
	        	
	        }
	        
	        
	        
	        
        

	        
	        jQuery(document).ready(function($) {
	        	//connectPlanChat();
	        	$(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
	        	getChatRoomList();
	        	$("#myAccChat").keydown(function (key) {
	                if(key.keyCode == 13){
	                	sendAccMessage();
	                	myAccChat.val();
	                }
	            });
	        });
    </script>

</body>
</html>