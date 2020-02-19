<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

    <!-- jQuery UI toolTip 사용 CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip 사용 JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		.container, .container-md, .container-sm {
		    max-width: 1000px;
		    font-size: 14px;
		}
		
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/community/getPostList").submit();
		}
		
		 $(function() {
			 $( ".fas.fa-search" ).on("click" , function() {
			 	fncGetUserList(1);
			 });
		 });
		
		 $(function() {
			 
			var boardName = $("#boardName").val();
		
			$( "td:nth-child(2)" ).on("click" , function() {
			     var postId = $(this).find($("input[name='postId']")).val();	
				 self.location ="/community/getPost?postId="+postId+"&boardName="+boardName;
			});
		});	
	
		$(function(){
			
			var boardName = $("#boardName").val();
			
			$("#addpost_view").on("click" , function() {
				self.location = "/community/addPost?boardName="+boardName;
			});
		});
		
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar/toolBar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="h3" style="font-weight: bold; margin-top: 40px;">
			<c:if test="${param.boardName=='A'}">
			자유게시판
			</c:if>
			<c:if test="${param.boardName=='B'}">
			정보공유
			</c:if>
			<c:if test="${param.boardName=='C'}">
			인기글게시판
			</c:if>
			<c:if test="${param.boardName=='D'}">
			동행찾기
			</c:if>
			<c:if test="${param.boardName=='E'}">
			플래너공유
			</c:if>
			<c:if test="${param.boardName=='F'}">
			여행후기
			</c:if>
			<c:if test="${param.boardName=='G'}">
			QnA
			</c:if>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
		    
		    <div class="col-md-12 text-right" style="margin: 10px 0 15px 0">
			    <form class="form-inline mt-2 mt-md-0" name="detailForm" style="float:right;">
			      <input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="height: 30px; width: 85px; font-size: 13px; margin-right: 2px;" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>태그</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control mr-sm-2" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" style="height: 30px; font-size: 13px;" >
				  </div>
				  
				  &nbsp;<i class="fas fa-search"></i>
			
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
	<div class="table-responsive">	
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover">
      
        <thead>
          <tr>
            <th scope="col">게시글번호</th>
            <th scope="col">제목</th>
            <th scope="col">닉네임</th>
            <th scope="col">작성일</th>
            <th scope="col">댓글수</th>
            <th scope="col">조회수</th>
            <th scope="col">추천수</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="post" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <th scope="row">${ i }</th>
			  <td style="font-weight: bold; color: dimgray;">
			  <input type="hidden" id="postId" name="postId" value="${post.postId}"/>${post.postTitle}</td>
			  <td>${post.nickName}</td>
			  <td>${post.postDate}</td>
			  <td>${post.comments}</td>
			  <td>${post.views}</td>
			  <td>${post.postLikeCount}</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
     </div>
	  <!--  table End /////////////////////////////////////-->
	  <button type="button" id="addpost_view" class="btn btn-lg btn-primary" style="font-size: 13px; width: 88px; height: 30px; line-height:11px;">작성하기</button>
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>