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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 30px;
        }
        .layer {
        	display: none;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button" ).on("click" , function() {
					self.location = "/community/updatePost?postId=${post.postId}"
			 });
		});
		
		$(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "span[href='#']" ).on("click" , function() {
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
					$("#like_result").html(data.like); //id���� like_result�� html�� ã�Ƽ� data.like������ �ٲ��ش�.
				},
				error:
				function (request, status, error){
					alert("ajax����")
				}
			});
		}
	 	
		function login_need(){
			alert("�α��� �� �̿� ����")
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
		            },
		            {
		                text: "���",
		                click: function(){
		                    $(this).dialog("close");
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
					  $(".glyphicon.glyphicon-star").attr('class','glyphicon glyphicon-star-empty');
					}else{
					  $(".glyphicon.glyphicon-star-empty").attr('class','glyphicon glyphicon-star');
					}      
				},
				error: function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}

	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/community/toolbar.jsp" />
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
	       <h3 class=" text-info">�Խñ���ȸ</h3>
	    </div>
	
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.postTitle}</div>
		
	    <form id="likeform">
			<input type="hidden" name="postId" value="${post.postId}">
			<input type="button" value="���ƿ�!" onclick="return like()"> 
			<span id="like_result">${post.postLikeCount}</span> 
	  &nbsp;<i onclick="reportshow('${post.postId}','P')" class="glyphicon glyphicon-remove"></i>
		</form>
		  <c:if test="${post.postLikeFlag == 'F' || post.postLikeFlag == null}">
			<i onclick="addBookMark(${post.postId})" class="glyphicon glyphicon-star-empty"></i>
		  </c:if>
		  <c:if test="${post.postLikeFlag == 'T' }">
		    <i onclick="addBookMark(${post.postId})" class="glyphicon glyphicon-star"></i>
		  </c:if>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.postWriterId} || ${post.postDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.postContent}</div>
		</div>
		
		<hr/>
		
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
	  	  &nbsp;<span class="btn btn-primary btn" href="#" role="button">����</span>
	  		</div>
		</div>
		</c:if>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<jsp:include page="/view/community/comment.jsp"/>
	
</body>

</html>