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
	
	
	
	<!-- �۾�ü ������ �ɾ�� link -->
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
 
 <!-- ��Ʈ��Ʈ�� ������ ��� cdn fontawesome.com  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<!-- CSS �Ӽ��� -->
<style>
	
	/*include�� ���� ui ������  */
	.tollbar{
		padding: 15px;
	}
	
	h3{
	font-size: 27px;
	}
	/* �̰� �־ȵ���?????????  */
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
</style>


<script type="text/javascript">

	/* //=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	 */
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "GET").attr("action" , "/admin/getAdminQnAList").submit();
	};//end of getUserList(CurrentPage)
	
	
	/*======== �˻��� �������� 1�������� ����������] =============  */
	$(function() {
		 $( ".form-control" ).change(function() {
		 	fncGetUserList(1);
		 }); 
	});//end of function	
	
</script>



</head>


<body>

	<div class="container">
	
		<!-- =============== ���ι��� ���� ��Ŭ���  ========== -->
		<div class="tollbar">
			<jsp:include page="/toolbar/toolBar.jsp"></jsp:include> 
		</div>
		<!-- =========== �̱���  ================ -->
		
	<div class="page-header text-info">

		<h3 class="font-weight-bold">1:1���Ǹ�� ����ȸ</h3>
	
	 </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
	    	<!-- �˻����� �� �� ��, ���� ������ ��Ÿ���� �۾�  -->
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		Total  ${resultPage.totalCount } �Ǽ�, ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    
		    <div class="col-md-6 text-right d-flex justify-content-end">
		    
		    <!-- =========================== �˻����� ����â =========================== -->
		     <form class="form-inline" name="detailForm">
			      <input type="hidden" id="qnaFirstCate" name="qnaFirstCate" value="${param.qnaFirstCate}"/>
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="height: 30px; width: 120px; font-size: 13px; margin-right: 2px;" >
						<c:if test="${empty search.searchCondition }">
						<option class="from-option" value="" >��ü</option>
						<option class="from-option" value="A" >�ֹ�����</option>
						<option class="from-option" value="B" >��ǰ����</option>
						<option class="from-option" value="C" >��Ÿ</option>
						</c:if>
						
						<c:if test="${!empty search.searchCondition }">
						<option class="from-option" value="" >��ü</option>
						<option class="from-option" value="A"  ${ ! empty search.searchCondition && search.searchCondition=='A' ? "selected" : "" }>�ֹ�����</option>
						<option class="from-option" value="B"  ${ ! empty search.searchCondition && search.searchCondition=='B' ? "selected" : "" }>��ǰ����</option>
						<option class="from-option" value="C"  ${ ! empty search.searchCondition && search.searchCondition=='C' ? "selected" : "" }>��Ÿ</option>
						</c:if>
					</select>
				  </div>
				   <!-- ======================== �˻����� ����â ��  ========================= -->
		    
		      		<!-- ������ ������  fontawesome.com-->
				  &nbsp;&nbsp;<i class="fas fa-search" style="font-size: x-large"></i>
				  
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
	    	 </form>
	    	</div>
		</div>
		
		<div class="table-responsive">
		
		<!-- =============================== ������� �Խ��� ���̺�  ���� ============================-->
			<table class="table table-hover">
	        <thead>
		        <tr class="top shadow-sm p-3 mb-5 bg-white rounded " style="font-size:small;">
		            <th scope="col" style= "width:7%;">��ȣ</th>
		            <th scope="col" style= "width:7%;">����</th>
		            <th scope="col" style= "width:50%; text-align:center;">����</th>
		            <th scope="col" style= "width:10%;">�з�</th>
		            <th scope="col" style= "width:10%;">�۾���</th>
		            <th scope="col"	style="width:10%;">��¥</th>
		          </tr>
	        </thead>
	        
		<!-- ========���̺� ���� ���� ========== -->
			<tbody class="userTab" style="font-size: small;">
			  <c:set var="i" value="0" />
			  <c:forEach var="post" items="${list }">
				<c:set var="i" value="${i+1 }" />
				<tr>
				
				<!-- �Խñ۹�ȣ -->
				  <th scope="row">${ i }</th>
				    <!--========= END ========== -->
				    
				  <!-- �亯����  -->
				  <td style="font-weight: bold; color: dimgray;">
				  <c:if test="${post.postGrade != 'Q' }">
		   			<span class="badge badge-pill badge-secondary">�亯����</span>
		   			</c:if>	
					<c:if test="${post.postGrade == 'Q' }">
		   			<span class="badge badge-pill badge-success">�亯�Ϸ�</span>
			   		</c:if>
				  </td>
				  <!--========= END ========== -->
				  
				  <!--����  -->
				  <td style="text-align: left;">${post.postTitle }
				  <input type="hidden" id="postId" name="postId" value=""/></td>
				    <!--========= END ========== -->
				  
				  <!-- �����з� ����  -->
				  <td> 
				  <c:if test="${post.qnaFirstCate=='A'}">
				    	�ֹ�����
				   </c:if>
				   <c:if test="${post.qnaFirstCate=='B'}">
				    	��ǰ����
				   </c:if>
				   <c:if test="${post.qnaFirstCate=='C'}">
				    	��Ÿ
				   </c:if>
					</td>  
					 <!--========= END ========== -->
					 
				  <!-- �ۼ��� ID  -->  
				  <td>${post.postWriterId }</td>
				   <!--========= END ========== -->
				   
				   <!-- �ۼ�����  -->
				  <td><c:set var="regDate" value="${fn:split(post.postDate,' ')}"></c:set>
					<c:out value="${regDate[0]}"></c:out></td>
					   <!--========= END ========== -->
				</tr>
	          </c:forEach>
			</tbody>
			</table>
				<!-- ========== ���̺� ���� �� ============ -->
			</div>
			<!--================================ ���̺�   =====================================-->
	</div>
	<!-- ================== div : Container End  ================-->	
	
	<div id="userInfoProfile" style="width: 1150px;height:150px;position: relative;left: 100px; top:-200px;">
	<h3>��۴ޱ�</h3>
	</div>
	
	
		<!-- pageNavigator include  -->
		<jsp:include page="../../common/pageNavigator_new.jsp"/>

</body>

</html>