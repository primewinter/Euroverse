<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

    <!-- jQuery UI toolTip ��� CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip ��� JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	
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
			
			if(boardName == 'D'){
				$( "td:nth-child(3)" ).on("click" , function() {
				     var postId = $(this).find($("input[name='postId']")).val();	
					 self.location ="/community/getPost?postId="+postId+"&boardName="+boardName;
				});
			}else{
				$( "td:nth-child(2)" ).on("click" , function() {
				     var postId = $(this).find($("input[name='postId']")).val();	
					 self.location ="/community/getPost?postId="+postId+"&boardName="+boardName;
				});
			}
		  });	
	
		$(function(){
			
			var boardName = $("#boardName").val();
			
			$("#addpost_view").on("click" , function() {
				self.location = "/community/addPost?boardName="+boardName;
			});
			
			$("#boardTitle").on("click", function(){
				self.location = "/community/getPostList?boardName="+boardName;
			});
		});
		
		function qnaKategotie(sorting){
			
			if(sorting == 0){
				$("select[name='sorting']").val("0").prop("selected", true);
			}else if(sorting == 1){
				$("select[name='sorting']").val("1").prop("selected", true);
			}else if(sorting == 2){
				$("select[name='sorting']").val("2").prop("selected", true);
			}else if(sorting == 3){
				$("select[name='sorting']").val("3").prop("selected", true);
			}else if(sorting == 4){
				$("select[name='sorting']").val("4").prop("selected", true);
			}else{
				$("select[name='sorting']").val("5").prop("selected", true);
			}
			fncGetUserList(1);
		}
		
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar/toolBar.jsp" />
	<jsp:include page="/toolbar/pushBar.jsp" />
	<jsp:include page="/view/community/sidebar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container" style="max-width: 1000px;">
	
		<div class="h4" id="boardTitle" style="font-weight: bold; margin-top: 40px;padding-left:10px;">
			<c:if test="${param.boardName=='A'}">
			�����Խ���
			</c:if>
			<c:if test="${param.boardName=='B'}">
			��������
			</c:if>
			<c:if test="${param.boardName=='D'}">
			����ã��
			</c:if>
			<c:if test="${param.boardName=='F'}">
			�����ı�
			</c:if>
			<c:if test="${param.boardName=='G'}">
			QnA
			</c:if>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
		    
		    <div class="col-md-12 text-right" style="margin: 10px 0 15px 0">
		    
		      <c:if test="${param.boardName == 'G'}">
		    	<div style="float:left;padding-top:15px;padding-left:10px;font-size:18px;">
			    	<c:if test="${search.sorting == 5}">
			    		<span class="badge badge-info" onclick="qnaKategotie('5')">��Ʈ</span>
			    	</c:if>
			    	<c:if test="${search.sorting != 5}">
			    		<span class="badge badge-secondary" onclick="qnaKategotie('5')">��Ʈ</span>
			        </c:if>
			        <c:if test="${search.sorting == 0}">
			    		<span class="badge badge-info" onclick="qnaKategotie('0')">����</span>
			    	</c:if>
			    	<c:if test="${search.sorting != 0}">
			    		<span class="badge badge-secondary" onclick="qnaKategotie('0')">����</span>
			        </c:if>
			        <c:if test="${search.sorting == 1}">
			    		<span class="badge badge-info" onclick="qnaKategotie('1')">����</span>
			    	</c:if>
			    	<c:if test="${search.sorting != 1}">
			    		<span class="badge badge-secondary" onclick="qnaKategotie('1')">����</span>
			        </c:if>
			         <c:if test="${search.sorting == 2}">
			    		<span class="badge badge-info" onclick="qnaKategotie('2')">����</span>
			    	</c:if>
			    	<c:if test="${search.sorting != 2}">
			    		<span class="badge badge-secondary" onclick="qnaKategotie('2')">����</span>
			        </c:if>
			         <c:if test="${search.sorting == 3}">
			    		<span class="badge badge-info" onclick="qnaKategotie('3')">����,���,ȯ��</span>
			    	</c:if>
			    	<c:if test="${search.sorting != 3}">
			    		<span class="badge badge-secondary" onclick="qnaKategotie('3')">����,���,ȯ��</span>
			        </c:if>
			         <c:if test="${search.sorting == 4}">
			    		<span class="badge badge-info" onclick="qnaKategotie('4')">��Ÿ</span>
			    	</c:if>
			    	<c:if test="${search.sorting != 4}">
			    		<span class="badge badge-secondary" onclick="qnaKategotie('4')">��Ÿ</span>
			        </c:if>
		    	</div>
		      </c:if>
		    
			    <form class="form-inline mt-2 mt-md-0" name="detailForm" style="float:right;">
			      <input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>
			      
			    <c:if test="${param.boardName == 'G'}">
			      <div class="form-group" style="display:none;">
				    <select class="form-control" name="sorting" style="height: 35px; width: 85px; font-size: 13px; margin-right: 2px;" >
						<option value="0"  ${ ! empty search.sorting && search.sorting==0 ? "selected" : "" }>����</option>
						<option value="1"  ${ ! empty search.sorting && search.sorting==1 ? "selected" : "" }>����</option>
						<option value="2"  ${ ! empty search.sorting && search.sorting==2 ? "selected" : "" }>����</option>
						<option value="3"  ${ ! empty search.sorting && search.sorting==3 ? "selected" : "" }>����,���,ȯ��</option>
						<option value="4"  ${ ! empty search.sorting && search.sorting==4 ? "selected" : "" }>��Ÿ</option>
						<option value="5"  ${ ! empty search.sorting && search.sorting==5 ? "selected" : "" }>��Ʈ</option>
					</select>
				  </div>
			    </c:if>  
			      
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="height: 35px; width: 85px; font-size: 13px; margin-right: 2px;" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>����</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>�г���</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>�±�</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control mr-sm-2" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" style="height: 35px; font-size: 13px;" >
				  </div>
				  
				  &nbsp;<i class="fas fa-search"></i>
			
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
	<div class="table-responsive" style="font-size:14px;">	
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover" style="text-align:center;">
      
        <thead>
          <tr>
            <th scope="col">�Խñ۹�ȣ</th>
          <c:if test="${param.boardName=='D'}">
            <th scope="col">���೯¥</th>
          </c:if>
            <th scope="col">����</th>
          <c:if test="${param.boardName=='D'}">
            <th scope="col">�ο�</th>
          </c:if>
            <th scope="col">�г���</th>
            <th scope="col">�ۼ���</th>
            <th scope="col">��ȸ��</th>
            <th scope="col">��õ��</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="post" items="${list}">
			<tr>
		  <c:if test="${post.postGrade == 'N'}">
		  	  <th scope="row" style="color:#CE1717;">���� <i class="fas fa-bullhorn"></i></th>
			  <td style="text-align:left;">
			  <input type="hidden" id="postId" name="postId" value="${post.postId}"/><span>${post.postTitle}</span> <span style="color:red;">(${post.comments})</span></td>
		  </c:if>
		  <c:if test="${post.postGrade == 'B' || post.postGrade == null}">
		  <c:set var="i" value="${ i+1 }" />
			  <th scope="row">${ i }</th>
			<c:if test="${param.boardName == 'D'}">
			  <c:if test="${post.accEndDate == null}">
			    <td><fmt:formatDate value="${post.accStartDate}" pattern="yyyy-MM-dd"/></td>
			  </c:if>
			  <c:if test="${post.accEndDate != null}">
			    <td><fmt:formatDate value="${post.accStartDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${post.accEndDate}" pattern="yyyy-MM-dd"/></td>
			  </c:if>
			</c:if>
			  <td style="text-align:left;">
			  <input type="hidden" id="postId" name="postId" value="${post.postId}"/>
			  <span style="color:black;">
			  <c:if test="${post.boardName=='G'}">
				  <c:if test="${post.qnaKategorie=='M'}">
					[��Ʈ]
				  </c:if>
				  <c:if test="${post.qnaKategorie=='H'}">
					[����]
				  </c:if>
				  <c:if test="${post.qnaKategorie=='I'}">
					[����]
				  </c:if>
				  <c:if test="${post.qnaKategorie=='J'}">
					[����]
				  </c:if>
				  <c:if test="${post.qnaKategorie=='K'}">
					[����,���,ȯ��]
				  </c:if>
				  <c:if test="${post.qnaKategorie=='L'}">
					[��Ÿ]
				  </c:if>
			  </c:if>
			  </span>
			  ${post.postTitle} <span style="color:red;">(${post.comments})</span></td>
		  <c:if test="${param.boardName == 'D'}">
		   	  <td>${post.accCount}/${post.accPerson}</td>
		  </c:if>
		  </c:if>
			  <td>${post.nickName}</td>
		  <c:if test="${param.boardName == 'D'}">
		   	  <td><fmt:formatDate value="${post.postDate}" pattern="yyyy-MM-dd"/></td>
		  </c:if>
		  <c:if test="${param.boardName != 'D'}">
			  <td><fmt:formatDate value="${post.postDate}" pattern="yyyy-MM-dd"/></td>
		  </c:if>
			  <td>${post.views}</td>
			  <td>${post.postLikeCount}</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
     </div>
	  <!--  table End /////////////////////////////////////-->
	  <button type="button" id="addpost_view" class="btn btn-dark">�ۼ��ϱ�</button>
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	<jsp:include page="/toolbar/footer.jsp" />
</body>

</html>