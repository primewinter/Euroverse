<%@ page language="java"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*" %>

<html>
<head>
<title>���� �����ȸ</title>
<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	 <!-- jQuery UI toolTip ��� CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip ��� JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
  <!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
        h3{
        	color: white;
        	font-family : Consolas;
        }
      
        #flight , #room {
        	width: 80%;
			margin:auto;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(document).ready(function(){
	Show();
})

function fncGetUserList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/order/getOrderList").submit();
}

 $(function() {
	 $( "button.btn.btn-default" ).on("click" , function() {
	 	fncGetUserList(1);
	 });
 });

 function doShow() { 
	    if ($('#flight').is(":visible")) { 
	        $('#flight').hide();
	        $('#iconf').hide();
	        $('#room').show();
	        $('#iconr').show();// id���� �޾Ƽ� ����� 
	    } 
	} 

	function Show() { 
	    if ($('#room').is(":visible")) { 
	        $('#room').hide(); 
	        $('#iconr').hide();
	        $('#flight').show();
	        $('#iconf').show();// id���� �޾Ƽ� ����� 
	    } 
	} 
 
 		$( function () {
		$('.fas.fa-list').on("click" , function (){
			//var flightId = $("#flightId").val();
			var flightId = $(this).next().val();
			var orderId = $(this).next().next().val();
			self.location ="/order/getFlightOrder?flightId="+flightId+"&orderId="+orderId;
		})
		$('.fas.fa-list-ul').on("click" , function (){
			var roomId = $(this).next().val();
			var orderId = $(this).next().next().val();
			self.location ="/order/getRoomOrder?roomId="+roomId+"&orderId="+orderId;
		})
	})
	
	/* ------------------------- ȯ�� ��û���� ȯ�� ó����  ���� modal ------------------------- */
	function order(orderId){
 			var orderState = $('#'+orderId+' option:selected').val();
 			console.log("orderId "+orderId);
 			 if ( orderState == '3' ) {
 				
 				$( "#refundmodal3" ).modal('show');
	 			var orderIds = $("#confirmModal3Id").val(orderId);
 				
 			} 
 		}
 		
 		$(function() {
 			$("#refundConfirm3").click(function(){
 				var orderId = $(this).next().val();	
 				console.log("orderID : "+orderId);
 	 			$.ajax (
 	 					{
 	 						url : "/order/json/updateOrderStatus/"+orderId ,
 	 						method : "GET",
 	 						dataType : "json",
 	 						headers : {
 	 							"Accept" : "application/json",
 	 							"Content-Type" : "application/json"
 	 						},
 	 						success : function (JSONData, status ) {
 	 							var displayValue = "<select class='custom-select' name='orderStatus' id='${flight.orderId}' onChange='order2('${flight.orderId}')' >"
 	 							 displayValue +=  "<option selected value='3' >ȯ��ó����</option>"
 	 							+ "<option value='4'>ȯ�ҿϷ�</option>"
 	 							+ "</select>";
 	 					
 	 							$("td #"+JSONData.orderId+"").html(displayValue);
 	 						}
 	 					})
 	 					$("#refundmodal3").modal("hide");
 			});
 		});
 	/* ------------------------- �����¡ ------------------------ */	
 	
 	
 	
 	/* ------------------------- ȯ�ҿϷ�� ���� modal ------------------------- */
 	function order2(orderId){
 			
 			var orderState = $('#'+orderId+' option:selected').val();
 			console.log("orderId "+orderId);
 			 if ( orderState == '4' ) {
 				
 				$( "#refundmodal4" ).modal('show');
	 			var orderIds = $("#confirmModal4Id").val(orderId);
 				
 			} 
 		}
 		
 		$(function() {
 			$("#refundConfirm4").click(function(){
 				var orderId = $(this).next().val();	
 				console.log("orderID : "+orderId);
 	 			$.ajax (
 	 					{
 	 						url : "/order/json/payRefund/"+orderId ,
 	 						method : "GET",
 	 						dataType : "json",
 	 						headers : {
 	 							"Accept" : "application/json",
 	 							"Content-Type" : "application/json"
 	 						},
 	 						success : function (JSONData, status ) {
 	 							console.log("�ù���...");
 	 							/* var displayValue = "<select class='custom-select' name='orderStatus' id='${flight.orderId}' onChange='order2('${flight.orderId}')' >"
 	 	 							 displayValue +=   "<option selected value='4'>ȯ�ҿϷ�</option>"
 	 	 							+ "</select>";
 	 	 						var value = "<td>"+JSONData.order.refundDate+"</td>";
 	 							 */
 	 	 					 	var result = "<p>ȯ�ҿϷ� <i class='far fa-clock'></i>"+JSONData.order.refundDate+"</p>";
 	 					
 	 							$("#"+JSONData.orderId+"s").remove();
 	 							$("#"+JSONData.orderId+"").html(result);
 	 						}
 	 						
 	 					})
 	 					$("#refundmodal4").modal("hide");
 			});
 		});
 	
	/* ------------------------- �����¡ ------------------------ */	
 	/* -----------------------close modal----------------------- */
 	$(function() {
 		$("#resetmodal4").click(function() {
 			
 			/* if(  $("#refundmodal4")[0] != "undefined" ){
 				$("#refundmodal4")[0].reset();	
 			} */
 			var orderId = $(this).next().next().val();
 			$("#refundmodal4").modal("hide");
 			$('#'+orderId+' option[value=3]').prop('selected', 'selected').change();
 		})
 		$("#resetmodal3").click(function() {
 			/* if( typeof $("#refundmodal3")[0] != "undefined" ){
 				$("#refundmodal3")[0].reset();	
 			} */
 			var orderId = $(this).next().next().val();
 			alert(orderId);
 			$("#refundmodal3").modal("hide");
 			$('#'+orderId+' option[value=2]').prop('selected', 'selected').change();
 		})
 	})
	/* ------------------------- �����¡ ------------------------ */	 
	////////////////////////////////////////////////////
