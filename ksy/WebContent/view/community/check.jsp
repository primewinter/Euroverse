<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>getPostList</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >

	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
	
	<script>
	</script>

</head>
<body>

	<!-- ToolBar ���� -->
	<jsp:include page="/toolbar/toolBar.jsp" />
	<jsp:include page="/toolbar/pushBar.jsp" />
	<jsp:include page="/view/community/sidebar.jsp"/>
	<!-- ToolBar �� -->

	<!-- ȭ�鱸�� div Start ///////////////////////////// -->
	<div class="container">
	
	<c:if test="${ !empty user && user.role == 'G'}">
		<div class="h4" style="text-align:center;">����ã��� ���������� ��� �����մϴ�.</div>
	</c:if>
	<c:if test="${empty user}">	
		<div class="h4" style="text-align:center;">�Խñ� ��ȸ�� �α��� �� �̿� �����մϴ�.</div>
	</c:if>
		
	</div>
	<!-- ȭ�鱸�� div End ///////////////////////////// -->
	<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</body>
</html>