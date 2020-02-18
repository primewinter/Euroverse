<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
            <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- jquery Ui ��ũ (datePicker)  -->
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


</style>



<script>

function fncGetUserList(currentPage) {
	$("#currentPage").val(currentPage)
	$("#qnaForm").attr("method" , "POST").attr("action" , "/myPage/addQnaAndQnaList").submit();
}



$(function(){
	
	
	 $("b:contains('��ۺ���')").on("click",function(){
		console.log($(this).next().val());
		var postId = $(this).next().val();
		 
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
							alert("����!");
							if(JSONData.returnMessage=='ok'){
								alert("�޼����� ok");
								
								var qnaCommentList = JSONData.qnaCommentList;
								console.log(qnaCommentList);
								
								$("#appendCommentDiv").append("<div class='media mt-3'>");
								$("#appendCommentDiv").append("<i class='fas fa-arrow-right'></i>");
								$("#appendCommentDiv").append("");
								$("#appendCommentDiv").append("");
								$("#appendCommentDiv").append("");
								$("#appendCommentDiv").append("");
								$("#appendCommentDiv").append("");
								$("#appendCommentDiv").append("");
								$("#appendCommentDiv").append("");
								$("#appendCommentDiv").append("");
								$("#appendCommentDiv").append("");
							}else if(JSONData.returnMessage=='error'){
								alert("�޼����� error");
								/*   <div class="media mt-3">
									<i class="fas fa-arrow-right"></i>
							      <div class="media-body">
							        <h5 class="mt-0">Media heading</h5>
							        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
							      </div>
							    </div> */
								
								
								
							}
						}
					})
		
		
		
	 })
	
	$("#yes").on("click",function(){
		var qnaFirstCate = $('#qnaFirstCate');
		var qnaSecondCate = $("#qnaSecondCate");
		var postContent = $("#postContent");
		var postTitle = $("#postTitle");
		alert(postTitle.val()+" "+postContent.val()+" "+qnaFirstCate.val()+" "+qnaSecondCate.val());
	
		
		
		$("#qnaForm").attr("action","/myPage/addQna").attr("method","post").submit();
		
		
	})
	
	$("#no").on("click",function(){
		alert("s");
		var qnaFirstCate = $('#qnaFirstCate');
		var qnaSecondCate = $("#qnaSecondCate");
		var postContent = $("#postContent");
		var postTitle = $("#postTitle");
		
 		$("#qnaFirstCate option:eq(0)").prop("selected", true);
		qnaSecondCate.css("display","none");
		$(".secondCate").remove();
		postContent.val("");
		postTitle.vla("");
	})
	

	$('#qnaFirstCate').change(function() {
		var state = $('#qnaFirstCate option:selected').val();
		
		var qnaSecondCate = $("#qnaSecondCate");
		
		
		if ( state == 'A' ) {
			$(".secondCate").remove();
			qnaSecondCate.css("display","block");
			qnaSecondCate.append("<option disabled selected hidden>2���з�</option>");
			qnaSecondCate.append("<option value='D' class='secondCate'>����</option>");
			qnaSecondCate.append("<option value='E' class='secondCate'>ȯ��</option>");
		
		}else if(state == 'B') {
			$(".secondCate").remove();
			qnaSecondCate.css("display","block");
			qnaSecondCate.append("<option disabled selected hidden>2���з�</option>");
			qnaSecondCate.append("<option value='F' class='secondCate'>�װ���</option>");
			qnaSecondCate.append("<option value='G' class='secondCate'>����</option>");
		}else if(state =='C'){
			$(".secondCate").remove();
			qnaSecondCate.css("display","none");
		}
	
	
	});

})
</script>


</head>
<body>
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>

	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"  id="main">
	
	 <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">1:1����</h1>
     </div> 
     
     
		
