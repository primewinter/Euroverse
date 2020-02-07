<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ToolBar Start /////////////////////////////////////-->
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" href="/view/community/page.jsp">EUROVERSE</a>
	  </li>
	  <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="#">인기글게시판</a>
	      <a class="dropdown-item" href="#">플래너공유</a>
	      <a class="dropdown-item" href="#">동행찾기</a>
	      <a class="dropdown-item" href="#">여행후기</a>
	      <a class="dropdown-item" href="#">정보공유</a>
	      <a class="dropdown-item" href="#">QnA</a>
	      <a class="dropdown-item" href="#">자유게시판</a>
	    </div>
	  </li>
	</ul>
	
		<!-- ToolBar End /////////////////////////////////////-->
   	<script type="text/javascript">
 
	 	$( "a:contains('자유게시판')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=A");
		});
	 	
	 	$( "a:contains('정보공유')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=B");
		}); 
	 	
	 	$( "a:contains('인기글게시판')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=C");
		}); 
	 	
	 	$( "a:contains('동행찾기')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=D");
		}); 
	 	
	 	$( "a:contains('플래너공유')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=E");
		}); 
	 	
	 	$( "a:contains('여행후기')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=F");
		}); 
	 	
	 	$( "a:contains('QnA')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=G");
		}); 
	 	
	</script>  