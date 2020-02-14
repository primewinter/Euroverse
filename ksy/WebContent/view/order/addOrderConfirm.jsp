<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<html>
<head>
<title>Insert title here</title>
<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

	<!--  bootstrap jQuery CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
	<style>
	
		body{
		 padding-top : 50px;
		}
       body > div.container{
        	border: 3px solid white;
            margin-top: 10px;
            
        }
   
    </style>
    <script type="text/javascript">
    $( function () {
	$('button.btn.btn-warning').on('click' , function () {
		var orderId = $("#orderId").val();
		alert("${order.orderId}");
		self.location ="/view/flight/searchFlight.jsp";

		//  $("form").attr("method" , "POST").attr("action" , "/order/addOrderConfirm?orderId=${order.orderId}").submit();
	});
});
    </script>

</head>

<body>

<div class="container"><br/>
	<div class="alert alert-warning" role="alert">
	  <h5 align="center" style="font-size:30px; font-family : Consolas;">Order History</h5>
	</div>
	
	<form class="form-horizontal">
		
		<div class="row">
		 <c:if test="${room.roomCity == null }">
			<div class="col-xs-4 col-md-2"><strong>도착도시</strong></div>
			<div class="col-xs-8 col-md-4">${flight.depCity }</div>
		</c:if>
		 <c:if test="${flight.depCity == null }">
			<div class="col-xs-4 col-md-2"><strong>도착지역</strong></div>
			<div class="col-xs-8 col-md-4">${room.roomCity }</div>
		</c:if>
		</div>
	<hr/>
	
	<div class="row">
	<c:if test="${flight.arrCity == null }">
			<div class="col-xs-4 col-md-2"><strong>숙소이름</strong></div>
			<div class="col-xs-8 col-md-4">${room.roomName }</div>
	</c:if>
	<c:if test="${room.roomName == null }">
			<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${flight.arrCity }</div>
	</c:if>
		</div>
	<hr/>
	
	<div class="row">
			<div class="col-xs-4 col-md-2"><strong>orderId</strong></div>
			<div class="col-xs-8 col-md-4">${order.orderId }</div>
		</div>
	<hr/>
	
	

   		 <div class="col-sm-offset-4  col-sm-4 text-center">
		<button type="button" class="btn btn-warning"  >예약확정</button>
		</div>
		</div>
		
	</form>
	
	
</div>


</body>
</html>
