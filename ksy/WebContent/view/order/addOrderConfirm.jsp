<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<html>
<head>
<title>Insert title here</title>
<meta charset="EUC-KR">
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	

  	<!-- jQuery UI toolTip ��� CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip ��� JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	
       body > div.container{
        	border: 3px solid white;
            margin-top: 10px;
            
        }
   
    </style>
    <script type="text/javascript">
    $( function () {
	$('button.btn.btn-warning').on('click' , function () {
		var orderId = $("#orderId").val();
		var room = $("#roomCity").val();
		var flight = $("#depCity").val();
		alert("${order.orderId}");
		if (room == null) {
		self.location ="/view/flight/searchFlight.jsp";
		}else if(flight == null){
		self.location = "/view/room/searchRoom.jsp";
		}
		//  $("form").attr("method" , "POST").attr("action" , "/order/addOrderConfirm?orderId=${order.orderId}").submit();
	});
});
    </script>

</head>

<body>
	<jsp:include page="/toolbar/toolBar.jsp" />
	 <jsp:include page="/toolbar/pushBar.jsp" />
	<form>

<div class="container"><br/>

	<div >
	  <h3 align="center">${user.userName}�� ������ ���������� �Ϸ�Ǿ����ϴ�.</h3>
	</div>
	
		 <c:if test="${room.roomCity == null }">
		 	<hr/>
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
		 	<hr/>
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
					      <td>${room.roomNum} ��</td>
					      <td>���� ${room.adultNum} �� , ���� ${room.childNum} ��</td>
					      <td>${room.price}��</td>
					    </tr>
					  </tbody>
				</table>
		</c:if>
		
		<br/>
		
		<div class="row">
			<i class="fas fa-won-sign" style="Padding-left:20px;font-size:40px;"></i>
			<h4 align="left" style="margin-top:5px;margin-left:10px;font-size:17px;">���� �Ϸ� ����</h4>
		</div>	
			<hr/>
			<div class="row">
	             <div class="col-sm-2">
	            		 �� ���� �ݾ�
	                    <div class="row">
	                    	<c:if test="${flight.depCity == null }">	
	                   			<div id="totalAmount" style="Padding-left:30px;">${room.price}��</div> 
	            			</c:if>
	            			<c:if test="${room.roomCity == null }">	
	                   			<div id="totalAmount" style="Padding-left:30px;">${flight.price}��</div>
	            			</c:if>
	            		</div>
	             </div>
	             <div class="col-sm-1">
	             	<i class="fas fa-minus-circle" style="margin-top:10px;"></i>
	             </div>
	             <div class="col-sm-2" style="Padding-left:30px;">
	            		 ����Ʈ ����
	                    <div class="row">
	                    	<div id="usedPoint" style="Padding-left:20px;"> - ${point.usedPoint} P</div>
	            		</div>
	             </div>
	             <div class="col-sm-1">
	             	<i class="fas fa-equals" style="margin-left:15px;margin-top:10px;"></i>
	             </div>
	             <div class="col-sm-2" style="Padding-left:40px;">
	            		 �� ���� �ݾ�
	                    <div class="row">
	                    	<div id="actualAmount" style="Padding-left:20px;">${order.actualAmount}��</div>
	            		</div>
	             </div>
			</div>
			<br/>
			<hr style="width:50%;float:left;margin-right:700px;" />
			
				<div class="row" style="Padding-left:190px;">
					<div class="col-sm-1" style="margin-top:10px;">
						<i class="fas fa-plus"></i>
					</div>
					<%-- <div class="col-sm-3">
				 		����� ����Ʈ 
						<div id="payPoint" style="Padding-left:20px;">${order.payPoint} P</div>
					 <i class="fas fa-minus-circle" style="margin-top:10px;"></i>
					</div> --%>
					<div class="col-sm-2" style="margin-left:30px;">
						<p>���� �� ����Ʈ</p>
							<%-- <c:if test="${point.usedType eq 'F' | point.usedType eq 'R' }"> --%>
					 			<div id="addPoint" style="Padding-left:20px;">${order.addPoint} P </div>
					</div>
					<div class="col-sm-1" style="margin-left:20px;">
						<i class="fas fa-equals" style="margin-left:15px;margin-top:10px;"></i>
					</div>
					<div class="col-sm-2" style="margin-left:50px;">
						<p>�� ����Ʈ</p>
							<div id="totalPoint" style="margin-left:10px;">${user.totalPoint} P </div>
					</div>
				</div>
			<br/>
		<div class="row">
			<i class="fas fa-user" style="Padding-left:20px;font-size:40px;"></i>
			<h4 align="left" style="margin-top:5px;margin-left:10px;font-size:17px;">������ ����</h4>
		</div>
		<hr/>
			<div>
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
			</div>
		<hr/>
	
	   		 <div class="form-group" align="center">
			<button type="button" class="btn btn-warning"  >Ȯ��</button>
			</div>
			
			 <jsp:include page="/toolbar/footer.jsp" />
</div>
			
	</form>
</body>
</html>
