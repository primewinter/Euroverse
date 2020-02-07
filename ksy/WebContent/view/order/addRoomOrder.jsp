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
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
	<style>
	
		body{
		 padding-top : 50px;
            background: linear-gradient(-100deg, mistyrose,pink, lightpink) fixed;
		}
       body > div.container{
        	border: 3px solid white;
            margin-top: 10px;
            
        }
   
    </style>
    <script type="text/javascript">
    window.onload = function () {
    	var price = $("#prices").val();
    	console.log("price"+$("#prices").val());
    	var totalAmount = $("#totalAmount").val(price);
    	var actualAmount = $("#actualAmount").val(price);
    	};	
       function call(){
    	   var price = $("#prices").val(); //��ǰ����
    	   var totalAmount = $("#totalAmount").val(price); //�� ����
        	var payPoint = document.getElementById("payPoint").value; //����� ����Ʈ 
        	
        	console.log("totalAmount"+totalAmount);
        	console.log("payPoint"+payPoint);
        	console.log("price"+price);
        	
        	//���� ����Ʈ = ����� ����Ʈ
    		document.getElementById("usedPoint").value = document.getElementById("payPoint").value;
        	
    		var calculation = price - payPoint; //��ǰ���� - ����� ����Ʈ = �ǰ����ݾ� ���
    		var calculation2 = 500 - payPoint;// ���� ����Ʈ - �������Ʈ ����
    		console.log("calculation2"+calculation2);
    		
    		
    		var point = $("#point").val(calculation2);  //������ ����Ʈ
    		var actualAmount = $("#actualAmount").val(calculation); //�� �����ݾ� �Է�
    		console.log("actualAmount"+actualAmount+"calculation"+calculation);	
    		
    		var accumulate = $("#accumulate").val(calculation * 0.05); //�������� �ݾ�
    		console.log("accumulate"+accumulate);
    };	
    
    $( function () {
    	$('button.btn.btn-primary').on('click' , function () {
    		var actualAmount = $("#actualAmount").val();
    		//$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
    						 IMP.init('imp15344798');
    						 IMP.request_pay({
    							    pg : 'inicis', // version 1.1.0���� ����.
    							    pay_method : 'card',
    							    merchant_uid : 'merchant_' + new Date().getTime(),
    							    name : 'Order',
    							    amount : 10,
    							    buyer_email : 'iamport@siot.do',
    							    buyer_name : "������",
    							    buyer_tel : "010",
    							    buyer_addr : "����",
    							    buyer_postcode : 1234 ,
    							    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
    							    
    							}, function(rsp) {
    							    if ( rsp.success ) {
    							        var msg = '������ �Ϸ�Ǿ����ϴ�.';
    							        msg += '����ID : ' + rsp.imp_uid;
    							        msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
    							        msg += '���� �ݾ� : ' + rsp.paid_amount;
    							        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
    									msg += 'ȸ�� ���̵� : ' + '${user.userId}';
    									msg += '��ǰ ��ȣ : '+ '${product.prodNo}';
    									msg += '�����Ͻ�' + rsp.paid_at;
    									msg += '??' + rsp.vbank_name;
    									msg += 'status '+ rsp.pay_method;
    									msg += '�Һ�'+ rsp.card_quota;
    									
    									var payInstal = rsp.card_quota;
    									$("#payInstal").val(payInstal);
    									
    							        var orderId = rsp.imp_uid;
    							        $("#orderId").val(orderId);
    							        
    							        var price = rsp.paid_amount;
    							        $("#price").val(price);
    							        
    							        var payDate = rsp.paid_at;
    							        $("#payDate").val(payDate);
    							        
    							        var userId = '${user.userId}';
    							        $("#userId").val(userId);
    							        
    							    } else {
    							        var msg = '������ �����Ͽ����ϴ�.';
    							        msg += '�������� : ' + rsp.error_msg;
    							    }
    						        alert(msg);
    						        alert("input imp_uid : "+$("#orderId").val());
    						    
    							  $("form").attr("method" , "POST").attr("action" , "/order/addRoomOrder").submit();
    					});	
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
	<input type="hidden" name="orderId" value= "" id="orderId"/>
	<input type="hidden" name="price" value= "" id="price"/>
	<input type="hidden" name="payDate" value= "" id="payDate"/>
	<input type="hidden" name="userId" value= "" id="userId"/>
	<input type="hidden" name="payInstal" value= "" id="payInstal"/>
	
		<div class="form-group">
		<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">ȸ�����̵�</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" readonly="readonly" id="userId" name="userId" value="${user.userId}">
		</div>
		</div>
		
		<div class="form-group">
		<label for="roomCity" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" id="roomCity" name="roomCity" value="${room.roomCity }">
		</div>
		</div>
		
		<div class="form-group">
		<label for="roomName" class="col-sm-offset-1 col-sm-3 control-label">���� �̸�</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" id="roomName" name="roomName" value="${room.roomName}">
		</div>
		</div>
		
		<div class="form-group">
		<label for="checkIn" class="col-sm-offset-1 col-sm-3 control-label">checkIn</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" id="checkIn" name="checkIn" value="${room.checkIn}">
		</div>
		</div>
		
		<div class="form-group">
		<label for="checkOut" class="col-sm-offset-1 col-sm-3 control-label">checkOut</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" id="checkOut" name="checkOut" value="${room.checkOut}">
		</div>
		</div>
		
		<div class="form-group">
		<label for="roomNum" class="col-sm-offset-1 col-sm-3 control-label">���Ǽ�</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" id="roomNum" name="roomNum" value="${room.roomNum}">
		</div>
		</div>
		
		<div class="form-group">
		<label for="adultNum" class="col-sm-offset-1 col-sm-3 control-label">���μ�</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" id="adultNum" name="adultNum" value="${room.adultNum}">
		</div>
		</div>
		
		<div class="form-group">
		<label for="childNum" class="col-sm-offset-1 col-sm-3 control-label">���Ƽ�</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" id="childNum" name="childNum" value="${room.childNum}">
		</div>
		</div>
	
		<div class="form-group">
		<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" id="prices" name="price" value="${room.price}">
		</div>
		</div>
		
		<h4 align="center">����Ʈ ��� </h4>
		<div class="form-group">
		<label for="payPoint" class="col-sm-offset-1 col-sm-3 control-label"></label>
		<div class="col-sm-4">
		<input	type="text" name="payPoint" id="payPoint" class="form-control" 
		placeholder="����� ����Ʈ" onkeyup="call()">
		
		</div>
		<div class="col-sm-4">
		
		������ ����Ʈ
		<input	type="text" name="point" id="point" class="form-control" value="">
		</div>
		</div>
		
		<label for="totalAmount" class="col-sm-offset-1 col-sm-3 control-label">�� �ֹ� �ݾ� </label>
		<div class="col-sm-4">
		<input	type="text" name="totalAmount" id="totalAmount" class="form-control" value="">
	
		</div>
		
		<label for="usedPoint" class="col-sm-offset-1 col-sm-3 control-label"> -����Ʈ��� </label>
		<div class="col-sm-4">
		<input	type="text" name="usedPoint" id="usedPoint" class="form-control" readonly="readonly">
		
		</div>
		
		<label for="actualAmount" class="col-sm-offset-1 col-sm-3 control-label">�� �ֹ� �ݾ� </label>
		<div class="col-sm-4">
		<input	type="text" name="actualAmount" id="actualAmount" class="form-control" value="${order.actualAmount }">
		
		��������
		<div class="col-md-4">
		<input	type="text" name="accumulate" id="accumulate" class="form-control" value="">
		</div>
		</div>
		
							
		<div class="form-group">
   		 <div class="col-sm-offset-4  col-sm-4 text-center">
		<button type="button" class="btn btn-primary"  >����</button>
		<input type="hidden" name="roomImg" value= "${room.roomImg }" id="roomImg"/>
		<input type="hidden" name="mainService" value= "${room.mainService }" id="mainService"/>
		<input type="hidden" name="familyService" value= "${room.familyService }" id="familyService"/>
		<input type="hidden" name="sights" value= "${room.sights }" id="sights"/>
		<input type="hidden" name="detailLink" value= "${room.detailLink }" id="detailLink"/>
		<input type="hidden" name="hotelInfo" value= "${room.hotelInfo }" id="hotelInfo"/>
		<input type="hidden" name="roomInfo" value= "${room.roomInfo }" id="roomInfo"/>
		</div>
		</div>
		
	</form>
	
	
</div>


</body>
</html>
