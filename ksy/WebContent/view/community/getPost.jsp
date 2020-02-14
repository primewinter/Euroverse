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
	
	  <nav aria-label="breadcrumb">
		<ol class="breadcrumb">
	     <div class="recom_bottom_box clear" style="width: 1078px;"> 
         	<i class="fas fa-ban" onclick="reportshow('${post.postId}','P')" style="float: right; padding-left: 8px"> 신고</i>
          <c:if test="${post.postLikeFlag == 'F' || post.postLikeFlag == null}">
	   		<i onclick="addBookMark(${post.postId})" class="far fa-bookmark" style="float: right;"> 북마크</i>
	      </c:if>
	      <c:if test="${post.postLikeFlag == 'T' }">
	  		<i onclick="addBookMark(${post.postId})" class="fas fa-bookmark" style="float: right;"> 북마크</i>
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
 	
 	
 	
 	
 	<h3 class="tit"><a onclick="getPost('${post.prevId}')">${post.prevTitle}</a>&nbsp;<i class="fas fa-angle-left"></i>&nbsp;이전글&nbsp;${post.postTitle}&nbsp;다음글&nbsp;<i class="fas fa-angle-right"></i>&nbsp;<a onclick="getPost('${post.nextId}')">${post.nextTitle}</a></h3>
 	
 	
 	<!-- 댓글 jsp include -->
	<jsp:include page="/view/community/comment.jsp"/>
	
</body>

</html>