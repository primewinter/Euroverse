<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<style></style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	jQuery(document).ready(function($){
		getCommentList(1);
	});
	
	$(function(){
		$("#addComment").on("click" , function() {
			$.ajax({
				url : '/community/json/addComment' ,
				type : "POST" ,
				cache : false ,  
				dataType : "json" ,
				data : $('#addCmt').serialize() ,
				success : function(data) {
					getCommentList(1);
					$('#cmtContent').val('');
				}
			});
		});
	});
	
	function getCommentList(currentPage){
		
		var postId = $("input[name='postId']").val();

		$.ajax({
			url : '/community/json/getCommentList/'+postId+'/'+currentPage ,
			type : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},  
			success : function(JSONData , status) {
				var output = "<table><strong>전체 댓글 "+JSONData.resultPage.totalCount+"개</strong>";
				for(var i in JSONData.list){
					console.log(JSONData.list[i].cmtLikeCount);
					console.log(JSONData.list[i].cmtLikeFlag);
					console.log(JSONData.list[i].cmtId);
				if(JSONData.list[i].deleted == "F"){
					output += "<tr>"
					+"<td>"+JSONData.list[i].cmtWriterId.userId+"&nbsp;&nbsp;"+JSONData.list[i].cmtDate
				if(JSONData.list[i].cmtWriterId.userId == JSONData.userId){
					output += "&nbsp;<a onclick='showUpdate("+JSONData.list[i].cmtId+");'>수정</a><a onclick='deleteComment("+JSONData.list[i].cmtId+");'>삭제</a>"
				}
				if(JSONData.userId != null){
				if(JSONData.list[i].cmtLikeFlag == "F"){ 
				output += "<a onclick='like_func("+JSONData.list[i].cmtId+");'><input type='text' value='♡' id='"+JSONData.list[i].cmtId+"zz'></a><span id='"+JSONData.list[i].cmtId+"count'>"+JSONData.list[i].cmtLikeCount+"</span>"
				}else{
			 	output += "<a onclick='like_func("+JSONData.list[i].cmtId+");'><input type='text' value='♥' id='"+JSONData.list[i].cmtId+"zz'></a><span id='"+JSONData.list[i].cmtId+"count'>"+JSONData.list[i].cmtLikeCount+"</span>"	 
				} 
				}else{
					output += "<a onclick='login_need();'><input type='text' value='♡'></a><span id='"+JSONData.list[i].cmtId+"count'>"+JSONData.list[i].cmtLikeCount+"</span>"
				}
					output += "&nbsp;<i onclick='reportshow("+JSONData.list[i].cmtId+",\"C\");' class='glyphicon glyphicon-remove'></i>";
				if(JSONData.list[i].secret == "T"){
				if(JSONData.userId == JSONData.list[i].cmtWriterId.userId || JSONData.userId == JSONData.list[i].postWriterId){
					output += "<h5 class='old' id='"+JSONData.list[i].cmtId+"old'>"+JSONData.list[i].cmtContent+"<font color=orange> *비밀댓글입니다.*</font></h5>"
				}else{
					output += "<br>비밀댓글입니다!"
				}
				}else{
					output += "<h5 class='old' id='"+JSONData.list[i].cmtId+"old'>"+JSONData.list[i].cmtContent+"</h5>"
				}
					output += "<form name='"+JSONData.list[i].cmtId+"f'><div style='display: none;' class='new' id='"+JSONData.list[i].cmtId+"neww'><input style='display: none;' type='text' id='"+JSONData.list[i].cmtId+"new' name='cmtContent' value='"+JSONData.list[i].cmtContent+"'/><input type='hidden' name='cmtId' value='"+JSONData.list[i].cmtId+"'/><label><input type='checkbox' id='secret' name='secret' value='T' "
				if(JSONData.list[i].secret == "T"){
					output += "checked"
				}
					output += ">비밀댓글</label><a onclick='cancel("+JSONData.list[i].cmtId+");'>취소</a><a onclick='updateComment("+JSONData.list[i].cmtId+");'>등록</a></div></form>"
					+"</td><tr>"
				}
				}
				output += "<table>"
				
				for(var i=JSONData.resultPage.beginUnitPage; i<=JSONData.resultPage.endUnitPage; i++){
					if(JSONData.resultPage.currentPage == i){
						output +="<li class='active'>"
						+"<a onclick='getCommentList("+i+");'>"+i+"<span class='sr-only'>(current)</span></a>"
						+"</li>"
					}
					if(JSONData.resultPage.currentPage != i){
						output +="<li>"
						+"<a onclick='getCommentList("+i+");'>"+i+"</a>"
						+"</li>";
					}
				}
				$("#getCommentList").html(output);
			  }
		   });
		}
	
		function cancel(cmtId){
			$(".new").hide();
			$("#"+cmtId+"old").show();
		}
	
		function showUpdate(cmtId){ //수정 클릭시 onclick function으로 댓글 수정 화면
			$(".old").show(); 
			$(".new").hide(); //다른 모든 댓글 수정칸 숨김
			$("#"+cmtId+"neww").show(); //누른 댓글의 수정칸 출력
			$("#"+cmtId+"new").show(); 
			$("#"+cmtId+"old").hide(); //누른 댓글의 원 내용 숨김
		}
		
		function updateComment(cmtId){
			$.ajax({
				url : '/community/json/updateComment' ,
				type : "POST" ,
				data : $("form[name='"+cmtId+"f']").serialize() ,
				dataType : "json" ,
				success : function(JSONData , status){
					getCommentList(1);
				}
			}); 
		}
		
		function deleteComment(cmtId){
	
			var result = confirm("댓글을 삭제하시겠습니까?");
			
			if(result){
				$.ajax({
					url : '/community/json/deleteComment/'+cmtId ,
					type : "GET" ,
					dataType : "json" ,
					headers : {
		   				"Accept" : "application/json",
		   				"Content-Type" : "application/json"
	   			    },
	   			    success : function(JSONData , status){
	   			    	getCommentList(1);
	   			    }
				});
			}
		}
		
		function like_func(cmtId){

			$.ajax({
				url : '/community/json/like/'+cmtId ,
				type : "GET" ,
				cache : false ,
				dataType : "json" ,
				success : function(data) {
					var msg = '';
					var like_img = '';
					msg += data.msg;
					alert(msg);
					
					if(data.likeCheck == 'F'){
					  like_img = "♡";
					}else{
					  like_img = "♥";
					}      
					$("#"+cmtId+"zz").val(like_img);
					$("#"+cmtId+"count").html(data.cmtLikeCount);
					$('#like_check').html(data.likeCheck);
				},
				error: function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	
	</script>
    
</head>

<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" id="addCmt">
		
		<div class="form-group">
		    <input type="text" id="cmtContent" name="cmtContent">
		    <span id="addComment">등록</span>
		    &nbsp;<label><input type="checkbox" id="secret" name="secret" value="T">비밀댓글</label>
		</div>
		    <input type="hidden" id="postId" name="postId" value="${post.postId}"/>
		</form>
		
		<div id="getCommentList"></div>

	</div>
	
</body>
</html>