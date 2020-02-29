<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*" %>     

<html>
<head>
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
    
    $(function() {
			$("#refundApp2").click(function(){
				
				
				var orderId = $("#orderId").val();
				var flightId = $("#flightIds").val();
				var roomId = $("#roomIds").val("");
				var orderStatus = $("#orderStatus").val();
					orderStatus = 2;
				
	 			$.ajax (
	 					{
	 						url : "/order/json/getOrderRefund/"+orderId+"/"+2 ,
	 						method : "GET",
	 						dataType : "json",
	 						headers : {
	 							"Accept" : "application/json",
	 							"Content-Type" : "application/json"
	 						},
	 						success : function (JSONData, status ) {
	 							console.log("�ù���...");
	 							var displayValue = "<h4 align='left' id='title'>";
	 							displayValue += "ȯ�ҽ�û"
	 										+ "</h4>";
	 								
	 							$("#title").html("");
	 							$("#title").html(displayValue);
	 							console.log("�ù���2...");
	 						}
	 						
	 					})
	 					console.log("�ù���3...");
	 					$("#refund").modal("hide");
	 					$("#refundApp1").css( 'display' , 'none');
			});
		});
    
   /*  
    $( function () {
	$("#refundApp2").on('click' , function () {
		var orderId = $("#orderId").val();
		var flightId = $("#flightIds").val();
		var roomId = $("#roomIds").val("");
		var orderStatus = $("#orderStatus").val();
			orderStatus = 2;
		$("#refundApp2").modal("hide");
		
		$("#refundApp1").css( 'outline' , '0');
		
		self.location ="/order/getOrderRefund?orderId="+orderId+"&orderStatus="+orderStatus;
		
		//$("form").attr("method" , "POST").attr("action" , "/order/getOrderRefund").submit();
	});
});  */
    
    $(function () {
    	$(".btn.btn-warning").click(function() {
    		if (  $("#role").val() != 'A') {
    			self.location = "/order/getOrderList";	
			}else{
    		
    		self.location = "/order/getOrderListAdmin";	
			}
    	});
    });
    </script>

</head>

<body>
	<jsp:include page="/toolbar/toolBar.jsp" />
	 <jsp:include page="/toolbar/pushBar.jsp" />
	<form>
	<input type="hidden" name="role" id="role" value= "${user.role }"/>
	<input type="hidden" name="orderId" id="orderId" value= "${order.orderId }"/>
	<input type="hidden" name="orderStatus" id="orderStatus" value= "${order.orderStatus }"/>
	<input type="hidden" name="flightId" id="flightIds" value= "${flight.flightId }"/>
	<input type="hidden" name="roomId" id="roomIds" value= "${room.roomId }"/>
