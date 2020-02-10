<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>getPlanList</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- 부트스트랩 4.4 쓰려다가 빠꾸...............................했다가 다시 4.4로..  -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

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



	<!-- ICON 사용을 위한 스크립트 임포트 -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>

	<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
        width: 70%;
        background-color: grey;
      }
      /* Optional: Makes the sample page fill the window. */
      
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #floating-panel {
        width: 440px;
      }
      #place-id {
        width: 250px;
      }
      
      .modal{
	    background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
      }
	</style>


	<script type="text/javascript">
	
		$(function(){
			
			$('.showAddPlanModal').on('click', function(){
				$('#addPlanModal').show();
			});
			
			$('#addPlan').on('click', function(){
				addPlan();
			});
			
			$('#showUpdateSlotModal').on('click', function(){
				$('#updateSlotModal').show();
			});
			
			$('#updateUserSlot').on('click', function(){
				updateUserSlot();
			});
			
			$('div.plan').on('click', function(){
				var planId = $(this).children('div .planId').text().trim();
				var string = "/plan/getPlan?planId="+planId;
				$(self.location).attr("href", string);
			});
		});
			
		function addPlan(){
			console.log("addPlan 실행");
			
			var userId = $("input[name='userId']").val();
			var planTitle = $("input[name='planTitle']").val();
			var planImg = $("input[name='planImg']").val();
			var planType = $("input[name='planType']").val();
			var startDateString = $("input[name='startDateString']").val();
			
			$('form.addPlanModal').attr('method', 'POST').attr("action" , "/plan/addPlan").submit();
		}
		
		
		function showEditPlan(indexOfPlan){
			
			alert(indexOfPlan);
			planId = '10000';
			
			/* $.ajax({
				url: "/plan/json/getPlan/"+planId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					alert("리턴값 있음 => "+JSON.stringify(JSONData));
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    } 
			}); */
			
			$('#editPlan').show();
		}
		
		function updatePlan(){
			alert("updatePlan() 실행!");
		}
		
		
		function updateUserSlot(){
			var userId = '${user.userId}';
			var userSlot = '${user.slot}';
			console.log("updateUserSlot() 실행! userId="+userId+", slot="+userSlot);
			
			var string = "/plan/updateUserSlot?userId="+userId;
			$(self.location).attr("href", string);
		}
		
	</script>

