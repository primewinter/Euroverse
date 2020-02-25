<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>getPostList</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >

	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<style type="text/css">

	</style>

	<script>
	$(function(){

		$("#authButton").on("click",function(){
			var phone1 = $("#phone1").val();
			var phone2 = $("#phone2").val();
			var phone3 = $("#phone3").val();
			var phone = phone1+"-"+phone2+"-"+phone3;
					$.ajax({
						url : "/user/json/checkPhone",
						method : "post",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							phone : phone
						}),
						beforeSend : function() {
							$("#errorMsg").text("문자 발송 중입니다.");
						},
						success : function(JSONData, Status) {
							console.log(Status);
							console.log(JSONData);
							if (JSONData.result == "done") {
								$("input[name='phoneCheck']").val(
										JSONData.phoneCheck);
								$("#errorMsg").text("입력하신 번호로 문자 발송이 완료되었습니다.");

								$("input[name='phoneValue']").attr("type",
										"text").attr("placeholder", "인증번호 입력").attr("id","phoneValue");

								$('#sendPhone').hide();
								$('#removeDiv').hide();
								$('#phoneConfirm').show();

							}
						}
					})
			})
		})
	
	
		$(function(){
			$("#userAuth").on("click",function(){
				$("#authModal").modal("show");
			})
		})
		
		function auth(){
		var phoneCheck = $("input[name='phoneCheck']").val();
		var phoneValue = $("input[name='phoneValue']").val();
		
		alert($("input[name='phoneCheck']").val());
		alert($("input[name='phoneValue']").val());
		
			if(phoneCheck == phoneValue){
					$.ajax({
						url : "/user/json/updateRole",
						method : "get",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, Status) {
							alert(JSONData.returnMsg)
							$("#authModal").modal("hide");
							 $(self.location).attr("href", "/community/getPostList?boardName=D");
						}
					})	
			}else{
				alert("인증번호와 일치하지않습니다.")
			}
		}
	
	</script>

</head>
<body>

	<!-- ToolBar 시작 -->
	<jsp:include page="/toolbar/toolBar.jsp" />
	<jsp:include page="/toolbar/pushBar.jsp" />
	<jsp:include page="/view/community/sidebar.jsp"/>
	<!-- ToolBar 끝 -->

	<!-- 화면구성 div Start ///////////////////////////// -->
	<div class="container">
	
	<c:if test="${boardName == 'C'}">
		<div class="h4" style="text-align:center;">삭제된 게시글입니다. ㅠ_ㅠ</div>
	</c:if>
	
	<c:if test="${empty user}">	
		<div class="h4" style="text-align:center;">게시글 조회는 로그인 후 이용 가능합니다.</div>
	</c:if>
	
	<c:if test="${ !empty user && user.role == 'G'}">
		<div style="height: 100px;"></div>
		<div class="h4" style="text-align:center;">동행찾기는 본인인증후 사용 가능합니다.</div>
		<div style="text-align: center;margin-top: 50px;">
		<button type="button" class="btn btn-outline-primary" id="userAuth">휴대폰으로 본인인증하기</button>
		</div>
	</c:if>	
		
	</div>
		
		<!-- Modal -->
		<div class="modal fade" id="authModal">
		  <div class="modal-dialog bounceln animated"  role="document">
		    <div class="modal-content" id="authContent" style="width: 500px; height: 300px">
		      <div class="modal-body" id="authBody" style="text-align: center;">
		       	  <b style="font-size: 30px;">인증하세요.</b>
		       	  <div style="height: 50px;"></div>
		 		<div class="input-group-prepend">
		 		  <span class="input-group-text"><i class="fas fa-phone"></i></span>
			      <input type="text" class="form-control" id="phone1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3"> - 
			      <input type="text" class="form-control" id="phone2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"> - 
			      <input type="text" class="form-control" id="phone3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
			      <input type="hidden" name="phone" id="phone"> 
			      <input type="button" value="인증번호 전송" id="authButton" class="btn btn-outline-primary">  
					<!-- <input type="hidden" id="updatePwd" onclick="javascript:auth()" class="btn btn-outline-primary"> -->
				  <input type="hidden" name="phoneCheck" value="">
			    </div>
			    
			    <div style="height: 10px"></div>
			    
			    <div id="errorMsg"></div>
			    <div style="height: 10px"></div>
			    
				<input type="hidden" name="phoneValue" value="">
			    <button type="button" style="display: none" id="phoneConfirm" class="btn btn-outline-primary" onclick="javascript:auth()">인증</button>
		      </div>
		    </div>
		  </div>
	    </div>

	<!-- 화면구성 div End ///////////////////////////// -->
	<jsp:include page="/toolbar/footer.jsp"></jsp:include>

</body>
</html>