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
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".btn.btn-primary" ).on("click" , function() {
					self.location = "/community/updatePost?postId=${post.postId}"
			 });
		});
		
		$(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#delbutton" ).on("click" , function() {
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
					$(".fas.fa-grin-hearts").html(data.like); //id값이 like_result인 html을 찾아서 data.like값으로 바꿔준다.
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
		                    		alert("신고 완료!");
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
	
		<div class="page-header">
	       <h3 class=" text-info">게시글조회</h3>
	       <div class="col-xs-8 col-md-4">조회수 ${post.views} | 댓글수 ${post.comments}</div>
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
			<div class="col-xs-8 col-md-4">${post.accPerson} / ${post.accPerson}</div>
		</div>
			
		
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.nickName} || ${post.postDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.postContent}</div>
		</div>
		
		<button type="button" class="btn btn-info">동행참여신청하기</button>
		
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.accPerson} / ${post.accPerson}</div>
		</div>
		
		<div class="row">
			<div class="col-xs-8 col-md-4">
			태그
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
	  			<button type="button" class="btn btn-primary">수정</button>
	  	  &nbsp;<a id="delbutton" class="btn btn-primary btn" href="#" role="button">삭제</a>
	  		</div>
		</div>
		</c:if>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
	<jsp:include page="/view/community/comment.jsp"/>
	
</body>

</html>