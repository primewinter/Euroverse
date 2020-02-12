<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 30px;
        }
        .layer {
        	display: none;
        }
        .recmt {
        	text-indent: 2em;
        }
        .imgFile {
		    width: 100px;
		    height: 144px;
		}
		.bd-placeholder-img {
			text-align: center;		
		}
		.col-auto.d-none.d-lg-block {
			height: 80px;
			width: 100px;
		}
		#profile_box {
			float: left;
		}
		#profile {
			height: 144px;
		}

     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		var postId = ${post.postId};
		var boardName = '${post.boardName}';
	
		//============= ȸ���������� Event  ó�� =============	
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".btn.btn-primary" ).on("click" , function() {
					self.location = "/community/updatePost?postId=${post.postId}"
			 });
		});
		
		$(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#delbutton" ).on("click" , function() {
					self.location = "/community/deletePost?postId=${post.postId}"
			 });
		});
		
		//���ƿ� ����
		function like(){
			console.log($('#likeform').serialize());
			$.ajax({
				url: '/community/json/likeUpdate',
				type: "POST",
				cache: false,
				dataType: "json",
				data: $('#likeform').serialize(), //���̵� like_form�� ���� ��� ������ ������ �Ķ���� ���� ����(ǥ�� ��������)�� �������
				success:
				function(data){ //ajax��� ������ �Ѿ���� ������ ��° �̸� =data
					alert("'���ƿ�'�� �ݿ��Ǿ����ϴ�!") ; // data�� put�� ���� �̸� like
					$(".fas.fa-grin-hearts").html(data.like); //id���� like_result�� html�� ã�Ƽ� data.like������ �ٲ��ش�.
				},
				error:
				function (request, status, error){
					alert("ajax����")
				}
			});
		}

		function reportshow(refId, repTar){ 
	    	$("#refId").attr('value',''+refId+'');
	    	$("#reportTarget").attr('value',''+repTar+'');
	        $("#dialog-add").dialog("open");     
	    };
		
		$(function(){

		    $("#dialog-add").dialog({
		        autoOpen: false,
		        buttons:[
		            {
		                text: "�Ű�",
		                click: function(){
		                	
		                	if($('#reportReason option:selected').val() == 'E'){
		                		
			                	var reportContent = $("input[name='reportContent']").val();
			                	
			            		if(reportContent == null || reportContent.length<1){
			            			alert("������ �ݵ�� �Է��ϼ���.");
			            			return;
			            		}
		                	}
		                	
		                    $.ajax({
		                    	url : '/community/json/addReport' ,
		                    	type : "POST" ,
		                    	data : $("#reportform").serialize() ,
		                    	dataType : "json" ,
		                    	success : function(JSONData , status){
		                    		alert("�Ű� �Ϸ�!");
		                    		$("#dialog-add").dialog("close");
		                    	}
		                    });
		                }
		            }
		        ]
		    });

		    $('#reportReason').change(function() {
				if($('#reportReason option:selected').val() == 'E'){
					$('.layer').show();
				}else{
					$('.layer').hide();
				}
			});
		});
		
		function addBookMark(postId){

			$.ajax({
				url : '/community/json/addBookMark/'+postId ,
				type : "GET" ,
				cache : false ,
				dataType : "json" ,
				success : function(data) {
					var msg = '';
					msg += data.msg;
					alert(msg);
					
					if(data.likeCheck == 'F'){
					  $(".fas.fa-bookmark").attr('class','far fa-bookmark');
					}else{
					  $(".far.fa-bookmark").attr('class','fas fa-bookmark');
					}      
				},
				error: function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
		function inviteUser() {
			$('#accOffer').modal({
				backdrop: 'static'
			});
			$("#accOffer").show()
		}
		
		$(function(){
			$('#addOffer').on('click', function(){
				addOffer();
			});
		});
		
		function addOffer() {	
	
			var offerMsg = $("input[name='offerMsg']").val();
			var postWriterId = $("input[name='postWriterId']").val();
			
			if(offerMsg == ''){
				alert("offerMsg�� �Է����ּ���");
				return false;
			}
			console.log("toUserId="+postWriterId+", offerMsg="+offerMsg);
			
			$.ajax({
				url: "/community/json/addOffer" ,
				method: "POST",
				dataType: "json",
				headers: { 
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data: JSON.stringify({
					refId: postId,
					toUserId: postWriterId,
					offerMsg: offerMsg
				}),
				success: function(data){
					closeModal('accOffer');
			        alert(data.toUserId+" �Կ��� �޽����� ���½��ϴ�.");
			        
			     	//�� �ۼ��ڿ��� push �ϱ�
					var receiverId = data.toUserId;
					var pushType = 'A';
					sendPush(receiverId, pushType);
			    } 
			});
		}
		
		function closeModal(modalName) {
			
			if( typeof $("."+modalName)[0] != "undefined" ){
				$("."+modalName)[0].reset();	
			}
			$("#"+modalName).hide();
		}
		
		function getPost(postId) {
			self.location = "/community/getPost?postId="+postId+"&boardName="+boardName;
		}
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar/toolBar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<div id="dialog-add" title="�Ű� �ۼ�">
	  <form id="reportform">
	    <p>�Ű����</p>
	    <select id="reportReason" name="reportReason">
	      <option value="F">�弳</option>
	      <option value="A">������</option>
	      <option value="R">�������</option>
	      <option value="E">��Ÿ</option>
	    </select>
	    <div class="layer"><input type="text" id="reportContent" name="reportContent" placeholder="��Ÿ ������ �Է��ϼ���."/></div>
	      <input type="hidden" id="refId" name="refId" value="">
	      <input type="hidden" id="reportTarget" name="reportTarget" value="">
	  </form>	
	</div>
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class="text-primary">����ã��</h3>
	       <div class="col-xs-8 col-md-4">��ȸ�� ${post.views} | ��ۼ� ${post.comments}</div>
	    </div>
	    
	    <div class="row">
	    <form id="likeform">
			<input type="hidden" name="postId" value="${post.postId}">
			<i onclick="like()" class="fas fa-grin-hearts">&nbsp;${post.postLikeCount}</i> 
	  &nbsp;<i onclick="reportshow('${post.postId}','P')" class="fas fa-concierge-bell"></i>
		</form>
		  <c:if test="${post.postLikeFlag == 'F' || post.postLikeFlag == null}">
		  &nbsp;<i onclick="addBookMark(${post.postId})" class="far fa-bookmark"></i>
		  </c:if>
		  <c:if test="${post.postLikeFlag == 'T' }">
		  &nbsp;<i onclick="addBookMark(${post.postId})" class="fas fa-bookmark"></i>
		  </c:if>
		</div>
	
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.postTitle}</div>
			<div class="col-xs-8 col-md-4">${post.accStartDate} ~ ${post.accEndDate}</div>
			<div class="col-xs-8 col-md-4">${post.accCount} / ${post.accPerson}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.nickName} || ${post.postDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.postContent}</div>
		</div>
		
		<div class="col-md-12 text-center">
			<button type="button" class="btn btn-info" onclick="inviteUser()">����������û�ϱ�</button>
		</div>
		
		<hr/>
		
		<div class="row">
		  <div class="col-xs-8 col-md-4">${post.accCount} / ${post.accPerson}</div>
			<div class="col-md-12 text-left">
			  <c:set var="i" value="0"/>
			  <c:forEach var="userList" items="${userList}">
			    <c:forEach var="party"	items="${party}">
			  	  <c:if test="${userList.userId == party.partyUserId}">
			 	  <c:set var="i" value="${ i+1 }"/>
					<div id="profile_box" class="row mb-12">
					  <div class="col-md-10">
					    <div id="profile" class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					      <div class="col-auto d-none d-lg-block">
					        <svg class="bd-placeholder-img" width="0" height="0" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><img class="imgFile" src="/resources/images/userImages/${userList.userImg}"><rect width="50%" height="5%" fill="#55595c"/></svg>
					      </div>
					      <div class="col p-4 d-flex flex-column position-static">
					      <c:if test="${party.partyRole == 'K'}">
					        <i class="fas fa-crown"><br>${userList.nickname}</i>
					      </c:if>
					      <c:if test="${party.partyRole == 'M'}">
					      	<i class="fas fa-user"><br>${userList.nickname}</i>
					      </c:if>
					        <p class="mb-auto">${userList.totalPoint}</p>
					      </div>
					    </div>
					  </div>
					</div>
			  	  </c:if>
			    </c:forEach>
			  </c:forEach>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">
			�±�
			<c:set var="i" value="0"/>
			<c:forEach var="tag" items="${tag}">
			<c:set var="i" value="${ i+1 }"/>
			<a href="">${tag.tagContent}</a>
			</c:forEach>
			</div>
		</div>
	
		<hr/>
		
		<c:if test="${user.userId == post.postWriterId}">
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">����</button>
	  	  &nbsp;<a id="delbutton" class="btn btn-primary btn" href="#" role="button">����</a>
	  		</div>
		</div>
		</c:if>
	  		
		������<i class="fas fa-angle-double-right" onclick="getPost('${post.prevId}')">${post.prevTitle}</i><br>
		������<i class="fas fa-angle-double-right" onclick="getPost('${post.nextId}')">${post.nextTitle}</i>
	  		
 	</div>
 	
	<div class="modal" id="accOffer">
	  <div class="modal-dialog modal-lg" >
	  	<h4 style="color: #FFFFFF; margin-top: 100px;">�����û</h4>
	  
	    <div class="modal-content">
	
	      <div class="modal-header">
	        <div class="modal-title">
	        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>���� ��û �޼����� �Է��ϼ���.</h6>
	        </div>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('accOffer')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	        
	        <form class="accOffer" style="margin: 10px;">
				<div class="form-group" id="offerMsgForm" style="margin: 30px 10px 10px 10px; width:auto;">
				    <label for="offerMsg" class="control-label" style="font-weight: bold; margin-bottom: 7px;" >${post.nickName} �Կ��� ������ �޽���</label><br/>
				    <input type="text" class="form-control" id="offerMsg" name="offerMsg" placeholder="�����û �޼����� �Է��ϼ���." style="width:100%; height: 100px;">
				    <input type="hidden" id="postWriterId" name="postWriterId" value="${post.postWriterId}"/>
				</div>
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('accOffer')">Close</button>
	        <button type="button" class="btn btn-success" id="addOffer">��û�ϱ�</button>
	      </div>
	    </div>
	  </div>
	</div>

 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<jsp:include page="/view/community/comment.jsp"/>
	
</body>

</html>