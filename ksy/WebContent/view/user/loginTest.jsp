<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<style>



</style>

<script>

$(function(){
	

	
var userId = $('#userId');
var pwd = $('#pwd');
var h6 = document.getElementsByTagName('h6');




	$(document).on('keyup', '#userId', function() {
		if(userId.val().length <4 || userId.val().length > 12 ){
			h6[0].innerHTML ="아이디는 4~12자 입니다.";
		}else{
			h6[0].innerHTML ="";
		}
		h6[2].innerHTML ="";
		
		
				
	});
	
	$(document).on('keyup','#pwd',function(){
		if(pwd.val().length <6  || pwd.val().length >20 ){
			h6[1].innerHTML = "비밀번호는 6~20자 입니다.";
		}else{
			h6[1].innerHTML = "";
		}
		h6[2].innerHTML ="";
	
	
	});
	
	$("button:contains('Submit')").on("click",function(){
		
		
		if(userId.val().length <4 || userId.val().length > 12 ){
				//alert("아이디를 확인해주세요.")
				h6[2].innerHTML ="아이디를 확인해주세요.";
			return;
		}else if(pwd.val().length <6  || pwd.val().length >20 ){
				//alert("비밀번호를 확인해주세요.");
				h6[2].innerHTML ="비밀번호를 확인해주세요.";
			return;
		}else{
			
		
		$.ajax({
			url : "/user/json/login",
			method : "post",
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				userId : userId.val(),
				pwd : pwd.val()
			}),
			success : function(JSONData){
				console.log(JSONData);
				if(JSONData.result == 'ok'){
					$("form").attr("method","get").attr("action","/user/login").submit();
				}else if(JSONData.result =='errorId'){
					//alert("존재하지 않는 아이디입니다.");
					h6[2].innerHTML = "존재하지 않는 아이디입니다.";
				}else if(JSONData.result =='errorPwd'){
					//alert("비밀번호가 틀렸습니다.");
					h6[2].innerHTML = "비밀번호가 틀렸습니다.";
				}else{
					alert("띠용");
				}
				
			}//success
		})//ajax
		
		}//else
		
		
	});
	


})


</script>

<title>Insert title here</title>
</head>
<body>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">
로그인모달
</button>


<div class="modal fade " id="myModal">
	  <!-- <div class="modal-dialog modal-lg"> -->
	  <div class="modal-dialog ">
	  	<h2 style="color : #FFFFFF">Sign In</h2>
	  
		<div class="modal-content">
			 <!-- 	<div class="modal-header">
				</div>modal header End 
 			-->
				 
				
			
		<div class="modal-body">
			<form>
					<div class="form-group">
						<label for="id">Id</label> 
						<input type="text"	class="form-control" placeholder="Enter Id" id="userId" name="userId">
						<h6 style="color: #F00"></h6>
					</div>
					<div class="form-group">
						<label for="pwd">Password</label>
						 <input type="password"	class="form-control" placeholder="Enter password" id="pwd" name="pwd">
						<h6 style="color: #F00"></h6>
					</div>
						<h6 style="color: #F00"></h6>
					<div class="form-group form-check">
						<label class="form-check-label">
						<input class="form-check-input" type="checkbox"> Remember me
						</label>
					</div>
					<h6></h6>
					
					<button type="button" class="btn btn-primary">Submit</button>
	      			<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</form>


			<!-- 	<div class="modal-footer">
				</div>modal footer End  -->

				</div><!--modal body End  -->

			</div><!--modal content End  --> 
	  </div><!--modal dialog End  -->

</div><!--myModal End  -->

</body>
</html>