<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>getPlanList</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- ��Ʈ��Ʈ�� 4.4 �����ٰ� ����...............................�ߴٰ� �ٽ� 4.4��..  -->
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
			
			$('#addPlan').on('click', function(){
				console.log("addPlan ���â ����");
				$('#myModal1').show();
			});
			
			$('#myModal1Button').on('click', function(){
				console.log("addPlan ����");
				
				var userId = $("input[name='userId']").val();
				var planTitle = $("input[name='planTitle']").val();
				var planImg = $("input[name='planImg']").val();
				var planType = $("input[name='planType']").val();
				var startDateString = $("input[name='startDateString']").val();
				
				/* $.ajax({
					url: "/plan/json/addPlan",
					method: "POST",
					dataType: "json",
					data: JSON.stringify({
						userId: userId,
						planTitle: planTitle
					}),
					headers: {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success: function(JSONData, status){
						
					},
					error:function(request,status,error){
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
				    } 
				}); */
				
				$('form').attr('method', 'POST').attr("action" , "/plan/addPlan").submit();
				
			});
			
			
			$('div.plan').on('click', function(){
				var planId = $(this).children('div .planId').text().trim();
				var string = "/plan/getPlan?planId="+planId;
				//alert(string);
				$(self.location).attr("href", string);
			});
			
		});
		
		
		
	</script>

</head>
<body>
	<script>
		function closeMyModal(number) {
			console.log("closeMyModal"+number);
			$('form')[0].reset();
			$("#myModal"+number).hide();
		}	
	</script>
	
	
	<br/>
	<a href="/index.jsp" >�ٽ� ��������</a><br/><br/>
	
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row">
			
			<c:if test="${list.size() != 0}">
				<c:forEach var="plan" items="${list}">
					<div class="col-md-4">
			          <div class="card mb-4 shadow-sm">
			            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
			            <title>Placeholder</title><rect width="100%" height="100%" fill="#99E1FF"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">${plan.planTitle}</text></svg>
			            <div class="card-body plan">
			              <p class="card-text">
			              <div class="planId" hidden="hidden">${plan.planId}</div>
			              ${plan.planId}<br/>
			              ${plan.startDateString} <c:if test="${plan.endDate != null}"> ~ ${plan.endDate}</c:if><br/>
			              						
			              						<c:if test="${plan.planTotalDays!=0}">
			              							${plan.planTotalDays-1} �� ${plan.planTotalDays} ��
			              						</c:if><br/><br/>
			              						�÷� �����ο� : ${plan.planPartySize} ��<br/> 
			              						</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
				</c:forEach>		
			</c:if>
			
			<div class="col-md-4">
	          <div class="card mb-4 shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
	            <title>Placeholder</title><rect width="100%" height="100%" fill="#D4FF7B"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">+</text></svg>
	            <div class="card-body">
	              <p class="card-text text-center" id="addPlan"><br/>�÷��� �߰��ϱ�<br/><br/> </p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
	                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
	                </div>
	                <small class="text-muted">9 mins</small>
	              </div>
	            </div>
	          </div>
			</div>
			
			</div>
		</div>
	</div>
	
	
	<div class="modal" id="myModal1" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">AddPlan() : �÷��� �߰��ϱ�</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeMyModal(1)">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        
	        <form class="form-horizontal">
	        
				<div class="form-group">
				    <label for="planTitle" class="col-sm-offset-3 col-sm-5 control-label">�÷��� ����	</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="planTitle" name="planTitle" placeholder="�÷��� ����">
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="planImg" class="col-sm-offset-3 col-sm-5 control-label">�÷��� �̹���</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="planImg" name="planImg" placeholder="�÷��� �̹���">
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="planType" class="col-sm-offset-3 col-sm-5 control-label">�÷��� Ÿ��</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="planType" name="planType" placeholder="�÷��� Ÿ��">
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="startDateString" class="col-sm-offset-3 col-sm-5 control-label">���� ������</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="startDateString" name="startDateString" placeholder="���� ������">
				    </div>
				</div>
				
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeMyModal(1)">Close</button>
	        <button type="button" class="btn btn-primary" id="myModal1Button">Add Plan</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<script>
	</script>


</body>
</html>