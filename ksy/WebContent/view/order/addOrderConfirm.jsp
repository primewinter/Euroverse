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
	<form>

<div class="container"><br/>

	<div >
	  <h5 align="center">${user.userName}�� ������ �Ϸ�Ǿ����ϴ�.</h5>
	</div>
	<hr/>
		<div class="row" style="margin-bottom: 15px" >
				  <div class="col-md-3">������</div>
				  <div class="col-md-9">${order.buyerName}</div>
		</div>
		<div class="row" style="margin-bottom: 15px" >
				  <div class="col-md-3">����ó</div>
				  <div class="col-md-9">${order.buyerPhone}</div>
		</div>
		<div class="row" style="margin-bottom: 15px" >
				  <div class="col-md-3">Email</div>
				  <div class="col-md-9">${order.buyerEmail}</div>
		</div>
		<hr/>
		 <c:if test="${room.roomCity == null }">
			<i class="fas fa-plane" id="iconf" style="Padding-left:20px;font-size:40px;" ></i>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">�װ���</th>
					      <th scope="col">��߽ð�</th>
					      <th scope="col">�����ð�</th>
					      <th scope="col">����</th>
					      <th scope="col">�ҿ�ð�</th>
					      <th scope="col">����</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${flight.airline}</th>
					      <td>${flight.depTime}</td>
					      <td>${flight.arrTime}</td>
					      <td>${flight.stopOver}</td>
					      <td>${flight.leadTime}</td>
					      <td>${flight.price}��</td>
					    </tr>
					  </tbody>
				</table>
		</c:if>
		 <c:if test="${flight.depCity == null }">
			<i class="fas fa-bed" id="iconr" style="Padding-left:20px;font-size:40px;"></i>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">����</th>
					      <th scope="col">üũ��</th>
					      <th scope="col">üũ�ƿ�</th>
					      <th scope="col">���Ǽ�</th>
					      <th scope="col">�����ο�</th>
					      <th scope="col">����</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${room.roomName}</th>
					      <td>${room.checkIn}</td>
					      <td>${room.checkOut}</td>
					      <td>${room.roomNum}</td>
					      <td>���� ${room.adultNum} �� , ���� ${room.childNum} ��</td>
					      <td>${room.price}��</td>
					    </tr>
					  </tbody>
				</table>
		</c:if>
		
		
		
		<div class="row">
		
			<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${flight.depCity }</div>
		 <c:if test="${flight.depCity == null }">
			<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${room.roomCity }</div>
		</c:if>
		</div>
	<hr/>
	
	<div class="row">
	<c:if test="${flight.arrCity == null }">
			<div class="col-xs-4 col-md-2"><strong>�����̸�</strong></div>
			<div class="col-xs-8 col-md-4">${room.roomName }</div>
	</c:if>
	<c:if test="${room.roomName == null }">
			<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
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
		<button type="button" class="btn btn-warning"  >����Ȯ��</button>
		</div>
		</div>
		
	
	


	</form>
</body>
</html>
