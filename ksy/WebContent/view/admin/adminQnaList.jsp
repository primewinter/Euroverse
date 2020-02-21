<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


 <!-- : http://getbootstrap.com/css/  -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- =========================================================================================  -->
	
	
	
	<!-- 글씨체 때문에 걸어둔 link -->
	<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
	 <!-- =========================================================================================  -->
	 
	 
	 
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- ===================================================================================  -->
	<!-- =================================================================================== -->
	
	

<!-- fontawesome CDN -->
<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
 -->
 
 <!-- 부트스트랩 아이콘 사용 cdn fontawesome.com  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<!-- CSS 속성값 -->
<style>
	
	/*include한 툴바 ui 설정값  */
	.tollbar{
		padding: 15px;
	}
	
	h3{
	font-size: 27px;
	}
	/* 이거 왜안되지?????????  */
	table thead > tr{
		border-color: blue;
	}
	.text-right{
		padding : 8px;
	}
	.table-hover{
	}
	
	.text-primary{
		font-size: 14px;
	}
	
	.a{
		padding: 3px;
	}
	.b{
		padding: 3px;
	}
	
.outer{
	background-color: #E6E2E2;
	padding: 30px; 
	padding-top: 2px;
	width:auto;
	height: auto;
	display: inline-block;
}

.inner{
	display: inline-block;
	background-color: white;
	border-bottom-left-radius : 15px;
	border-bottom-right-radius : 15px;
	box-shadow : 5px 5px 7px #C3C0C0;
	height: auto;
	width:940px;
}
</style>


<script type="text/javascript">

	/* //=============    검색 / page 두가지 경우 모두  Event  처리 =============	 */
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "GET").attr("action" , "/admin/getAdminQnAList").submit();
	};//end of getUserList(CurrentPage)
	
	
	/*======== 검색시 페이지를 1페이지로 돌리기위해] =============  */
	$(function() {
		 $( ".form-control" ).change(function() {
		 	fncGetUserList(1);
		 }); 
	});//end of function	
	
	$(function(){
		$(".postId").on("click",function(){
			
			
		});
	});
	
</script>



</head>


