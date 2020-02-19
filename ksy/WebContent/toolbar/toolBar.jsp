<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<style>
        body {
            padding-top : 70px;
        }
   	</style>



<jsp:include page="/view/user/login.jsp"></jsp:include>


	<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #FFFFFF; border-bottom: 1px solid gray;">
    	<a class="navbar-brand" href="/main.jsp">Eurovers</a>
    	
    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
      		<span class="navbar-toggler-icon"></span>
    	</button>

    	<div class="collapse navbar-collapse" id="navbarsExample09">
      		<ul class="navbar-nav mr-auto">
      		
        		<li class="nav-item active">
          			<a class="nav-link" href="/main.jsp">Home <span class="sr-only">(current)</span></a>
        		</li>
        		
        		<!-- 플래너 -->
        		<li class="nav-item">
          			<a class="nav-link" href="/plan/getPlanList">플래너</a>
        		</li>
        		
        		<!-- 커뮤니티 드롭다운 -->
        		<li class="nav-item dropdown">
          			<a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
          			<div class="dropdown-menu" aria-labelledby="dropdown01">
          				<a class="dropdown-item" href="#">인기글게시판</a>
					    <a class="dropdown-item" href="#">플래너공유</a>
					    <a class="dropdown-item" href="#">동행찾기</a>
					    <a class="dropdown-item" href="#">여행후기</a>
					    <a class="dropdown-item" href="#">정보공유</a>
					    <a class="dropdown-item" href="#">QnA</a>
					    <a class="dropdown-item" href="#">자유게시판</a>
          			</div>
        		</li>
        		
        		<!-- 항공 / 숙소 -->
        		<li class="nav-item">
          			<a class="nav-link" href="/view/flight/searchFlight.jsp">항공</a>
        		</li>
        		
        		<li class="nav-item">
          			<a class="nav-link" href="/view/room/searchRoom.jsp">숙소</a>
        		</li>
        		
        		<!-- 개인페이지로.. -->
        		<li class="nav-item">
          			<a class="nav-link" href="/order/getOrderList">주문목록</a>
        		</li>
        		
        		<!-- 여행정보조회 드롭다운 -->
        		<li class="nav-item dropdown">
          			<a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">여행정보</a>
          			<div class="dropdown-menu" aria-labelledby="dropdown02">
            			<a class="dropdown-item" href="/api/infinityClick">무한클릭</a>
            			<a class="dropdown-item" href="/view/tripInfo/exchange.jsp">환율</a>
            			<a class="dropdown-item" href="#">Something else here</a>
          			</div>
        		</li>
        		
        		
        		&ensp;&ensp;
        		
        		<li class="nav-item">
          			<a class="nav-link" href="/toolbar/donghaeng.jsp">동행채팅</a>
        		</li>
        		&ensp;&ensp;
        		
        		<li class="nav-item">
        		<c:if test="${user.role != 'A'}">
        			<a class="nav-link" href="/user/getUser">내정보 조회</a>
        		</c:if>
        		<c:if test="${user.role == 'A'}">
        			<a class="nav-link" href="/admin/getUserList">회원정보조회</a>
        		</c:if>
        		</li>
        		
        		<!-- <li class="nav-item"> <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> </li> -->
      		</ul>
      		
      		
      		<div class="mr-3">
	      		<c:if test="${user.userName != null}">
					<span>${user.nickname}&nbsp;&nbsp;</span> <button type="button" class="btn btn-dark">로그아웃</button>
				</c:if>
				<c:if test="${user.userId == null}">
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">로그인</button>
				</c:if>
			</div>
				
      		<form class="form-inline my-2 my-md-0">
        		<input class="form-control" type="text" placeholder="Search" aria-label="Search">
      		</form>
    	</div>
	</nav>

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






<%-- 
<c:if test="${user.userName != null}">
	<span> ${user.nickname}님 로그인중.... </span> <button type="button" class="btn btn-dark">로그아웃</button>
</c:if>
<c:if test="${user.userId == null}">
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal" data-backdrop="static" data-keyboard="false">로그인</button>
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
 --%>