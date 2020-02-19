<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<title>getPlan</title>
	
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
	
	<!-- fontawesome CDN -->
	<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script> -->
	<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script> -->
	


	<!-- FullCalendar CDN -->
	<link href='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.css' rel='stylesheet' />
  	<link href='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.css' rel='stylesheet' />
  	<link href='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.css' rel='stylesheet' />
	<link href='https://unpkg.com/@fullcalendar/list@4.3.0/main.min.css' rel='stylesheet' />
	
	<script src='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/interaction@4.3.0/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/list@4.3.0/main.min.js'></script>
	
	
	<!-- jquery Ui 링크 (datePicker)  -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!--datePicker CDN  -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	
	<!-- boot strap File upload CDN  -->
	<script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.js"></script>
	
	<style>
		#click {
			position: fixed;
			right: 20px;
			top : 5px;
			border-radius: 50%;
			background-color:#81e0fc;
			box-sizing: border-box;
			width: 50px;
			height: 50px;
			text-align:center;
			line-height:60px;
		}
         #planChat {
            height: 90%;
            width: 300px;
            transition: all 0.5s;
            color: #333;
            font-size: 10px;
            position: fixed;
            right: -350px;
            z-index: 999;
            bottom: 20px;
            border: 1px solid #ccc;
            background-color: #E2F4F3;
        }
        #planChat.on {
        	right: 10px;
        }

        .planChat.output {
            height: 95%;
            background-color: white;
            overflow:auto;
        }

        .planChat.input {
            height: 40px;
            bottom: 0px;
            background-color: #C5ECE9;
        }
     </style>
	
</head>

<body>

	<%-- <jsp:include page="/toolbar/toolBar.jsp" /> --%>
	<div id="click" >
		<i class="fas fa-comment-dots  fa-flip-horizontal fa-2x" style="color:white;"></i>
	</div>

			       <div id="planChat">
	      				   <div class="planChat output" style="padding:5px">
	     				   </div>
        				   <div class="planChat input" style="padding:5px">
								 <div class="input-group">
								      <input type="text" class="form-control form-control-sm" id="myChat" placeholder="메시지를 입력하세요">
								      <span class="input-group-btn">
								        	<button class="btn btn-default btn-sm" type="button"><i class="fab fa-telegram-plane"></i></button>
								      </span>
								 </div>
        				</div>
   				  </div>
    <script type="text/javascript">
    	var userId = '${user.userId}';
        var planChatSocket;
        var planChatLayer = $(".planChat.output");
        var myChat = $("#myChat");

        
        function connectPlanChat() {
            var addr = "ws://localhost:8080/planSocket/5000/" + userId;
            planChatSocket = new WebSocket(addr);
            
            planChatSocket.onopen = function(message) {
            	console.log("접속했다."+addr)

            	planChatSocket.onmessage = function(message) {
                	var json = JSON.parse(message.data);
                	if( Array.isArray(json) ) {
                		checkOnlineMembers(json);
                	} else {
	                    receivePlanChat(json);
                	}
                    $(".planChat.output").scrollTop($(".planChat.output")[0].scrollHeight);
                };

            };
            planChatSocket.onclose = function(message) {
                console.log("접속이 끊어졌습니다.")
            };
            planChatSocket.onerror = function(message) {
                console.log("에러가 발생했습니다.")
            };

        }
        
        function receivePlanChat(chat) {
        	var html = "";
            if(chat.senderId == 'system'){
                html += "<div style=\"text-align:center;margin: 20px;background-color:#D8D8D8;border-radius:10px;\">";
                html += "<font color='#424242' size=2>"+chat.chatContent+"</font>";
                html += "</div>"
            } else if(chat.senderId == userId) {
                html += "<div style=\"text-align:right;margin:10px;\">"
                html += "<font color='#cccccc' size=1>"+chat.sendTime+"&ensp;</font>";
                html += "<div style='display: inline-block;background-color:#C5ECE9;height:auto;min-height:25px;vertical-align:middle;border-radius:10px;padding:2px'>";
                html += "<font color='black' size=2>&ensp;"+chat.chatContent+"&ensp;</font>";
                html += "</div>"
              	html += "</div>"
            } else { 
                html += "<div style=\"text-align:left;margin:10px;\">"
                html += "<div style='text-align:center;display: inline-block;vertical-align: center;'>";
                html += chat.senderId+"<br/>";
               	html += "<img  style='border: 2px solid #C5ECE9;width:30px;height:30px;margin:2px;' class='rounded-circle' src=\"/resources/images/userImages/"+chat.user.userImg+"\">";
               	html += "</div>"
               	html += "<div style='display: inline-block;background-color:#F2F2F2;height:auto;min-height:25px;vertical-align:middle;border-radius:10px;padding:2px'>";
                html += "<font color='black' size=2>&ensp;"+chat.chatContent+"&ensp;</font>";
                html += "</div>"
                html += "<font color='#cccccc' size=1> "+chat.sendTime+"</font>";
                html += "</div>"
            }
            planChatLayer.append(html);
        }
        
        function checkOnlineMembers(data) {
        	// 온라인 멤버들 표시해주기
        	for( var i in data) {
        		$("#img_"+data[i].userId).addClass("on");
        	}
        }
       
        function sendMessage() {
        	if( myChat.val().trim() != "" ) {
            var chat = new Object();
            chat.senderId = userId;
            chat.chatContent = myChat.val();
                        
            planChatSocket.send(JSON.stringify({chat}));
        	}
            myChat.val('');
            $(".planChat.output").scrollTop($(".planChat.output")[0].scrollHeight);
        }
        
        jQuery(document).ready(function($) {

        	connectPlanChat();
        	$("#myChat").keydown(function (key) {
                if(key.keyCode == 13){
                	sendMessage();
                	myChat.val();
                }
            });
        	$("#click").on("mouseover", function() {
        		$("#click").css({"background-color":"#2ECCFA"});
        	}).on("mouseout", function() {
        		$("#click").css({"background-color":"#81e0fc"});
        	});
        	
        	$(".fa-comment-dots").on("click", function() {
        		$("#planChat").toggleClass('on');
        	});
        	
        	
        });
        

    </script>
     


</body>
</html>