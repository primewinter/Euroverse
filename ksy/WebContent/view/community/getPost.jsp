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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
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
			 $( "a[href='#']" ).on("click" , function() {
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

		    $(".glyphicon.glyphicon-remove").click(function(){       
		        $("#dialog-add").dialog("open");     
		    });
		    
		    $('#reportReason').change(function() {
				if($('#reportReason option:selected').val() == 'E'){
					$('.layer').show();
				}else{
					$('.layer').hide();
				}
			});
		});
		
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
	      <input type="hidden" id="refId" name="refId" value="${post.postId}">
	      <input type="hidden" id="reportTarget" name="reportTarget" value="P">
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
	  &nbsp;<i class="glyphicon glyphicon-remove"></i>
		</form>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.postWriterId.userId} || ${post.postDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.postContent}</div>
		</div>
		
		<hr/>
		
		<c:if test="${user.userId == post.postWriterId.userId}">
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">����</button>
	  	  &nbsp;<a class="btn btn-primary btn" href="#" role="button">����</a>
	  		</div>
		</div>
		</c:if>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<jsp:include page="/view/community/comment.jsp"/>
	
</body>

</html>