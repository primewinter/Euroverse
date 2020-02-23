<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*" %>    
    

<html>
<head>
<title>Insert title here</title>
<meta charset="EUC-KR">
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	<!--  iamPort -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	

  	<!-- jQuery UI toolTip 사용 CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid white;
            margin-top: 10px;
            
        }
        
        #reserInfo {
        line-height: 1.2;
		color: #646464;
		word-break: break-all;
		font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum, "돋움", Dotum, Arial, Helvetica, sans-serif;
		letter-spacing: -.3px;
		border-spacing: 0;
		empty-cells: show;
		margin-top: 10px;
		text-align: left;
		border-collapse: collapse;
		font-size: 13px;
        }
        .final-pay{
        line-height: 1.2;
		color: #646464;
		word-break: break-all;
		margin: 0;
		font-size: 13px;
		font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum, "돋움", Dotum, Arial, Helvetica, sans-serif;
		letter-spacing: -.3px;
		overflow: hidden;
		display: table;
		width: 100%;
		padding: 0;
		border-bottom: 1px solid #afafaf;
		box-sizing: border-box;
        }
   
    </style>
    <script type="text/javascript">
    
    window.onload = function () {
    	var price = $("#prices").val(); //상품 가격
    	var total = $("#usertotalPoint").val(); // 원래 있던 총 보유 포인트
    	var payPoint = $("#payPoint").val(); //사용할 포인트
    	
    	console.log("total Point : "+total);
    	console.log("price"+$("#prices").val());
    	
    	var totalAmount = $("#totalAmount").val(price); // 총결제금액
    	var actualAmount = $("#actualAmount").val(price); // 실결제금액
    	
    	console.log("actualAmount : "+actualAmount);
    	
    	var calculation = price - payPoint; //상품가격 - 사용할 포인트 = 실결제금액 계산
    	var addPoint = $("#addPoint").val(Math.floor(calculation * 0.01)); //적립예정 금액
    	
    	$("#usedPoint").val(0);
    	};	
    	
       function call(){
    	
    	var price = $("#prices").val(); //상품가격
 	   	var totalAmount = $("#totalAmount").text(); //총 가격
 	   	var total = $("#usertotalPoint").val();
     	var payPoint = $("#payPoint").val(); //사용할 포인트 
    	   
        	
        	console.log("totalAmount"+totalAmount);
        	console.log("payPoint"+payPoint);
        	console.log("price"+price);
        	
        	//사용된 포인트 = 사용할 포인트
    		//document.getElementById("usedPoint").value = document.getElementById("payPoint").value;
        	$("#usedPoint").val(payPoint);
        	
    		var calculation = price - payPoint; //상품가격 - 사용할 포인트 = 실결제금액 계산
    		console.log("calculation"+calculation);
    		var calculation2 = total - payPoint;// 보유 포인트 - 사용포인트 빼기
    		console.log("calculation2"+calculation2); 
    		
    		
    		var actualAmount = $("#actualAmount").val(calculation); //실 결제금액 입력
    		console.log("actualAmount"+actualAmount+"calculation"+calculation);	
    		
    		//$("#totalPoint").text(calculation2);  // 사용할 포인트를 감소한 총 보유한 포인트
    		var addPoint = $("#addPoint").val(Math.floor(calculation * 0.01)); //적립예정 금액
    		console.log("addPoint"+addPoint);
    		
    		if ($("#usedPoint").val() == 0 ) {
    	    	$("#usedPoint").val(0);
    		}
    };	
    
    
    $( function () {
    	$('button.btn.btn-primary').on('click' , function () {
    		var actualAmount = $("#actualAmount").val();
    		var payPoint = $("#payPoint").val(); //사용할 포인트
    		var buyerEmail = $("#buyerEmail").val();
    		var buyerName = $("#buyerName").val();
    		var buyerPhone = $("#buyerPhone").val();
    		if ($("#payPoint").val() == null | $("#payPoint").val() == "" | $("#payPoint").val() == 0) {
    			$("#zeroPoint").val(0);
			}else{
				$("#zeroPoint").val(payPoint);
			}
    		
    		var buyerEmail = $("#str_email01").val()+$("#middle").text()+$("#selectEmail").val();
        	var buyerPhone = $("#mobile0").val()+$("#mobile1").val()+$("#mobile2").val();
        	
        	$("#email").val(buyerEmail);
        	$("#phone").val(buyerPhone);
    		
    		//$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
    						 IMP.init('imp15344798');
    						 IMP.request_pay({
    							    pg : 'inicis', // version 1.1.0부터 지원.
    							    pay_method : 'card',
    							    merchant_uid : 'merchant_' + new Date().getTime(),
    							    name : 'Flights',
    							    amount : 10,
    							    buyer_email : buyerEmail ,
    							    buyer_name : buyerName,
    							    buyer_tel : buyerPhone ,
    							    buyer_postcode : 1234 ,
    							  
    							    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
    							    
    							}, function(rsp) {
    							    if ( rsp.success ) {
    							        var msg = '결제가 완료되었습니다.';
    							        msg += '고유ID : ' + rsp.imp_uid;
    							        msg += '상점 거래ID : ' + rsp.merchant_uid;
    							        msg += '결제 금액 : ' + rsp.paid_amount;
    							        msg += '카드 승인번호 : ' + rsp.apply_num;
    									msg += '회원 아이디 : ' + '${user.userId}';
    									msg += '결제일시' + rsp.paid_at;
    									msg += '??' + rsp.vbank_name;
    									msg += 'status '+ rsp.pay_method;
    									msg += '할부'+ rsp.card_quota;
    									
    									var payInstal = rsp.card_quota;
    									$("#payInstal").val(payInstal);
    									
    							        var orderId = rsp.imp_uid;
    							        $("#orderId").val(orderId);
    							        
    							        var price = rsp.paid_amount;
    							        $("#price").val(price);
    							        
    							        
    							       /*  var orderDate = rsp.paid_at;
    							        $("#orderDate").val(orderDate); */
    							        
    							        var userId = '${user.userId}';
    							        $("#userId").val(userId);
    							        
    							    } else {
    							        var msg = '결제에 실패하였습니다.';
    							        msg += '에러내용 : ' + rsp.error_msg;
    	    							  $("form").attr("method" , "GET").attr("action" , "/view/order/addFlightOrder.jsp").submit();
    							    }
    						        alert(msg);
    						        alert("input imp_uid : "+$("#userId").val());
    						    
    							  $("form").attr("method" , "POST").attr("action" , "/order/addFlightOrder").submit();
    					});	
    				}); 
    	
    			});
    
    
   
    </script>

