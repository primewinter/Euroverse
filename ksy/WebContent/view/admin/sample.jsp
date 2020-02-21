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


 
 <!-- 부트스트랩 아이콘 사용 cdn fontawesome.com  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<!-- CSS 속성값 -->
<style>
.q{
	width :30px;
	margin: 10px;
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

	
</script>



</head>


<body>

	<form>
		<!-- =============== 유로버스 툴바 인클루드  ========== -->
		<div class="tollbar">
			<jsp:include page="/toolbar/toolBar.jsp"></jsp:include> 
		</div>
		<!-- =========== 이까지  ================ -->
		
		<table class="outer">
		  <tbody>
			<tr class="inner" style="display: inline-block;">
			<td>
			<img class ="q" alt="" src="\resources\images\admin\Qicon.png">
			</td>
			<td>	
			asdfasdfasdfAasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadas
			</td>
			<td>
			<div class="form-group">
		   	 <label for="exampleFormControlTextarea1"></label>
		     <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		  	</div>
			</td>
			
		  	 </tr>
			</tbody>
		</table>
		
	</form>			 

	

</body>

</html>