<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<a class="nav-link active" href="/">
		<h6>메인</h6>
</a>
<jsp:include page="/view/user/login.jsp"></jsp:include>

<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">
로그인모달
</button> -->

<c:if test="${user.userName != null}">
<p>
${user.nickname}님 로그인중....
</p>
<button type="button" class="btn btn-dark">로그아웃</button>
</c:if>
<c:if test="${user.userId == null}">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal" data-backdrop="static" data-keyboard="false">
로그인
</button>
</c:if>

<br/>
<a href="/view/flight/searchFlight.jsp">항공권 검색</a> &ensp;&ensp;
<a href="/view/room/searchRoom.jsp">숙소 검색</a> &ensp;&ensp;
<a href="/order/getOrderList">주문 목록</a> &ensp;&ensp; 
<a href="/toolbar/donghaeng.jsp">동행 채팅</a> &ensp;&ensp;
<a href="/plan/getPlanList">플래너 리스트</a> &ensp;&ensp;

<ul class="nav nav-tabs">
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
		$("button:contains('로그아웃')").on("click",function(){
			location.href="/user/logout";
		});
	
 
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