<div class="container">
<br/><br/>
			<h4 align="left" id="title" style="margin-left:480px;">
				  <c:if test="${order.orderStatus == 'O' }">
			      	�ֹ��Ϸ�
			      </c:if>
			      <c:if test="${order.orderStatus == 'A' }">
			      	ȯ�ҽ�û
			      </c:if>
			      <c:if test="${order.orderStatus == 'R' }">
			      	ȯ�� ó����
				  </c:if>
				  <c:if test="${order.orderStatus == 'C' }">
				  	ȯ�ҿϷ�
				  </c:if>
			</h4>
		 <c:if test="${room.roomName == null }">
		 	<br/>
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
					      <c:if test="${flight.tripCourse == 'R' }">
					     	 <td>�պ� ����</td>
					      </c:if>
					       <c:if test="${flight.tripCourse == 'O' }">
					     	 <td>�� ����</td>
					      </c:if>
					      <!--  flight.price �� �ٲ������ -->
					      <td><fmt:formatNumber value="${flight.price}" pattern="###,###" />��</td>
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
					      <td>${room.roomNum}</td>
					      <td>���� ${room.adultNum} �� , ���� ${room.childNum} ��</td>
					      <td><fmt:formatNumber value="${room.price}" pattern="###,###" />��</td>
					    </tr>
					  </tbody>
				</table>
		</c:if>
		
		<br/>
		
		<div class="row">
			<div class="col-8">
				<i class="fas fa-won-sign" style="Padding-left:20px;font-size:40px;"></i>
				<span  style="margin-top:5px;margin-left:10px;font-size:17px;">���� �Ϸ� ����</span>
			</div>
			<div class="col-4">	
				<c:if test="${order.orderStatus == 'C' }">
					<i class="fas fa-hand-holding-usd" style="font-size:40px;"></i>
					<span  style="margin-left:10px;font-size:17px;">ȯ�� ����</span>
				</c:if>
			</div>
		</div>	
			<hr/>
			<div class="row">
	             <div class="col-sm-2">
	            		 �� ���� �ݾ�
	                    <div class="row">
	                    	<c:if test="${flight.depCity == null }">	
	                   			<div id="totalAmount" style="Padding-left:30px;"><fmt:formatNumber value="${room.price}" pattern="###,###" />��</div> 
	            			</c:if>
	            			<c:if test="${room.roomName == null }">	 		<!-- flight.price �� �ٲ������ -->
	                   			<div id="totalAmount" style="Padding-left:30px;"><fmt:formatNumber value="${flight.price}" pattern="###,###" />��</div>
	            			</c:if>
	            		</div>
	             </div>
	             <div class="col-sm-1">
	             	<i class="fas fa-minus-circle" style="margin-top:10px;"></i>
	             </div>
	             
	             <c:set var = "i" value="0"/>
				<c:forEach var="point" items = "${point}" >
				<c:set var="i" value="${i+1}"/>
				<c:if test="${point.usedType == 'U'}" >
	             <div class="col-sm-2" style="Padding-left:30px;">
	            		 ����Ʈ ����
	                    <div class="row">
	            <!--         if (point.getUsedType() == "R") {
							order.setAddPoint(point.getUsedPoint());
						}else if(point.getUsedType() == "U") {
							order.setPayPoint(point.getUsedPoint());
						} -->
	                    	<div id="usedPoint" style="Padding-left:20px;"> - ${point.usedPoint} P</div>
	            		</div>
	            		
	             </div>
	             </c:if>
	            </c:forEach>
	             
	             <div class="col-sm-1">
	             	<i class="fas fa-equals" style="margin-left:15px;margin-top:10px;"></i>
	             </div>
	             <div class="col-sm-2" style="Padding-left:40px;">
	            		 �� ���� �ݾ�
	                    <div class="row">
	                    	<div id="actualAmount" style="Padding-left:20px;"><fmt:formatNumber value="${order.actualAmount}" pattern="###,###" />��</div>
	            		</div>
	             </div>
	             <c:if test="${order.orderStatus == 'C' }">
	           <div class="col-4">  <!-- style="background-color:whitesmoke;width:40%;" -->
	           		<div class="" style="margin-left:50px;">ȯ�� �ݾ�</div>
	           		<div class="row">
	                    	<div id="actualAmount" style="margin-left:60px;"><fmt:formatNumber value="${order.actualAmount}" pattern="###,###" />��</div>
	            		</div>
	           </div>
	           </c:if>
			</div>
			<br/>
			<hr style="width:60%;float:left;margin-right:700px;" />
			
			
				<div class="row" style="Padding-left:190px;">
					<div class="col-sm-1" style="margin-top:10px;">
						<i class="fas fa-plus"></i>
					</div>
					<c:set var = "i" value="0"/>
					<c:forEach var="point" items = "${point}" >
					<c:set var="i" value="${i+1}"/>
				   <c:if test="${point.usedType == 'R' || point.usedType == 'F' }" >	
				   
					<div class="col-sm-2" style="margin-left:30px;">
						<p>���� �� ����Ʈ</p>
							<%-- <c:if test="${point.usedType eq 'F' | point.usedType eq 'R' }"> --%>
					 			<div id="addPoint" style="Padding-left:20px;">${point.usedPoint} P </div>
					</div>
					</c:if>
					</c:forEach>
					<div class="col-sm-1" style="margin-left:20px;">
						<i class="fas fa-equals" style="margin-left:15px;margin-top:10px;"></i>
					</div>
					<div class="col-sm-2" style="margin-left:50px;">
						<p>�� ����Ʈ</p>
							<div id="totalPoint" style="margin-left:10px;">${user.totalPoint} P </div>
					</div>
					 <c:if test="${order.orderStatus == 'C' }">
					<div class="col-4" >
						<p style="margin-left:50px;">ȯ�� �Ͻ�</p>
							<div id="refundDate" style="margin-left:50px;">${order.refundDate} </div>
					</div>
					</c:if>
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
				<div class="row" style="margin-bottom: 15px" >
						  <div class="col-md-3">�Һ�</div>
						  <div class="col-md-9">${order.payInstal} ����</div>
				</div>
				<div class="row" style="margin-bottom: 15px" >
						  <div class="col-md-3">�������</div>
						  <c:if test="${order.payOpt == '0' }">
							  <div class="col-md-9">�޴��� �Ҿ� ����</div>
						  </c:if>
						   <c:if test="${order.payOpt == '1'}">
							  <div class="col-md-9">ī�����</div>
						  </c:if>
				</div>
			</div>
		<hr/>
	
	   		 <div class="form-group" align="center">
			<button type="button" class="btn btn-warning"  >Ȯ��</button>
			<c:if test="${order.orderStatus == 'O' &&  user.role != 'A'}">
			<button type="button" class="btn btn-info" id="refundApp1" data-toggle="modal" data-target="#refund">
			   ȯ�� ��û
			</button>
			</c:if>
		<!-- 	<button type="button" class="btn btn-primary" id="refundApp1" data-toggle="modal" data-target="#refund">
			   ȯ�� ��û
			</button> -->
			</div>

</div>
			
<div class="modal fade" id="refund" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">ȯ�� ��û</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	  ������ ��ǰ�� ȯ�� ��û �Ͻðڽ��ϱ�?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="reset" data-dismiss="modal">���</button>
        <button type="button" class="btn btn-primary" id="refundApp2">ȯ�ҽ�û</button>
      </div>
    </div>
  </div>
</div>	
			
		
		
		
<%-- 		<div class="row">
		
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
	<hr/> --%>

	</form>
			 <jsp:include page="/toolbar/footer.jsp" />	
</body>
</html>