/*     $( function () {
		$('.delete:contains("��")').on("click" , function () {
      jQuery.ajax({
        "url": "http://www.myservice.com/payments/cancel",
        "type": "POST",
        "contentType": "application/json",
        "data": JSON.stringify({
          "merchant_uid": "mid_" + new Date().getTime(), // �ֹ���ȣ
          "cancel_request_amount": 100, // ȯ�ұݾ�
          "reason": "�׽�Ʈ ���� ȯ��" // ȯ�һ���
          //"refund_holder": "ȫ�浿", // [������� ȯ�ҽ� �ʼ��Է�] ȯ�� ������� ������
         // "refund_bank": "88" // [������� ȯ�ҽ� �ʼ��Է�] ȯ�� ������� �����ڵ�(ex. KG�̴Ͻý��� ��� ���������� 88��)
          //"refund_account": "56211105948400" // [������� ȯ�ҽ� �ʼ��Է�] ȯ�� ������� ��ȣ
        }),
        "dataType": "json"
      });
    });
    }); */
	
	
	////////////////////////////////////////////////////


</script>

</head>
<body>
<form>
<div>
	<jsp:include page="/toolbar/toolBar.jsp" />
	 <jsp:include page="/toolbar/pushBar.jsp" />
	<div class="container">
		<br/>
	</div>
<div class="btn-group btn-group-toggle" data-toggle="buttons" style="Padding-left:180px;" >
  <label class="btn btn-secondary active">
    <input type="radio" name="flight" id="option1" checked onclick="javascript:Show();"> Flight
  </label>
  <label class="btn btn-secondary">
    <input type="radio" name="room" id="option2" onclick="javascript:doShow();"> Room
  </label>
</div>

	
  	<br/><br/>
  	<i class="fas fa-plane" id="iconf" style="Padding-left:180px;font-size:40px;" ></i>
  	<i class="fas fa-bed" id="iconr" style="Padding-left:180px;font-size:40px;"></i>
	 <table class="table table-bordered" id="flight" >
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">�װ���</th>
      <th scope="col">��ߵ��� - ��������</th>
      <th scope="col">����Ͻ�/�����Ͻ�</th>
      <th scope="col">����/�ҿ�ð�</th>
      <th scope="col">����/�����Ͻ�</th>
      <th scope="col">�ֹ�����</th>
    </tr>
  </thead>
 
  <tbody>
   
     <c:set var = "i" value="0"/>
		<c:forEach var="flight" items = "${list}" >
	<c:set var="i" value="${i+1}"/>
			 <tr>
			      <th scope="row">
			      <i class="fas fa-list"></i>
			      <input type="hidden" name="${flight.flightId}"  value="${flight.flightId}"/>
			      <input type="hidden" name="${flight.orderId }"  value="${flight.orderId}" />
			      </th>
				      <td id="refund">${flight.airline}</td>
				      <td>${flight.depCity}/${flight.arrCity }</td>
				      <td>${flight.depTime} - ${flight.arrTime }</td>
				      <td>${flight.stopOver}/${flight.leadTime}</td>
				      <td id="appendStatus"><fmt:formatNumber value="${flight.price}" pattern="###,###" />��/${flight.orderDate}</td>
				      <td id="${flight.orderId }">
					     <c:if test="${flight.orderStatus == '1' }">
					      	�ֹ��Ϸ�
					      </c:if>
					      <c:if test="${flight.orderStatus == '2' }">
					      	<select class="custom-select" onChange="order('${flight.orderId}')" name="orderStatus"  id="${flight.orderId }" style="">
							  <option selected value="2">ȯ�ҽ�û</option>
							  <option value="3">ȯ��ó����</option>
							  <option value="4" disabled >ȯ�ҿϷ�</option>
							</select>
					      </c:if>
					         <c:if test="${flight.orderStatus == '3' }">
					         <select class="custom-select" onChange="order2('${flight.orderId}')" name="orderStatus" id="${flight.orderId }s" style="">
							  <option selected value="3">ȯ��ó����</option>
							  <option value="4" id="4">ȯ�ҿϷ�</option>
							</select>
					         </c:if>
					      <c:if test="${flight.orderStatus == '4' }">
					      	<p>ȯ�ҿϷ� <i class="far fa-clock"></i> ${flight.refundDate }</p>
						  </c:if>
					  
					  </td>
					   
		   	 </tr>
    	 </c:forEach>
  </tbody>
