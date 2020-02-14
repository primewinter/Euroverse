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
	<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'> 
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		.nickname .gall_date {
		    line-height: 16px;
		    vertical-align: top;
		    display: block;
		    padding: 13px 0 0 1px;
		    font-size: 13px;
		    color: #909090;
		}
		
		
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		var boardName = '${post.boardName}';
		
		//============= ȸ���������� Event  ó�� =============	
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".fr .updatePost" ).on("click" , function() {
					self.location = "/community/updatePost?postId=${post.postId}&boardName="+boardName;
			 });
		});
		
		$(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".fr .deletePost" ).on("click" , function() {
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
					$(".up_num_box p").html(data.like); //id���� like_result�� html�� ã�Ƽ� data.like������ �ٲ��ش�.
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
		                    		alert(JSONData.msg);
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
	
	<br>
	
	  <div class="page_head clear">
		<div class="h3" style="text-align: center;font-weight: bold;">
	     <c:if test="${param.boardName=='A'}">
		   �����Խ���
		 </c:if>
		 <c:if test="${param.boardName=='B'}">
		   ��������
		 </c:if>
		 <c:if test="${param.boardName=='C'}">
		   �α�۰Խ���
		 </c:if>
		 <c:if test="${param.boardName=='E'}">
		  �÷��ʰ���
		 </c:if>
		 <c:if test="${param.boardName=='F'}">
		  �����ı�
		 </c:if>
		 <c:if test="${param.boardName=='G'}">
		  QnA
		 </c:if>
	    </div>
	  </div>
	
	  <nav aria-label="breadcrumb">
		<ol class="breadcrumb">
	     <div class="recom_bottom_box clear" style="width: 1078px;"> 
         	<i class="fas fa-ban" onclick="reportshow('${post.postId}','P')" style="float: right; padding-left: 8px"> �Ű�</i>
          <c:if test="${post.postLikeFlag == 'F' || post.postLikeFlag == null}">
	   		<i onclick="addBookMark(${post.postId})" class="far fa-bookmark" style="float: right;"> �ϸ�ũ</i>
	      </c:if>
	      <c:if test="${post.postLikeFlag == 'T' }">
	  		<i onclick="addBookMark(${post.postId})" class="fas fa-bookmark" style="float: right;"> �ϸ�ũ</i>
	      </c:if>
	     </div>
		</ol>
	  </nav>
	  
	  <div class="view_content_wrap">
	    <div class="gallview_head clear ub-content">
	      <h2 class="title ub-word">
	      	<span class="title_subject">${post.postTitle}</span>
	      </h2>

	  <div class="gall_writer ub-writer">
	    <div class="fl">
	      <span class="nickname in" title="${post.nickName}">
	        <em>${post.nickName}</em>
	      </span>
	      <span class="gall_date" title="${post.postDate}">
	        ${post.postDate}
	      </span>
	    </div>
	  </div>
	 </div>
	  
	  <div class="gallview_contents">
	    <div class="inner clear">
	      <div class="writing_view_box">
	        <pre></pre>
	        <div style="overflow:hidden;">
				${post.postContent}
	        </div>
	      </div>
	    </div>
	    
	    <div class="btn_recommend_box clear">
	      <h3 class="blind">��õ</h3>
	    <form id="likeform">
	        <input type="hidden" id="postId" name="postId" value="${post.postId}"/>
	      <div class="inner fl">
	        <div class="up_num_box">
	          <p class="up_num font_red" id="recommend_view_up_${post.postId}">${post.postLikeCount}</p>
	        </div>
	        <button type="button" class="btn_recom_up" data-no="${post.postId}">
	          <i onclick="like()" class="far fa-thumbs-up fa-5x"></i>
	        </button>
	      </div>
	    </form>
	    </div>
	    
	    
	  </div>
	  
	  
	  
	     <dl class="tagbox">
	       <dt>�±�</dt>
	       <dd>
	         <c:set var="i" value="0"/>
			 <c:forEach var="tag" items="${tag}" varStatus="last">
			 <c:set var="i" value="${ i+1 }"/>
	           <a href="/search?q=">${tag.tagContent}</a>
	         <c:if test="${!last.last}">
	           <i>,</i>
	         </c:if>
	         </c:forEach>
	       </dd>  
	     <c:if test="${user.userId == post.postWriterId}">
	       <div class="fr">
		     <button type="button" class="updatePost">����</button>
	  	     <button type="button" class="deletePost">����</button>
		   </div>
		 </c:if>
	     </dl>
	 </div>
   </div> 
 	
 	
 	
 	
 	<h3 class="tit"><a onclick="getPost('${post.prevId}')">${post.prevTitle}</a>&nbsp;<i class="fas fa-angle-left"></i>&nbsp;������&nbsp;${post.postTitle}&nbsp;������&nbsp;<i class="fas fa-angle-right"></i>&nbsp;<a onclick="getPost('${post.nextId}')">${post.nextTitle}</a></h3>
 	
 	
 	<!-- ��� jsp include -->
	<jsp:include page="/view/community/comment.jsp"/>
	
</body>

</html>