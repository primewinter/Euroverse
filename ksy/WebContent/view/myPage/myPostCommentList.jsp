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


<script>
function fncGetUserList(currentPage) {
	alert("1�� currentPage="+currentPage);
	$("#currentPage").val(currentPage)
	$("#myPostCommentListForm").attr("method" , "POST").attr("action" , "/myPage/myPostCommentList").submit();
}
function fncGetUserList2(currentPage2) {
	alert("2��currentPage="+currentPage2);
	$("#currentPage2").val(currentPage2)
	$("#myPostCommentListForm").attr("method" , "POST").attr("action" , "/myPage/myPostCommentList").submit();
}

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
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"  id="main">
	
	 <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">���� �Խñ۸��</h1>
     </div> 
		
	
	
	<form id="myPostCommentListForm">
 		<input type="hidden" id="currentPage" name="currentPage" value=0 />
 		<input type="hidden" id="currentPage2" name="currentPage2" value=0 /> 

	</form>
	



<table class="table">
							
	
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
			<td>${post.postTitle}</td>
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
<hr class="one">


 <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">���� ��۸��</h1>
     </div> 
     


<table class="table">
	
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
			<td>${comment.cmtContent}</td>
			<td>${comment.nickName}</td>
			<td>${comment.cmtLikeCount}</td>
			<td>${comment.cmtDate}</td>
		</tr>
  		</c:forEach>
  	
  </tbody>
</table>


<jsp:include page="../../common/pageNavigator_new2.jsp"/>
</main>
</div>
</div>
</body>
</html>