</head>

<body>
	<jsp:include page="/toolbar/toolBar.jsp" />
	 <jsp:include page="/toolbar/pushBar.jsp" />
<div class="container"><br/>
	
	<form >
	<input type="hidden" name="orderId" value= "" id="orderId"/>
	<input type="hidden" name="price" value= "" id="price"/>
	<input type="hidden" name="userId" value= "" id="userId"/>
	<input type="hidden" name="payInstal" value= "" id="payInstal"/>
	<input type="hidden" name="buyerEmail" value= "" id="email"/>
	<input type="hidden" name="buyerPhone" value= "" id="phone"/>
	<input type="hidden" name="payPoint" value= "" id="zeroPoint"/>
	
	<i class="fas fa-plane" id="iconf" style="Padding-left:20px;font-size:40px;" ></i>
	<br/>
		<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">항공사</th>
			      <th scope="col">출발시간</th>
			      <th scope="col">도착시간</th>
			      <th scope="col">경유</th>
			      <th scope="col">소요시간</th>
			      <th scope="col">가격</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">${flight.airline}</th>
			      <td>${flight.depTime}</td>
			      <td>${flight.arrTime}</td>
			      <td>${flight.stopOver}</td>
			      <td>${flight.leadTime}</td>
			      <td><fmt:formatNumber value="${flight.price}" pattern="###,###" /> 원</td>
			    </tr>
			  </tbody>
			  
			</table>
			<br/><br/>

			<h4 align="left">주문자 정보</h4>
			<hr/>
					<div class="row">
	            		<p style="Padding-left:20px;">이름 *</p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   			<input type="text" title="예약자명을 입력하세요" style="width:200px;height:30px;" class="form-control" maxlength="20" name="buyerName" id="buyerName">
                   		<p style="Padding-left:220px;">이메일 *</p>&nbsp;&nbsp;&nbsp;
                   			<input type="text" title="이메일주소 앞자리를 입력해주세요" style="width:200px;height:30px;"class="form-control" name="str_email01" id="str_email01" >
                   		<P style="Padding-left:10px;" id="middle">@</P>&nbsp;&nbsp;&nbsp;
	                   		 <select title="이메일 서비스 도메인을 선택해주세요." class="form-control" style="width:250px;height:30px;font-size:13px;" name="selectEmail" id="selectEmail">
		                          <option value="">선택</option>
		                          <option value="naver.com">naver.com</option>
		                          <option value="gmail.com">gmail.com</option>
		                          <option value="hanmail.net">hanmail.net</option>
		                          <option value="chol.com">chol.com</option>
		                          <option value="freechal.com">freechal.com</option>
		                          <option value="intizen.com">intizen.com</option>
		                          <option value="nate.com">nate.com</option>
	                        </select> 
                   	</div>
					<hr/>
                   	<div class="row">	
                   		<p style="Padding-left:20px;">전화번호 *</p>&nbsp;&nbsp;&nbsp;
	                   		<select title="휴대전화 식별번호를 선택해주세요."  class="form-control" style="width:170px;" id="mobile0">
	                          <option value="">선택</option>
	                          <option value="010">010</option>
	                          <option value="011">011</option>
	                          <option value="016">016</option>
	                          <option value="017">017</option>
	                          <option value="018">018</option>
	                          <option value="019">019</option>
	                        </select>
	                    <p style="Padding-left:10px;">-</p>&nbsp;&nbsp;&nbsp;
	                        <input type="text" title="휴대전화 국번을 입력해주세요." style="width:170px;" class="form-control" maxlength="4" id="mobile1" onkeyup="this.value=this.value.replace(/[^-0-9]/g,'');" onblur="this.value=this.value.replace(/[^-0-9]/g,'');">
	                   	<p style="Padding-left:10px;">-</p>&nbsp;&nbsp;&nbsp;
	                   		<input type="text" title="휴대전화 뒷자리를 입력해주세요." style="width:170px;" class="form-control" maxlength="4" id="mobile2" onkeyup="this.value=this.value.replace(/[^-0-9]/g,'');" onblur="this.value=this.value.replace(/[^-0-9]/g,'');">
                   	</div>
			<br/><br/>
			
			<br/>	
			<h4 align="left">결제 정보</h4>
			<hr/>
			<div class="row" id="pay">
	             <div class="col-sm-2">
	            		 총 결제 금액
	                    <div class="row">
	                    <input	type="text" name="totalAmount" id="totalAmount" class="form-control" value="${flight.price}"
                  		 		style="Padding-left:30px;margin-top:10px;height:20px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" />
	                    <%-- <div id="totalAmount" style="Padding-left:30px;">${flight.price}</div> 원 --%>
	            		</div>
	             </div>
	             <i class="fas fa-minus-circle" style="margin-top:10px;"></i>
	             <div class="col-sm-2" style="Padding-left:70px;">
	             <input type="hidden" name="price" id="prices" value="${flight.price }" >
	            		 포인트 할인
	                    <div class="row">
	                    <input	type="text" name="usedPoint" id="usedPoint" class="form-control" value="${point.usedPoint}"
                  		 		style="Padding-left:30px;margin-top:10px;height:20px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" />
	                    <%-- <div id="usedPoint" style="Padding-left:20px;">${point.usedPoint}</div> --%>
	            		</div>
	             </div>
	             <i class="fas fa-equals" style="margin-left:15px;margin-top:10px;"></i>
	             <div class="col-sm-2" style="Padding-left:40px;">
	            		 실 결제 금액
	                    <div class="row">
	                    <input	type="text" name="actualAmount" id="actualAmount" class="form-control" value="${order.actualAmount}"
                  		 		style="Padding-left:30px;margin-top:10px;height:20px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" />
	                    <%-- <div id="actualAmount" style="Padding-left:20px;">${order.actualAmount}</div> 원 --%>
	            		
	            		</div>
	             </div>
			</div>
			<br/>
			<hr style="width:50%;float:left;margin-right:700px;" />
			
				<div class="row" style="Padding-left:10px;">
				 포인트 사용 &nbsp;&nbsp;&nbsp;
				<input	type="text" name="payPoint" id="payPoint" class="form-control" 
							style="width:110px;height:30px;font-size:13px;"	placeholder="0" onkeyup="call()">
				&nbsp;&nbsp;&nbsp;
				<p style="font-size:12px;margin-top:5px;"> ( 보유 포인트 ${user.totalPoint} P ) </p>
				<i class="fas fa-equals" style="margin-left:60px;"></i>
					<div class="col" style="Padding-left:40px;">
						<p> 적립 예정</p>
					 	<input	type="text" name="addPoint" id="addPoint" class="form-control" readonly="readonly"
                  		 		style="background-color:white;margin-top:-10px;width:50px;height:10px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" />
					</div>
				</div>
			
		<br/><br/>
		<div class="form-group" align="center">
   		 <div class="col-sm-offset-4  col-sm-4 text-center">
		<button type="button" class="btn btn-primary"  >예약하기</button>
		<input type="hidden" name="actualAmount" value= "${order.actualAmount }"/>
		<input type="hidden" name="usedPoint" value= "${point.usedPoint }"/>
		<input type="hidden" name="totalAmount" value= "${order.totalAmount }"/>
		<input type="hidden" name="addPoint" value= "${order.addPoint }"/>
		<input type="hidden" name="payPoint" value= "${order.payPoint }"/>
		<input type="hidden" name="airline" value= "${flight.airline }"/>
		<input type="hidden" name="tripCourse" value= "${flight.tripCourse }"/>
		<input type="hidden" name="depDate" value= "${flight.depDate }"/>
		<input type="hidden" name="arrDate" value= "${flight.arrDate }"/>
		<input type="hidden" name="depCity" value= "${flight.depCity }"/>
		<input type="hidden" name="arrCity" value= "${flight.arrCity }"/>
		<input type="hidden" name="seatGrade" value= "${flight.seatGrade }"/>
		<input type="hidden" name="adultNum" value= "${flight.adultNum }"/>
		<input type="hidden" name="childNum" value= "${flight.childNum }"/>
		<input type="hidden" name="infantNum" value= "${flight.infantNum }"/>
		<input type="hidden" name="leadTime" value= "${flight.leadTime }"/>	
		<input type="hidden" name="stopOver" value= "${flight.stopOver }"/>	
		<input type="hidden" name="depTime" value= "${flight.depTime }"/>	
		<input type="hidden" name="arrTime" value= "${flight.arrTime }"/>
		
		</div>
		</div>
		
	</form>
	
	 <jsp:include page="/toolbar/footer.jsp" />
</div>


</body>
</html>
