<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<!DOCTYPE html>

<style>
    h6 {
        margin-left: 13px;
        margin-top: -10px;
    }

    #loginModal .modal-dialog>h2 {

        color: #F0F8FF;
        position: absolute;
        top: 58px;
        right: 215px;
    }


    #loginModal .modal-content {

        width: 500px;
        height: 300px;
        position: absolute;
        top: 100px;
        right: 10px;
    }

    #loginModal #modalForm .form-group>input {
        padding: 15px 20px;
        border-radius: 25px;
        background: rgba(217, 242, 253);
        border: 2px;
    }

    .useruser {
        font-size: 12px;

    }

</style>


<script>

    $(function() {
        // 네이버 아이디로 로그인 이미지 클릭 시 
        $("#naverLogin").on("click", function() {
            $.ajax({
                url: "/user/json/naverLoginUrlMake",
                method: "get",
                dataType: "json",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                success: function(JSONData) {
                    self.location = JSONData.url;
                }
            })
        })

        $("#googleLogin").on("click", function() {
            $(self.location).attr("href", "https://accounts.google.com/o/oauth2/v2/auth?scope=https://www.googleapis.com/auth/analytics.readonly&access_type=offline&include_granted_scopes=true&state=state_parameter_passthrough_value&redirect_uri=http://localhost:8080/user/googleLoginLogic&response_type=code&client_id=474522905430-f6nkrljp2qocnq1mop0ve2oc5ng91q38.apps.googleusercontent.com");
        })

        $("#kakaoLogin").on("click", function() {
            $.ajax({
                url: "/user/json/kakaoLoginUrlMake", // 단순 URL을 만들기 위한 UserController 
                method: "get", // 넘겨 줄 Data가 없으므로 get
                dataType: "json", // 받아 올 data의 Type을 json으로 설정 
                headers: { // dataType이 json이므로 받을 때(Accept)와 보낼 때(Content-Type)을 모두 application/json으로 설정  
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                success: function(JSONData) { // success 시, 
                    self.location = JSONData.url; // json/kakaoLoginUrlMake에서 return을 Map<String, String>으로 했으며
                }
            })
        })
    })

    $(document).ready(function() {
        var userInputId = getCookie("userInputId"); //저장된 쿠기값 가져오기
        $("#loginUserId").val(userInputId);

        if ($("#loginUserId").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
            // 아이디 저장하기 체크되어있을 시,
            $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        }

        $("#idSaveCheck").change(function() { // 체크박스에 변화가 발생시
            if ($("#idSaveCheck").is(":checked")) { // ID 저장하기 체크했을 때,
                var userInputId = $("#loginUserId").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            } else { // ID 저장하기 체크 해제 시,
                deleteCookie("userInputId");
            }
        });

        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("#loginUserId").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
            if ($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
                var userInputId = $("#loginUserId").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            }
        });
    });

    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }

    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }

    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if (start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if (end == -1) end = cookieData.length;
           		cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }


    $(function() {
        var userId = $('#loginUserId');
        var pwd = $('#loginPwd');
        var h6 = document.getElementsByClassName('loginH6');
        $("#loginUserId").keydown(function(key) {
            if (key.keyCode == 13) {
                loginAjax(userId, pwd);
            }
        });

        $("#loginPwd").keydown(function(key) {
            if (key.keyCode == 13) {
                loginAjax(userId, pwd);
            }
        });

        $("#loginButton").on("click", function() {
            loginAjax(userId, pwd);
        });
    })

    function loginAjax(userId, pwd) {
        var h6 = document.getElementsByClassName('loginH6');
        $.ajax({
            url: "/user/json/login",
            method: "post",
            dataType: "json",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            data: JSON.stringify({
                userId: userId.val(),
                pwd: pwd.val()
            }),
    		success : function(JSONData){
    			console.log(JSONData);
    			if(JSONData.result == 'ok'){
    				$("#loginModal").modal("hide");
    				location.reload();
    			}else if(JSONData.result=='unReg'){
    				swal({
    					   icon : 'info',
    					  buttons: {confirm:{value:"T",text:"네",className:"btn btn-outline-primary",},cancle:{value:"F",text:"아니오",className:"btn btn-outline-secondary",},},
    					  title : "탈퇴한 회원입니다.",
    					  text : "복구하시겠습니까?" 
    					}).then((value) =>{
    						if(value=='T'){
    							$(self.location).attr("href","/user/comeBack?userId="+JSONData.userId);
    						}
    						else if(value=='F'){
    						}
    					
    					});
    			}else if(JSONData.result =='errorId'){
    				h6[2].innerHTML = "존재하지 않는 아이디입니다.";
    			}else if(JSONData.result =='errorPwd'){
    				h6[2].innerHTML = "비밀번호가 틀렸습니다.";
    			}else{
    				swal({
  					  icon : 'warning',
  					  title : "에러",
  					  text:" ",
  					  button : false,
  					})
    			}
    		}//success
        }) //ajax
    }
</script>

	
	<div class="modal fade " id="loginModal">
	    <!-- <div class="modal-dialog modal-lg"> -->
	    <div class="modal-dialog ">
	        <div class="modal-content">
	            <div class="modal-body">
	                <form id="modalForm">
	                    <label class="form-check-label" style="position:relative; margin-top: 0px;top:70px;">
	                        <input class="form-check-input" type="checkbox" id="idSaveCheck" style="margin-left: 10px;margin-top: 8px;">
	                        <span style="margin-left: 25px;"><small>아이디저장</small></span>
	                    </label>
	                    <div class="form-group" style="margin-top: -20px;">
	                        <div style="margin-bottom: 5px;">&nbsp;&nbsp;&nbsp;<b>ID</b></div>
	                        <input type="text" class="form-control" id="loginUserId" name="userId">
	                        <h6 class="loginH6" style="color: #F00"></h6>
	                    </div>
	
	
	                    <div class="form-group" style="margin-top: 45px">
	                        <div style="margin-bottom: 5px;">&nbsp;&nbsp;&nbsp;<b>Password</b></div>
	                        <input type="password" class="form-control" id="loginPwd" name="pwd">
	                        <h6 class="loginH6" style="color: #F00"></h6>
	                    </div>
	                    <h6 class="loginH6" style="color: #F00"></h6>
	                    <a href="/user/searchId"> <span class="useruser" style="position:absolute; top:215px;left:30px;">아이디찾기</span> </a>
	                    <a href="/user/findPwd"> <span class="useruser" style="position:absolute; top:215px;left:100px;">비밀번호찾기</span></a>
	
	                    <div style="text-align: right; position:absolute; top:215px;right:25px;font-size: 12px;">SNS간편회원가입</div>
	                    <div style="text-align: right;position:absolute;top:235px;right:20px;">
	                        <img id="kakaoLogin" src="/resources/images/userImages/kakaoImage.png" width="30" height="30" />
	                        <img id="naverLogin" src="/resources/images/userImages/naverImage.PNG" width="30" height="30" />
	                        <img id="googleLogin" src="/resources/images/userImages/googleImage.png" width="30" height="30">
	                    </div>
	                    <h6 class="loginH6"></h6>
	
	                    <button type="button" id="loginButton" class="btn btn-outline-primary" style="margin-left: 20px; position:absolute; top:240px;right:395px;">로그인</button>
	
	                </form>
	            </div>
	            <!--modal body End  -->
	        </div>
	        <!--modal content End  -->
	    </div>
	    <!--modal dialog End  -->
	</div>
	<!--myModal End  -->
	
<!--구글 로그인을 위한 스크립트태그  -->
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
