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
				
				 var output = "<div class='comment_wrap show'>"
				
				 output += "<div class='comment_count'>"
				 + "<div class='fl num_box'>전체 리플 <em class='font_red'><span id='totalCount'>"+JSONData.resultPage.totalCount+"</span></em>개</div></div>"
				 + "<div class='comment_box'><ul class='cmt_list'>"
				 for(var i in JSONData.list){
					if(JSONData.list[i].deleted == "F"){
						 output += "<li id='comment_li_"+JSONData.list[i].cmtId+"' class='ub-content'>"
						 + "<div class='cmt_info clear'><div class='cmt_nickbox'><span class='gall_writer ub-writer'>"
						 + "<span class='nickname me in' title='"+JSONData.list[i].nickName+"'><em>"+JSONData.list[i].nickName+"</em></span></span></div>"
					if(JSONData.list[i].secret == "T"){
					if(JSONData.userId == JSONData.list[i].cmtWriterId || JSONData.userId == JSONData.list[i].postWriterId){
						 output += "<div class='clear cmt_txtbox btn_reply_write_all' id='"+JSONData.list[i].cmtId+"old'><p class='usertxt ub-word'>"+JSONData.list[i].cmtContent+"<font color=gray> //비밀댓글입니다.</font></p></div>"
					}else{
						 output += "<div class='clear cmt_txtbox btn_reply_write_all' id='"+JSONData.list[i].cmtId+"old'><p class='usertxt ub-word'>비밀댓글입니다.</p></div>"
					}
					}else{
						 output += "<div class='clear cmt_txtbox btn_reply_write_all' id='"+JSONData.list[i].cmtId+"old'><p class='usertxt ub-word'>"+JSONData.list[i].cmtContent+"</p></div>"
					}
						 output += "<form name='"+JSONData.list[i].cmtId+"f'><div style='display: none;' class='new' id='"+JSONData.list[i].cmtId+"neww'><input style='display: none;' type='text' id='"+JSONData.list[i].cmtId+"new' name='cmtContent' value='"+JSONData.list[i].cmtContent+"'/><input type='hidden' name='cmtId' value='"+JSONData.list[i].cmtId+"'/><label><input type='checkbox' id='secret' name='secret' value='T' "
					if(JSONData.list[i].secret == "T"){
						 output += "checked"
					}	 
						 output += ">비밀댓글</label><a onclick='cancel("+JSONData.list[i].cmtId+");'>취소</a><a onclick='updateComment("+JSONData.list[i].cmtId+");'>등록</a></div></form>"
						 
						 + "<div class='fr clear'><span class='date_time'>"+JSONData.list[i].cmtDate+"</span>"
					if(JSONData.list[i].cmtWriterId == JSONData.userId){
						 output += "<div class='cmt_mdf_updat' onclick='showUpdate("+JSONData.list[i].cmtId+");'><button type='button' class='btn_cmt_updat'>수정</button></div><div class='cmt_mdf_del' onclick='deleteComment("+JSONData.list[i].cmtId+");'><button type='button' class='btn_cmt_delete'>삭제</button></div>"
					}
					if(JSONData.userId != null){
					if(JSONData.list[i].cmtLikeFlag == "F"){ 
						output += "<div class='cmt_like'><i onclick='like_func("+JSONData.list[i].cmtId+");' id='"+JSONData.list[i].cmtId+"zz' class='far fa-thumbs-up'>"+JSONData.list[i].cmtLikeCount+"</i></div>"
					}else{
					 	output += "<div class='cmt_like'><i onclick='like_func("+JSONData.list[i].cmtId+");' id='"+JSONData.list[i].cmtId+"zz' class='fas fa-thumbs-up'>"+JSONData.list[i].cmtLikeCount+"</i></div>"	 
					} 
					}else{
						output += "<div class='cmt_like'><i onclick='login_need();' id='"+JSONData.list[i].cmtId+"zz' class='far fa-thumbs-up'>"+JSONData.list[i].cmtLikeCount+"</i></div>"
					}
						output += "&nbsp;<i onclick='reportshow("+JSONData.list[i].cmtId+",\"C\");' class='fas fa-concierge-bell'></i>"
						+ "<i class='fas fa-reply-all' onclick='showrcmt("+JSONData.list[i].cmtId+")'></i>"
						+ "<div class='container'><div class='view_comment'>"
						+ "<form class='form-horizontal' id='"+JSONData.list[i].cmtId+"addRcmt'>"
						+ "<div class='cmt_write_box clear' id='"+JSONData.list[i].cmtId+"rcmt' style='display: none;'><div class='fl'>"
						+ "<div class='user_info_input'><label for='nickName' class='blind'>닉네임</label>"
					    + "<input type='text' id='nickName' name='nickName' placeholder='닉네임' onfocus='this.style.background='#FFFFFF'' maxlength='20' value='${post.nickName}'>"
						+ "</div></div><div class='cmt_txt_cont'>"
					    + "<div class='cmt_write'><textarea id='rcmtContent' name='cmtContent' maxlength='400'></textarea></div>"
						+ "<div class='cmt_cont_bottm clear'><div class='fr'>"
						+ "<label><input type='checkbox' id='secret' name='secret' value='T'>비밀댓글</label>"
						+ "<span onclick='addRecomment("+JSONData.list[i].cmtId+")' class='btn_blue btn_svc small repley_add' id='addRecomment'>등록</span></div></div></div></div>"
						+ "<input type='hidden' id='parentCmtId' name='parentCmtId' value='"+JSONData.list[i].cmtId+"'/><input type='hidden' id='postId' name='postId' value='"+JSONData.list[i].postId+"'/><input type='hidden' id='postWriterId' name='postWriterId' value='"+JSONData.list[i].postWriterId+"'/>"
						+ "</form></div></div>"
						+ "<div id='getRecommentList"+JSONData.list[i].cmtId+"'></div>"
						+ "</div></div></li>"
					}
				 }
						output += "</ul><div class='bottom_paging_box'><div class='cmt_paging'>"
				
						for(var i=JSONData.resultPage.beginUnitPage; i<=JSONData.resultPage.endUnitPage; i++){
							if(JSONData.resultPage.currentPage == i){
								output +="<li class='active'>"
								+"<a onclick='getCommentList("+i+");'>"+i+"<span class='sr-only'>(current)</span></a>"
								+"</li>"
							}
							if(JSONData.resultPage.currentPage != i){
								output +="<li>"
								+"<a onclick='getCommentList("+i+");'>"+i+"</a>"
								+"</li></div></div></div></div>";
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
			$(".clear.cmt_txtbox.btn_reply_write_all").show(); 
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
	<!-- ///////////////////////댓글 작성 view 화면/////////////////////////////// -->
	<div class="view_comment">
	
		<form class="form-horizontal" id="addCmt">
		<!-- 답글 입력 -->
		<div class="cmt_write_box clear">
			<div class="fl">
				<div class="card" style="width: 105px; float: left;">
				  <img src="../../resources/images/userImages/${user.userImg}" class="card-img-top" alt="..." style="height: 70px; width: 100px;">
				  <span id="nickName" name="nickName">${post.nickName}</span>
				</div>
			</div>
			<div class="cmt_txt_cont">
				<div class="cmt_write">
				  <textarea id="cmtContent" name="cmtContent" maxlength="400" style="float: left; margin-bottom: 10px;"></textarea>
				</div>
				<div class="cmt_cont_bottm clear">
					<div class="fr">
						<div class="custom-control custom-radio">
						  <input type="radio" id="secret" name="secret" class="custom-control-input" value="T">
						  <label class="custom-control-label" for="customRadio1" style="font-size: 14px; margin: 7px 7px 0 0">비밀댓글</label>
						  <button type="button" class="btn btn-secondary btn-sm" id="addComment">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		   <input type="hidden" id="postId" name="postId" value="${post.postId}"/>
		   <input type="hidden" id="postWriterId" name="postWriterId" value="${post.postWriterId}">
		</form>
	<!-- 답글쓰기 -->
		<div id="getCommentList"></div>
		
	</div>
	
	</div>