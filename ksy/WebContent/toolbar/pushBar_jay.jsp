<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 <div class="footerBar">
 		<div class="pushToast">
 		</div>
 		<div class="bottom-bar push-layer" >
				    <div class="deletePush" >
						    <span class = "totalCount" style="float:center;">�� �ҽ� �˸�</span>
						    <a href='javascript:deletePush()'><i class="far fa-trash-alt" style="float:right;"></i></a><hr>
						    	<div class="pushList" style="overflow-y:auto; width:300px; height:350px;"></div>
				    </div>
				    <script type="text/javascript">
				        var pushAddr = "ws://192.168.0.82:8080/userSocket/";
				        var webSocket;
				        var userId = '${user.userId}';
				        
				        if( userId != null && userId != '' ) { // �α��� ���� ���� ������ ����
					        	pushAddr += userId;
					        	webSocket = new WebSocket(pushAddr);
					        	
						        //�� ������ ����Ǿ��� �� ȣ��Ǵ� �̺�Ʈ
						        webSocket.onopen = function(message){
						              console.log('[push] : connection opened.')
						          	  //�� ���Ͽ��� �޽����� ���� ���� �� ȣ��Ǵ� �̺�Ʈ
							          webSocket.onmessage = function(message){
						            	  console.log("push �Դ� ::: "+message.data)
						            	  var obj = JSON.parse(message.data);
						            	  var pushType = obj.pushType;
						            	  console.log("pushType :: "+pushType);
						            	  if(pushType=='P') {
						            		  var pushMsg = obj.pushMsg+" ���� �����̳���?";
						            		  console.log(pushMsg);
						            		  console.log(obj.refId)
						            		  /* var html = '<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">';
						            		  html += '<div class="toast-header">';
						            		  html += '!';
						            		  //<img src="..." class="rounded mr-2" alt="...">
						            		  html += '<strong class="mr-auto">Bootstrap</strong>';
						            		  html += '<small>'+obj.pushTime+'</small>';
						            		  html += '<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">';
						            		  html += '<span aria-hidden="true">����?</span>';
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
					        
						        //�� ������ ������ �� ȣ��Ǵ� �̺�Ʈ
						        webSocket.onclose = function(message){
						            console.log("push ������ ���������ϴ�.\n");
						        };
						        //�� ������ ������ ���� �� ȣ��Ǵ� �̺�Ʈ
						        webSocket.onerror = function(message){
						            console.log("push ������ �߻��߽��ϴ�.\n");
						        };
				        }
				        //������ ����
				        function disconnect(){
				            webSocket.close();
				        }
				        
				        function sendPush(receiverId, pushType) {
				        	var push = new Object();
				        	console.log("[sendPush] receiverId : "+receiverId+" || pushType : "+pushType);
							push.receiverId = receiverId;
							push.pushType = pushType;
						  	webSocket.send(JSON.stringify({push}));
							console.log("push ������ ::"+JSON.stringify({push}));
				        }
				    </script>
 		</div>
 		<div class="bottom-bar chat-layer" id="slider-wrap" >
		          <ul id="slider">
			           <li data-color="#1abc9c" style="overflow-y:auto;">
				 				<!-- ä�ø�� -->
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
													      <input type="text" class="form-control" id="myAccChat" placeholder="�޽����� �Է��ϼ���">
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
					 console.log("�˸� ���� ��� ����");
					 console.log(error.responseText);
					 console.log(status);
				 }
			 })
		 }
		 
		 // <���ѽ�ũ�� ----------------------------------------------------------------------------
		var pushPage = 2;
	    var end = false;
	    
	    // ��ũ�� ����
	    $(".pushList").scroll(function(){
	    	var scrollTop = $(this).scrollTop(); // ���� ��ũ���� ��ġ
	    	var innerHeight = $(this).innerHeight(); // �е����� ������ ���� .pushList ������ ����
	    	var scrollHeight = $(this).prop('scrollHeight'); // ��ũ�� ��Ű�� �ʾ��� ���� ��ü ����
	    	//console.log("ScrollTop : "+scrollTop+"|| innerHeight : "+innerHeight+"|| scrollHeight : "+scrollHeight);
	    	if( scrollTop + innerHeight >= scrollHeight ) { // scrollTop() �� innerHeight() ���� ���� ���� scrollHeight() ���� ���ų� ũ�� �Ǹ� �� �Ʒ� ���� ����
	    		console.log("��ũ�� ���ϴܿ� ��ġ")
				scrollList();
	    	}
	    })
	    
		 // ��ũ�� ���ϴܿ� ��ġ �� �۵��� function(���ѽ�ũ��) : ����Ʈ ȣ��
		 function scrollList() {
			 if(end == true){  //�� �̻� �ҷ��� data�� ���� ��� return
				 console.log("if(end == true) ����")
				 return;
			 }
			console.log("scrollList ����")
			 
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
					console.log("�޾ƿ� data�� ���� : "+length);
					console.log("currentPage : "+pushPage)
				
					if( length < 5 ){
						isEnd = true;
						console.log("���� �����Ͱ� 5�� �̸��̹Ƿ� isEnd = true;")
					}
					
					 $.each(list, function(index, vo){
						showList(vo);
					})
					
					pushPage++;
				},
				error : function(error){
					console.log("fetchList ����");
					console.log(error);
				}
			 })
		 }
		 
		 // ����Ʈ ȣ�� �� �۵��� function : ����Ʈ ȭ�鿡 ���
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
			 		tag += "<a href='/myPage' >"; // �ʴ� ��� ����Ʈ ��ũ
			 	} else if (vo.pushType.trim() == 'A') {
			 		tag += "<img src='/resources/images/icon/push_acc.png'>";
			 		tag += "</td>";
			 		tag += "<td style='text-align:left;margin-left:10'>"
	 				tag += "<font size='2'  font color='black'>"
			 		tag += "<a href='/myPage/' >" // ���� ��û ��� ����Ʈ ��ũ
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
		 
		// ----------------------------------------------------------------------------------------- ���ѽ�ũ��>
		
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
					 console.log("�� ���� �˸� ���� ��� ���� : "+result+"��")
					 var h = "<font color='red'>"+result+"</font>";
					 $(".unreadCount").html(h);
				 },
				 error : function(error) {
					 console.log("�� ���� �˸� ���� ��� ����");
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
					 console.log("�˸� �б� ����")
				 },
				 error : function(error) {
					 console.log("�˸� �б� ����");
					 console.log(error);
				 }
			 })
		 }
		 
		 function deletePush() {
			 console.log("���� ����")
			 
			// �迭 ����
			 var arrayParam = new Array();
			 //each�� loop�� ���鼭 checkbox�� check�� ���� ������ ����ش�.
			 $("input:checkbox[name='chk']:checked").each(function(){
			 	arrayParam.push($(this).val());
			 });
			 console.log("�迭!!! \n");
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
					console.log("�˸� ���� ����");
					getPushList(userId);
				},
				error : function(error) {
					console.log("�˸� ���� ����");
					console.log(error);
				}
			 })
			 
		 }
		 
		 
		 // ���� ä�� ���� function ================================================
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
        	html += "<h5>���� ä�� <i class=\"fas fa-comment-alt\"></i></h5><hr>"
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
	  		console.log("������ ä�ù� ��ȣ : "+roomId);
	        var accChatAddr = "ws://192.168.0.82:8080/accSocket/"+roomId+"/"+userId;
	        accChatSocket = new WebSocket(accChatAddr);
	        //�� ������ ����Ǿ��� �� ȣ��Ǵ� �̺�Ʈ
	        accChatSocket.onopen = function(message){
	              console.log('[accChat] : connection opened. || �� ��ȣ : '+roomId)
	              
            	  accChatLayer.html("");
	              
	              loadChat(roomId); // ������ ���� �Ǹ� ���� ��ȭ ���� �ҷ��� 
	              loadChatRoomInfo(roomId); // ä�ù� ���� �ҷ���
	              
	          	  //�� ���Ͽ��� �޽����� ������� �� ȣ��Ǵ� �̺�Ʈ
		          accChatSocket.onmessage = function(message){
	            	  console.log("�޽��� ���ƿ� :: " + message)
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
                	chat.chatContent = quitUser+"���� ���࿡�� Ż���ϼ̽��ϴ�."
                	chat.chatRoomId = chatRoomId;
                	accChatSocket.send(JSON.stringify({chat}));
                	console.log("Ż�� �޽��� ���� :: ");
                	console.log(chat);
	               	}
	        	
	        	if( myAccChat.val().trim() != "" ) {
	        		console.log("���� �Է� > ����");
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
				 console.log(roomNo +"�� �� ä�ø޽��� �ҷ����� ����")
				 $.ajax({
					url: "/chat/json/getChat/"+roomNo ,
				 	type: "GET",
				 	dataType : "json",
					headers : {	"Accept" : "application/json","Content-Type" : "application/json" },
					success : function(result) {
						var list = JSON.stringify({result});
						console.log("getChat() ���� : "+result.length + " || "+result);
						if( result.length != 0 ) {
							var html = "";
							for(var i in result) {
								receiveAccChat(result[i]);
							}
						} else {
							var chat = new Object();
		                	chat.senderId = "system";
		                	chat.chatContent = "����ä���� �����Ǿ����ϴ�.";
		                	chat.chatRoomId = roomNo;
		                	accChatSocket.send(JSON.stringify({chat}));
						}
						$(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
					},
					error: function(error) {
						console.log("getChat() ����")
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
	      				 	dataType : "text",
	      					headers : { "Accept" : "application/json", "Content-Type" : "application/json" },
	      					success : function(result) {
	      						console.log(result);
	      						console.log("quitChatRoom() ���� :: "+quitId+" || db���� ������ �г��� : "+result);
	      						sendAccMessage(result);
	      						getChatRoomList();
	      						loadChatRoomInfo(chatRoomId);
	      						
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
			  console.log("���� �α����� ȸ�� : "+userId);
			 
			  if(userId != null && userId != '' ) {
			  	setTimeout(() => getPushList(userId), 10);
			  	setTimeout(() => getUnreadCount(userId), 10);
			  	setTimeout(() => getChatRoomList(), 20);
			  }
			  
	            $(".footerBar .fa-bell").click(function() {
	            	// �α��� ���� ���� ����
	            	if(userId != null && userId != '' ) {
	            		readPush(userId);
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