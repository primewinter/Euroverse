<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	  body {
            padding-top : 30px;
      }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/community/getPostList").submit();
		}
		
		 $(function() {
			 $( "button.btn.btn-default" ).on("click" , function() {
			 	fncGetUserList(1);
			 });
		 });
		
		 $(function() {
		
			$( "td:nth-child(2)" ).on("click" , function() {
			     var postId = $(this).find($("input[name='postId']")).val();	
				 self.location ="/community/getPost?postId="+postId;
			});
						
			$( "td:nth-child(2)" ).css("color" , "indianred");
			
		});	
	
		$(function(){
			
			var boardName = $("#boardName").val();
			
			$(".btn.btn-primary").on("click" , function() {
				self.location = "/community/addPost?boardName="+boardName;
			});
		});
		
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/community/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
		<c:if test="${param.boardName=='A'}">
			<h3>�����Խ���</h3>
		</c:if>
		<c:if test="${param.boardName=='B'}">
			<h3>��������</h3>
		</c:if>
		<c:if test="${param.boardName=='C'}">
			<h3>�α�۰Խ���</h3>
		</c:if>
		<c:if test="${param.boardName=='D'}">
			<h3>����ã��</h3>
		</c:if>
		<c:if test="${param.boardName=='E'}">
			<h3>�÷��ʰ���</h3>
		</c:if>
		<c:if test="${param.boardName=='F'}">
			<h3>�����ı�</h3>
		</c:if>
		<c:if test="${param.boardName=='G'}">
			<h3>QnA</h3>
		</c:if>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			      <input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>����</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>�г���</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>�±�</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">�Խñ۹�ȣ</th>
            <th align="left" >����</th>
            <th align="left">�г���</th>
            <th align="left">�ۼ���</th>
            <th align="left">��ۼ�</th>
            <th align="left">��ȸ��</th>
            <th align="left">��õ��</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="post" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">${ i }</td>
			  <td align="left">
			  <input type="hidden" id="postId" name="postId" value="${post.postId}"/>${post.postTitle}</td>
			  <td align="left">${post.postWriterId}</td>
			  <td align="left">${post.postDate}</td>
			  <td align="left">${post.comments}</td>
			  <td align="left">${post.views}</td>
			  <td align="left">${post.postLikeCount}</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  <button type="button" class="btn btn-primary">�ۼ��ϱ�</button>
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>