<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${  empty user }">
		<jsp:forward page="/"/>
	</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- jquery Ui 링크 (datePicker)  -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!--datePicker CDN  -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- boot strap File upload CDN  -->
<script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.js"></script>

<!-- swiper CDN -->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<!--========================= -->

<!-- fontawesome CDN -->
<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.media{
	margin:20px;
}

.media .media-body{
	margin: 20px;
}

.inner{
	display: inline-block;
	background-color: white;
	border-bottom-left-radius : 15px;
	border-bottom-right-radius : 15px;
	box-shadow : 5px 5px 7px #C3C0C0;
	height: 100%;
	width:100%;
	margin-bottom: 10px;
}



</style>



<script>

var maPageCode = 'Q';

function fncGetUserList(currentPage) {
	$("#currentPage").val(currentPage)
	$("#qnaForm").attr("method" , "POST").attr("action" , "/myPage/addQnaAndQnaList").submit();
}



$(function(){
	
	$(".updateQna").on("click",function(){
		var num = $(this).next().next().val();
		
		var qnaFirstCate = $('#qnaFirstCate'+num).val();
		var postTitle = $('#postTitle'+num).val();
		var postContent = $('#postContent'+num).val();
		
		if(postTitle == "" || postTitle == null){
			alert("제목은 꼭 입력해주세요");
			return;
		}
		
		if(qnaFirstCate=="" || qnaFirstCate==null){
			alert("1차분류는 꼭 선택해주세요");
			return;
		}
		
		if(postContent == "" || postContent==null){
			alert("내용을 입력해주세요");
			return;
			
		}
		
		
		
		$("#qnaUpdateForm"+num).attr("action","/myPage/updateQna").attr("method","post").submit();
		
	})
	
	$(".fa-cog").on("click",function(){
		var postId = $(this).next().val();
		var num = $(this).next().next().val();
		
		$("#mediaBody"+num).css("display","none");
		$("#updateDiv"+num).css("display","block");
		
		//$("#qnaUpdateForm"+num).attr("action","/myPage/updateQna").attr("method","post").submit();
		
	})
	
	$(".fa-times-circle").on("click",function(){
		var postId = $(this).next().val();
		var num = $(this).next().next().val();
		$(self.location).attr("href","/myPage/deleteQna?postId="+postId);				
	})
		
	
	/*답글보는 로직  */
	 $("b:contains('답글보기')").on("click",function(){
		console.log($(this).next().val());
		var postId = $(this).next().val();
		var num = $(this).next().next().val();
		 
					$.ajax({
						url : "/myPage/json/getQnaCommentList",
						method : "post",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							postId : postId
						}),
						success : function(JSONData) {
							console.log(JSONData);
							if(JSONData.returnMessage=='ok'){
								
								var qnaCommentList = JSONData.qnaCommentList;
								console.log(qnaCommentList);
								$("#appendCommentDiv"+num).html("");
								
								for(var i=0;i<qnaCommentList.length;i++){
									
									$("#appendCommentDiv"+num).append("<div class='media mt-3'>");
									$("#appendCommentDiv"+num).append("<div class='media-body'>");
									$("#appendCommentDiv"+num).append("<h5 class='mt-0' style='text-align: right;'>"+"답글"+"</h5>");
									$("#appendCommentDiv"+num).append("<div align='right'><small>"+qnaCommentList[i].cmtDate+" , "+qnaCommentList[i].nickName+"</small></div>");
									$("#appendCommentDiv"+num).append("<div id='qnaContentDiv' style='margin-top: 20px;text-align: right;'>"+qnaCommentList[i].cmtContent+"</div>");
									
								}
								
								
							}else if(JSONData.returnMessage=='error'){
							/* 	<div class="media mt-3">
						      	<div class="media-body">
							        <h5 class="mt-0" style="text-align: right;">답변제목</h5>
									<div align="right">
							        <small>답변 날짜 , 답변자</small>
									</div>
							        <div id="qnaContentDiv" style="margin-top: 20px;text-align: right;">
										답변내용
					 			  	</div>
						      </div>
						    </div>  */
								
								
								
							}
						}
					})
		
	 })/*답글보는 로직 end  */
	
	$("#yes").on("click",function(){
		var qnaFirstCate = $('#qnaFirstCate');
		var qnaSecondCate = $("#qnaSecondCate");
		var postContent = $("#postContent");
		var postTitle = $("#postTitle");
		
		
		
		if(postTitle.val()=="" || postTitle.val()==null){
			alert("제목을 입력해주세요");
			return;
		}
		
		if(qnaFirstCate.val()=="" || qnaFirstCate.val()==null){
			alert("1차분류는 꼭 선택해주세요.");
			return;
		}
		
		if(postContent.val()=="" || postContent.val()==null){
			alert("내용을 입력해주세요");
			return;
		}
		
		
		$("#qnaForm").attr("action","/myPage/addQna").attr("method","post").submit();
		
		
	})
	
	$("#no").on("click",function(){
		var qnaFirstCate = $('#qnaFirstCate');
		var qnaSecondCate = $("#qnaSecondCate");
		var postContent = $("#postContent");
		var postTitle = $("#postTitle");
		
 		$("#qnaFirstCate option:eq(0)").prop("selected", true);
		qnaSecondCate.css("display","none");
		$(".secondCate").remove();
		postContent.val("");
		postTitle.val("");
	})
	
	$(".updateDelete").on("click",function(){
		var num = $(this).next().val();
		
		$("#mediaBody"+num).css("display","block");
		$("#updateDiv"+num).css("display","none");
		
	})
	
	

	$('#qnaFirstCate').change(function() {
		var state = $('#qnaFirstCate option:selected').val();
		
		var qnaSecondCate = $("#qnaSecondCate");
		
		
		if ( state == 'A' ) {
			$(".secondCate").remove();
			qnaSecondCate.css("display","block");
			qnaSecondCate.append("<option disabled selected hidden>2차분류</option>");
			qnaSecondCate.append("<option value='D' class='secondCate'>결제</option>");
			qnaSecondCate.append("<option value='E' class='secondCate'>환불</option>");
		
		}else if(state == 'B') {
			$(".secondCate").remove();
			qnaSecondCate.css("display","block");
			qnaSecondCate.append("<option disabled selected hidden>2차분류</option>");
			qnaSecondCate.append("<option value='F' class='secondCate'>항공권</option>");
			qnaSecondCate.append("<option value='G' class='secondCate'>숙소</option>");
		}else if(state =='C'){
			$(".secondCate").remove();
			qnaSecondCate.css("display","none");
		}
	

	});
	
	$('.qnaFirstCateClass').change(function() {
		var num = $(this).next().val();
		var state = $('#qnaFirstCate'+num+' option:selected').val();
		
		console.log($('.qnaFirstCateClass'))
		
		var qnaSecondCate = $("#qnaSecondCate"+num);
		
		
		if ( state == 'A' ) {
			$('.qnaSecondCateClass2').remove();
			qnaSecondCate.html("");
			qnaSecondCate.css("display","block");
			qnaSecondCate.append("<option disabled selected hidden>2차분류</option>");
			qnaSecondCate.append("<option value='D' class='qnaSecondCateClass2'>결제</option>");
			qnaSecondCate.append("<option value='E' class='qnaSecondCateClass2'>환불</option>");
		
		}else if(state == 'B') {
			qnaSecondCate.html("");
			$(".qnaSecondCateClass2").remove();
			qnaSecondCate.css("display","block");
			qnaSecondCate.append("<option disabled selected hidden>2차분류</option>");
			qnaSecondCate.append("<option value='F' class='qnaSecondCateClass2'>항공권</option>");
			qnaSecondCate.append("<option value='G' class='qnaSecondCateClass2'>숙소</option>");
		}else if(state =='C'){
			qnaSecondCate.html("");
			$(".qnaSecondCateClass2").remove();
			qnaSecondCate.css("display","none");
		}
	
	
	});

})
</script>


