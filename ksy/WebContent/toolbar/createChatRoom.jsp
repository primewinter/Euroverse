<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>채팅방 개설</title>	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- 부트스트랩 4.4 쓰려다가 빠꾸...............................했다가 다시 4.4로..  -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- sweetalert2 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	
	
	<!-- Use Swiper from CDN -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	
	
	<!-- FontAwesome CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	

</head>
<body>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createChat">채팅방 개설</button>

<form id="roomInfo" enctype="multipart/form-data" accept-charset="euc-kr">
<div class="modal fade" id="createChat" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">동행채팅방 개설</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-group row">
		    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">채팅방 이름</label>
		    <div class="col-sm-9">
		      <input type="text" class="form-control form-control-sm" name="chatRoomName" placeholder="${post.postTitle}">
		    </div>
		  </div>
          <div class="form-group custom-file">
			     <label class="custom-file-label col-form-label-sm" for="validatedCustomFile">채팅방 이미지(선택 사항)</label>
                 <input type="file" class="custom-file-input" name="chatRoomFile">
          </div>
        <%--   <div class="form-group row">
        		  <c:forEach var="userList" items="${userList}">
			    <c:forEach var="party"	items="${party}">
			  	  <c:if test="${userList.userId == party.partyUserId}">
			 	  <c:set var="i" value="${ i+1 }"/>
					<div id="profile_box" class="row mb-12">
					  <div class="col-md-10">
					    <div id="profile" class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					      <div class="col-auto d-none d-lg-block">
					        <svg class="bd-placeholder-img" width="0" height="0" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><img class="imgFile" src="/resources/images/userImages/${userList.userImg}" style="width:30px;height:30px"><rect width="50%" height="5%" fill="#55595c"/></svg>
					      </div>
					      <div class="col p-4 d-flex flex-column position-static">
					      <c:if test="${party.partyRole == 'K'}">
					        <i class="fas fa-crown"><br>${userList.nickname}</i><input type="hidden" name="chatMems" value="${userList.userId}">
					      </c:if>
					      <c:if test="${party.partyRole == 'M'}">
					      	<i class="fas fa-user"><br>${userList.nickname}</i><input type="hidden" name="chatMems" value="${userList.userId}">
					      </c:if>
					        <p class="mb-auto">${userList.totalPoint}</p>
					      </div>
					    </div>
					  </div>
					</div>
			  	  </c:if>
			    </c:forEach>
			  </c:forEach>
          </div> --%>
          <input type="hidden" name="creator" value="admin">
          <!-- <input type="hidden" name="chatMems" value="user01"> -->
          <!-- <input type="hidden" name="chatMems" value="user02">
          <input type="hidden" name="chatMems" value="user03"> -->
          <%-- <input type="hidden" name="creator" value="${post.postWriterId}"> --%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary create">개설</button>
      </div>
    </div>
  </div>
</div>
</form>

<script>
$('#createChat').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget)
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
	
	
	
	
	$('button.btn-primary.create').on('click', function(){
		var chatRoom = new Object();
		chatRoom.creator = $('#roomInfo[name="creator"]').val();
		chatRoom.chatRoomName = $('#roomInfo[name="chatRoomName"]').val();
		chatRoom.chatImg =  
		console.log($('#roomInfo').serialize());
		var form = $('#roomInfo')[0];
        var formData = new FormData(form);
        console.log(formData);


		$.ajax({
			url : "/chat/json/createRoom",
			type : "post",
			enctype: 'multipart/form-data',
			data :  formData,
			headers : { "Accept" : "application/json", "Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"},
			success : function() {
				console.log("채팅방 개설 성공");
			},error : function(err) {
				console.log("채팅방 개설 실패");
				console.log(err.responseText);
			}
				
		})
	}); 
</script>

</body>
</html>