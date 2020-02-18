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
		
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar/toolBar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="h3" style="font-weight: bold; margin-top: 40px;">
			<c:if test="${param.boardName=='A'}">
			�����Խ���
			</c:if>
			<c:if test="${param.boardName=='B'}">
			��������
			</c:if>
			<c:if test="${param.boardName=='C'}">
			�α�۰Խ���
			</c:if>
			<c:if test="${param.boardName=='D'}">
			����ã��
			</c:if>
			<c:if test="${param.boardName=='E'}">
			�÷��ʰ���
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
			    <form class="form-inline mt-2 mt-md-0" name="detailForm" style="float:right;">
			      <input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="height: 30px; width: 85px; font-size: 13px; margin-right: 2px;" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>����</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>�г���</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>�±�</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control mr-sm-2" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" style="height: 30px; font-size: 13px;" >
				  </div>
				  
				  &nbsp;<i class="fas fa-search"></i>
			
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
	<div class="table-responsive">	
      <!--  table Start /////////////////////////////////////-->
      <table class="table">
      
        <thead>
          <tr>
            <th scope="col">�Խñ۹�ȣ</th>
            <th align="left" >�Խ����̸�</th>
            <th scope="col">����</th>
            <th scope="col">�г���</th>
            <th scope="col">�ۼ���</th>
            <th scope="col">��ۼ�</th>
            <th scope="col">��ȸ��</th>
            <th scope="col">��õ��</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="post" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <th scope="row">${ i }</th>
			  <td align="left">
				<c:if test="${post.boardName=='A'}">
					�����Խ���
				</c:if>
				<c:if test="${post.boardName=='B'}">
					��������
				</c:if>
				<c:if test="${post.boardName=='D'}">
					����ã��
				</c:if>
				<c:if test="${post.boardName=='E'}">
					�÷��ʰ���
				</c:if>
				<c:if test="${post.boardName=='F'}">
					�����ı�
				</c:if>
				<c:if test="${post.boardName=='G'}">
					QnA
				</c:if>
			  </td>
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
	
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>