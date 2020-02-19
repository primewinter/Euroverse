<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>getPlanList</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />



<!-- 부트스트랩 4.4 쓰려다가 빠꾸...............................했다가 다시 4.4로..  -->
<!-- Bootstrap CSS -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->





	<!-- ICON 사용을 위한 스크립트 임포트 -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>
	
	
	<script>
		
		/* 모달창 닫기 */
		function closeModal(modalName) {
			console.log("closeModal : modalName="+modalName);
			if( typeof $("."+modalName)[0] != "undefined" ){
				$("."+modalName)[0].reset();		//form에 모달 이름과 같은 클래스명 주기
			}
			$("#"+modalName).hide();
		}
		
	</script>

</head>
<body>

	<!-- ToolBar 시작 -->
	<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
	<!-- ToolBar 끝 -->

	<!-- 화면구성 div Start ///////////////////////////// -->
	<div class="container-fluid">
		
		<!-- 다단 레이아웃 Start ///////////////////////////// -->
		<div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center">
		
			<h4> 플래너 기능을 사용하시려면 로그인 되어있어야 합니다</h4>
			<div>
				
				
			</div>


		</div>
		<!-- 다단 레이아웃 End ///////////////////////////// -->
		
	</div>
	<!-- 화면구성 div End ///////////////////////////// -->
	
	
	<script>
		/* icon 사용을 위한 스크립트 */
		feather.replace();
	</script>
	

</body>
</html>