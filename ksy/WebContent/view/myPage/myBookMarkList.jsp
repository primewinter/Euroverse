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

<script>

$(function(){

	$( "td:nth-child(2)" ).on("click" , function() {
		
		var postId = $(this).next().next().next().next().val();
		var boardName = $(this).next().next().next().next().next().val();
		self.location ="/community/getPost?postId="+postId+"&boardName="+boardName;
	});
})



function getPost(postId , boardName){
	self.location ="/community/getPost?postId="+postId+"&boardName="+boardName;
} 



function deleteBookMark(postId){
	$.ajax({
		url : '/myPage/json/deleteBookMark/'+postId ,
		type : "GET" ,
		cache : false ,
		dataType : "json" ,
		success : function(JSONData) {
			var bookMarkList = JSONData.bookMarkList;
				$("tbody").html("");
			for(var i=0;i<bookMarkList.length;i++){
				//alert(bookMarkList[i].postId);
				$("tbody").append("<tr>");
				$("tbody").append("<th scope='row'>"+(i+1)+"</th>");
				
				
				var boardName= bookMarkList[i].boardName;
				var postId = bookMarkList[i].postId;
				
				//alert(bookMarkList[i].postTitle.subString(0,10))
				$("tbody").append("<td><span onclick='javascript:getPost("+postId+",\""+boardName+"\")'>"+bookMarkList[i].postTitle.substring(0,35)+"</span> </td>");
				
				//$("tbody").append("<td onclick='javascript:getPost("+bookMarkList[i].postId , bookMarkList[i].boardName+")'>"+bookMarkList[i].postTitle.substring(0,35)+" </td>");
				
				$("tbody").append("<td>"+bookMarkList[i].nickName+"</td>");
				$("tbody").append("<td><i id=deleteBookMark"+i+" class='fas fa-bookmark fa-2x' onclick='javascript:deleteBookMark("+bookMarkList[i].postId+")'></i></td>");
				$("tbody").append("<input type='hidden' value="+i+">");
				$("tbody").append("<input type='hidden' name='postId' value="+bookMarkList[i].postId+"/>");
				$("tbody").append("<input type='hidden' value="+bookMarkList[i].boardName+"/>");
				$("tbody").append("</tr>");
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
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>
	<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>	
	<div style="height: 100px;"></div>
        <h1  style="margin-left: 240px; width: 1000px">나의 북마크목록</h1>
		
	
	
	
	<form id="myBookMarkListForm">
 		<input type="hidden" id="currentPage" name="currentPage" value=0 /> 
	



<table class="table" style="margin-left: 240px; width: 1200px;">
<!-- 	  <button type="button" class="btn btn-outline-warning waves-effect btn-sm">최신순</button>
	  <button type="button" class="btn btn-outline-warning waves-effect btn-sm">적립</button>
	  <button type="button" class="btn btn-outline-warning waves-effect btn-sm">차감</button>
	   -->
	</form>
	
							
	
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">제목</th>
      <th scope="col">닉네임</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
<%--   		
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
  	</c:forEach>	 --%>
  	
  	<c:forEach var="bookMarkPost" items="${bookMarkList}" varStatus="status">
  		<tr>
  			<th scope="row">${status.count}</th>
  			
  			
  			<c:set var="title" value="${bookMarkPost.postTitle}"/>
			<td>${fn:substring(title,0,35)}
			<c:if test="${fn:length(title)>35}">
				......
			</c:if>
			</td>
			
			
  			<td>${bookMarkPost.nickName}</td>
  			<td><i id="deleteBookMark${status.index}" class="fas fa-bookmark fa-2x" onclick="javascript:deleteBookMark(${bookMarkPost.postId})"></i></td>
  			<input type="hidden" value="${status.index}">
  			<input type="hidden" value="${bookMarkPost.postId}"/>
  			<input type="hidden" value="${bookMarkPost.boardName}"/>
  		</tr>
  	
  	
  	</c:forEach>
  		
  </tbody>
</table>
<%-- <jsp:include page="../../common/pageNavigator_new.jsp"/> --%>



</body>
<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</html>