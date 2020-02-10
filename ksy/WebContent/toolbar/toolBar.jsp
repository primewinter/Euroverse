<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
    <div class="footerBar">
 		<div class="pushToast">
 		������<i class="far fa-trash-alt"></i>
 		</div>
 		<div class="footerBar-content">
 			 
				    <!-- ��� �޽��� �����ִ� â -->
				     <div class="deletePush">
				    �� �ҽ� �˸�
				    <a href='javascript:deletePush()'><i class="far fa-trash-alt"></i></a><hr>
				    	<div class="pushList" style="overflow-y:auto; width:300px; height:350px;">
				    	</div>
				    </div>
				    <br />
				    
				    <script type="text/javascript">
				        var pushAddr = "ws://192.168.0.82:8080/websocket/";
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
 		<i class="fas fa-bell fa-2x"></i>
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
					 tag += "<a href='javascript:deletePush()'><i class=\"far fa-trash-alt\"></i></a><hr>";
					 for(var i = 0 in list) {
						tag += "<table width=95%>"
					 	tag += "<tr>"
					 	tag += "<td style='margin:auto;text-align:center' width='20%'>"
						tag += "<input type='checkbox'  class='custom-control-input' name='chk' id='"+list[i].pushId+"' value='"+list[i].pushId+"'>"; // style='display:none;'
					 	/* tag += "<a href='/board/getBoard?boardNo="+list[i].refId+"'>";
					 	tag += list[i].pushMsg+"</a><br>"; */
					 	if(list[i].pushType.trim()=='R') {
					 		tag += "<img src='/images/icon/push_reply9.png'>";
					 		tag += "</td>"
				 			tag += "<td style='text-align:left;'>"
			 				tag += "<label  class='custom-control-label' for='"+list[i].pushId+"' ><font size='2' font color='black'><a href='/board/getBoard?boardNo="+list[i].refId+"'>";
					 	} else if (list[i].pushType.trim() == 'I' ) {
					 		tag += "<img src='/images/icon/push_invite.png'>";
					 		//tag += "<font size='3' font color='black'><a href='/myPage' >"; // �ʴ� ��� ����Ʈ ��ũ
					 	} else if (list[i].pushType.trim() == 'A') {
					 		tag += "<img src='/images/icon/push_acc.png'>";
					 		//tag += "<font size='3' font color='black'><a href='/myPage/' >" // ���� ��û ��� ����Ʈ ��ũ
					 	}
					 		tag += list[i].pushMsg+"</font></label></td>";
					 		tag += "<tr>";
					 		tag += "<td></td><td>";
					 		tag += "<label  class='custom-control-label' for='"+list[i].pushId+"'><font size='1' font color='gray'>"+list[i].pushTime+"</font></a></label>";
					 		tag += "</td>";
					 		tag += "</tr>";
					 }
					 tag += "</table>"
					 tag += "</div>"
					  tag += "<style>"
					  +"label { font-weight: normal; font-color: white; }"
						/*+ "input[type=\"checkbox\"] {"
						 +    "display:none;"
						 +"}"
						 +"input[type=\"checkbox\"] + label span {"
						     +"display: inline-block;"
						     +"width: 24px;"
						     +"height: 24px;"
						     +"margin: -2px 10px 0 0;"
						     +"vertical-align: middle;"
						     +"background: url(checkbox.svg) left top no-repeat;"
						     +"cursor: pointer;"
						     +"background-size: cover;"
						 +"}"
						 +"input[type=\"checkbox\"]:checked + label span {"
						     +"background:url(checkbox.svg)  -26px top no-repeat;"
						      +"background-size: cover;"
						 +"}"*/
						 +"</style>";  
					 
					 $('.pushList').html(tag);
					 console.log("resultPage : "+resultPage);
					 console.log("search : "+search);
				 },
				 error : function(error) {
					 console.log("�˸� ���� ��� ����");
					 console.log(error);
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
		 function showList(vo) {
			 var tag = "";
				tag += "<table width=95%>"
			 	tag += "<tr>"
			 	tag += "<td style='margin:auto;text-align:center' width='20%'>"
				tag += "<input type='checkbox'  class='custom-control-input' name='chk' id='"+vo.pushId+"' value='"+vo.pushId+"'>"; // style='display:none;'
			 	if(vo.pushType.trim()=='R') {
			 		tag += "<img src='/images/icon/push_reply9.png'>";
			 		tag += "</td>"
		 			tag += "<td style='text-align:left;'>"
	 				tag += "<label  class='custom-control-label' for='"+vo.pushId+"' ><font size='2' font color='black'><a href='/board/getBoard?boardNo="+vo.refId+"'>";
			 	} else if (vo.pushType.trim() == 'I' ) {
			 		tag += "<img src='/images/icon/push_invite.png'>";
			 		//tag += "<font size='3' font color='black'><a href='/myPage' >"; // �ʴ� ��� ����Ʈ ��ũ
			 	} else if (vo.pushType.trim() == 'A') {
			 		tag += "<img src='/images/icon/push_acc.png'>";
			 		//tag += "<font size='3' font color='black'><a href='/myPage/' >" // ���� ��û ��� ����Ʈ ��ũ
			 	}
		 		tag += vo.pushMsg+"</font></label></td>";
		 		tag += "<tr>";
		 		tag += "<td></td><td>";
		 		tag += "<label  class='custom-control-label' for='"+vo.pushId+"'><font size='1' font color='gray'>"+vo.pushTime+"</font></a></label>";
		 		tag += "</td>";
		 		tag += "</tr>";
				tag += "</table>"
				tag += "</div>"
		  	 $(".chkPushList").append(tag);
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
					 var h = "<h4>�˸� ����<font color='red'>"+result+"</font></h4>";
					 $(".footerBar h4").html(h);
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
		 
		  jQuery(document).ready(function($) {
			  console.log("���� �α����� ȸ�� : "+userId);
			 
			  if(userId != null && userId != '' ) {
			  	getPushList(userId);
			  	getUnreadCount(userId);
			  	
			  }
	            // hide the menu when the page load
	            $(".footerBar-content").hide();

	            // when .menuBtn is clicked, do this
	            $(".footerBar .fa-bell").click(function() {
	            	// �α��� ���� ���� ����
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