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
		.view_comment {
		    position: relative;
		}
		.comment_wrap.show, .gall_listwrap.album .comment_wrap.show, .comment_box .reply.show {
		    overflow: visible;
		    height: 100%;
		}
		.comment_wrap {
		    overflow: hidden;
		    width: 100%;
		    height: 38px;
		    margin-top: 15px;
		    font-family: '����',Gulim;
		    font-size: 13px;
		    color: #333;
		}
		.comment_count {
		    height: 38px;
		    line-height: 38px;
		    font-weight: bold;
		}
		.comment_count .num_box {
		    width: 50%;
		}
		.comment_box {
		    position: relative;
		    border-top: 2px solid silver;
		}
		ol, ul {
		    list-style: none;
		}
		.cmt_list li:first-child .cmt_info {
		    border-top: none;
		}
		.view_comment .cmt_info {
		    padding: 9px 3px 40px 3px;
		}
		.cmt_info {
		    position: relative;
		    padding: 9px 12px 7px;
		    border-top: 1px solid #eee;
		}
		.cmt_nickbox {
		    float: left;
		    width: 132px;
		    margin-right: 33px;
		    margin-top: 3px;
		}
		.gall_writer {
		    position: relative;
		    font-size: 13px;
		    cursor: pointer;
		}.nickname.me {
		    background: #e5ebff;
		    padding: 3px 1px 1px 2px;
		}
		.comment_box .nickname {
		    font-size: 12px;
		    color: #777;
		    vertical-align: top;
		}.comment_box .nickname.in > em {
		    max-width: 110px;
		    padding-right: 1px;
		}
		.comment_box .nickname > em {
		    display: inline-block;
		    max-width: 84px;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    white-space: nowrap;
		    vertical-align: top;
		}
		.writer_nikcon img {
		    vertical-align: middle;
		}
		.cmt_txtbox {
		    float: left;
		}
		.comment_wrap .comment_dccon {
		    float: left;
		}
		.usertxt, .comment_wrap .comment_dccon {
		    width: 820px;
		    cursor: pointer;
		}
		.comment_dccon {
		    position: relative;
		    margin: 3px 0 5px;
		}
		.coment_dccon_img {
		    float: left;
		    height: 100px;
		    cursor: pointer;
		}
		.fr {
		    float: right;
		}
		.date_time {
		    float: left;
		    font-size: 12px;
		    color: #999;
		    vertical-align: top;
		    margin-top: 3px;
		}
		.view_comment .cmt_mdf_del {
		    top: 3px;
		}
		.cmt_mdf_del:empty {
		    display: none;
		}
		.cmt_mdf_del {
		    float: right;
		}
		.cmt_mdf_del {
		    position: relative;
		    margin-left: 6px;
		    z-index: 1;
		}
		.view_comment .bottom_paging_box {
		    height: 69px;
		}
		.comment_box .bottom_paging_box {
		    margin-top: 0;
		}
		.comment_wrap .bottom_paging_box {
		    border-top: 1px #eee solid;
		}
		.bottom_paging_box {
		    position: relative;
		    margin-top: 18px;
		    text-align: center;
		    line-height: 20px;
		}
		.cmt_paging {
		    padding: 23px 0 28px;
		}
		.bottom_paging_box a:first-child, .bottom_paging_box em:first-child {
		    margin-left: 0;
		}
		.bottom_paging_box em {
		    text-decoration: underline;
		    color: #d31900;
		}
		.bottom_paging_box a, .bottom_paging_box em, .bottom_paging_box span {
		    display: inline-block;
		    margin-left: 9px;
		    font-size: 14px;
		    font-weight: bold;
		}
		.view_comment .cmt_write_box {
		    border-bottom: 1px solid silver;
		    border-left: 1px solid silver;
		    border-right: 1px solid silver;
		}
		.cmt_write_box {
		    padding: 12px 12px 12px;
		    background: #fafafa;
		    border-top: 1px solid silver;
		}
		.user_info_input:first-child {
		    margin-top: 0px;
		}
		.user_info_input {
		    width: 140px;
		    height: 30px;
		    margin-top: 5px;
		    border: 1px solid #cecdce;
		    background: #fff;
		}
		.user_info_input input, .cmt_write_box .user_info_input.id > label {
		    width: 126px;
		    height: 25px;
		    line-height: 29px;
		    padding: 1px 7px 0;
		    border: none;
		    font-family: '����',Gulim;
		    font-size: 12px;
		    vertical-align: top;
		}
		.user_info_input {
		    width: 140px;
		    height: 30px;
		    margin-top: 5px;
		    border: 1px solid #cecdce;
		    background: #fff;
		}
		.cmt_txt_cont {
		    float: right;
		}
		.cmt_write {
		    position: relative;
		}
		.cmt_textarea_label {
		    position: absolute;
		    left: 13px;
		    top: 13px;
		    font-size: 12px;
		    color: #999;
		    line-height: 18px;
		}
		.cmt_txt_cont textarea {
		    width: 900px;
		    height: 78px;
		    padding: 13px;
		    border: 1px solid #cecdce;
		    background: #fff;
		    font-family: '����',Gulim;
		    font-size: 13px;
		    color: #333;
		    line-height: 18px;
		}
		.cmt_cont_bottm {
		    margin-top: 8px;
		}
		.view_wrap .view_comment .btn_blue, .view_comment .btn_blue.small {
		    width: 85px;
		    margin-left: 0;
		}
		.view_comment .btn_lightblue {
		    font-weight: normal;
		}
		.btn_blue {
		    background: #00A8C1;
		    border-color: #3c4790;
		    text-shadow: 0px -1px #343d8e;
		    color: #fff;
		}
		.btn_lightblue {
		    background: #00A8C1;
		    border-color: #525eaa;
		    text-shadow: 0px -1px #4b559c;
		    color: #fff;
		}
		.btn_lightgreen.small, .btn_yeongrey.small, .btn_lightpurple.small, .btn_blue.small, .btn_lightblue.small, .btn_grey.small, .btn_jeangrey.small, .btn_white.small, .btn_red.small, .btn_lightgrey.small, .btn_red.small, .btn_green.small {
		    height: 31px;
		    line-height: 30px;
		    margin-left: 3px;
		    border-width: 1px;
		    border-style: solid;
		    border-radius: 2px;
		    font-size: 12px;
		    font-weight: bold;
		}
		.clear:after {
		    clear: both;
		    display: block;
		    visibility: hidden;
		    content: "";
		}
		.cmt_info p {
		    line-height: 20px;
		}
		.usertxt {
		    float: left;
		    line-height: 20px;
		    cursor: pointer;
		    word-break: break-all;
		    overflow: hidden;
		}
		.usertxt, .comment_wrap .comment_dccon {
		    width: 820px;
		    cursor: pointer;
		}
		.cmt_mdf_del button {
		    color: #999;
		}
		.btn_cmt_delete {
		    background: url(https://nstatic.dcinside.com/dc/w/images/sp/sp_img.png);
		    background-position: -268px -200px;
		    font-size: 0;
		    line-height: 0;
		    width: 13px;
		    height: 13px;
		    vertical-align: top;
		}
		.cmt_like {
			clear: both;
			float: left;
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
					$(".up_num_box span").html(data.like); //id���� like_result�� html�� ã�Ƽ� data.like������ �ٲ��ش�.
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
					  $(".fas.fa-bookmark").attr('class','far fa-bookmark fa-2x');
					}else{
					  $(".far.fa-bookmark").attr('class','fas fa-bookmark fa-2x');
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
	
	  <hr>
	  
	     <div class="recom_bottom_box clear" style="width: 1110px;"> 
          <c:if test="${post.postLikeFlag == 'F' || post.postLikeFlag == null}">
	   		<i onclick="addBookMark(${post.postId})" class="far fa-bookmark fa-2x" style="float: right;"></i>
	      </c:if>
	      <c:if test="${post.postLikeFlag == 'T' }">
	  		<i onclick="addBookMark(${post.postId})" class="fas fa-bookmark fa-2x" style="float: right;"></i>
	      </c:if>
         	<div class="far fa-angry" onclick="reportshow('${post.postId}','P')" style="float: right; padding: 15px 30px 10px 10px; font-size: 11px;"> �Ű��ϱ�</div>
	     	  <h3 class="title ub-word" style="margin-bottom: 40px">
		      	<span class="title_subject">${post.postTitle}</span>
		      </h3>
	     </div>
		
	  
	<div class="view_content_wrap">
	 <div class="gallview_head clear ub-content">
	  <div class="gall_writer ub-writer">
	    <div class="fl">
	      <span class="nickname in" style="font-size: 14px; color: gray;">
	        ${post.nickName}
	      </span>
	      <span class="gall_date" style="font-size: 14px; color: gray;">
	        ${post.postDate}
	      </span>
	    <div class="post_history" style="float: right;">
	      <span class="views" style="font-size: 12px;">��ȸ�� ${post.views} || </span>
	      <span class="likes" style="font-size: 12px;">��õ�� ${post.postLikeCount} || </span>
	      <span class="comments" style="font-size: 12px;">��ۼ� ${post.comments}</span>
	    </div>
	    </div>
	  </div>
	 </div>
	 
	 <hr>
	  
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
	    <form id="likeform">
	        <input type="hidden" id="postId" name="postId" value="${post.postId}"/>
	      <div class="inner fl" style="text-align: center;">
	        <div class="up_num_box" style="margin: 50px 0 50px 0">
	          <span class="up_num font_red" style="color: tomato; font-size: 43px; margin-right: 20px">${post.postLikeCount} </span>
	          <i onclick="like()" class="far fa-thumbs-up fa-3x" style="color: tomato;"></i>
	        </div>
	      </div>
	    </form>
	    </div>
	  </div>
	  
	  <div class="tag_content_box">
	     <div class="tagbox">
	       <i class="fas fa-tags"> �±� </i>
	       <span>
	         <c:set var="i" value="0"/>
			 <c:forEach var="tag" items="${tag}" varStatus="last">
			 <c:set var="i" value="${ i+1 }"/>
	           <a href="" style="font-size: 14px; color: gray;">${tag.tagContent}</a>
	         <c:if test="${!last.last}">
	           <i>,</i>
	         </c:if>
	         </c:forEach>
	       </span>  
		   <c:if test="${user.userId == post.postWriterId}">
			 <div class="fr" style="float: right;">
			   <span class="updatePost">����</span>
			   <span class="deletePost">����</span>
			 </div>
		   </c:if>
	     </div>
	   </div>
	   
	   <hr>
	   
	   <ul class="list-group list-group-flush">
		  <li class="list-group-item">������ <i class="fas fa-angle-double-right" onclick="getPost('${post.prevId}')"> ${post.prevTitle}</i></li>
		  <li class="list-group-item">������ <i class="fas fa-angle-double-right" onclick="getPost('${post.nextId}')"> ${post.nextTitle}</i></li>
	   </ul>
	   
 	 </div>
 	 
   </div> 
 	
 	<!-- ��� jsp include -->
	<jsp:include page="/view/community/comment.jsp"/>
	
</body>

</html>