<form id="qnaForm">		
 	<input type="hidden" id="currentPage" name="currentPage" value=0 />
		
	<div class="container mt-3">
		  <div class="d-flex flex-column mb-3">
		    <div class="p-2 ">
		    <h2>1:1���� �ۼ�</h2>
		 		<input type="text" id="postTitle" name="postTitle" placeholder="������ �Է����ּ���." class="form-control" style="width: 200px;margin-bottom: 5px;">
		    <select id="qnaFirstCate" name="qnaFirstCate" class="form-control" style="width: 150px;height: 35px;float: left; margin-right: 20px;">
		        <option disabled selected hidden>1���з�</option>
		        <option value="A">�ֹ�����</option>
		        <option value="B">��ǰ����</option>
		        <option value="C">��Ÿ</option>
		    </select>
		    
		    
		    <select id="qnaSecondCate" name="qnaSecondCate" class="form-control" style="width: 150px;height: 35px; display: none;">
		        
		    </select>
		    
  	 	 </div><!--1:1�����ۼ�  -->
		 <div class="p-2 ">
		 	<div class="md-form">
			  	<textarea id="postContent" name="postContent" placeholder="���ǻ����� �ۼ����ּ���." class="md-textarea form-control" rows="3" style="width: 700px;margin-bottom: 10px;"></textarea>
				<button id="yes" type="button" class="btn btn-primary" style="margin-left: 575px;margin-right:17px; float: left;">�ۼ�</button>
		 		<button id="no" type="button" class="btn btn-secondary">���</button>
			</div>
		 </div>
</form>			
			<hr class="one">
			
    	<div class="p-2 ">
    		<h2>���� 1:1����</h2>
		    		
		    		
		    	<c:forEach var="qna" items="${qnaList}" varStatus="status">	
		    		<div class="media border border-info">
					  <div class="media-body">
					    <h4 class="mt-0">${qna.postTitle} </h4>
					    	<c:if test="${qna.postGrade != null }">
					   			<span class="badge badge-pill badge-success">�亯�Ϸ�</span>
					   		</c:if>	
					   		
					   		<c:if test="${qna.postGrade == null }">
					   			<span class="badge badge-pill badge-secondary">�亯����</span>
					   		</c:if>
					   		   	
					    
					    
					    <small>
					    <c:set var="qnaDate" value="${fn:split(qna.postDate,' ')}"></c:set>
					    <c:out value="${qnaDate[0]}"></c:out>
					    
					    
					    <c:if test="${qna.qnaFirstCate=='A'}">
					    	�ֹ�����
					    </c:if>
					    <c:if test="${qna.qnaFirstCate=='B'}">
					    	��ǰ����
					    </c:if>
					    <c:if test="${qna.qnaFirstCate=='C'}">
					    	��Ÿ
					    </c:if>
					    
					    &nbsp;
					    
					    <c:if test="${qna.qnaSecondCate=='D'}">
					    	����
					    </c:if>
					    <c:if test="${qna.qnaSecondCate=='E'}">
					    	ȯ��
					    </c:if>
					    <c:if test="${qna.qnaSecondCate=='F'}">
					    	�װ���
					    </c:if>
					    <c:if test="${qna.qnaSecondCate=='G'}">
					    	����
					    </c:if>
					   <%--  <c:if test="${qna.qnaFirstCate==''}">
					    	
					    </c:if>
					    <c:if test="${qna.qnaFirstCate==''}">
					    	
					    </c:if> --%>
					  </small>
					   <div id="qnaContentDiv" style="margin-top: 20px;">
					    ${qna.postContent}
					   </div>
					   		
					   
					    <c:if test="${qna.postGrade != null }">
					    <span style="float: right;">
					   			<b><i class="fas fa-arrow-down"></i>��ۺ���</b>
					   			<input type="hidden" value="${qna.postId}">
					   				</span>
				   		</c:if>	
				   		
				   		<c:if test="${qna.postGrade == null }">
				   		 <span style="float: right;">
				   				<b><i class="fas fa-arrow-down"></i>��ۺ���</b>
				   				<input type="hidden" value="${qna.postId}">
				   				</span>
				   		</c:if>
				   		   	
<!-- 					   <div id="appendCommentDiv">
					   		
					   			 <div class="media mt-3">
							      	<div class="media-body">
								        <h5 class="mt-0" style="float: right;">�亯����</h5>
								        <br>
								        <small style="float: right;">�亯 ��¥ , �亯��</small>
								        <div id="qnaContentDiv" style="margin-top: 20px;">
											   �亯����   �亯����   �亯����   �亯����   �亯����   �亯����   �亯����   �亯����   �亯����   �亯����   �亯����   �亯����   �亯����
						 			  	</div>
							      </div>
							    </div> 
					   
					   
					   </div> -->
					   
					  </div>
					</div>
				</c:forEach>
				
				
					
    			
    	</div>
    		<jsp:include page="../../common/pageNavigator_new.jsp"/>	
 	 </div><!-- dflex -->
		
	</div><!-- container -->
		
		
		
		
		
		
		
		
	
</main>
</div>
</div>
</body>
</html>