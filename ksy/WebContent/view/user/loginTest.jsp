<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<style></style>

<script>

$( function() {
	// ���̹� ���̵�� �α��� �̹��� Ŭ�� �� 
	$("#naverLogin").on("click", function(){
		// ���� �˾�â���� ���̹� �α����� �����ϱ� ���� �ƹ� �ǹ̾��� jsp�� ����
		/* $(self.location).attr("href","/naver/openWindow.jsp"); */
		$.ajax(
				{
					
					url : "/user/json/naverLoginUrlMake" , 
					method : "get" ,
					dataType : "json" ,
					headers : { 
						"Accept" : "application/json" , 
						"Content-Type" : "application/json"
					} , 
					success : function( JSONData ) { 
						self.location = JSONData.url; 	
					}
				}
		)
		
		/* window.open("/naver/openWindow.jsp",
				"popWin",
				"left=700, top=90, width=537, height=750, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no"); */
	})
	
	$("#googleLogin").on("click",function(){
		/* function openopen() {
			window.open("https://accounts.google.com/o/oauth2/v2/auth?scope=https://www.googleapis.com/auth/analytics.readonly&access_type=offline&include_granted_scopes=true&state=state_parameter_passthrough_value&redirect_uri=http://localhost:8080/user/googleLoginLogic&response_type=code&client_id=474522905430-f6nkrljp2qocnq1mop0ve2oc5ng91q38.apps.googleusercontent.com",
					"popWin",
					"left=700, top=90 , width=537 , height=750 , marginwidth=0,marginheight=0, fullscreen=no , scrollbars=yes, scrolling=yes, menubar=no, resizable=no");
		} */
		$(self.location).attr("href","https://accounts.google.com/o/oauth2/v2/auth?scope=https://www.googleapis.com/auth/analytics.readonly&access_type=offline&include_granted_scopes=true&state=state_parameter_passthrough_value&redirect_uri=http://localhost:8080/user/googleLoginLogic&response_type=code&client_id=474522905430-f6nkrljp2qocnq1mop0ve2oc5ng91q38.apps.googleusercontent.com");
	})
	
	$("#kakaoLogin").on("click", function(){
				// ���� �˾�â���� īī�� �α����� �����ϱ� ���� �ƹ� �ǹ̾��� jsp�� ����
				/* window.open("/kakao/openWindow.jsp",
						"popWin",
						"left=700, top=90, width=537, height=750, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no"); */
						$.ajax(
								{
									
									url : "/user/json/kakaoLoginUrlMake" ,  // �ܼ� URL�� ����� ���� UserController 
									method : "get" , // �Ѱ� �� Data�� �����Ƿ� get
									dataType : "json" , // �޾� �� data�� Type�� json���� ���� 
									headers : { // dataType�� json�̹Ƿ� ���� ��(Accept)�� ���� ��(Content-Type)�� ��� application/json���� ����  
										"Accept" : "application/json" , 
										"Content-Type" : "application/json"
									} , 
									success : function( JSONData ) { // success ��, 
																	 // HTTP 200 OK�� �� 
																	 // UserController���� return�� ���� JSONData�� ���� 
										
										self.location = JSONData.url; 	// json/kakaoLoginUrlMake���� return�� Map<String, String>���� ������
																		// map.put("url", kakaoLoginUrl); ���� map�� �־����Ƿ� 
																		// JSONData.url�� naverLoginUrl ������ �����ϴ� 
																		// self.location���� return�� URL�� �̵� 
																		// �̵� �� īī�� ���̵�� �α����϶�� â���� �̵��ϸ� �α��� �ڿ� 
																		// �α��� Redirect URL���� �ڵ� redirect, �̵��Ѵ�.
																		// redirect �� URL�� {redirect_uri}?code={authorize_code}
																		// ����� http://192.168.0.76:8080/user/kakaoLoginLogic?code={authorize_code}
																		// query string���� ��ȯ�� code�� ���� ��ū ��û�� �� ���ǹǷ� @RequestParam���� �޾ƿ;��Ѵ�.

									}
								}
						)
			})
})

