<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*" %>

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
		 var detailLink = $(this).val();
	     var price = $(this).next().val();
	     var roomCity = $(this).next().next().val();
	     var roomNum = $(this).next().next().next().val();
	     var checkIn = $(this).next().next().next().next().val();
	     var adultNum = $("#adultNum").val();
	     var childNum = $("#childNum").val();
	     var checkOut = $("#checkOut").val();
	     var location = $("#location").val();
	     var distance = $("#distance").val();
	     var grade = $("#grade").val();
	     
	     $("#checkIn").val(checkIn);
	     
		 alert(detailLink+"price"+price+"room : "+roomCity+"checkIn : "+checkIn);
		 self.location ="/room/getRoom?detailLink="+detailLink+"&price="+price+"&roomCity="+roomCity+"&checkIn="+checkIn
				 +"&roomNum="+roomNum+"&adultNum="+adultNum+"&childNum="+childNum+"&checkOut="+checkOut+"&location="+location
				 +"&distance="+distance+"&grade="+grade;
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
		<hr/>
		<div class="row">
		<br/>
				<div class="col-sm-2" style="margin-left:50px;margin-right:20px;">
					<img src = "/resources/images/roomImg/${room.roomImg}" width="180" height="120"/>
				</div>
				<div class="col-sm-6" style="background-color:whitesmoke;">
					<div class="row" style="color:gray;margin-top:10px;margin-left:20px;margin-right:20px;margin-bottom:10px;">
						<p style="font-size:18px;"><strong>${room.roomName}</strong></p>
						<address class="contact">
							<span style="font-size:13px;">${room.roomAddr}</span>
						</address>
					</div>
						<br/>
					<div class="row" style="margin-left:10px;margin-top:-20px;">
							<div class="col-sm-8">
								<p style="margin-bottom:5px;font-size:13px;"><i class="fas fa-map-marker-alt" style="margin-left:2px;font-size:15px;"></i>&nbsp;&nbsp;${room.location}</p>
								<p style="margin-bottom:5px;font-size:13px;"><i class="fas fa-road"></i>&nbsp;&nbsp;${room.distance}</p>
								<p style="font-size:18px;"><strong><i class="fas fa-heart"></i>&nbsp;&nbsp;${room.grade}</strong></p>
							</div>
							<div class="col-sm-4">
								<div class="row" id="price" style="margin-left:10px;">
										<i class="fas fa-won-sign" style="font-size:22px;"><fmt:formatNumber value="${room.price}" pattern="###,###" /> 원</i>
								</div>
								<br/>
								<button type="button" class="btn btn-info"  value="${room.detailLink}" style="margin-top:-10px;width:120px;">상세보기</button>
									<input type="hidden" name="price" value=" ${room.price}">
							    	<input type="hidden" name="roomCity" value=" ${room.roomCity}">
							    	<input type="hidden" name="roomNum" value=" ${room.roomNum}">
							    	<input type="hidden" name="checkIn" value=" ${room.checkIn}">
							    	<input type="hidden" name="adultNum" value=" ${room.adultNum}" id="adultNum">
							    	<input type="hidden" name="childNum" value=" ${room.childNum}" id="childNum">
							    	<input type="hidden" name="checkOut" value=" ${room.checkOut}" id="checkOut">
							    	<input type="hidden" name="location" value=" ${room.location}" id="location">
							    	<input type="hidden" name="distance" value=" ${room.distance}" id="distance">
							    	<input type="hidden" name="grade" value=" ${room.grade}" id="grade">
							</div>
					</div>
					</div>
							
					<br/>
				</div>
				
		</c:forEach>
			<%-- 
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