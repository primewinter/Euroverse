<%@ page language="java"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
		$('#refund').on("click" , function (){
			var flightId = $("#flightId").val();
			self.location ="/order/getFlightOrder?flightId="+flightId;
		})
		$('#refund2').on("click" , function (){
			var roomId = $("#roomId").val();
			self.location ="/order/getRoomOrder?roomId="+roomId;
		})
	})
	
	/* ȯ�� ó���� , ȯ�ҿϷ�� ���� modal */
 	$(function() {
 		
 		$('#orderStatus').change(function() {
 			var state = $('#orderStatus option:selected').val();
	 			if ( state == '3' ) {
	 				$( "#refundmodal3" ).modal('show');
	 			} 
 				if (state == '4') {
 					$( "#refundmodal4" ).modal('show');
				}
 		
 		});
	}); 
	
 	/* close modal */
 	function closeModal(modalName) {
		if( typeof $("."+modalName)[0] != "undefined" ){
			$("."+modalName)[0].reset();	
		}
		$("#"+modalName).modal("hide");
	}
	
	  
	
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
<form>
<body>
<div>
	<jsp:include page="/toolbar/toolBar.jsp" />
	<div class="container">
		<div class="page-header">
			<h3>Order List</h3>
		</div>
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
			      <i class="fas fa-list" id="refund"></i>
			      <input type="hidden" name="${flight.flightId}" id="flightId" value="${flight.flightId}"/>
			      </th>
				      <td>${flight.airline}</td>
				      <td>${flight.depCity}/${flight.arrCity }</td>
				      <td>${flight.depTime} - ${flight.arrTime }</td>
				      <td>${flight.stopOver}/${flight.leadTime}</td>
				      <td>${flight.price}��/${flight.orderDate}</td>
				      <td>
					     <c:if test="${flight.orderStatus == '1' }">
					      	�ֹ��Ϸ�
					      </c:if>
					      <c:if test="${flight.orderStatus == '2' }">
					      	<select class="custom-select" name="orderStatus" id="orderStatus" style="">
							  <option selected value="2">ȯ�ҽ�û</option>
							  <option value="3" id="3">ȯ��ó����</option>
							  <option value="4" id="4">ȯ�ҿϷ�</option>
							</select>
					      </c:if>
					         <c:if test="${flight.orderStatus == '3' }">
					         <select class="custom-select" name="orderStatus" id="orderStatus" style="">
							  <option selected value="3">ȯ��ó����</option>
							  <option value="4" id="4">ȯ�ҿϷ�</option>
							</select>
					         </c:if>
					      <c:if test="${flight.orderStatus == '4' }">
					      	ȯ�ҿϷ�
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
			    <i class="fas fa-list"></i>
			    	<input type="hidden" name="${room.roomId}" id="roomId" value="${room.roomId}"/>
			    </th>
			    <td>${room.roomCity }</td>
			    <td>${room.roomName}</td>
			    <td>${room.checkIn} - ${room.checkOut }</td>
			    <td>${room.roomNum} �� / ���� ${room.adultNum} �� , ���� ${room.childNum} ��</td>
			    <td>${room.price} �� /${room.orderDate}</td>
			    <td> 
			    
			      <c:if test="${room.orderStatus == '1' }">
			      	�ֹ��Ϸ�
			      </c:if>
			      <c:if test="${room.orderStatus == '2' }">
			      	<select class="custom-select" name="orderStatus" id="orderStatus" style="">
					  <option selected value="2" id="2">ȯ�ҽ�û</option>
					  <option value="3" id="3" data-toggle="modal" data-target="#refund">ȯ��ó����</option>
					  <option value="4" id="4">ȯ�ҿϷ�</option>
					</select>
			      </c:if>
			         <c:if test="${room.orderStatus == '3' }">
			         <select class="custom-select" name="orderStatus" id="orderStatus" style="">
					  <option selected value="3" id="3" >ȯ��ó����</option>
					  <option value="4" id="4">ȯ�ҿϷ�</option>
					</select>
			         </c:if>
			      <c:if test="${room.orderStatus == '4' }">
			      	ȯ�ҿϷ�
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
	
	<div class="modal fade" id="refundmodal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	        <button type="button" class="btn btn-secondary" onclick="closeModal('refundmodal3');" id="reset" data-dismiss="modal">���</button>
	        <button type="button" class="btn btn-primary" id="refundConfirm">Ȯ��</button>
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
	        <button type="button" class="btn btn-secondary" onclick="closeModal('refundmodal4');" id="reset" data-dismiss="modal">���</button>
	        <button type="button" class="btn btn-primary" id="refundConfirm">Ȯ��</button>
	      </div>
	    </div>
	  </div>
	</div>	
</body>
</form>
</html>
