<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<a class="nav-link active" href="/">
		<h6>����</h6>
</a>
<jsp:include page="/view/user/loginTest.jsp"></jsp:include>

<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">
�α��θ��
</button> -->

<c:if test="${user.userName != null}">
<p>
${user.nickname}�� �α�����....
</p>
<button type="button" class="btn btn-dark">�α׾ƿ�</button>
</c:if>

<c:if test="${user.userId == null}">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">
�α���
</button>
</c:if>

<br/>
<a href="../view/flight/searchFlight.jsp">�װ��� �˻�</a>
<br/>
<a href="../view/room/searchRoom.jsp">���� �˻�</a>
<br/>
<a href="/order/getOrderList">�ֹ� ���</a>

<ul class="nav nav-tabs">
	  <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Ŀ�´�Ƽ</a>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="#">�α�۰Խ���</a>
	      <a class="dropdown-item" href="#">�÷��ʰ���</a>
	      <a class="dropdown-item" href="#">����ã��</a>
	      <a class="dropdown-item" href="#">�����ı�</a>
	      <a class="dropdown-item" href="#">��������</a>
	      <a class="dropdown-item" href="#">QnA</a>
	      <a class="dropdown-item" href="#">�����Խ���</a>
	    </div>
	  </li>
	</ul>
	
		<!-- ToolBar End /////////////////////////////////////-->
   	<script type="text/javascript">
		$("button:contains('�α׾ƿ�')").on("click",function(){
			location.href="/user/logout";
		});
	
 
	 	$( "a:contains('�����Խ���')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=A");
		});
	 	
	 	$( "a:contains('��������')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=B");
		}); 
	 	
	 	$( "a:contains('�α�۰Խ���')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=C");
		}); 
	 	
	 	$( "a:contains('����ã��')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=D");
		}); 
	 	
	 	$( "a:contains('�÷��ʰ���')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=E");
		}); 
	 	
	 	$( "a:contains('�����ı�')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=F");
		}); 
	 	
	 	$( "a:contains('QnA')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=G");
		}); 
	 	
	</script>  

    <div class="footerBar">
 		<div class="pushToast">
 		pushToast �ڸ�
 		</div>
 		<div class="footerBar-content">
 			 
				    <!-- ��� �޽��� �����ִ� â -->
				     <div class="deletePush" >
				    <span class = "totalCount" style="float:center;">�� �ҽ� �˸�</span>
				    <a href='javascript:deletePush()'><i class="far fa-trash-alt" style="float:right;"></i></a><hr>
				    	<div class="pushList" style="overflow-y:auto; width:300px; height:350px;">
				    	</div>
				    </div>
				    <br />
				    
				    <script type="text/javascript">
				        var pushAddr = "ws://localhost:8080/websocket/";
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