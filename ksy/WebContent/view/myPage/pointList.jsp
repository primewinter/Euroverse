<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${  empty user }">
		<jsp:forward page="/"/>
	</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- jquery Ui ��ũ (datePicker)  -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!--datePicker CDN  -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- boot strap File upload CDN  -->
<script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.js"></script>

<!-- swiper CDN -->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<!--========================= -->

<!-- fontawesome CDN -->
<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script type="text/javascript">

	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("#pointListForm").attr("method" , "POST").attr("action" , "/myPage/pointList").submit();
	}
	
	 $(function() {
		 
		 $("button:contains('����')").on("click",function(){
			 $("input[name='searchKeyword']").val("save");
			 $("#pointListForm").attr("method" , "POST").attr("action" , "/myPage/pointList").submit();
			 
		 });
		 $("button:contains('����')").on("click",function(){
			 $("input[name='searchKeyword']").val("use");
			 $("#pointListForm").attr("method" , "POST").attr("action" , "/myPage/pointList").submit();
			 
		 });
		 
		 $("button:contains('�ֽż�')").on("click",function(){
			 $("input[name='searchKeyword']").val(null);
			 $("#pointListForm").attr("method" , "POST").attr("action" , "/myPage/pointList").submit();
			 
		 });
	 });
	 
	 
	 


</script>


</head>
<body>
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>
	<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>	
       <div style="height: 100px;"></div>
		
	



<table class="table" style="margin-left: 240px; width: 75%; text-align: center;">
	
	<form id="pointListForm">
	 <input type="hidden" id="currentPage" name="currentPage" value=0 /> 
	
	<h3 style="margin-left: 240px;">��������Ʈ</h3>
	<h2 style="margin-left: 240px;">${user.totalPoint} Point
	  <button type="button" class="btn btn-outline-warning waves-effect btn-sm">�ֽż�</button>
	  <button type="button" class="btn btn-outline-warning waves-effect btn-sm">����</button>
	  <button type="button" class="btn btn-outline-warning waves-effect btn-sm">����</button>
	  
	<c:if test="${search.searchKeyword != null}">
		<c:if test="${search.searchKeyword =='save'}">
	 	 	<input type="hidden"  name="searchKeyword" value="save">
		</c:if>
		<c:if test="${search.searchKeyword =='use'}">
	 	 	<input type="hidden"  name="searchKeyword" value="use">
		</c:if>
	</c:if>	
	<c:if test="${search.searchKeyword == null}">
		<input type="hidden"  name="searchKeyword" value="">
	</c:if>  
	</h2>
	</form>
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">����(����/����)</th>
      <th scope="col">����</th>
      <th scope="col">����/��������Ʈ</th>
      <th scope="col">����Ͻ�</th>
    </tr>
  </thead>
  <tbody >
  	<c:forEach var="point" items="${pointList}" varStatus="status">
	    <tr>
	      <th scope="row">${status.count}</th>
	      	<td>${point.usedData}</td>
	      	<td>${point.usedContent}</td>
	      	
	      	<c:if test="${point.usedData=='����'}">
	      	<td><i class="fas fa-plus" style="font-size: 10px; vertical-align: middle;"></i>${point.usedPoint}</td>
	      	</c:if>
      		<c:if test="${point.usedData=='����'}">
      		<td><i class="fas fa-minus" style="font-size: 10px; vertical-align: middle;"></i>${point.usedPoint}</td>
      		</c:if>
	      	
	      	
		    <td>${point.usedDate }</td>
	    </tr>
  	</c:forEach>
  </tbody>
</table>




<jsp:include page="../../common/pageNavigator_new.jsp"/>








</body>
<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</html>