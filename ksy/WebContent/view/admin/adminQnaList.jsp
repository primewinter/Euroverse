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


<script type="text/javascript">

	/* ss초전 mm분전 hh시간전 구하는 코드  */
	/* function fn_dateTimeToFormatted(dt) {
		var min = 60 * 1000;
		var c = new Date()
		var d = new Date(dt);
		var minsAgo = Math.floor((c - d) / (min));

		var result = {
			'raw': d.getFullYear() + '-' + (d.getMonth() + 1 > 9 ? '' : '0') + (d.getMonth() + 1) + '-' + (d.getDate() > 9 ? '' : '0') +  d.getDate() + ' ' + (d.getHours() > 9 ? '' : '0') +  d.getHours() + ':' + (d.getMinutes() > 9 ? '' : '0') +  d.getMinutes() + ':'  + (d.getSeconds() > 9 ? '' : '0') +  d.getSeconds(),
			'formatted': '',
		};

		if (minsAgo < 60) { // 1시간 내
			result.formatted = minsAgo + '분 전';
		} else if (minsAgo < 60 * 24) { // 하루 내
			result.formatted = Math.floor(minsAgo / 60) + '시간 전';
		} else { // 하루 이상
			result.formatted = Math.floor(minsAgo / 60 / 24) + '일 전';
		};

		return formatDate;
	};
	//end 시간구하기

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
	});//end of function */
	
	
	 function close(){
     	$("#con").remove();
     }
	
	//관리자가 리스트를 클릭했을경우 상세보기
		function getAdminQnaList(postId,postContent,qnaFirstCate,postWriterId) {
			
			if(qnaFirstCate == "A"){
				
				qnaFirstCate = '주문관련';
			}
			if(qnaFirstCate == "B"){
				
				qnaFirstCate = '상품관련';
			}
			if(qnaFirstCate == "C"){
				
				qnaFirstCate = '기타';
			}
			var display = 
				'<div id="con" class="container">'+
			        '<div class="inner">'+
			            '<div style="padding:5px 25px" class="row">'+
			                '<div style="margin:8px;text-align:right;display: inline-block; height: 70px; width: 70px;">'+
			                    '<img id="qimg" style="width:40px; "alt="" src=\"/resources/images/admin/Qicon.png"\></div><div>'+
			                    '<div style="width: 600px; height:20px; margin: 5px 5px 5px 5px;">'+postContent+'</div>'+
			                    '<div style="height:20px; font-size:9pt;font-family:돋움; color:#4EC2F8; height:20px; margin: 2px 5px 5px 5px;">'+qnaFirstCate+'</div>'+
			                    '<div style="font-size:11pt; color: rgb(240, 168, 72);"><i class="fas fa-clock"></i>'+postWriterId+'님이 ㅇ분전에 질문하셨습니다.</div></div></div>'+
			            '<div id="append" style=" height: auto; padding:15px 25px" class="row">'+
			                '<div style="display: inline-block; height: 70px; width: 70px;"></div>'+
			                '<div style="text-align:right;display: inline-block; height: 70px; width: 70px;">'+
			                    '<img style="width:40px;" src=\"/resources/images/admin/Aicon.png"\></div><div>'+
			                    '<div style="width: 600px; height:100%; margin: 0px 5px 5px 10px;"><textarea id="content" class="form-control" style="min-height: 100px">'+
			                    '</textarea></div></div><div>'+
			                    '<button type="button" class="btn btn-primary" onclick="answer('+postId+')" style=" margin-left:5px; height:70px; display: inline-block">답변하기</button></div>'+
			            '</div></div></div>';
        
	    	$("#con").remove();//다른 게시글을 클릭할경우 이전태그 지움
	        $("#"+postId+"").html(display);//게시글을 클릭할경우 태그 어펜드
			 
	        	$.ajax({
					url: "/admin/json/getQnaCommentList/"+postId,
					method: "GET",
					dataType: "json",
					headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
					success: function(JSONData, status){
						
						if( JSONData==null || JSONData=="" ){
							console.log("리턴데이터 없음");	
						}else{
							console.log("리턴데이터 있음! => "+JSONData);	 
							if(JSONData.list.length != 0){
								
					            var appendHtml =
									'<div id="delCmt" style="padding:5px 25px" class="row">'+
									'<div style="display: inline-block; height: 70px; width: 70px;"></div>'+
									'<div style="margin:8px;text-align:right;display: inline-block; height: 70px; width: 70px;">'+
						            '<img style="width:40px;" src="/resources/images/admin/Aicon.png"></div><div>'+
						            '<div class="qnaComment" style="width: 600px; height:20px; margin: 5px 5px 5px 5px;">'+JSONData.list[0].cmtContent+
						            '<button type="button" class="btn btn-outline-danger btn-sm" style="margin-left:5px;" onclick="deleteCmt('+JSONData.list[0].cmtId+','+JSONData.list[0].postId+')">삭제</button></div>'+
						            '<div style="height:20px; font-size:9pt;font-family:돋움; color:#4EC2F8; height:20px; margin: 2px 5px 5px 5px;">관련</div>'+
						            '<div style="font-size:11pt; color: rgb(240, 168, 72);"><i class="fas fa-user-clock"></i>분전에 답변하셨습니다.</div>'+
						        	'</div></div>';
						         	
							 $("#append").append(appendHtml);
							}//end of if
						}//end of else
					    
					},//end of success
						
					error:function(request,status,error){
				        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				    }// end of error  
					    
				 });// end of ajax
		};//end of getAdminQnaList
					            
	
	
	
	//관리자의 1:1문의 답변 관리자가 한 문의당 답변을 한개만 달수있도록 로직짜놓음
	function answer(postId){ 
		
       	var cmtContent = $('#content').val().replace(/\n/g,"<br>");
       	$('#content').val('');	
       	
       	 $.ajax({
			url: "/admin/json/addQnaComment",
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data:JSON.stringify({
				postId: postId,
				cmtWriterId : 'admin',
				nickName:'Euroverse',
		 		cmtContent : cmtContent
			}),
			success: function(JSONData, status){
				//restController에서 comments에 값이 이미 존재하면 error메세지를 보냄 
				if(JSONData.returnMsg=='error'){
					
					alert("답변은 한개만 가능합니다.")
				
				//답글이 하나도 없으면 ajax 실행
				}else if(JSONData.returnMsg=='ok'){
					
					if( JSONData==null || JSONData=="" ){
						console.log("리턴데이터 없음");	
					}else{
						console.log("리턴데이터 있음! => "+JSONData);
				            var appendHtml =
								'<div id="delCmt" style="padding:5px 25px" class="row">'+
								'<div style="display: inline-block; height: 70px; width: 70px;"></div>'+
								'<div style="margin:8px;text-align:right;display: inline-block; height: 70px; width: 70px;">'+
					            '<img style="width:40px;" src="/resources/images/admin/Aicon.png"></div><div>'+
					            '<div style="width: 600px; height:20px; margin: 5px 5px 5px 5px;">'+JSONData.list[0].cmtContent+
					            '<button type="button" style="margin-left:5px;" class="btn btn-outline-danger btn-sm"' +
					            'onclick="deleteCmt('+JSONData.list[0].cmtId+','+JSONData.list[0].postId+')">삭제</button></div>'+
					            '<div style="height:20px; font-size:9pt;font-family:돋움; color:#4EC2F8; height:20px; margin: 2px 5px 5px 5px;">관련</div>'+
					            '<div style="font-size:11pt; color: rgb(240, 168, 72);"><i class="fas fa-user-clock"></i>분전에 답변하셨습니다.</div>'+
					        	'</div></div>';
						        	
							 $("#append").append(appendHtml); 
							 $("#content").val('');
							 $(".state").val('');
							 $(".state").val('<span class="badge badge-pill badge-success">답변완료</span>');
					
					}// end of else
				}//end of elseIf
						
			},// end of success
			error:function(request,status,error){
		        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }// end of error  
					
		});// end of ajax
			
	};//end of fuction
        
		
	function deleteCmt(cmtId, postId){
		
		$.ajax({
			url: "/admin/json/deleteQnaComm",
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data: JSON.stringify({
				postId: postId,
				cmtId : cmtId
			})

		}).always(function( data) {
			$("#append").children().last().remove();
		  });
		
	};//end deleteCmt()
	
