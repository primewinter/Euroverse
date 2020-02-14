<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- ��Ʈ��Ʈ�� 4.4 �����ٰ� ����...............................�ߴٰ� �ٽ� 4.4��..  -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- sweetalert2 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
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
            background-color: antiquewhite;
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
            background-color: antiquewhite;
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
				
				<!-- ä�ø�� -->
				<div class="accLobby container" >
       			</div>

				<!-- ä��â -->
 				<div id="accChat">
 						<div class="accChat info" style="padding:5px;margin-top:10%;">
 							<p><i class="fas fa-arrow-left fa-2x"></i></p>
 							<span style="float:left;"></span>
 							<p style="text-align:right;"><i class="fas fa-bars fa-2x" data-toggle="modal" data-target="#accModal"></i></p>
 						</div>
      				   <div class="accChat output" style="padding:5px">
     				   </div>
       				   <div class="accChat input" style="padding:5px">
								 <div class="input-group">
								      <input type="text" class="form-control" id="myAccChat" placeholder="�޽����� �Է��ϼ���">
								      <span class="input-group-btn">
								        	<button class="btn btn-default" type="button" onclick="sendAccMessage()"><i class="fab fa-telegram-plane"></i></button>
								      </span>
								 </div>
        				</div>
   				  </div>
   				  
   			<div class="modal fade" id="accModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
						        <h5 class="modal-title" id="accModalLabel">ä�ù� ����</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
				      </div>
				      <div class="modal-body">
						        <form class="form-group accModal">
						     			ä�� ������ ���
						        </form>
				      </div>
				    </div>
				  </div>
			</div>
    <script type="text/javascript">
    	var userId = '${user.userId}';
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
					console.log("ä�ù� ��ȸ ����");
					showRoomList(result);
				},
				error : function(error) {
					console.log("ä�ù� ��ȸ ����");
					console.log(error);
				}
			 });
        }
        
        function showRoomList(list) {
        	var html = "";
        	console.log("ä�ù� ��� ���� : "+list.length);
        	for(var i in list) {
        		html += "<div class=\"accRoom row\" style='margin-bottom:20px;' onclick='enterRoom(\""+list[i].chatRoomId+"\")'>";
        		//html += "<input type='hidden' name='chatRoomId' value='"+list[i].chatRoomId+"'>";
        		html += "<div class='col-2' style='background-color: antiquewhite'>";
        		html += "</div>"
        		html += "<div class='col-8'>";
        		html += "<b>"+list[i].chatRoomName +"&ensp;</b><font color=gray>"+list[i].chatMems.length+"</font><br/>";
        		html += "<font size=2 color=gray>"+ list[i].lastChat.chatContent+"</font>";
        		html += "</div>";
        		html += " <div class='col-2' style='padding:0;text-align:right;'>";
        		html += "<font size=1 color=gray>"+ list[i].lastChat.sendTime+"</font>";
        		html += "</div>";
        		html += "</div>";
        	}
        	$(".accLobby").html(html);
        }
        
        
        function enterRoom(roomId) {
        	$("#accChat").show();
        	chatRoomId = roomId;
	  		console.log("������ ä�ù� ��ȣ : "+roomId);
	        var accChatAddr = "ws://192.168.0.82:8080/accSocket/"+roomId+"/"+userId;
	        accChatSocket = new WebSocket(accChatAddr);
	        //�� ������ ����Ǿ��� �� ȣ��Ǵ� �̺�Ʈ
	        accChatSocket.onopen = function(message){
	              console.log('[accChat] : connection opened. || �� ��ȣ : '+roomId)
            	  accChatLayer.html("");
	              
	              getChat(roomId); // ������ ���� �Ǹ� ���� ��ȭ ���� �ҷ��� 
	              getChatRoom(roomId); // ä�ù� ���� �ҷ���
	              
	          	  //�� ���Ͽ��� �޽����� ������� �� ȣ��Ǵ� �̺�Ʈ
		          accChatSocket.onmessage = function(message){
	            	  var data = JSON.parse(message.data)
	            	  data.readers = [ userId ];
	                  receiveAccChat(data);
	                  //readChat(data);
	                  $(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
	                    
		        };
	            
	        };
  
	        //�� ������ ������ �� ȣ��Ǵ� �̺�Ʈ
	        accChatSocket.onclose = function(message){
	        	accChatLayer.value += "������ ���������ϴ�.\n";
	        };
	        //�� ������ ������ ���� �� ȣ��Ǵ� �̺�Ʈ
	        accChatSocket.onerror = function(message){
	        	accChatLayer.value += "accChat ������ �߻��߽��ϴ�.\n";
	        };
  		}
        
        
        function receiveAccChat(chat) {
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
                html += chat.user.nickname+"<br/>";
                html += "<img  style='border: 2px solid gold;border-radius: 7px;-moz-border-radius: 7px;-khtml-border-radius: 7px; -webkit-border-radius: 7px;width:30px;height:30px;' src=\"/resources/images/userImages/"+chat.user.userImg+"\">";
                html += "<font color='black' size=2>&ensp;"+chat.chatContent+"&ensp;</font>";
                html += "<font color='#cccccc' size=1> "+chat.sendTime+"</font>";
            }
            html += "</div>"
            
            accChatLayer.append(html);
            
        }
        
        
	        //Send ��ư�� ������ ����Ǵ� �Լ�
	        function sendAccMessage(quitUser){
	        	 if(quitUser != null ){ 
	        		var chat = new Object();
                	chat.senderId = "system";
                	chat.chatContent = quitUser+"���� ���࿡�� Ż���ϼ̽��ϴ�."
                	chat.chatRoomId = chatRoomId;
                	accChatSocket.send(JSON.stringify({chat}));
                	console.log("Ż�� �޽��� ���� :: ");
                	console.log(chat);
	               	}
	        	
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
	        //������ ����
	        function disconnectAcc(){
	        	accChatSocket.close();
	        }
	        
	        function getChat(roomNo) {
				 console.log(roomNo +"�� �� ä�ø޽��� �ҷ����� ����")
				 $.ajax({
					url: "/chat/json/getChat/"+roomNo ,
				 	type: "GET",
				 	dataType : "json",
					headers : {	"Accept" : "application/json","Content-Type" : "application/json" },
					success : function(result) {
						console.log("getChat() ����");
						var list = JSON.stringify({result});
						var html = "";
						for(var i in result) {
							receiveAccChat(result[i]);
						}
						$(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
					},
					error: function(error) {
						console.log("getChat() ����")
						console.log(error);
					}
				 })
			 }
	        
	        function getChatRoom(roomId) {
	        	$.ajax({
	        		url : "/chat/json/getChatRoom/"+roomId,
	        		type : "GET",
	        		dataType : "json",
	        		headers : { "Accept" : "application/json", "Content-Type" : "application/json" },
	        		success : function(result) {
	        			var userList = result.userList;
	        			chatRoomName = result.chatRoomName;
	        			var html = "<b><font size=3>"+chatRoomName+"</font></b>";
	        			html += "<font size=3 color=chocolate>"+userList.length+"</font>";
	        			$(".accChat.info span").html(html);
	        			$("#accModalLabel").html(chatRoomName+"("+userList.length+")");
					    
	        			var tag = ""
	        			for(var i in userList){
	        				tag += "<div style='margin-bottom:20px;'>"
	        				tag += "<img  style='border: 2px solid gold;border-radius: 7px;-moz-border-radius: 7px;-khtml-border-radius: 7px; -webkit-border-radius: 7px;width:30px;height:30px;margin-right:10px;' src=\"/resources/images/userImages/"+userList[i].userImg+"\">";
	        				tag += userList[i].nickname;
	        				if(userId == result.creator && userId != userList[i].userId) {
	        					tag += "<button type='button' class='btn btn-outline-danger' style='float:right;' onclick='quitAcc(\""+userList[i].userId+"\")'>����</button>";
	        				}
	        				tag += "</div>"
	        			}
        				$(".form-group.accModal").html(tag);
	        		},
	        		error : function(error) {
	        			console.log("ä�ù� ���� ��ȸ ���� :: "+error);
	        		}
	        	})

	        }
	        
	        function readChat(chat) {
	        	console.log("readChat ����")
	        	 $.ajax({
					url: "/chat/json/readChat/",
				 	type: "POST",
				 	data : JSON.stringify(chat),
					headers : { "Accept" : "application/json", "Content-Type" : "application/json" },
					success : function() {
						console.log("readChat() ����");
					},
					error: function(error) {
						console.log("readChat() ����")
						console.log(error);
					}
				 })
	        	
	        }
	        
	        function quitAcc(quitId) {
	        	console.log("�����ų user : "+quitId);
	        	
	        	Swal.fire({
	        		  title: '���� ���� ���� ��Ű�ðڽ��ϱ�?',
	        		  text: "�� �� �����Ű�ø� ä�ù�Ӹ� �ƴ϶� ���࿡���� ������ �˴ϴ�.",
	        		  icon: 'warning',
	        		  showCancelButton: true,
	        		  confirmButtonColor: '#3085d6',
	        		  cancelButtonColor: '#d33',
	        		  confirmButtonText: '��, ���� �����Ű�ڽ��ϴ�.',
	        		  cancelButtonText: '�ƴϿ�!',
	        		}).then((result) => {
	        		  if (result.value) {
	        			  var chatRoom = new Object();
	        			  chatRoom.chatRoomId = chatRoomId;
	        			  chatRoom.chatMems = [ quitId ];
	        			  $.ajax({
	      					url: "/chat/json/quitChatRoom/",
	      				 	type: "POST",
	      				 	data : JSON.stringify(chatRoom),
	      					headers : { "Accept" : "application/json", "Content-Type" : "application/json" },
	      					success : function() {
	      						console.log("quitChatRoom() ���� :: "+quitId);
	      						sendAccMessage(quitId);
	      						enterRoom(chatRoomId);
	      						getChatRoomList();
	      					},
	      					error: function(error) {
	      						console.log("quitChatRoom() ����")
	      						console.log(error);
	      					}
	      				 })
	        		    Swal.fire(
	        		      '�Ϸ�',
	        		      '�ش� ȸ���� ���࿡�� ���ܵǾ����ϴ�.'
	        		    )
	        		  }
	        		})
	        	
	        }
	        
	        
	        
	        
        

	        
	        jQuery(document).ready(function($) {
	        	//connectPlanChat();
	        	$("#accChat").hide();
	        	$(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
	        	getChatRoomList();
	        	$("#myAccChat").keydown(function (key) {
	                if(key.keyCode == 13){
	                	sendAccMessage();
	                	myAccChat.val();
	                }
	            });
	        	$(".fas.fa-arrow-left").on("click", function(){
	        		$("#accChat").hide();
	        	})
	        });
    </script>

</body>
</html>