</table>
	 
	
	
	 <table class="table table-bordered" id="room" >
	 
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">������</th>
	      <th scope="col">����</th>
	      <th scope="col">����Ͻ� - �����Ͻ�</th>
	      <th scope="col">���Ǽ�/�����ο�</th>
	      <th scope="col">����/�����Ͻ�</th>
	      <th scope="col">�ֹ�����</th>
	    </tr>
	  </thead>
	 
	  <tbody>
	   
	     <c:set var = "i" value="0"/>
		<c:forEach var="room" items = "${list2}" >
		<c:set var="i" value="${i+1}"/>
			 <tr>
			    <th scope="row"  id="refund2" >
			    <i class="fas fa-list-ul"></i>
			    	<input type="hidden" name="${room.roomId}" value="${room.roomId}"/>
			    	<input type="hidden" name="${room.orderId }"  value="${room.orderId}" />
			    </th>
			    <td>${room.roomCity }</td>
			    <td>${room.roomName}</td>
			    <td>${room.checkIn} - ${room.checkOut }</td>
			    <td>${room.roomNum} �� / ���� ${room.adultNum} �� , ���� ${room.childNum} ��</td>
			    <td><fmt:formatNumber value="${room.price}" pattern="###,###" /> �� /${room.orderDate}</td>
			    <td id="${room.orderId }"> 
			    
			      <c:if test="${room.orderStatus == '1' }">
			      	�ֹ��Ϸ�
			      </c:if>
			      <c:if test="${room.orderStatus == '2' }">
			      	<select class="custom-select" name="orderStatus" onChange="order('${room.orderId}')"  id="${room.orderId }" style="">
					  <option selected value="2" id="2">ȯ�ҽ�û</option>
					  <option value="3" id="3">ȯ��ó����</option>
					  <option value="4" id="4">ȯ�ҿϷ�</option>
					</select>
			      </c:if>
			         <c:if test="${room.orderStatus == '3' }">
			         <select class="custom-select" name="orderStatus" onChange="order2('${room.orderId}')"  id="${room.orderId }" style="">
					  <option selected value="3">ȯ��ó����</option>
					  <option value="4" id="4">ȯ�ҿϷ�</option>
					</select>
			         </c:if>
			      <c:if test="${room.orderStatus == '4' }">
			      		<p>ȯ�ҿϷ� <i class="far fa-clock"></i> ${room.refundDate }</p>
				  </c:if>
				 </td>
		   	 </tr>
	     </c:forEach>
	  </tbody>
	</table>

	</div>
	<!-- <button type="button" class="btn btn-primary" id="refundApp1" data-toggle="modal" data-target="#refund">
			   ȯ�� ��û
			</button> -->
	
	<div class="modal fade" id="refundmodal3" value="" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">ȯ�� ó�������� ����</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	 ȯ�� ó�������� �����Ͻðڽ��ϱ�?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="resetmodal3" data-dismiss="modal">���</button>
	        <button type="button" class="btn btn-primary"
	        		id="refundConfirm3">Ȯ��</button>
	        <input type="hidden" name="orderId" id="confirmModal3Id" value="" />
	     
	      </div>
	    </div>
	  </div>
	</div>	
	
	<div class="modal fade" id="refundmodal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">ȯ�� ó�� �Ϸ�</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	 ȯ�� ó���� �Ϸ� �Ͻðڽ��ϱ�?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="resetmodal4" data-dismiss="modal">���</button>
	        <button type="button" class="btn btn-primary" id="refundConfirm4">Ȯ��</button>
	        <input type="hidden" name="orderId" id="confirmModal4Id" value="" />
	      </div>
	    </div>
	  </div>
	</div>	
</form>
	 <jsp:include page="/toolbar/footer.jsp" />
</body>
</html>