</script>



</head>


<body>

	<!-- =============== 유로버스 툴바 인클루드  ========== -->
		<jsp:include page="/toolbar/toolBar.jsp"></jsp:include> 
	<!-- =========== 이까지  ================ -->
	
	<!-- 푸쉬바 인클루드  -->
		<jsp:include page="/toolbar/pushBar.jsp"></jsp:include> 
		<!-- 인클루드 end--> 

	<div onclick='close()' class="container">
	
	<div class="page-header text-info">

		<h3 class="font-weight-bold">1:1문의 목록</h3>
	
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
				  <td class="no" >${ i }</td>
				    <!--========= END ========== -->
				    
				  <!-- 답변상태  -->
				  <td class="state" style="font-weight: bold; color: dimgray;">
					  <c:if test="${post.postGrade != 'Q' }">
			   				<span class="badge badge-pill badge-secondary">답변없음</span>
			   			 </c:if>	
						<c:if test="${post.postGrade == 'Q' }">
			   			<span class="badge badge-pill badge-success">답변완료</span>
				   		</c:if>
				  </td>
				  <!--========= END ========== -->
				  
				  <!--제목  -->
				  <td class="postclick" 
				  onclick="getAdminQnaList('${post.postId}','${post.postContent}','${post.qnaFirstCate}','${post.postWriterId}')" 
				  style="text-align: left;">
				  <input type="hidden" id="postId" name="postId" value="${post.postId}"/>
				  <input type="hidden" id="postContent" name="postContent" value="${post.postContent}"/>
				  <input type="hidden" id="qnaCate" name="qnaCate" value="${post.qnaFirstCate}"/>
				  <input type="hidden" id="userId" name="userId" value="${post.postWriterId}"/>
				  ${post.postTitle }</td>
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
				<tr>
	          		<td id="${post.postId }" colspan="6" bgcolor="#E6E2E2" style="margin:0px;padding:0px 0px 0px 0px;"></td>
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
		
	  <!-- 푸터 인클루드  -->
		<jsp:include page="/toolbar/footer.jsp"></jsp:include>
		<!-- 인클루드 end--> 
	
</body>

</html>