$(document).ready(function(){
    var userInputId = getCookie("userInputId");//����� ��Ⱚ ��������
    $("input[name='userId']").val(userInputId); 
     
    if($("input[name='userId']").val() != ""){ // �� ���� ID�� �����ؼ� ó�� ������ �ε�
                                           // ���̵� �����ϱ� üũ�Ǿ����� ��,
        $("#idSaveCheck").attr("checked", true); // ID �����ϱ⸦ üũ ���·� �α�.
    }
     
    $("#idSaveCheck").change(function(){ // üũ�ڽ��� ��ȭ�� �߻���
        if($("#idSaveCheck").is(":checked")){ // ID �����ϱ� üũ���� ��,
            var userInputId = $("input[name='userId']").val();
            setCookie("userInputId", userInputId, 7); // 7�� ���� ��Ű ����
        }else{ // ID �����ϱ� üũ ���� ��,
            deleteCookie("userInputId");
        }
    });
     
    // ID �����ϱ⸦ üũ�� ���¿��� ID�� �Է��ϴ� ���, �̷� ���� ��Ű ����.
    $("input[name='userId']").keyup(function(){ // ID �Է� ĭ�� ID�� �Է��� ��,
        if($("#idSaveCheck").is(":checked")){ // ID �����ϱ⸦ üũ�� ���¶��,
            var userInputId = $("input[name='userId']").val();
            setCookie("userInputId", userInputId, 7); // 7�� ���� ��Ű ����
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}


$(function(){
	

	
var userId = $('#userId');
var pwd = $('#pwd');
var h6 = document.getElementsByClassName('loginH6');




	$(document).on('keyup', '#userId', function() {
		if(userId.val().length <4 || userId.val().length > 12 ){
			h6[0].innerHTML ="���̵�� 4~12�� �Դϴ�.";
		}else{
			h6[0].innerHTML ="";
		}
		h6[2].innerHTML ="";
		
		
				
	});
	
	$(document).on('keyup','#pwd',function(){
		if(pwd.val().length <6  || pwd.val().length >20 ){
			h6[1].innerHTML = "��й�ȣ�� 6~20�� �Դϴ�.";
		}else{
			h6[1].innerHTML = "";
		}
		h6[2].innerHTML ="";
	
	
	});
	
	$("button:contains('Submit')").on("click",function(){
		
		
		if(userId.val().length <4 || userId.val().length > 12 ){
				//alert("���̵� Ȯ�����ּ���.")
				h6[2].innerHTML ="���̵� Ȯ�����ּ���.";
			return;
		}else if(pwd.val().length <6  || pwd.val().length >20 ){
				//alert("��й�ȣ�� Ȯ�����ּ���.");
				h6[2].innerHTML ="��й�ȣ�� Ȯ�����ּ���.";
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
					//alert("�������� �ʴ� ���̵��Դϴ�.");
					h6[2].innerHTML = "�������� �ʴ� ���̵��Դϴ�.";
				}else if(JSONData.result =='errorPwd'){
					//alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
					h6[2].innerHTML = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
				}else{
					alert("���");
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

<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">
�α��θ��
</button>
 -->

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
						<h6 class="loginH6" style="color: #F00"></h6>
					</div>
					<div class="form-group">
						<label for="pwd">Password</label>
						 <input type="password"	class="form-control" placeholder="Enter password" id="pwd" name="pwd">
						<h6 class="loginH6" style="color: #F00"></h6>
					</div>
						<h6 class="loginH6" style="color: #F00"></h6>
						
						
							<div class="form-group form-check" >
								<label class="form-check-label">
									<input class="form-check-input" type="checkbox" id="idSaveCheck"> Remember me
								</label>
								<a href="/user/addUser" class="badge badge-pill badge-primary pull-right">ȸ������</a>
								<a href="/user/searchId" class="badge badge-pill badge-primary pull-right">���̵�ã��</a>
								<a href="/user/findPwd" class="badge badge-pill badge-primary pull-right">��й�ȣã��</a>
								<img id="kakaoLogin" src="/resources/images/userImages/kakaoImage.png" width="30" height="30" /> 
								<img id="naverLogin" src="/resources/images/userImages/naverImage.PNG" width="30" height="30" /> 
								<img id="googleLogin" src="/resources/images/userImages/googleImage.png" width="30" height="30">
							</div>
							
				<!-- 		<div name="naverLogin">
							���̹� ���̵�� �α��� �̹���
						</div>
						<div name="googleLogin">
						</div>
						<div name="kakaoLogin">
							īī�� ���̵�� �α��� �̹���
						</div>	
						 -->
					<h6 class="loginH6"></h6>
					
					<button type="button" class="btn btn-primary">Submit</button>
	      			<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</form>


			<!-- 	<div class="modal-footer">
				</div>modal footer End  -->

				</div><!--modal body End  -->

			</div><!--modal content End  --> 
	  </div><!--modal dialog End  -->

</div><!--myModal End  -->
 <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
</body>
</html>