</head>
<body>
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>
<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>
	
   <div style="height: 100px;"></div>
		
<form id="qnaForm">		
 	<input type="hidden" id="currentPage" name="currentPage" value=0 />
		
	<div class="container mt-3">
		  <div class="d-flex flex-column mb-3">
		   
		   <div class="row">
		   
		   <div style="position:fixed; width: 230px;"></div>
		   
		   <div style="">
		    
			    <div class="p-2 ">
			    <h2>1:1문의 작성</h2>
			 		<input type="text" id="postTitle" name="postTitle" placeholder="제목을 입력해주세요." class="form-control" style="width: 200px;margin-bottom: 5px;">
			    <select id="qnaFirstCate" name="qnaFirstCate" class="form-control" style="width: 150px;height: 35px;float: left; margin-right: 20px;">
			        <option disabled selected hidden>1차분류</option>
			        <option value="A">주문관련</option>
			        <option value="B">상품관련</option>
			        <option value="C">기타</option>
			    </select>
			    
			    
			    <select id="qnaSecondCate" name="qnaSecondCate" class="form-control" style="width: 150px;height: 35px; display: none;">
			        
			    </select>
			    
	  	 	 </div><!--1:1문의작성  -->
			 <div class="p-2 ">
			 	<div class="md-form">
				  	<textarea id="postContent" name="postContent" placeholder="문의사항을 작성해주세요." class="md-textarea form-control" rows="3" style="width: 700px;margin-bottom: 10px;"></textarea>
					<button id="yes" type="button" class="btn btn-primary" style="margin-left: 575px;margin-right:17px; float: left;">작성</button>
			 		<button id="no" type="button" class="btn btn-secondary">취소</button>
				</div>
			 </div>
			 </div>
		 </div>