<body>

	<div class="container">
	
		<!-- =============== 유로버스 툴바 인클루드  ========== -->
		<div class="tollbar">
			<jsp:include page="/toolbar/toolBar.jsp"></jsp:include> 
		</div>
		<!-- =========== 이까지  ================ -->
		
	<div class="page-header text-info">

		<h3 class="font-weight-bold">1:1문의목록 상세조회</h3>
	
	 </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
	    	<!-- 검색조건 총 몇 건, 현재 페이지 나타내는 글씨  -->
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		Total  ${resultPage.totalCount } 건수, ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    
		    <div class="col-md-6 text-right d-flex justify-content-end">
		    
		    <!-- =========================== 검색조건 선택창 =========================== -->
		     <form class="form-inline" name="detailForm">
			      <input type="hidden" id="qnaFirstCate" name="qnaFirstCate" value="${param.qnaFirstCate}"/>
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="height: 30px; width: 120px; font-size: 13px; margin-right: 2px;" >
						<c:if test="${empty search.searchCondition }">
						<option class="from-option" value="" >전체</option>
						<option class="from-option" value="A" >주문관련</option>
						<option class="from-option" value="B" >상품관리</option>
						<option class="from-option" value="C" >기타</option>
						</c:if>
						
						<c:if test="${!empty search.searchCondition }">
						<option class="from-option" value="" >전체</option>
						<option class="from-option" value="A"  ${ ! empty search.searchCondition && search.searchCondition=='A' ? "selected" : "" }>주문관련</option>
						<option class="from-option" value="B"  ${ ! empty search.searchCondition && search.searchCondition=='B' ? "selected" : "" }>상품관련</option>
						<option class="from-option" value="C"  ${ ! empty search.searchCondition && search.searchCondition=='C' ? "selected" : "" }>기타</option>
						</c:if>
					</select>
				  </div>
				   <!-- ======================== 검색조건 선택창 끝  ========================= -->
		    
		      		<!-- 돋보기 아이콘  fontawesome.com-->
				  &nbsp;&nbsp;<i class="fas fa-search" style="font-size: x-large"></i>
				  
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
	    	 </form>
	    	</div>
		</div>
		
		<div class="table-responsive">
		
		<!-- =============================== 유저목록 게시판 테이블  시작 ============================-->
			<table class="table table-hover">
	        <thead>
		        <tr class="top shadow-sm p-3 mb-5 bg-white rounded " style="font-size:small;">
		            <th scope="col" style= "width:7%;">번호</th>
		            <th scope="col" style= "width:7%;">상태</th>
		            <th scope="col" style= "width:50%; text-align:center;">제목</th>
		            <th scope="col" style= "width:10%;">분류</th>
		            <th scope="col" style= "width:10%;">글쓴이</th>
		            <th scope="col"	style="width:10%;">날짜</th>
		          </tr>
	        </thead>
	        
		<!-- ========테이블 내용 시작 ========== -->
			<tbody class="userTab" style="font-size: small;">
			  <c:set var="i" value="0" />
			  <c:forEach var="post" items="${list }">
				<c:set var="i" value="${i+1 }" />
				<tr>
				
				<!-- 게시글번호 -->
				  <th scope="row">${ i }</th>
				    <!--========= END ========== -->
				    
				  <!-- 답변상태  -->
				  <td style="font-weight: bold; color: dimgray;">
				  <c:if test="${post.postGrade != 'Q' }">
		   			<span class="badge badge-pill badge-secondary">답변없음</span>
		   			</c:if>	
					<c:if test="${post.postGrade == 'Q' }">
		   			<span class="badge badge-pill badge-success">답변완료</span>
			   		</c:if>
				  </td>
				  <!--========= END ========== -->
				  
				  <!--제목  -->
				  <td class="postId" style="text-align: left;">${post.postTitle }
				  <input type="hidden" id="postId" name="postId" value=""/></td>
				    <!--========= END ========== -->
				  
				  <!-- 질문분류 종류  -->
				  <td> 
				  <c:if test="${post.qnaFirstCate=='A'}">
				    	주문관련
				   </c:if>
				   <c:if test="${post.qnaFirstCate=='B'}">
				    	상품관련
				   </c:if>
				   <c:if test="${post.qnaFirstCate=='C'}">
				    	기타
				   </c:if>
					</td>  
					 <!--========= END ========== -->
					 
				  <!-- 작성자 ID  -->  
				  <td>${post.postWriterId }</td>
				   <!--========= END ========== -->
				   
				   <!-- 작성일자  -->
				  <td><c:set var="regDate" value="${fn:split(post.postDate,' ')}"></c:set>
					<c:out value="${regDate[0]}"></c:out></td>
					   <!--========= END ========== -->
				</tr>
	          </c:forEach>
			</tbody>
			</table>
				<!-- ========== 테이블 내용 끝 ============ -->
			</div>
			<!--================================ 테이블끝   =====================================-->
	</div>
	<!-- ================== div : Container End  ================-->	
	

	<!-- pageNavigator include  -->
	<jsp:include page="../../common/pageNavigator_new.jsp"/>
		
		
	<table class="outer" style="margin-top:15px; border-top:1px;" style=" display: none;">
	  <tbody class="inner">
		<tr>
		<td valign="top">
		  <table style="margin-top:15px;">
		    <tbody>
		      <tr>
		        <td style="allign:center;">
				  <img  style="width:40px; margin: 10px;" alt="" src="\resources\images\admin\Qicon.png">
			    </td>
			   </tr>
			  <tr>
			    <td align="center" height="33"></td>
		      </tr>
		    </tbody>
		  </table>
		</td>
	   <td valign="top">
	   	 <table style="margin-top:15px;">
	   	   <tbody>
	   	    <tr>
	   	      <td width="680px;">
	   	        <table>
	   	          <tbody>
	   	            <tr>
	   	              <td colspan="2">
	   	                <table>
	   	                   <tbody>
	   	                    <tr>
	   	                      <td>
							    <font>	
							  	  asdfasdfasdfAasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadas
							    </font>
							   </td>
						     </tr>
						     <tr>
						      <td style="font-size:9pt;font-family:돋움; color:#4EC2F8;">관련</td>
					   		  <td></td>
						     </tr>
						   </tbody>
						  </table>
						</td>
					  </tr>
					 <tr>
					  <td>
			 	       <font style= "font-size:11pt; color: rgb(240, 168, 72);">
			 	         <i class="fas fa-clock"></i>
 					            ㅇㅇㅇ님이 분전에 질문하셨습니다.
				       </font>
				     </td>
					</tr>
				   </tbody>
				  </table>
				 </td>
				</tr>
			  <tr>
			   <td>
		         <table>
		           <tbody>
		             <tr>
		               <td valign="top">
		                 <img style="width :40px;margin: 10px;" src="\resources\images\admin\Aicon.png">
		               </td>
		               <td valign="top">
		                <table>
		                  <tbody>
		                    <tr>
		                      <td>
		                       <label for="exampleFormControlTextarea1"></label>
     			 		   	   <textarea class="form-control"  style="width:460px; transform: translate(0%,-15px);min-height: 100px" id="exampleFormControlTextarea1" rows="3"></textarea>
     			 		   	  </td>
     			 		   	  <td valign="top" >
     			 		   	  	<button type="button" class="btn btn-primary"  style=" margin:10px; height: 70px;">답변하기</button>
     			 		   	  </td>
     			 		   	 </tr>
     			 		   	</tbody>
     			 		  </table>
   	 			 		 </td>
   	 			 		</tr>
   	 			 	  </tbody>
   	 			 	 </table>
   	 			 </td>
   	 			</tr>
   	 			<!-- 답변한 글 띄우는 html -->
   	 		  <tr>
   	 			<td>
   	 			 <table>
   	 			  <tbody>
   	 			  <!-- 여기부터 append -->
   	 			   <tr>
   	 			    <td valign="top">
   	 			      <img style="width :40px;margin: 10px;" src="\resources\images\admin\Aicon.png">
					</td>
					 <td valign="bottom">
					  <table>
					   <tbody>
					    <tr>
					     <td>
					      <font>
					                 관리자 답변관리자 답변관리자 답변관리자 답변관리자 답변관리자 답변관리자 답변관리자 답변
					      </font>
					     </td>
					    </tr>
					     <tr>
  	 			 			  <td>
  	 			        	  <font style= "font-size:11pt; color: rgb(240, 168, 72);">
  	 			        	   <i class="fas fa-user-clock"></i>
					  		       관리자님이 분전에 답변하셨습니다.
			    			</font>
  	 			  			 </td>
  	 			 			 </tr>
					   </tbody>
					  </table>
					 </td>	   	 			   
   	 			   </tr>
   	 			  </tbody>
   	 			 </table>
   	 			</td>
   	 	      </tr>
   	 	      <!-- 관리자 답글 html 끝  -->
   	 		</tbody>
	   	   </table>
	   	 </td>
	   	</tr>
	   </tbody>
	  </table>
	  
	  

</body>

</html>