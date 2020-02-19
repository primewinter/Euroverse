<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>getPlanList</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />



<!-- ��Ʈ��Ʈ�� 4.4 �����ٰ� ����...............................�ߴٰ� �ٽ� 4.4��..  -->
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





	<!-- ICON ����� ���� ��ũ��Ʈ ����Ʈ -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>
	
	
	<script>
		
		/* ���â �ݱ� */
		function closeModal(modalName) {
			console.log("closeModal : modalName="+modalName);
			if( typeof $("."+modalName)[0] != "undefined" ){
				$("."+modalName)[0].reset();		//form�� ��� �̸��� ���� Ŭ������ �ֱ�
			}
			$("#"+modalName).hide();
		}
		
	</script>

</head>
<body>

	<!-- ToolBar ���� -->
	<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
	<!-- ToolBar �� -->

	<!-- ȭ�鱸�� div Start ///////////////////////////// -->
	<div class="container-fluid">
		
		<!-- �ٴ� ���̾ƿ� Start ///////////////////////////// -->
		<div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center">
		
			<h4> �÷��� ����� ����Ͻ÷��� �α��� �Ǿ��־�� �մϴ�</h4>
			<div>
				
				
			</div>


		</div>
		<!-- �ٴ� ���̾ƿ� End ///////////////////////////// -->
		
	</div>
	<!-- ȭ�鱸�� div End ///////////////////////////// -->
	
	
	<script>
		/* icon ����� ���� ��ũ��Ʈ */
		feather.replace();
	</script>
	

</body>
</html>