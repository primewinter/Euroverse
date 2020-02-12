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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;

        }
        image {
        	border : 1px solid lightpink;
        }
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
		$('.delete:contains("��")').on("click" , function (){
			var tranNo = $(this).next().val();
			alert(tranNo);
			//xxx self.location = "/purchase/deletePurchase?tranNo="+$(this).next().val()+"&prodNo="+$(this).next().next().val();
			self.location ="/order/cancel?tranNo="+tranNo;
			
			
						
		})
		$('.delete:contains("��")').css("color" , "steelblue");
		
	})
	
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
	
	
	
//+"&count="+$(this).next().next().next().val()
 		$(function () { 
 			$('input:button').on('click' , function () {
			var tranNo = $(this).next().val();
			var tranCode = $(this).next().next().val();
			tranCode = 2;
			console.log("tranNo"+tranNo);
			self.location ="/purchase/updateTranCode?tranNo="+tranNo+"&tranCode="+tranCode;
		});
		
		$( 'input:button' ).css("color" , "lightseagreen");
		
	}) 

</script>

</head>

<body>
	
	<div class="container">
		<div class="page-header">
			<h3>Order List</h3>
		</div>
	
	
			
		<div class="col-md-6 text-right">
			<form class="form-inline" name="detailForm">
			<input type="hidden" name="imp_uid" value= "${purchase.imp_uid}" id="imp_uid"/>
				<div class="form-group">
					<select class="form-control" name="searchCondition">
						<option value="0" ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>���Ź�ȣ</option>
						<option value="1" ${ !empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>������ID</option>
						<option value="2" ${ !empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>�������̸�</option>
					</select>
				</div>
				
				<div class="form-group">
					  <label class="sr-only" for="searchKeyword">�˻���</label>
				    	<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    		value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				</div>
				  <button type="button" class="btn btn-default">�˻�</button>
				  <input type="hidden" id="currentPage" name="currentPage" value="" />
			</form>
		</div>
		</div>
		<br/>
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
      <th scope="col">��ߵ���/��������</th>
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
      <th scope="row">ȸ�����̵�</th>
      <td>${flight.airline}</td>
      <td>${flight.depCity}/${flight.arrCity }</td>
      <td>${flight.depTime}/${flight.arrTime }</td>
      <td>${flight.stopOver}/${flight.leadTime}</td>
      <td>${flight.price}/${flight.orderDate}</td>
      <td>${flight.orderStatus}</td>
   	 </tr>
     </c:forEach>
   
   <!--  <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr> -->
  </tbody>
</table>
	 
	
	
	 <table class="table table-bordered" id="room" >
	 
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">������</th>
	      <th scope="col">����</th>
	      <th scope="col">����Ͻ�/�����Ͻ�</th>
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
	      <th scope="row">1</th>
	      <td>${room.roomCity }</td>
	      <td>${room.roomName}</td>
	      <td>${room.checkIn}/${room.checkOut }</td>
	      <td>${room.roomNum}/${room.adultNum }</td>
	      <td>${room.price}/${orderDate}</td>
	      <td>${room.orderStatus}</td>
	   	 </tr>
	     </c:forEach>
	   
	   <!--  <tr>
	      <th scope="row">2</th>
	      <td>Jacob</td>
	      <td>Thornton</td>
	      <td>@fat</td>
	    </tr>
	    <tr>
	      <th scope="row">3</th>
	      <td colspan="2">Larry the Bird</td>
	      <td>@twitter</td>
	    </tr> -->
	  </tbody>
	</table>




</div>


</body>
</html>