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
		.writing_view_box {
		    position: relative !important;
		    overflow: hidden;
		}
		.writing_view_box {
		    float: left;
		    max-width: 900px;
		    word-break: break-all;
		    line-height: 1.5;
		}
		.gallview_contents > .inner {
		    margin-bottom: 50px;
		}
		.gallview_head .gall_date, .gallview_head .gall_count, .gallview_head .gall_reply_num, .gallview_head .gall_comment {
		    cursor: default;
		}
		a {
		    color: #333;
		    text-decoration: none;
		}
		em {
		    font-style: italic;
		}
		.gall_writer {
		    position: relative;
		    font-size: 13px;
		    cursor: pointer;
		}
		.gallview_head .gall_writer {
		    padding: 0 2px;
		}
		.gallview_head .title {
		    padding: 0 2px;
		    margin-bottom: 9px;
		    font-size: 14px;
		}
		.gallview_head {
		    margin: 16px 0 29px;
		    padding-bottom: 11px;
		    border-bottom: 1px solid #eee;
		}
		.view_content_wrap {
		    font-family: '굴림',Gulim;
		    font-size: 13px;
		    color: #333;
		}
		.visit_history .tit {
			padding-top: 10px;
		    float: left;
		    font-size: 12px;
		    color: #083A41;
		}
		.issue_wrap {
		    position: relative;
		    width: 1134px;
		    border-top: 3px solid #00A8C1;
		    padding-bottom: 37px;
		    z-index: 13;
		}
		.page_head {
		    height: 37px;
		    margin-bottom: 3px;
		    padding-top: 4px;
		}
		.page-header h3 a {
		    color: #00A8C1;
		}
		.page-header h3 {
		    font-size: 26px;
		    font-family: 'Jeju Hallasan', cursive;
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
		    font-family: Dotum,'돋움',Helvetica,"Apple SD Gothic Neo",sans-serif;
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
		.btn_recommend_box {
		    width: 195px;
		    height: 132px;
		    margin: 0 auto 36px;
		    padding-top: 19px;
		    border: 1px solid #c4c4c4;
		    border-radius: 2px;
		    background: #fff;
		    font-family: Dotum,'돋움';
		}
		.blind {
		    position: absolute;
		    overflow: hidden;
		    visibility: hidden;
		    margin: -1px;
		    width: 0px;
		    height: 0px;
		    top: -9999px;
		    font-size: 0;
		}
		.btn_recommend_box .inner {
		    overflow: hidden;
		    width: 139px;
		    margin-bottom: 13px;
		    padding: 0;
		}
		.up_num_box {
		    float: left;
		    width: 67px;
		    padding: 10px 0 0 11px;
		}
		.up_num_box, .down_num_box {
		    text-align: center;
		    font-size: 16px;
		    font-weight: bold;
		    color: #555;
		}
		.font_red {
		    color: #d31900;
		}
		.btn_recom_up {
		    float: right;
		    width: 56px;
		}
		.recom_bottom_box {
		    clear: both;
		    position: relative;
		    height: 37px;
		    border-top: 1px solid #c4c4c4;
		}
		.btn_hitgall {
		    margin-left: 0;
		}
		.btn_hitgall, .btn_snsmore, .btn_report {
		    display: block;
		    float: left;
		    width: 95px;
		    height: 37px;
		    margin-left: 1px;
		    border-right: 1px solid #c4c4c4;
		    background: #f9f9f9;
		    font-family: '굴림',Gulim;
		    font-size: 12px;
		    color: #555;
		    text-shadow: 0px 1px #fff;
		}
		.icon_report {
		    display: inline-block;
		}
		.sp_img {
		    background-image: url(https://nstatic.dcinside.com/dc/w/images/sp/sp_img.png?1145);
		    background-repeat: no-repeat;
		}
		.btn_snsmore {
		    width: 96px;
		}
		.icon_report {
		    width: 18px;
		    height: 20px;
		    background-position: -74px -241px;
		    margin-right: 6px;
		    vertical-align: -4px;
		}
		.btn_report {
		    border-right: 0;
		}
		.view_content_wrap .tagbox {
		    clear: both;
		    float: left;
		    width: 100%;
		    margin-bottom: 12px;
		}
		.view_content_wrap .tagbox dt {
		    float: left;
		    width: 52px;
		    height: 14px;
		    /* text-indent: -9999em; */
		    overflow: hidden;
		}
		.view_content_wrap .tagbox dd {
		    float: left;
		    width: 567px;
		    color: #999;
		    line-height: 1.4;
		}
		.view_content_wrap .tagbox dd a {
		    display: inline;
		    word-break: break-all;
		    word-wrap: break-word;
		    color: #999;
		}
		.view_content_wrap .tagbox dd i {
		    margin: 0 4px 0 2px;
		}
		a:visited, a:active {
		    text-decoration: none;
		}
		a {
		    color: #333333;
		    text-decoration: none;
		}
		a:-webkit-any-link {
		    color: -webkit-link;
		    cursor: pointer;
		    text-decoration: underline;
		}
		i, em, u, cite {
		    font-style: normal;
		}
		i {
		    font-style: italic;
		}
		/* 댓글 css */
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
		    border-top: 2px solid #00A8C1;
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
		    border-bottom: 2px solid #00A8C1;
		}
		.cmt_write_box {
		    padding: 12px 12px 12px;
		    background: #fafafa;
		    border-top: 2px solid #00A8C1;
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
		.fl {
		    float: left;
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
					$(".up_num_box p").html(data.like); //id값이 like_result인 html을 찾아서 data.like값으로 바꿔준다.
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
	        $("#dialog-add").dialog("open");     
	    };
		
		$(function(){

		    $("#dialog-add").dialog({
		        autoOpen: false,
		        buttons:[
		            {
		                text: "신고",
		                click: function(){
		                	
		                	if($('#reportReason option:selected').val() == 'E'){
		                		
			                	var reportContent = $("input[name='reportContent']").val();
			                	
			            		if(reportContent == null || reportContent.length<1){
			            			alert("내용은 반드시 입력하세요.");
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
   	
	<div id="dialog-add" title="신고 작성">
	  <form id="reportform">
	    <p>신고사유</p>
	    <select id="reportReason" name="reportReason">
	      <option value="F">욕설</option>
	      <option value="A">음란물</option>
	      <option value="R">허위사실</option>
	      <option value="E">기타</option>
	    </select>
	    <div class="layer"><input type="text" id="reportContent" name="reportContent" placeholder="기타 내용을 입력하세요."/></div>
	      <input type="hidden" id="refId" name="refId" value="">
	      <input type="hidden" id="reportTarget" name="reportTarget" value="">
	  </form>	
	</div>
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	  <div class="page_head clear">
		<div class="page-header">
	     <c:if test="${param.boardName=='A'}">
		   <h3><a>자유게시판</a></h3>
		 </c:if>
		 <c:if test="${param.boardName=='B'}">
		   <h3><a>정보공유</a></h3>
		 </c:if>
		 <c:if test="${param.boardName=='C'}">
		   <h3><a>인기글게시판</a></h3>
		 </c:if>
		 <c:if test="${param.boardName=='E'}">
		   <h3><a>플래너공유</a></h3>
		 </c:if>
		 <c:if test="${param.boardName=='F'}">
		   <h3><a>여행후기</a></h3>
		 </c:if>
		 <c:if test="${param.boardName=='G'}">
		   <h3><a>QnA</a></h3>
		 </c:if>
	    </div>
	  </div>
	  
	  <div class="issue_wrap">  
	    <div id="visit_history" class="visit_history">
	      <h3 class="tit"><a onclick="getPost('${post.prevId}')">${post.prevTitle}</a>&nbsp;<i class="fas fa-angle-left"></i>&nbsp;이전글&nbsp;${post.postTitle}&nbsp;다음글&nbsp;<i class="fas fa-angle-right"></i>&nbsp;<a onclick="getPost('${post.nextId}')">${post.nextTitle}</a></h3>
	    </div>
	  </div>
	  
	  <div class="view_content_wrap">
	    <div class="gallview_head clear ub-content">
	      <h3 class="title ub-word">
	      	<span class="title_subject">${post.postTitle}</span>
	      </h3>

	  <div class="gall_writer ub-writer" data-nick="${post.nickName}" data-uid="${post.postWriterId}" data-ip data-loc="view">
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
	      <h3 class="blind">추천</h3>
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
	      <div class="recom_bottom_box clear"> 
	        <button type="button" class="btn_snsmore" data-no="${post.postId}">
	      <c:if test="${post.postLikeFlag == 'F' || post.postLikeFlag == null}">
		    <i onclick="addBookMark(${post.postId})" class="far fa-bookmark"></i>
		  </c:if>
		  <c:if test="${post.postLikeFlag == 'T' }">
		    <i onclick="addBookMark(${post.postId})" class="fas fa-bookmark"></i>
		  </c:if>
	           	북마크
	        </button>  
	        <button type="button" class="btn_report" data-no="${post.postId}">
	           <em onclick="reportshow('${post.postId}','P')" class="sp_img icon_report"></em> 
	         	신고
	        </button>  
	      </div>
	    </div>
	  </div>
	     <dl class="tagbox">
	       <dt>태그</dt>
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
		     <button type="button" class="updatePost">수정</button>
	  	     <button type="button" class="deletePost">삭제</button>
		   </div>
		 </c:if>
	     </dl>
	 </div>
   </div> 
 	
 	<!-- 댓글 jsp include -->
	<jsp:include page="/view/community/comment.jsp"/>
	
</body>

</html>