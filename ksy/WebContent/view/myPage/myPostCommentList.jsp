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


<script>
function fncGetUserList(currentPage) {
	$("#currentPage").val(currentPage)
	$("#myPostCommentListForm").attr("method" , "POST").attr("action" , "/myPage/myPostCommentList").submit();
}
function fncGetUserList2(currentPage2) {
	$("#currentPage2").val(currentPage2)
	$("#myPostCommentListForm").attr("method" , "POST").attr("action" , "/myPage/myPostCommentList").submit();
}

$(function() {
	 
	var boardName = $("#boardName").val();

	$( "td:nth-child(2)" ).on("click" , function() {
		var postId = $(this).next().val();
		var boardName = $(this).next().next().val();
		self.location ="/community/getPost?postId="+postId+"&boardName="+boardName;
		
		
	     /* var postId = $(this).find($("input[name='postId']")).val();	
		 self.location ="/community/getPost?postId="+postId+"&boardName="+boardName; */
	});
	
	
	
	$("#viewPost").on("click",function(){
		 $("#postTable").css("display","block");
		$("#commentTable").css("display","none"); 
		$("#keyword").val("post");
	})
	$("#viewComment").on("click",function(){
	 	$("#commentTable").css("display","block");
		$("#postTable").css("display","none"); 
		$("#keyword").val("comment");
	})
	
	
});	

/* $(function() {
	 
	var boardName = $("#boardName").val();

	$( "td:nth-child(2)" ).on("click" , function() {
	     var postId = $(this).find($("input[name='postId']")).val();	
		 self.location ="/community/getPost?postId="+postId+"&boardName="+boardName;
	});
				
	$( "td:nth-child(2)" ).css("color" , "indianred");
	
});	
 */

</script>


</head>

<body>
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>
	<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>	
	
	
	
	
	
	
	<form id="myPostCommentListForm">
 		<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
 		<input type="hidden" id="currentPage2" name="currentPage2" value="${resultPage2.currentPage }" /> 
 		<c:if test="${!empty keyword}">
 		<input type="hidden" id="keyword" name="searchKeyword" value="${keyword}"/>
 		</c:if>

	</form>
	
	<div class="row">
		<div style="width: 250px;"></div>

			<div class="btn-group" role="group" aria-label="Basic example">
		  <button type="button" class="btn btn-outline-primary" id="viewPost">�Խñ�</button>
		  <button type="button" class="btn btn-outline-primary" id="viewComment">�� ��</button>
			</div>
	
	</div>



<c:if test="${keyword!='post'}">
<div id="postTable" style="display: none;">
</c:if>	
<c:if test="${keyword=='post'}">
<div id="postTable" style="display: block;">
</c:if>	



	
	<div style="height: 30px;"></div>
        <h1  style="margin-left: 240px;">���� �Խñ۸��</h1>
		
<table class="table" style="margin-left: 240px; width: 75%">
							
	
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">����</th>
      <th scope="col">�г���</th>
      <th scope="col">�ۼ���</th>
      <th scope="col">��ۼ�</th>
      <th scope="col">��ȸ��</th>
      <th scope="col">��õ��</th>
    </tr>
  </thead>
  <tbody>
  		
  	<c:forEach var="post" items="${postList}" varStatus="status">
		<tr>
			<th scope="row">${status.count}</th>
			
					<c:set var="title" value="${post.postTitle}"/>
			<td>${fn:substring(title,0,20)}
			<c:if test="${fn:length(title)>20}">
				......
			</c:if>
			</td>
			
			
			<input type="hidden" value="${post.postId}">
			<input type="hidden" value="${post.boardName}">
			<td>${post.nickName}</td>
			<td>${post.postDate}</td>
 			<td>${post.comments}</td>
			<td>${post.views}</td>
			<td>${post.postLikeCount}</td>
		</tr>
  	</c:forEach>	
  	
  		
  </tbody>
</table>
<jsp:include page="../../common/pageNavigator_new.jsp"/>

</div>

<!-- <hr class="one" width="1190px" style="margin-left: 230px;"> -->

<c:if test="${keyword!='comment'}">
<div id="commentTable" style="display: none;">
</c:if>
<c:if test="${keyword=='comment'}">
<div id="commentTable" style="display: block;">
</c:if>




        <h1 style="margin-left: 240px; margin-top: 40px;">���� ��۸��</h1>
     

<table class="table" style="margin-left: 240px; width: 75%">
	
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">����</th>
      <th scope="col">��۳���</th>
      <th scope="col">�г���</th>
      <th scope="col">��õ��</th>
      <th scope="col">����ۼ���</th>
    </tr>
  </thead>
  <tbody>
  	  	<c:forEach var="comment" items="${commentList}" varStatus="status">
		<tr>
			<th scope="row">${status.count}</th>
			<td>${comment.postTitle}</td>
			<input type="hidden" value="${comment.postId}">
			<input type="hidden" value="${comment.boardName}">
			
			
			
			
		<c:set var="content" value="${comment.cmtContent}"/>
			<td>${fn:substring(content,0,25)}
			<c:if test="${fn:length(content)>20}">
				......
			</c:if>
			</td>
			
			<td>${comment.nickName}</td>
			<td>${comment.cmtLikeCount}</td>
			<td>${comment.cmtDate}</td>
		</tr>
  		</c:forEach>
  	
  </tbody>
</table>


<jsp:include page="../../common/pageNavigator_new2.jsp"/>

</div>


</body>
<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</html>