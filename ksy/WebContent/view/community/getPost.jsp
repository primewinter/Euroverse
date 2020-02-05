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
		
		//============= 회원정보수정 Event  처리 =============	
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button" ).on("click" , function() {
					self.location = "/community/updatePost?postId=${post.postId}"
			 });
		});
		
		$(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "a[href='#']" ).on("click" , function() {
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
					$("#like_result").html(data.like); //id값이 like_result인 html을 찾아서 data.like값으로 바꿔준다.
				},
				error:
				function (request, status, error){
					alert("ajax실패")
				}
			});
		}
	 	
		function login_need(){
			alert("로그인 후 이용 가능")
		}
		
		$(function(){

		    $("#dialog-add").dialog({
		        autoOpen: false,
		        buttons:[
		            {
		                text: "신고",
		                click: function(){
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
		            },
		            {
		                text: "취소",
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
	      <input type="hidden" id="refId" name="refId" value="${post.postId}">
	      <input type="hidden" id="reportTarget" name="reportTarget" value="P">
	  </form>	
	</div>
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">게시글조회</h3>
	    </div>
	
		<div class="row">
			<div class="col-xs-8 col-md-4">${post.postTitle}</div>
		
	    <form id="likeform">
			<input type="hidden" name="postId" value="${post.postId}">
			<input type="button" value="좋아요!" onclick="return like()"> 
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
	  			<button type="button" class="btn btn-primary">수정</button>
	  	  &nbsp;<a class="btn btn-primary btn" href="#" role="button">삭제</a>
	  		</div>
		</div>
		</c:if>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
	<jsp:include page="/view/community/comment.jsp"/>
	
</body>

</html>