</head>
<body>
	<script>
		
		/* 모달창 닫기 */
		function closeModal(modalName) {
			console.log("closeModal : modalName="+modalName);
			if( typeof $("."+modalName)[0] != "undefined" ){
				$("."+modalName)[0].reset();		//form에 모달 이름과 같은 클래스명 주기
			}
			$("#"+modalName).hide();
		}
	</script>
	
	
	<br/>
	<a href="/index.jsp" >다시 메인으로</a><br/>
	userId = ${user.userId} , userSlot = ${user.slot} , user.totalPoint = ${user.totalPoint}
	<br/><br/>
	
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row">
			
				<c:if test="${list.size() != 0}">
					<c:forEach var="plan" items="${list}">
						
						<div class="col-md-4 plan">
							<div class="planId" hidden="hidden">${plan.planId}</div>
				          
				          <div class="card mb-4 shadow-sm">
				          
				            <svg class="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
					            <rect width="100%" height="100%" fill="#99E1FF"/>
					            <image xlink:href="/resources/images/planImg/${plan.planImg}" x="0" y="0" height="230" width="100%"/>
					            <text x="50%" y="50%" fill="#eceeef" dy=".3em">${plan.planTitle}</text>
					        </svg>
				            
				            <div class="card-body">
				              	<div class="d-flex justify-content-between align-items-center">
				              		<div style="font-weight: 500; color: #6D6D6D;">
						              	<c:if test="${plan.planDday < 0}"> &nbsp; </c:if>
							            <c:if test="${plan.planDday == 0}"> D-Day </c:if>
										<c:if test="${plan.planDday > 0}"> D-${plan.planDday} </c:if>
						            </div>
									<div>${plan.planType}</div>
				              	</div>
					            <div class="card-text">
					            	<div style="font-weight: bolder; font-size: large; margin: 15px 3px;"> ${plan.planTitle}</div>
						            <div>${plan.startDateString} <c:if test="${plan.endDate != null}"> ~ ${plan.endDate} </c:if></div>
						            <div>
						            	<c:if test="${plan.planTotalDays!=0}"> ${plan.planTotalDays-1} 박 ${plan.planTotalDays} 일 </c:if>
						            </div>
						            <br/>
						        </div>
				              
					            <div class="d-flex justify-content-between align-items-center">
					              	<div class="btn-group">
					                	<button type="button" class="btn btn-sm btn-outline-secondary" onClick="showEditPlan('${list.indexOf(plan)}')">Edit</button>
					                </div>
					                <div>
						                <c:if test="${plan.planPartySize > 1}"><span data-feather="users"></span></c:if>
						                <c:if test="${plan.planPartySize == 1}"><span data-feather="user"></span></c:if>
						                 ${plan.planPartySize}
					                </div>
					            </div>
				            </div><!-- card-body end -->
				            
				          </div>
				        </div>
				        
					</c:forEach>		
				</c:if>
			
				<!-- 플래너 등록 버튼 -->
				<%-- <c:if test="${user.slot > 0 }"> --%>
					<c:forEach var="i" begin="1" end="${user.slot - list.size()}">
						<div class="col-md-4">
				          <div class="card mb-4 shadow-sm showAddPlanModal">
				          
				            <div class="card-body">
				              <div class="card-text text-center"><br/><span data-feather="plus-circle"></span><br/><br/>새로운 플래너 만들기<br/><br/> </div>
				            </div>
				            
				          </div>
						</div>
					</c:forEach>
				<%-- </c:if> --%>
				
			
				<!-- 슬롯 추가 버튼 -->
				<div class="col-md-4">
		          <div class="card mb-4 shadow-sm" id="showUpdateSlotModal">
		            <div class="card-body">
		              <p class="card-text text-center"><br/><span data-feather="lock"></span><br/><br/>슬롯 늘리기<br/><br/> </p>
		            </div>
		          </div>
				</div>
			
			</div>
		</div>
	</div>
	
	
	
	<!-- /////////////////////	Modal : addPlan	///////////////////// -->
	<div class="modal" id="addPlanModal" >
	  <div class="modal-dialog">
	  <h4 style="color: #FFFFFF; margin-top: 100px;">플래너 만들기</h4>
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <h5 class="modal-title">새로운 플래너 등록해 여행을 준비해보세요</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('addPlanModal')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	        
	        <form class="form-horizontal addPlanModal">
				<div class="form-group">
				    <label for="planTitle" class="col-sm-offset-3 col-sm-5 control-label">플래너 제목</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="planTitle" name="planTitle" placeholder="플래너 제목">
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="planImg" class="col-sm-offset-3 col-sm-5 control-label">플래너 이미지</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="planImg" name="planImg" placeholder="플래너 이미지">
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="planType" class="col-sm-offset-3 col-sm-5 control-label">플래너 타입</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="planType" name="planType" placeholder="플래너 타입">
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="startDateString" class="col-sm-offset-3 col-sm-5 control-label">여행 시작일</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="startDateString" name="startDateString" placeholder="여행 시작일">
				    </div>
				</div>
	        </form>
	        
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('addPlanModal')">Close</button>
	        <button type="button" class="btn btn-primary" id="addPlan">Add Plan</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Modal : addPlan	///////////////////// -->
	
	<!-- /////////////////////	Modal : editPlan 	///////////////////// -->
	<div class="modal" id="editPlan">
	  <div class="modal-dialog" >
	  	<h4 style="color: #FFFFFF; margin-top: 100px;"> 플래너 수정</h4>
	  
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <div class="modal-title">
	        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>플래너를 수정합니다</h6>
	        </div>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('editPlan')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	        
	        <form class="form-horizontal editPlan" style="margin: 10px;">
	        	
				<div class="form-group">
				    <label for="planTitle" class="col-sm-offset-3 col-sm-5 control-label">플래너 제목	</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="planTitle" name="planTitle" placeholder="플래너 제목" value="${plan.planTitle}">
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="planImg" class="col-sm-offset-3 col-sm-5 control-label">플래너 이미지</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="planImg" name="planImg" placeholder="플래너 이미지" value="${plan.planImg}">
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="planType" class="col-sm-offset-3 col-sm-5 control-label">플래너 타입</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="planType" name="planType" placeholder="플래너 타입" value="${plan.planType}">
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="startDateString" class="col-sm-offset-3 col-sm-5 control-label">여행 시작일</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="startDateString" name="startDateString" placeholder="여행 시작일" value="${plan.startDateString}">
				    </div>
				</div>
				
				<!-- 여행완료 확정 폼제출을 위한 히든 값 -->
				<input type="hidden" class="form-control" id="planStatus" name="planStatus" value="${plan.planStatus}">
				<input type="hidden" class="form-control" id="planId2" name="planId" value="${plan.planId}">
	        	
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('editPlan')">Close</button>
	        <button type="button" class="btn btn-primary" id="updatePlan">수정</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Modal : editPlan 끝	///////////////////// -->
	
	<!-- /////////////////////	Modal : 슬롯 늘리기 	///////////////////// -->	
	<div class="modal" id="updateSlotModal">
	  <div class="modal-dialog" >
	  	<h4 style="color: #FFFFFF; margin-top: 100px;"> 슬롯 구매</h4>
	  
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <!-- <div class="modal-title">
	        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>친구를 초대해 플래너를 함께 작성하고 여행을 떠나보세요</h6>
	        </div> -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('updateSlotModal')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body text-center">
	        <br/>
	        <c:if test="${ empty user.totalPoint || user.totalPoint < 500 }">
	        	 <span style="font-size:17px;"> 플래너 슬롯을 구매하기 위해선</span><br/>
				 <span style="font-size:17px;">보유 포인트가 500P 이상이어야 합니다</span><br/><br/>
	        </c:if>
	        <c:if test="${user.totalPoint >= 500 }">
	        	<span style="font-size:17px;"> 플래너 슬롯을 늘리시겠습니까?</span><br/>
	         	<span style="font-size:17px;"> 현재 보유하고 계신 ${user.totalPoint}P 중 500P 를 사용합니다</span><br/><br/>
	        </c:if>
	      </div>
	      
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('updateSlotModal')">아니오</button>
	      	<c:if test="${user.totalPoint >= 500 }">
	      		<button type="button" class="btn btn-primary" id="updateUserSlot">예</button>
	      	</c:if>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Modal : 슬롯 늘리기 끝	///////////////////// -->

	
	
	
	<script>
	
		/* icon 사용을 위한 스크립트 */
		/* https://github.com/feathericons/feather#feather 참고 */
		feather.replace();
		
	
	</script>


</body>
</html>