<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script>
$(document).ready(function(){
	Show();
})

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


</script>


</head>
<body>
	<jsp:include page="/toolbar/toolBar.jsp" />
	
	<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>

 	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
	
	<div class="container">
		<div class="page-header">
			<h3>Order List</h3>
		</div>
	
	
			
		<%-- <div class="col-md-6 text-right">
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
		</div> --%>
		</div>
		<br/>
<div class="btn-group btn-group-toggle" data-toggle="buttons" >
  <label class="btn btn-secondary active">
    <input type="radio" name="flight" id="option1" checked onclick="javascript:Show();"> Flight
  </label>
  <label class="btn btn-secondary">
    <input type="radio" name="room" id="option2" onclick="javascript:doShow();"> Room
  </label>
</div>

	
  	<br/><br/>
  	<i class="fas fa-plane" id="iconf" style="font-size:40px;" ></i>
  	<i class="fas fa-bed" id="iconr" style="font-size:40px;"></i>
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
   
  <%--    <c:set var = "i" value="0"/>
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
					      	ȯ�ҽ�û
					      </c:if>
					      <c:if test="${flight.orderStatus == '3' }">
					      	ȯ�ҿϷ�
						  </c:if>
					  </td>
		   	 </tr>
    	 </c:forEach> --%>
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
	   
	<%--      <c:set var = "i" value="0"/>
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
			      	ȯ�ҽ�û
			      </c:if>
			      <c:if test="${room.orderStatus == '3' }">
			      	ȯ�ҿϷ�
				  </c:if>
				 </td>
		   	 </tr>
	     </c:forEach> --%>
	  </tbody>
	</table>
	</main>
	</div>
	</div>
	
	
</body>
</html>