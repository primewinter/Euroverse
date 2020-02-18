<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
		    font-family: '굴림',Gulim;
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
		    border-top: 1px solid silver;
		}
		ol, ul {
		    list-style: none;
		    padding: 0 0 0 10px;
		}
		.cmt_list li:first-child .cmt_info {
		    border-top: none;
		}
		.view_comment .cmt_info {
		    padding: 9px 3px 10px 3px;
		}
		.cmt_info {
		    position: relative;
		    padding: 9px 12px 7px;
		    border-top: 1px solid #eee;
		}
		.cmt_nickbox {
		    float: left;
		    width: 110px;
		    margin-top: 3px;
		}
		.gall_writer {
		    position: relative;
		    font-size: 13px;
		    cursor: pointer;
		}
		.nickname.me {
		    background: #e5ebff;
		    padding: 3px 1px 1px 2px;
		}
		.comment_box .nickname {
		    font-size: 12px;
		    color: #777;
		    vertical-align: top;
		}
		.comment_box .nickname.in > em {
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
		    padding: 10px 10px 10px;
		    background: whitesmoke;
		    border-top: 1px solid silver;
		    border-radius: 3px;
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
		    font-family: '굴림',Gulim;
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
		    width: 730px;
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
			float: left;
			margin: 10px 0 10px 0;
		    width: 730px;
		    height: 78px;
		    padding: 13px;
		    border: 1px solid #cecdce;
		    background: #fff;
		    font-family: '굴림',Gulim;
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
		.cmt_like {
			clear: both;
			float: left;
		} 
		.clear.cmt_txtbox.btn_reply_write_all {
			clear: both;
			padding-left: 115px;
		}
		.container, .container-md, .container-sm {
		    max-width: 930px;
		}
		.modal {
        text-align: center;
		}
		@media screen and (min-width: 768px) { 
		        .modal:before {
		                display: inline-block;
		                vertical-align: middle;
		                content: " ";
		                height: 100%;
		        }
		}
		.modal-dialog {
		        display: inline-block;
		        text-align: left;
		        vertical-align: middle;
		}
		.card {
			width: 85px;
		    height: 85px; 
		    border-radius: 70%;
		    overflow: hidden;
		    margin-left: 10px;
		} 
	</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		var boardName = '${post.boardName}';
		
		//============= 회원정보수정 Event  처리 =============	
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".fr .updatePost" ).on("click" , function() {
					self.location = "/community/updatePost?postId=${post.postId}&boardName="+boardName;
			 });
		});
		
		$(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".fr .deletePost" ).on("click" , function() {
					self.location = "/community/deletePost?postId=${post.postId}"
			 });
		});
		
		//좋아요 구현
		function like(){
			console.log($('#likeform').serialize());
			$.ajax({
				url: '/community/json/likeUpdate',
				type: "POST",
				cache: false,
				dataType: "json",
				data: $('#likeform').serialize(), //아이디가 like_form인 곳의 모든 정보를 가져와 파라미터 전송 형태(표준 쿼리형태)로 만들어줌
				success:
				function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
					alert("'좋아요'가 반영되었습니다!") ; // data중 put한 것의 이름 like
					$(".up_num_box span").html(data.like); //id값이 like_result인 html을 찾아서 data.like값으로 바꿔준다.
				},
				error:
				function (request, status, error){
					alert("ajax실패")
				}
			});
		}

		function reportshow(refId, repTar){ 
	    	$("#refId").attr('value',''+refId+'');
	    	$("#reportTarget").attr('value',''+repTar+'');
	    	$('#myModal').on('shown.bs.modal'); 
	    };
	    
	    $(function(){
	    	$("#addReport").on("click", function(){

	    		if( $("input:radio[id='customRadio4']").is(":checked") == true ){
            		
                	var reportContent = $("input[name='reportContent']").val();
                	
            		if(reportContent == null || reportContent.length<1){
            			alert("내용은 반드시 입력하세요.");
            			return;
            		}
	    		}else if( $("input:radio[id='customRadio4']").is(":checked") == false ){
	    			
	    			if( $("input[name='reportContent']" ).val() != ""){
	    				alert("기타만 입력 가능");
	    				return;
	    			}
	    		}
            	
                $.ajax({
                	url : '/community/json/addReport' ,
                	type : "POST" ,
                	data : $("#reportform").serialize() ,
                	dataType : "json" ,
                	success : function(JSONData , status){
                		$(".myModal")[0].reset();
                		$("#myModal").modal("hide");
                		alert(JSONData.msg);
                	}
                });
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
   	
   	
   	<div class="modal" tabindex="-1" role="dialog" id="myModal" >
	  <div class="modal-dialog" role="document" >
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">신고 작성</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	            <p>신고사유 선택</p>
            <form id="reportform" class="myModal">
				<div class="custom-control custom-radio">
				  <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" value="F">
				  <label class="custom-control-label" for="customRadio1" style="font-size:12px; padding-bottom:5px;">욕설</label>
				</div>
				<div class="custom-control custom-radio">
				  <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" value="A">
				  <label class="custom-control-label" for="customRadio2" style="font-size:12px; padding-bottom:5px;">음란물</label>
				</div>
				<div class="custom-control custom-radio">
				  <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input" value="R">
				  <label class="custom-control-label" for="customRadio3" style="font-size:12px; padding-bottom:5px;">허위사실</label>
				</div>
				<div class="custom-control custom-radio">
				  <input type="radio" id="customRadio4" name="customRadio" class="custom-control-input" value="E">
				  <label class="custom-control-label" for="customRadio4" style="font-size:12px;">기타</label>
				  <input type="text" class="form-control" id="reportContent" name="reportContent" placeholder="기타 내용을 입력하세요." style="font-size:12px;"/>
				</div>
				  <input type="hidden" id="refId" name="refId" value="">
	              <input type="hidden" id="reportTarget" name="reportTarget" value="">
			</form>	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width:50px;height:30px;font-size:11px;line-height:9px;">Close</button>
	        <button type="button" class="btn btn-primary" style="width:50px;height:30px;font-size:11px;line-height:9px;" id="addReport">send report</button>
	      </div>
	    </div>
	  </div>
	</div>
   
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<br>
	
	  <div class="page_head clear">
		<div class="h3" style="text-align: center;font-weight: bold;">
	     <c:if test="${param.boardName=='A'}">
		   자유게시판
		 </c:if>
		 <c:if test="${param.boardName=='B'}">
		   정보공유
		 </c:if>
		 <c:if test="${param.boardName=='C'}">
		   인기글게시판
		 </c:if>
		 <c:if test="${param.boardName=='E'}">
		  플래너공유
		 </c:if>
		 <c:if test="${param.boardName=='F'}">
		  여행후기
		 </c:if>
		 <c:if test="${param.boardName=='G'}">
		  QnA
		 </c:if>
	    </div>
	  </div>
	
	  <hr>
	  
	     <div class="recom_bottom_box clear" style="width: 890px;"> 
          <c:if test="${post.postLikeFlag == 'F' || post.postLikeFlag == null}">
	   		<i onclick="addBookMark(${post.postId})" class="far fa-bookmark fa-2x" style="float: right;"></i>
	      </c:if>
	      <c:if test="${post.postLikeFlag == 'T' }">
	  		<i onclick="addBookMark(${post.postId})" class="fas fa-bookmark fa-2x" style="float: right;"></i>
	      </c:if>
         	<div class="far fa-angry" data-toggle="modal" data-target="#myModal" onclick="reportshow('${post.postId}','P');" style="float: right; padding: 15px 30px 10px 10px; font-size: 11px;"> 신고하기</div>
	     	  <h4 class="title ub-word" style="margin-bottom: 40px;">
		      	<span class="title_subject">${post.postTitle}</span>
		      </h4>
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
	      <i class="far fa-eye" style="font-size: 13px;"> ${post.views}</i>
	      &nbsp;<i class="far fa-thumbs-up" style="font-size: 13px;"> ${post.postLikeCount}</i>
	      &nbsp;<i class="far fa-comments" style="font-size: 13px;"> ${post.comments}</i>
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
	          <span class="up_num font_red" style="color: tomato; font-size: 20px; margin-right: 10px">${post.postLikeCount} </span>
	          <i onclick="like()" class="fas fa-heart fa-2x" style="color: tomato;"></i>
	        </div>
	      </div>
	    </form>
	    </div>
	  </div>
	  
	  <div class="tag_content_box">
	     <div class="tagbox" style="font-size: 12px;">
	       <i class="fas fa-tags"> 태그 </i>
	       <span>
	         <c:set var="i" value="0"/>
			 <c:forEach var="tag" items="${tag}" varStatus="last">
			 <c:set var="i" value="${ i+1 }"/>
	           <a href="" style="color: gray;">${tag.tagContent}</a>
	         <c:if test="${!last.last}">
	           <i>,</i>
	         </c:if>
	         </c:forEach>
	       </span>  
		   <c:if test="${user.userId == post.postWriterId}">
			 <div class="fr" style="float: right;">
			   <span class="updatePost">수정</span>
			   <span class="deletePost">삭제</span>
			 </div>
		   </c:if>
	     </div>
	   </div>
	   
	   <hr>
	   
	   <ul class="list-group list-group-flush" style="font-size: 13px;">
		  <li class="list-group-item">이전글 <i class="fas fa-angle-double-right" onclick="getPost('${post.prevId}')"> ${post.prevTitle}</i></li>
		  <li class="list-group-item">다음글 <i class="fas fa-angle-double-right" onclick="getPost('${post.nextId}')"> ${post.nextTitle}</i></li>
	   </ul>
	   
 	 </div>
 	 
   </div> 
 	
 	<!-- 댓글 jsp include -->
	<jsp:include page="/view/community/comment.jsp"/>
	
</body>

</html>