</form>			


		<c:forEach var="qna" items="${qnaList}" varStatus="status">	
		<!-- 나의 1:1 문의 태그 시작 부분  -->
		<form id="qnaUpdateForm${status.index}">
			<input type="hidden" value="${qna.postId}" name="postId">
			<div style="width: 100%" class="row">
				<div style="width: 230px;"></div>
				<div style="width: 70%;">
					<div>
						<h2>나의 1:1문의</h2>
					</div>
					<div class="inner">
						<div style="padding: 5px 25px" class="row">
							<div
								style="margin: 8px; text-align: right; display: inline-block; height: 70px; width: 70px;">
								<img id="qimg" style="width: 40px;" alt=""
									src="/resources/images/admin/Qicon.png">
							</div>
							<div>
								<div
									style="width: 300px; height: 20px; margin: 5px 5px 5px 5px;">${qna.postContent}</div>
								<div
									style="height: 20px; font-size: 9pt; font-family: 돋움; color: #4EC2F8; height: 20px; margin: 2px 5px 5px 5px;">
									<c:if test="${qna.qnaFirstCate != 'A' }">
					   					주문관련
					   				</c:if>
									<c:if test="${qna.postGrade == 'Q' }">
					   					상품관련
					   				</c:if>
									<c:if test="${qna.postGrade == 'Q' }">
					   					기타
					   				</c:if>
									${qna.postGrade}
									<c:if test="${qna.postGrade != 'Q' }">
										<span class="badge badge-pill badge-secondary">답변없음</span>
									</c:if>
									<c:if test="${qna.postGrade == 'Q' }">
										<span class="badge badge-pill badge-success">답변완료</span>
									</c:if>
								</div>
								<div style="font-size: 11pt; color: rgb(240, 168, 72);">
									<i class="fas fa-clock"></i>${qna.postDate}에 질문하셨습니다.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			</div>
		</form>
		<!-- 나의 1:1 문의 태그 시작 부분  -->
		</c:forEach>

			<hr class="one">
			
    	<div class="p-2 ">



		<c:forEach var="qna" items="${qnaList}" varStatus="status">	
		    	<form id="qnaUpdateForm${status.index}">
		    	<input type="hidden" value="${qna.postId}" name="postId">
		    	
		    	
		    	
		    		<div class="media border border-info">
					  <div id="mediaBody${status.index}" class="media-body">
					   		<div id="deleteQna${status.index}" align="right">
					   		<i class="far fa-times-circle" style="font-size: 20px;"></i>
					   		<input type="hidden" value="${qna.postId}">
					   		<input type="hidden" value="${status.index}">
					   		</div>
					   		<h4>
					   		${qna.postTitle}
					   		<i class="fas fa-cog"style="font-size: 15px;"></i>
					   		<input type="hidden" value="${qna.postId}">
					   		<input type="hidden" value="${status.index}">
					   		</h4>
					   		
					    	<c:if test="${qna.postGrade != 'Q' }">
					   			<span class="badge badge-pill badge-secondary">답변없음</span>
					   		</c:if>	
					   		
					   		<c:if test="${qna.postGrade == 'Q' }">
					   			<span class="badge badge-pill badge-success">답변완료</span>
					   		</c:if>
					   		   	
					    
					    
					    <small>
					    <c:set var="qnaDate" value="${fn:split(qna.postDate,' ')}"></c:set>
					    <c:out value="${qnaDate[0]}"></c:out>
					    
					    
					    <c:if test="${qna.qnaFirstCate=='A'}">
					    	주문관련
					    </c:if>
					    <c:if test="${qna.qnaFirstCate=='B'}">
					    	상품관련
					    </c:if>
					    <c:if test="${qna.qnaFirstCate=='C'}">
					    	기타
					    </c:if>
					    
					    &nbsp;
					    
					    <c:if test="${qna.qnaSecondCate=='D'}">
					    	결제
					    </c:if>
					    <c:if test="${qna.qnaSecondCate=='E'}">
					    	환불
					    </c:if>
					    <c:if test="${qna.qnaSecondCate=='F'}">
					    	항공권
					    </c:if>
					    <c:if test="${qna.qnaSecondCate=='G'}">
					    	숙소
					    </c:if>
					  </small>
					   <div id="qnaContentDiv" style="margin-top: 20px;">
					    ${qna.postContent}
					   </div>
					   		
					   
				   		
				   		<c:if test="${qna.postGrade == 'Q' }">
				   		 <span style="float: right;">
				   				<b><i class="fas fa-arrow-down"></i>답글보기</b>
				   				<input type="hidden" value="${qna.postId}">
				   				<input type="hidden" value="${status.index}">
				   				</span>
				   		</c:if>
				   		   	
				  		 <div id="appendCommentDiv${status.index}">
					   		
					   			 
					   
					   
					   	</div>
					   	
					  </div>
					  
					  
					</div>
					
							<div id="updateDiv${status.index}" style="display: none;">
								<div class="container mt-3">
								  <div class="d-flex flex-column mb-3">
								    <div class="p-2 ">
				  						<input type="text" id="postTitle${status.index}" name="postTitle" value="${qna.postTitle}" class="form-control" style="width: 200px;margin-bottom: 5px;">
									  
									    <select id="qnaFirstCate${status.index}" name="qnaFirstCate" class="form-control qnaFirstCateClass" style="width: 150px;height: 35px;float: left; margin-right: 20px;">
									      
									       <c:if test="${qna.qnaFirstCate=='A'}">
										    	<option value="A">주문관련</option>
											    <option value="B">상품관련</option>
											    <option value="C">기타</option>
										    </c:if>
										    <c:if test="${qna.qnaFirstCate=='B'}">
									     		<option value="B">상품관련</option>
										    	<option value="A">주문관련</option>
									      		<option value="C">기타</option>
										    </c:if>
										    <c:if test="${qna.qnaFirstCate=='C'}">
										        <option value="C">기타</option>
											    <option value="A">주문관련</option>
										        <option value="B">상품관련</option>
										    </c:if>
									    </select>
									    <input type="hidden" value="${status.index}">
													    
										<%-- <c:if test="${qna.qnaFirstCate!='C'}"> --%>			    
									    <select id="qnaSecondCate${status.index}" name="qnaSecondCate" class="form-control qnaSecondCateClass" style="width: 150px;height: 35px;">
									          
									           <c:if test="${qna.qnaSecondCate=='D'}">
											    	<option value="D">결제</option>
											    	<option value="E">환불</option>
											    </c:if>
											    <c:if test="${qna.qnaSecondCate=='E'}">
											    	<option value="E">환불</option>
											    	<option value="D">결제</option>
											    </c:if>
											    <c:if test="${qna.qnaSecondCate=='F'}">
											    	<option value="F">항공권</option>
											    	<option value="G">숙소</option>
											    </c:if>
											    <c:if test="${qna.qnaSecondCate=='G'}">
											    	<option value="G">숙소</option>
											    	<option value="F">항공권</option>
											    </c:if> 
											    
											    
									    </select>
										<%--  </c:if>		 --%>	    
						  	 	 	</div><!--1:1문의작성  -->
									 <div class="p-2 ">
									 	<div class="md-form">
										  	<textarea id="postContent${status.index}" name="postContent"  class="md-textarea form-control" rows="3" style="width: 700px;margin-bottom: 10px;">${qna.postContent}</textarea>
										 	<button  type="button" class="btn btn-primary updateQna" style="margin-left: 575px;margin-right:17px; float: left;">작성</button>
									 		<button  type="button" class="btn btn-secondary updateDelete">취소</button> 
									 		<input type="hidden" value="${status.index}">
										</div>
									</div>
								</div>
							</div>
						  </div><!-- updateDiv -->
					</form>
				</c:forEach>
				
				
					
    			
    	</div>
    		<jsp:include page="../../common/pageNavigator_new.jsp"/>	
 	 </div><!-- dflex -->
		
	</div><!-- container -->
		
		
		
</body>
<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</html>