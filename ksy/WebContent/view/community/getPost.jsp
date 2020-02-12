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
		.view_content_wrap {
		    font-family: '����',Gulim;
		    font-size: 13px;
		    color: #333;
		}
		.visit_history .tit {
		    float: left;
		    font-size: 12px;
		    color: #3c4790;
		}
		
		.issue_wrap {
		    position: relative;
		    border-top: 2px solid #3c4790;
		    padding-bottom: 37px;
		    z-index: 13;
		}
		.page_head {
		    height: 37px;
		    margin-bottom: 3px;
		    padding-top: 4px;
		}
		.page-header h3 a {
		    color: #3c4790;
		}
		.page-header h3 {
		    font-size: 24px;
		    font-family: 'Nanum Gothic', sans-serif;
		    letter-spacing: -1px;
		    margin: 2px 10px 0 3px;
		}
	
		html, body, div, span, iframe, h1, h2, h3, h4, h5, h6, p, a, em, img, strong, b, u, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, embed, figure, figcaption, footer, header, nav, section, summary, audio, video, button {
		    margin: 0;
		    padding: 0;
		    border: 0;
		    vertical-align: baseline;
		    background: transparent;
		    font-style: normal;
		}
		div {
		    display: block;
		}
		body, button, input, select, table, textarea {
		    font-size: 12px;
		    font-family: Dotum,'����',Helvetica,"Apple SD Gothic Neo",sans-serif;
		}
		html {
		    color: -internal-root-color;
		}
	
		.visit_history {
		    position: absolute;
		    overflow: hidden;
		    width: 1134px;
		    height: 36px;
		    line-height: 36px;
		    padding: 0 12px;
		    background: #f3f3f3;
		    border: 1px solid #d5d5d5;
		    border-width: 0 1px 1px 1px;
		}
 		body {
            padding-top : 30px;
        }
        .layer {
        	display: none;
        }
        .recmt {
        	text-indent: 2em;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		var boardName = '${post.boardName}';
		
		//============= ȸ���������� Event  ó�� =============	
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".btn.btn-primary" ).on("click" , function() {
					self.location = "/community/updatePost?postId=${post.postId}&boardName="+boardName;
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
	  <div class="page_head clear">
		<div class="page-header">
	     <c:if test="${param.boardName=='A'}">
		   <h3><a>�����Խ���</a></h3>
		 </c:if>
		 <c:if test="${param.boardName=='B'}">
		   <h3><a>��������</a></h3>
		 </c:if>
		 <c:if test="${param.boardName=='C'}">
		   <h3><a>�α�۰Խ���</a></h3>
		 </c:if>
		 <c:if test="${param.boardName=='E'}">
		   <h3><a>�÷��ʰ���</a></h3>
		 </c:if>
		 <c:if test="${param.boardName=='F'}">
		   <h3><a>�����ı�</a></h3>
		 </c:if>
		 <c:if test="${param.boardName=='G'}">
		   <h3><a>QnA</a></h3>
		 </c:if>
	    </div>
	  </div>
	  
	  <div class="issue_wrap">  
	    <div id="visit_history" class="visit_history">
	      <h3 class="tit">������ ������</h3>
	    </div>
	  </div>
	  
	  <div class="view_content_wrap">
	  
	  </div>
	
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.postTitle}</div>
		
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
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.nickName} || ${post.postDate}</div>
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
	  	  &nbsp;<a id="delbutton" class="btn btn-primary btn" href="#" role="button">����</a>
	  		</div>
		</div>
		</c:if>
	
		������<i class="fas fa-angle-double-right" onclick="getPost('${post.prevId}')">${post.prevTitle}</i><br>
		������<i class="fas fa-angle-double-right" onclick="getPost('${post.nextId}')">${post.nextTitle}</i>

 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<jsp:include page="/view/community/comment.jsp"/>
	
</body>

</html>