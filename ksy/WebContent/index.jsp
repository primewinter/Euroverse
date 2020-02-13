<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
</head>

<body>
	<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
	<h5>Euroverse</h5><br/><br/>

	<a href="https://www.naver.com/">네이버</a><br/>
	<a href="http://192.168.0.60:8080">김서영</a><br/>
	<a href="http://192.168.0.79:8080">김유경</a><br/>
	<a href="http://192.168.0.54:8080">이승환</a><br/>
	<a href="http://192.168.0.66:8080">이주하</a><br/>
	<a href="http://192.168.0.70:8080">박지성</a><br/>
	<a href="http://192.168.0.82:8080">차소영</a><br/>
	
	<br/><br/>
	<a href="/view/plan/page.jsp">/view/plan/page.jsp </a> : 김서영<br/>
	<a href="/view/planSub/page.jsp">/view/planSub/page.jsp </a><br/>
	<a href="/user/getUser">/user/getUser </a> : 박지성<br/>
	<a href="/view/myPage/page.jsp">/view/myPage/page.jsp </a><br/>
	<a href="/view/community/page.jsp">/view/community/page.jsp </a> : 이주하<br/>
	<a href="/view/order/page.jsp">/view/user/page.jsp </a> : 김유경<br/>
	<a href="/view/tripInfo/page.jsp">/view/tripInfo/infinityClick </a> : 이승환<br/>
	<a href="/toolbar/toolBar.jsp">/toolbar/toolBar.jsp </a> : 차소영<br/>
</body>

</html>