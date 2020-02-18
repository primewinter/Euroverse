<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
<head>
<title>구매 목록조회</title>
<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	

  	<!-- jQuery UI toolTip 사용 CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
             padding-top : 50px;
			font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum, "돋움", Dotum, Arial, Helvetica, sans-serif;
        }
        
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">


$(function() {
	 $( 'button' ).on("click" , function() {
		 
	        
	        //$("#merchant_uid").val()
		 var url = $(this).val();
	     var price = $(this).next().val();
	     var roomCity = $(this).next().next().val();
	     var roomNum = $(this).next().next().next().val();
	     var checkIn = $(this).next().next().next().next().val();
	     var adultNum = $("#adultNum").val();
	     var childNum = $("#childNum").val();
	     var checkOut = $("#checkOut").val();
	     
	     $("#checkIn").val(checkIn);
	     
		 alert(url+"price"+price+"room : "+roomCity+"checkIn : "+checkIn);
		 self.location ="/room/getRoom?detailLink="+url+"&price="+price+"&roomCity="+roomCity+"&checkIn="+checkIn
				 +"&roomNum="+roomNum+"&adultNum="+adultNum+"&childNum="+childNum+"&checkOut="+checkOut;
	  //$("form").attr("method" , "POST").attr("action" , "/room/getRoom").submit();

	});
});	

$(function() {
    $( "#testDatepicker" ).datepicker({
    	changeMonth: true, 
         changeYear: true,
        // nextText: '다음 달',
        // prevText: '이전 달' ,
         dateFormat: "yymmdd"
    });
});


	
</script>



</head>


<!-- 폼태크 -> input 안에 link 줌 -> controller 타기  ////link 필드 추가아아 -->

<body>
<jsp:include page="/toolbar/toolBar.jsp" />
	<div class="container">
		<c:forEach var="room" items = "${roomList}" >
		<div class="row">
				<div class="col-sm-8" style="background-color:whitesmoke;">
					<div class="row" style="color:gray;margin-top:10px;margin-left:20px;margin-right:20px;margin-bottom:10px;">
						<p style="font-size:18px;">${room.roomName}</p>
						<address class="contact">
							<span style="font-size:13px;">${room.roomAddr}</span>
						</address>
						<br/>
					</div>
						<div class="row" style="margin-left:30px;">
							<div class="col-sm-5">
								<img src = "/resources/images/orderImg/${room.roomImg}" width="180" height="120"/>
							</div>
							<div class="col-sm-7" style="Padding-left:250px;">
								<div class="row" style="margin-top:40px;margin-left:20px;">
								<i class="fas fa-won-sign" style="font-size:15px;"></i>
									<p>${room.price}원</p>
								</div>
								<button type="button" class="btn btn-info" style="width:100px;">상세보기</button>
							</div>
						</div>
					<br/>
				</div>
				<%-- <div class="col-sm-3">
					<div class="row" style="margin-top:40px;margin-left:20px;margin-right:20px;margin-bottom:10px;">
					<i class="fas fa-won-sign" style="font-size:15px;"></i>
						<p>${room.price}원</p>
					</div>
					<button type="button" class="btn btn-info" style="margin-top:80px;width:100px;">상세보기</button>
				</div>  --%>
		</div>
			<br/>
			<hr/>	
		</c:forEach>
			<%-- <table class="table">
			  <thead>
			    <tr>
			      <th scope="col">도착지역</th>
			      <th scope="col">숙소이름</th>
			      <th scope="col">체크인</th>
			      <th scope="col">체크아웃</th>
			      <th scope="col">숙소주소</th>
			      <th scope="col">이미지</th>
			      <th scope="col">객실수</th>
			      <th scope="col">인원수</th>
			      <th scope="col">가격</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach var="room" items = "${roomList}" >
			    <tr>
			      <th scope="row">${room.roomCity}</th>
			      <td>${room.roomName}</td>
			      <td>${room.checkIn}</td>
			      <td>${room.checkOut}</td>
			      <td>${room.roomAddr}</td>
			      <td><img src = "/resources/images/orderImg/${room.roomImg}" width="50" height="50"/></td>
			      <td>${room.roomNum}</td>
			      <td>${room.adultNum} / ${room.childNum}</td>
			      <td>${room.price}원</td>
			      <td><i class="far fa-heart" style="font-size:15px;"></i></td>
			      <td><button type="button" class="btn btn-info" style="width:40px;">상세보기</button>
			    	<input type="hidden" name="price" value=" ${room.price}">
			    	<input type="hidden" name="roomCity" value=" ${room.roomCity}">
			    	<input type="hidden" name="roomNum" value=" ${room.roomNum}">
			    	<input type="hidden" name="checkIn" value=" ${room.checkIn}">
			    	<input type="hidden" name="adultNum" value=" ${room.adultNum}" id="adultNum">
			    	<input type="hidden" name="childNum" value=" ${room.childNum}" id="childNum">
			    	<input type="hidden" name="checkOut" value=" ${room.checkOut}" id="checkOut">
    				<input type="hidden" name="detailLink" value="${room.detailLink}">
    			<input href="${purchase.merchant_uid }" type="button" value="상세보기" />
    			</td>
			    </tr>
			  </c:forEach>
			  </tbody>
			</table> --%>
		</div>

</body>
</html>