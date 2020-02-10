<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<script type="text/javascript">

	jQuery(document).ready(function($){
		getCommentList(1);
		setTimeout("getRcmtList()", 100);
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
					
					//글 작성자에게 push 하기
					var receiverId = data.postWriterId;
					var pushType = 'C';
					sendPush(receiverId, pushType);
				}
			});
		});
	});
	
	function addRecomment(cmtId) {
		
			$.ajax({
				url : '/community/json/addComment' ,
				type : "POST" ,
				cache : false ,  
				dataType : "json" ,
				data : $('#'+cmtId+'addRcmt').serialize() ,
				success : function(data) {
					getRcmtList();
					$('#rcmtContent').val('');
					
					//글 작성자에게 push 하기
					var receiverId = data.postWriterId;
					var pushType = 'R';
					sendPush(receiverId, pushType);
				}
			});
		}
	
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
				
				if(JSONData.list[i].deleted == "F"){
					output += "<tr>"
					+"<td>"+JSONData.list[i].nickName+"&nbsp;&nbsp;"+JSONData.list[i].cmtDate
				if(JSONData.list[i].cmtWriterId == JSONData.userId){
					output += "&nbsp;<a onclick='showUpdate("+JSONData.list[i].cmtId+");'>수정</a><a onclick='deleteComment("+JSONData.list[i].cmtId+");'>삭제</a>"
				}
				if(JSONData.userId != null){
				if(JSONData.list[i].cmtLikeFlag == "F"){ 
				output += "<i onclick='like_func("+JSONData.list[i].cmtId+");' id='"+JSONData.list[i].cmtId+"zz' class='far fa-thumbs-up'>"+JSONData.list[i].cmtLikeCount+"</i>"
				}else{
			 	output += "<i onclick='like_func("+JSONData.list[i].cmtId+");' id='"+JSONData.list[i].cmtId+"zz' class='fas fa-thumbs-up'>"+JSONData.list[i].cmtLikeCount+"</i>"	 
				} 
				}else{
					output += "<i onclick='login_need();' id='"+JSONData.list[i].cmtId+"zz' class='far fa-thumbs-up'>"+JSONData.list[i].cmtLikeCount+"</i>"
				}
					output += "&nbsp;<i onclick='reportshow("+JSONData.list[i].cmtId+",\"C\");' class='fas fa-concierge-bell'></i>"
					+ "<i class='fas fa-reply-all' onclick='showrcmt("+JSONData.list[i].cmtId+")'></i>"
				if(JSONData.list[i].secret == "T"){
				if(JSONData.userId == JSONData.list[i].cmtWriterId || JSONData.userId == JSONData.list[i].postWriterId){
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
					+"<div class='container'>"
					+"<form class='form-horizontal' id='"+JSONData.list[i].cmtId+"addRcmt'>"
					+"<div style='display: none;' class='form-group' id='"+JSONData.list[i].cmtId+"rcmt'>"
					+"<input type='text' id='rcmtContent' name='cmtContent'>"
					+"<span onclick='addRecomment("+JSONData.list[i].cmtId+")' id='addRecomment'>등록</span>"
					+"&nbsp;<label><input type='checkbox' id='secret' name='secret' value='T'>비밀댓글</label>"
					+"</div>"
					+"<input type='hidden' id='parentCmtId' name='parentCmtId' value='"+JSONData.list[i].cmtId+"'/><input type='hidden' id='postId' name='postId' value='"+JSONData.list[i].postId+"'/>"
					+"</form>"
					+"</div>"
					+"<div id='getRecommentList"+JSONData.list[i].cmtId+"'></div>"
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
				
				getRcmtList();
			  }
		   });
		}
	
		function getRcmtList(){
			
			var postId = $("input[name='postId']").val();
			
			$.ajax({
				url : '/community/json/getRcmtList/'+postId ,
				type : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status){
					$(".recmt").html("");
			
					for(var i in JSONData.list){
						var output = "";
						if(JSONData.list[i].deleted == "F"){
							output += "<tr class='recmt'>"
							+"<td><i class='fas fa-angle-double-right'></i>"+JSONData.list[i].nickName+"&nbsp;&nbsp;"+JSONData.list[i].cmtDate
						if(JSONData.list[i].cmtWriterId == JSONData.userId){
							output += "&nbsp;<a onclick='showUpdate("+JSONData.list[i].cmtId+");'>수정</a><a onclick='deleteComment("+JSONData.list[i].cmtId+");'>삭제</a>"
						}
						if(JSONData.userId != null){
						if(JSONData.list[i].cmtLikeFlag == "F"){ 
						output += "<i onclick='like_func("+JSONData.list[i].cmtId+");' id='"+JSONData.list[i].cmtId+"zz' class='far fa-thumbs-up'>"+JSONData.list[i].cmtLikeCount+"</i>"
						}else{
					 	output += "<i onclick='like_func("+JSONData.list[i].cmtId+");' id='"+JSONData.list[i].cmtId+"zz' class='fas fa-thumbs-up'>"+JSONData.list[i].cmtLikeCount+"</i>"	 
						} 
						}else{
							output += "<i onclick='login_need();' id='"+JSONData.list[i].cmtId+"zz' class='far fa-thumbs-up'>"+JSONData.list[i].cmtLikeCount+"</i>"
						}
							output += "&nbsp;<i onclick='reportshow("+JSONData.list[i].cmtId+",\"R\");' class='fas fa-concierge-bell'></i>"
						if(JSONData.list[i].secret == "T"){
						if(JSONData.userId == JSONData.list[i].cmtWriterId || JSONData.userId == JSONData.list[i].postWriterId){
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
						$("#getRecommentList"+JSONData.list[i].parentCmtId).append(output);
						
						}
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
					setTimeout("getRcmtList()", 100);
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
	   			    	setTimeout("getRcmtList()", 100);
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
					msg += data.msg;
					
					alert(msg);
					
					if(data.likeCheck == 'F'){
					  $("#"+cmtId+"zz").attr('class','far fa-thumbs-up');
					}else{
					  $("#"+cmtId+"zz").attr('class','fas fa-thumbs-up');
					}      
					  $("#"+cmtId+"zz").html(data.cmtLikeCount);
				},
				error: function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
		function showrcmt(cmtId){
			console.log(cmtId);
			$("#"+cmtId+"rcmt").toggle();
		}
	
	</script>
	
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