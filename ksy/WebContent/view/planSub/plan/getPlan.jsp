<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>getPlan</title>
	
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
	
	
	
	<!-- Use Swiper from CDN -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	
	
	<!-- FontAwesome CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- fontawesome CDN -->
	<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script> -->
	<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script> -->
	


	<!-- FullCalendar CDN -->
	<link href='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.css' rel='stylesheet' />
  	<link href='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.css' rel='stylesheet' />
  	<link href='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.css' rel='stylesheet' />
	<link href='https://unpkg.com/@fullcalendar/list@4.3.0/main.min.css' rel='stylesheet' />
	
	<script src='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/interaction@4.3.0/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/list@4.3.0/main.min.js'></script>
	
	
	<!-- jquery Ui ��ũ (datePicker)  -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!--datePicker CDN  -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	
	<!-- boot strap File upload CDN  -->
	<script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.js"></script>
	
	
	<style>
		
		#calendar {
			border-style: solid;
			border-width: thin;
			border-color: #E0E0E0;
			padding: 10px;
		}
		
	</style>

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
      
      .swiper-container {
      	border: 1px gray;
      	//padding: 5px;
      	height: 500px;
      }
      .swiper-wrapper {
      }
      .swiper-slide {
      	height: 480px;
      	background-color: white;
      	margin: 4px;
      	padding: 10px;
      	border-radius: 7px;
      	box-shadow:1px 3px 2px #ACC1CB;
      }
      
      
      .list-group-item{
      	height: 33px;
      	padding: 7px;
      	font-size: 13px;
      }
      
      
      .party-member-img{
      	height: 37px;
      	width: 37px;
      	border-style: solid;
      	border-width: thin;
      }
      .party-member-img.K{
      	border-width: 2px;
      	border-color: #FA6124;
      }
      .party-member-img.M{
      	border-color: #C6C6C6;
      }
      .plan-party-list-box{
      	border-radius: 5px;
      	border-style: solid; 
      	border-color: #DDDDDD;
      	border-width: thin;
      	padding: 5px 12px; 
      	background-color: white; 
      	display:scroll; 
      	position:fixed; 
      	top:280px; 
      	left:20px; 
      	margin: 15px; 
      	width: 165px;
      }
      
      /* ���� */
      .stuffItem{
      	/* display:inline-block; */
		position:relative;
      }
      .stuffName{
      	bottom:0;
      	margin-left: 7px;
		position:absolute;
      }
	</style>
	
	
	<!-- Custom styles for this template -->
	<!-- ���� ���̵�ٸ� ���� CSS... �ȵż� �� ��ũ��Ʈ ��°�� �־�� -->
    <!-- <link href="/css/bootstrapDashboardCustomStyle.css" rel="stylesheet"> -->
	<style type="text/css">
		body {
		  font-size: .875rem;
		}
		.feather {
		  width: 16px;
		  height: 16px;
		  vertical-align: text-bottom;
		}
		
		/* Sidebar */
		.sidebar {
		  position: fixed;
		  top: 0;
		  bottom: 0;
		  left: 0;
		  z-index: 100; /* Behind the navbar */
		  padding: 48px 0 0; /* Height of navbar */
		  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
		}
		.sidebar-sticky {
		  position: relative;
		  top: 0;
		  height: calc(100vh - 48px);
		  padding-top: .5rem;
		  overflow-x: hidden;
		  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
		}
		@supports ((position: -webkit-sticky) or (position: sticky)) {
		  .sidebar-sticky {
		    position: -webkit-sticky;
		    position: sticky;
		  }
		}
		
		.sidebar .nav-link {
		  font-weight: 500;
		  color: #333;
		}
		.sidebar .nav-link .feather {
		  margin-right: 4px;
		  color: #999;
		}
		.sidebar .nav-link.active {
		  color: #007bff;
		}
		.sidebar .nav-link:hover .feather,
		.sidebar .nav-link.active .feather {
		  color: inherit;
		}
		.sidebar-heading {
		  font-size: .75rem;
		  text-transform: uppercase;
		}
		
		/* Content */
		
		[role="main"] {
		  padding-top: 133px; /* Space for fixed navbar */
		}
		@media (min-width: 768px) {
		  [role="main"] {
		    padding-top: 48px; /* Space for fixed navbar */
		  }
		}
		
		/* Navbar */
		.navbar-brand {
		  padding-top: .75rem;
		  padding-bottom: .75rem;
		  font-size: 1rem;
		  background-color: rgba(0, 0, 0, .25);
		  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
		}
		.navbar .form-control {
		  padding: .75rem 1rem;
		  border-width: 0;
		  border-radius: 0;
		}
		.form-control-dark {
		  color: #fff;
		  background-color: rgba(255, 255, 255, .1);
		  border-color: rgba(255, 255, 255, .1);
		}
		.form-control-dark:focus {
		  border-color: transparent;
		  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
		}
	
	
		.bd-placeholder-img {
	        font-size: 1.125rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        -ms-user-select: none;
	        user-select: none;
	      }
	
	      @media (min-width: 768px) {
	        .bd-placeholder-img-lg {
	          font-size: 3.5rem;
	        }
	      }
	</style>


	<!-- ICON ����� ���� ��ũ��Ʈ ����Ʈ -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>



	<!-- �Լ��� ������ -->
	<script type="text/javascript">
	
		var planId = ${plan.planId};	//���� ��ȸ���� plan�� ���̵� �ھƵα�
		
		/* ---------------------------------		Daily List ���� �Լ���		--------------------------------- */
		$(function(){
			$('#submitDaily').on('click', function(){
				submitDaily($(this).text());
			});
			
			$('#deleteDaily').on('click', function(){
				submitDaily($(this).text());
			});
		});
		
		function getDaily(planId, dayNo, dayTime){
			console.log("getDaily() ���� "+planId+"/"+dayNo+"/"+dayTime);
			
			$.ajax({
				url: "/planSub/json/getDaily",
				method: "POST",
				dataType: "json",
				data: JSON.stringify({
					planId: planId,
					dayNo: dayNo,
					dayTime: dayTime
				}),
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ 	//console.log("���ϵ����� ����");		//���ϵ����Ͱ� ������ request.status 200���� ���ƿ�
					}else{ 		//console.log("���ϵ����� ����1! => "+JSONData.dailyCate);	
						$("input[name='dailyId']").val(JSONData.dailyId);
						$("select[name='dailyCate']").val(JSONData.dailyCate);
						$("input[name='dailyDetail']").val(JSONData.dailyDetail);
						$("input[name='budgetAmount']").val(JSONData.budgetAmount);
						$("select[name='budgetCurrency']").val(JSONData.budgetCurrency);
						
						$('#deleteDaily').show();
						$('#submitDaily').text('Update Daily');
					}
				},
				error:function(request,status,error){
					if( request.status == '200'){ 		//console.log("���ϵ����� ����");	
						$("input[name='dailyId']").val('');
						$('#deleteDaily').hide();
						$('#submitDaily').text('Add Daily');
					}
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		}	//getDaily
	
		function openDailyEdit(cityNames, dateString, dayNo, dayTime, planId) {
			console.log("cityNames="+cityNames+", dateString="+dateString+", dayNo="+dayNo +", dayTime="+dayTime+", planId="+planId);
			
			getDaily(planId, dayNo, dayTime);
			
			$('.city-names').text(cityNames);
			$('.city-date').text(dateString+",  D"+dayNo);
			
			$('#dayNo').val(dayNo);
			$('#dayTime').val(dayTime);
			
			setTimeout(function(){
				$("#dailyEdit").show()
			},100);
		}	//openDailyEdit
		
		
		function submitDaily(dailyButton){
			//var planId = $("input[name='planId']").val();		//��ũ��Ʈ �� ������ planId �ھƵα� ������ ó�� �����൵ ����!
			var dailyId = $("input[name='dailyId']").val();
			var dayNo = $("input[name='dayNo']").val();
			var dayTime = $("select[name='dayTime']").val();
			var dailyCate = $("select[name='dailyCate']").val();
			var dailyDetail = $("input[name='dailyDetail']").val();
			
			var budgetAmount = $("input[name='budgetAmount']").val();
			var budgetCurrency = $("select[name='budgetCurrency']").val();
			
			//if(budgetCurrency == null || budgetCurrency ==''){ budgetCurrency = 'K'; }; //���� ���Է½� �⺻�� ���� :: 0�� / KRW
			if(budgetAmount == null || budgetAmount =='' || budgetAmount=='0'){ budgetAmount = 0; };
			
			if(dailyDetail == null || dailyDetail ==''){
				alert("dailyDetail �� �Է����ּ���");
				return false;
			}
			console.log("planId="+planId+", dailyId="+dailyId+", dayNo="+dayNo+", dayTime="+dayTime+", dailyCate="+dailyCate+", dailyDetail="+dailyDetail+", budgetAmount="+budgetAmount+", budgetCurrency="+budgetCurrency);
			
			/* addDaily */
			if(dailyButton == 'Add Daily'){
				console.log("Add Daily ��ư Ŭ��! ");
				
				if(dailyId == null || dailyId=='' ){
					$.ajax({
						url: "/planSub/json/addDaily",
						method: "POST",
						dataType: "json",
						data: JSON.stringify({
							planId: planId,
							dayNo: dayNo,
							dayTime: dayTime,
							dailyCate: dailyCate,
							dailyDetail: dailyDetail,
							budgetAmount: budgetAmount,
							budgetCurrency: budgetCurrency
						}),
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){
							if( JSONData==null || JSONData=="" ){
								console.log("���ϵ����� ����");	
							}else{
								console.log("���ϵ����� ����! => "+JSONData);	
								
								var dailyList = JSONData;
								for( var i in dailyList){
									setDaily(dailyList[i]);
								}
							}
							closeModal('dailyEdit');
						},
						error:function(request,status,error){
					        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
					    } 
					});
				}
				
			/* updateDaily */
			}else if(dailyButton == 'Update Daily'){
				console.log("Update Daily ��ư Ŭ��! ");
				
				if(dailyId != null && dailyId !='' ){
					$.ajax({
						url: "/planSub/json/updateDaily",
						method: "POST",
						dataType: "json",
						data: JSON.stringify({
							planId: planId,
							dailyId: dailyId,
							dayNo: dayNo,
							dayTime: dayTime,
							dailyCate: dailyCate,
							dailyDetail: dailyDetail,
							budgetAmount: budgetAmount,
							budgetCurrency: budgetCurrency
						}),
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){
							if( JSONData==null || JSONData=="" ){
								console.log("���ϵ����� ����");	
							}else{
								console.log("���ϵ����� ����! => "+JSONData);	
								
								var dailyList = JSONData;
								for( var i in dailyList){
									setDaily(dailyList[i]);
								}
							}
							closeModal('dailyEdit');
						},
						error:function(request,status,error){
					        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
					    } 
					});
				} 
				
			/* deleteDaily */
			}else if(dailyButton == 'Delete Daily'){
				console.log("Delete Daily ��ư Ŭ��! ");
				
				if(dailyId != null && dailyId !='' ){
					$.ajax({
						url: "/planSub/json/deleteDaily/"+dailyId,
						method: "GET",
						dataType: "json",
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){
							/* if( JSONData==null || JSONData=="" ){ alert("���ϵ����� ����");	 }
							closeModal('dailyEdit'); */
						},
						error:function(request,status,error){
							if( request.status == '200'){ 		//alert("���ϵ����� ����");	 but ���� (���� void��)
								
								var dailyIdString = '#daily_'+dayNo+"_"+dayTime;
								$(dailyIdString).text('');
								closeModal('dailyEdit');
							}
					    } 
					});
				}
			}
		} //submitDaily
		
		function getDailyList(planId){
			
			$.ajax({
				url: "/planSub/json/getDailyList/"+planId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){		//alert("���ϵ����� ����");	
					}else{		//alert("���ϵ����� ����! => JSONData = "+JSON.stringify(JSONData));	
						var dailyList = JSONData;
						for( var i in dailyList){
							setDaily(dailyList[i]);
						}
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //getDailyList
		
		function setDaily( daily ){
			var dailyIdString = '#daily_'+daily.dayNo+"_"+daily.dayTime;
			
			var bcolor;		//����(D), ����(T), ����(V), ����(R), �Ļ�(F), ����(S), ��Ÿ(E)
			if( daily.dailyCate =='D' ){ bcolor = 'yellow';
			}else if( daily.dailyCate =='T' ){ bcolor = 'red';
			}else if( daily.dailyCate =='V' ){ bcolor = 'navy';
			}else if( daily.dailyCate =='R' ){ bcolor = 'blue';
			}else if( daily.dailyCate =='F' ){ bcolor = 'green';
			}else if( daily.dailyCate =='S' ){ bcolor = 'orange';
			}else if( daily.dailyCate =='E' ){ bcolor = 'purple';
			}
			
			$(dailyIdString).text(daily.dailyDetail);		//$(dailyIdString).text(daily.dailyDetail).css("background-color", bcolor);
			var appendString = '<span style="padding-left:5px; border-right-width:10px; border-right-style: solid; border-color: '+bcolor+';"></span>'
			$(dailyIdString).append(appendString);
		} //setDaily
		
		getDailyList(planId);	//������ �ε� �� ajax�� ���� ����Ʈ �����ͼ� ������� ����ǥ�� �ɾ��ֱ�
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		
		/* ---------------------------------		Stuff List ���� �Լ���		--------------------------------- */
		$(function(){
			
			$('#stuffMode').on('click', function(){
				changeStuffMode($(this).text());
			});

		});
		
		function changeStuffMode(mode){
			console.log("changeStuffMode() ���� :: moed="+mode);
			var stuffIconHtml;
			
			if(mode == 'Edit Mode'){
				$('#stuffMode').text('List Mode');
				stuffIconHtml = '<i class="fas fa-edit" style="font-size: 25px; margin-right: 3px; margin-bottom: 15px;"></i>';
				
			}else if(mode == 'List Mode'){
				$('#stuffMode').text('Edit Mode');
				stuffIconHtml = '<i class="fas fa-tasks" style="font-size: 25px; margin-right: 6px; margin-bottom: 15px;"></i>';
			}
			$('#stuff_icon').html(stuffIconHtml);
			getStuffList(planId, mode);
		} //changeStuffMode(mode) END
		
		function checkStuff(stuffId){
			var checked = $("input[name='stuff_"+stuffId+"']").val();
			console.log("checkStuff(stuffId) ���� => checked="+checked+", stuffId="+stuffId);
			
			if(checked =='T'){
				checked = 'F';
			}else if(checked=='F'){
				checked = 'T';
			}
			$("input[name='stuff_"+stuffId+"']").val(checked);
			
			$.ajax({
				url: "/planSub/json/checkStuff/"+checked+"/"+stuffId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ console.log("���ϵ����� ����");	 }
				},
				error:function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //checkStuff(stuffId) END
		
		
		
		function getStuffList(planId, mode){
			console.log("getStuffList("+planId+", "+mode+") ���� ");
			
			var stuffCheckedCnt = 0;
			var stuffUncheckedCnt = 0;
			
			$.ajax({
				url: "/planSub/json/getStuffList/"+planId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					
					//var stuffItemsHtml = '<div class="stuffItems">';
					var stuffItemsHtml = '';
					var addStuffHtml = '<div class="addStuff"><i class="fas fa-pencil-alt" style="margin: 7px;"></i><input type="text" class="form-control" name="stuffName" style="margin-left:5px; margin-top:5px; width: 200px; display:inline-block;" placeholder="���ο� �׸� �Է�"> <button style="margin-bottom: 5px; margin-left: 5px;" type="button" class="btn btn-primary" onclick="addStuff()">�߰�</button> </div>';
					
					if( JSONData==null || JSONData=="" ){ 	
						console.log("���ϵ����� ����");	
						stuffItemsHtml += addStuffHtml;
						
					}else{ 		//alert("���ϵ����� ����1! => JSONData = "+JSON.stringify(JSONData));	

						if(mode == 'List Mode'){
							for( var i in JSONData){
								if( JSONData[i].stuffCheck == 'T' ){
									stuffCheckedCnt += 1;
									stuffItemsHtml += '<div class="stuffItem" style="margin: 7px;"> <input type="checkbox" name="stuff_'+JSONData[i].stuffId+'" checked value="T" onchange="checkStuff('+JSONData[i].stuffId+')"><span style="margin-left: 10px;"> '+JSONData[i].stuffName+'</span> </div>';
								}else if( JSONData[i].stuffCheck == 'F' ){
									stuffUncheckedCnt += 1;
									stuffItemsHtml += '<div class="stuffItem" style="margin: 7px;"> <input type="checkbox" name="stuff_'+JSONData[i].stuffId+'" value="F" onchange="checkStuff('+JSONData[i].stuffId+')"><span style="margin-left: 10px;"> '+JSONData[i].stuffName+'</span> </div>';
								}
							}
							$('#stuffCount').text( "( "+stuffCheckedCnt+" / "+(stuffUncheckedCnt+stuffCheckedCnt)+" )");
							$('#stuffCount').show();
							
						}else if(mode == 'Edit Mode'){
							for( var i in JSONData){ 	// html �̺�Ʈ�ɾ ������ �ٲٴ� ���� $(~).on("click") �̺�Ʈ�� ������� ����.... �׷��� �±� �ȿ� onClick="�����Լ�" �� �־���� �Լ�ȣ���� ��������
								stuffItemsHtml += '<div class="stuffItem" style="margin: 7px;"> <i class="fas fa-minus-circle" onClick="deleteStuff('+JSONData[i].stuffId+')" style="margin-right:5px;" ></i> <span class="stuffName" id="stuff_'+JSONData[i].stuffId+'">'+JSONData[i].stuffName+'</span> </div>';
							}
							stuffItemsHtml += addStuffHtml;
							$('#stuffCount').hide();
						}
					}
					//stuffItemsHtml += '</div>';
					//$(".stuffItems").replaceWith(stuffItemsHtml);
					$(".stuffItems").html(stuffItemsHtml);
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //getStuffList(planId, mode) END
		
		function deleteStuff(stuffId){
			alert("������ �غ��� ���� �Ұ����մϴ�")
			console.log('deleteStuff('+stuffId+') ����! ');
			
			$.ajax({
				url: "/planSub/json/deleteStuff/"+stuffId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ 	//alert("���ϵ����� ����");	
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			        getStuffList(planId,'Edit Mode');			    
				} 
			});
		} //deleteStuff(stuffId) END
		
		function addStuff(){
			var stuffName = $("input[name='stuffName']").val();
			console.log('addStuff() ���� : stuffName='+stuffName);
			
			if(stuffName == null || stuffName ==''){
				alert("stuffName �� �Է����ּ���");
				return false;
			}
			
			$.ajax({		// GET������� addStuff �ߴ��� �ѱ��� ���� ���� POST�� �ٲ�
				url: "/planSub/json/addStuff" ,
				method: "POST",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				data: JSON.stringify({
					planId: planId,
					stuffName: stuffName
				}),
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ 	
						console.log("���ϵ����� ����");	
					}else{
						console.log("���ϵ����� ����! +> JSONData = "+JSON.stringify(JSONData));	
					}
					getStuffList(planId,'Edit Mode');
				},
				error:function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
				} 
			});
		} //addStuff() END
		
		getStuffList(planId, 'List Mode');
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------		BudgetOverview ���� �Լ���		--------------------------------- */
		
		function getBudgetOverviewList(planId){
			console.log("getBudgetOverviewList("+planId+") ���� ");
			
			$.ajax({
				url: "/planSub/json/getBudgetOverviewList/"+planId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					//var budgetOverviewHtml = '';
					if( JSONData==null || JSONData=="" ){ 	
						console.log("���ϵ����� ����");	
					}else{ 		
						console.log("���ϵ����� ����1! => JSONData = "+JSON.stringify(JSONData));	

						for( var i in JSONData ){
							switch ( JSONData[i].dailyCate ) {
						        case 'D': $('#budget_D').text(JSONData[i].budgetAmount+" ��");	//����
						          break;
						        case 'T': $('#budget_T').text(JSONData[i].budgetAmount+" ��");	//����
						          break;
						        case 'V': $('#budget_V').text(JSONData[i].budgetAmount+" ��");	//����
						          break;
						        case 'R': $('#budget_R').text(JSONData[i].budgetAmount+" ��");	//����
						          break;
						        case 'F': $('#budget_F').text(JSONData[i].budgetAmount+" ��");	//�Ļ�
						          break;
						        case 'S': $('#budget_S').text(JSONData[i].budgetAmount+" ��");	//����
						          break;
						        case 'E': $('#budget_E').text(JSONData[i].budgetAmount+" ��");	//��Ÿ
						          break;
						        default:
						          var d = 'default';
						    } //switch
						}
					} //if-else
					//$(".budgetOverview").html(budgetOverviewHtml);
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //getBudgetOverviewList(planId) END
		
		getBudgetOverviewList(planId);
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------		Todo List ���� �Լ���			--------------------------------- */
		
		$(function(){
			
			$('#todoMode').on('click', function(){
				alert("#todoMode Ŭ�� => changeTodoMode() ����");
				changeTodoMode($(this).text());
			});

		});
		
		function changeTodoMode(mode){
			alert("changeTodoMode(mode) ����");
		} //changeTodoMode ��
		
		function checkTodo(todoId){
			alert("checkTodo(todoId) ����");
		}	//checkTodo ��
		
		function getTodoList(planId, mode){
			alert("getTodoList(planId, mode) ����");
		}	//getTodoList ��
		
		function deleteTodo(todoId){
			alert("deleteTodo(todoId) ����");
		}	//deleteTodo ��
		
		function addTodo(){
			alert("addTodo() ����");
		}	//addTodo ��
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------	CityRoute List ���� �Լ���		--------------------------------- */
		
		$(function(){
			
		});
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------	PlanPartyMember ���� �Լ���		--------------------------------- */
		$(function(){
			$('#findUser').on('click', function(){
				console.log("#findUser(�˻�) Ŭ�� => findUser("+$('#findUserId').val()+") ����");
				findUser($('#findUserId').val());
			});
			
			$('#addOffer').on('click', function(){
				addOffer();
			});
			
			$('#deletePlanParty').on('click', function(){
				deletePlanParty('F');
			});
			
			$('#exitPlanButton').on('click', function(){
				$('#exitPlanAlert').show();
			})
			
			$('#exitPlan').on('click', function(){
				deletePlanParty('S');
			});
		});
		
		function inviteUser() {
			console.log("inviteUser() ����");
			$('#offerMsgForm').hide();
			$('#addOffer').hide();
			$('.findUserResult').text('');
			$("#inviteUser").show()
		}
		
		function deletePlanPartyAlert(partyUserId, partyUserNickname){
			$('#planMemberId').text(partyUserId);
			$("#deletePlanPartyAlert").show();
		}
		
		function deletePlanParty(condition){
			var partyUserId;
			
			if( condition=='F'){
				partyUserId = $('#planMemberId').text();
				console.log("deletePlanParty("+condition+") ���� ==> "+partyUserId+" �����Ű��" );
			}else if( condition=='S'){
				partyUserId = '${user.userId}';
				console.log("deletePlanParty("+condition+") ���� ==> "+partyUserId+" ���� Ż��" );
			}
			
			$('#partyUserId').val(partyUserId);
			$('input[name="partyRole"]').val(condition);		//����� ����Ż��:S, �������� ����:F
			$('form.deleteMember').attr('method', 'POST').attr('action', '/plan/deletePlanParty').submit();
		}

		
		function findUser(findUserId) {
			console.log("findUser("+findUserId+") ����");
			if(findUserId == ''){
				alert("�˻��� ȸ���� ���̵� �Է����ּ���");
				return false;
			}
			
			$.ajax({
				url: "/plan/json/findUser/"+planId+"/"+findUserId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					console.log("���ϵ����� ����! +> JSONData = "+JSON.stringify(JSONData));	
					
					if(JSONData[0] == 'X'){	//�ʴ� �Ұ���
						$('.findUserResult').text(JSONData[1]);
						$('#offerMsgForm').hide();
						$('#addOffer').hide();
					}else if(JSONData[0] == 'A'){	//�ʴ� ����
						$('.findUserResult').text(JSONData[1]);
						$('#offerMsgForm').show();
						$('#addOffer').show();
					}
					$("input[name='findUserId']").val('');
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		}	//findUser ��
		
		
		function addOffer() {	
			var toUserId = $($('.findUserResult')[0]).text();
			var offerMsg = $("input[name='offerMsg']").val();
			
			if(offerMsg == ''){
				alert("offerMsg�� �Է����ּ���");
				return false;
			}
			console.log("toUserId="+toUserId+", offerMsg="+offerMsg);
			
			$.ajax({
				url: "/plan/json/addOffer" ,
				method: "POST",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				data: JSON.stringify({
					refId: planId,
					toUserId: toUserId,
					offerMsg: offerMsg
				}),
				success: function(JSONData, status){
					//String�� �ͼ� ����� ��ġ�� ����..
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			        closeModal('inviteUser');
			        alert(request.responseText+" �Կ��� �ʴ� �޽����� ���½��ϴ�.");
			        
			      	//�ʴ� �޴� ������� push �ϱ�
					var receiverId = toUserId;
					var pushType = 'I';
					sendPush(receiverId, pushType);		//jsp:include�� ���Ե� toolBar.jsp�� �ִ� �Լ�!
			    } 
			});
		}	//addOffer ��
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------	Plan Information ���� �Լ�		--------------------------------- */
		$(function(){
			$('#updatePlanButton').on('click',function(){
				$("#editPlan").show();
			});		
			$('#updatePlan').on('click', function(){
				updatePlan();
			});
			
			$('#deletePlanButton').on('click',function(){
				$("#deletePlanAlert").show();
			});	
			$('#deletePlan').on('click', function(){
				deletePlan();
			});
			
			$('#planCompleteButton').on("click", function(){
				$("#planCompleteAlert").show();
			});
			$('#planComplete').on('click', function(){
				planComplete();
			});
			
			
			$( "#startDateString" ).datepicker({
			      showOptions: { direction: "up" },
				  defaultDate : '1995-02-10',
			      changeYear : true ,
			      changeMonth : true ,
			      //buttonImage: "/resources/images/userImages/CalendarICON.png",
			      dateFormat : "yy-mm-dd",
			      showAnim : "bounce",
			      autoclose: true
			});
			
			/* ��� �ڿ� ����Ʈ��Ŀ�� �������� ����... ������� �ذ� */
			$('#startDateString').on('click', function(){
				 $('#ui-datepicker-div').appendTo($('#editPlan'));
				 $(this).datepicker();
				 $(this).datepicker("show");
			});
			
			//�����̲� ���پ� - ���Ͽ뷮 üũ
			$(".custom-file-input").on("change",function(){
				  var fileSize = this.files[0].size;
				    var maxSize = 360 * 360;
				    if(fileSize > maxSize) {
				        $(".custom-file-label").html("<i class='fas fa-camera-retro'> size 360x360</i>");
				        alert("���Ͽ뷮�� �ʰ��Ͽ����ϴ�.");
				        //$("#preview").html("");
				        return;
				    }else{
						//readImg(this);
				    }
			});
			
			$(document).ready(function() {
				  bsCustomFileInput.init();
			});
			
			
			//alert-danger���� x Ŭ���� â �ݱ�
			$(".alert-danger button").on("click",function(){
				$(".alert-danger").prop("style","display:none");			
			})
			$(document).on('keyup','#planTitle',function(){
				if($('#planTitle').val().length > 0){
					$(".alert-danger").prop("style","display:none");	
				}
			});
			$(document).on('change','#startDateString',function(){
				if($('#startDateString').val().length > 0){
					$(".alert-danger").prop("style","display:none");	
				}
			});
			
		})
		
		function updatePlan(){		//�÷��� ����
			console.log("updatePlan() ����!");
		
			var submitAlert = $(".alert-danger");
			var alertMessage = $(".alert-danger strong");
			
			var planTitle = $("input[name='planTitle']").val();
			var planImg = $("input[name='planImg']").val();
			var planType = $("input[name='planType']").val();
			var startDateString = $("input[name='startDateString']").val();
			
			//��ȿ�� üũ
			if ($.trim(planTitle)=="") {
				submitAlert.prop("style","display : block");
				alertMessage.html("�÷��� ������ �ʼ��Դϴ�.");
				return;
			}
			if ($.trim(startDateString)=="") {	//�� �ʿ����..
				submitAlert.prop("style","display : block");
				alertMessage.html("���� �������� �������ּ���.");
				return;
			}
			
			$('form.editPlan').attr('method', 'POST').attr("action" , "/plan/updatePlan").attr("enctype","multipart/form-data").submit();
		}
		
		function deletePlan(){		//�÷��� ����
			$('form.editPlan').attr('method', 'POST').attr('action', '/plan/deletePlan').submit();
		}
		
		function planComplete(){	//����Ϸ� Ȯ��
			$("input[name='planStatus']").val('C');
			$('form.editPlan').attr('method', 'POST').attr('action', '/plan/updatePlanStatus').submit();
		}
		
		/* ------------------------------------------------------------------------------------------------------ */
		
	</script>
	
	<script>
	
		/* ���â �ݱ� */
		function closeModal(modalName) {
			console.log("closeModal : modalName="+modalName);
			if( typeof $("."+modalName)[0] != "undefined" ){
				$("."+modalName)[0].reset();		//form�� ��� �̸��� ���� Ŭ������ �ֱ�
			}
			$("#"+modalName).hide();
		}
		
		/* ���� ���� */
		function shakeThat(){
			var rnd  = Math.round(Math.random() * 4);
			$('.stuffItem .stuffName').css({ 'bottom':rnd}); 	//Edit Mode�� �غ� ��� ���� ����
		}
		setInterval(shakeThat, 45);
		
		/* ��ũ�� �ε巴�� */
		jQuery(document).ready(function($) { 
			$(".scroll").click(function(event){ 
				event.preventDefault(); 
				$('html,body').animate({
					scrollTop:$(this.hash).offset().top
					}, 500); 
			}); 
		}); 

	</script>
	
	<!-- Ķ���� ���� -->
	<script type="text/javascript">
	
		document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
		  //var draggebleEl = document.getElementById('draggable');
		  //var containerEl = document.getElementById('external-events');
		  //var checkbox = document.getElementById('drop-remove');
		  
		  var Calendar = FullCalendar.Calendar;
		  //var Draggable = FullCalendarInteraction.Draggable;
		  
		  var calendar = new FullCalendar.Calendar(calendarEl, {
		    plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
		    defaultView: 'dayGridMonth',
		    defaultDate: new Date(),
		    header: {
		      left: 'prev, today',
		      center: 'title',
		      right: 'next'
		    },
		    height: 420,	// Ķ���� ũ��... ���� ����!
		    editable: false,
		    droppable: false, // this allows things to be dropped onto the calendar
		    locale: 'ko',
		    events:[
		    	{
		    		title: '������ ����',
		    		start: '2020-02-10'
		    	}
		    ]
		  });
		  
		  calendar.render();
		}); 
	
	</script>
	

</head>
<body>
	<!-- ToolBar ���� -->
	<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
	
	<div hidden="hidden"></div>
	<div class="navbar fixed-top py-4 bg-light text-center"> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~````~ ������ Top ToolBar �־�� �� �ڸ� ~~~~~~~~~~~~~~~~~~1~~~~~~~~~~ </div>
	<!-- ToolBar �� -->
	
	
	<!-- ȭ�鱸�� div Start ///////////////////////////// -->
	<div class="container">
		
		<!-- �ٴ� ���̾ƿ� Start ///////////////////////////// -->
		<div class="row">
		
		
			<!-- ���� Plan ���� ���� Start /////////////////////////////////////////////////////////// -->
			<nav class="col-md-2 d-none d-md-block bg-light sidebar" style="padding-left:7px;">
		      <div class="sidebar-sticky">
		      
		        <ul class="nav flex-column">
		          <li class="nav-item">
		            <a class="nav-link active" href="/plan/getPlanList">
		              <span data-feather="home"></span>
		              	�÷� ����Ʈ�� <span class="sr-only">(current)</span>
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoTodoList">
		              <span data-feather="check-square"></span>Todo ����Ʈ
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoCityRouteList">
		              <span data-feather="map"></span>�����Ʈ
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoBudgetOverviewList">
		              <span data-feather="dollar-sign"></span>����
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoDailyList">
		              <span data-feather="calendar"></span>����ǥ
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoStuffList">
		              <span data-feather="briefcase"></span>�غ�
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoMemoList">
		              <span data-feather="edit-3"></span>�޸�
		            </a>
		          </li>
		        </ul>
		        <!-- navigation-list  -->
				<!-- <div class="list-group navigation-list" style="display:scroll; position:fixed; top:40px; left:20px; margin: 15px; width: 165px;">
				  <a href="/index.jsp" class="list-group-item list-group-item-action">��������</a>
				  <a href="#gotoTodoList" class="list-group-item list-group-item-action scroll">Todo ����Ʈ</a>
				  <a href="#gotoCityRouteList" class="list-group-item list-group-item-action scroll">�����Ʈ</a>
				  <a href="#gotoBudgetOverviewList" class="list-group-item list-group-item-action  scroll">����</a>
				  <a href="#gotoDailyList" class="list-group-item list-group-item-action  scroll">����ǥ</a>
				  <a href="#gotoStuffList" class="list-group-item list-group-item-action  scroll">�غ�</a>
				  <a href="#gotoMemoList" class="list-group-item list-group-item-action  scroll">�޸�</a>
				</div> -->
		
		
		        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
		          <span>Plan Members</span>
		          <!-- <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new member"> -->
		            <span data-feather="plus-circle" onclick="inviteUser()"></span>
		          <!-- </a> -->
		        </h6>
		        
		        <ul class="nav flex-column mb-2" style="margin: 15px;">
		          <c:forEach var="member" items="${plan.planPartyList}">
		          	<li class="nav-item media party-member" style="margin-bottom: 10px;">
		          		<img src="https://pds.joins.com/news/component/htmlphoto_mmdata/201903/01/faf54c9e-e268-440d-995c-eea6834d559a.jpg" class="rounded-circle align-self-center mr-2 party-member-img ${member.role}" alt="...">
						    <div class="media-body" style="font-size:12px;">
							    <h6 class="mt-0 mb-1">${member.userId}</h6>
							      ${member.nickname}
						    </div>
						    <c:if test="${ user.userId == plan.planMaster.userId && member.role=='M' }">
						    	<span data-feather="user-minus" onclick="deletePlanPartyAlert('${member.userId}','${member.nickname}')"></span>
						    </c:if>
					</li>
					</c:forEach>
		        </ul>
		        
		        <!-- plan-party-list  -->
				<!--  <div class="plan-party-list-box">
					<div style="font-weight: bolder;">members</div>
			
					<ul class="list-unstyled plan-party-list">
						<c:forEach var="member" items="${plan.planPartyList}">
							<li class="media party-member" style="margin-top: 10px;">
								<img src="https://pds.joins.com/news/component/htmlphoto_mmdata/201903/01/faf54c9e-e268-440d-995c-eea6834d559a.jpg" class="rounded-circle align-self-center mr-2 party-member-img ${member.role}" alt="...">
							    
							    <div class="media-body" style="font-size:12px;">
							      <h6 class="mt-0 mb-1">${member.userId}</h6>
							      ${member.nickname}
							    </div>
							</li>
						</c:forEach>
						
						<li class="media add-party-member" style="margin-top: 15px;">
							<i class="fas fa-user-plus" style="font-size: 22px; margin-left: 5px;" onclick="inviteUser()"></i>
						</li>
					</ul>
				</div> --> 
		        
		        <!-- Top ��ư -->
		        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
		        	<span></span>
		        	<span>
		        		<a href="#gotop" title="top" class="scroll"> top <span data-feather="arrow-up"></span></a>
		        	</span>
		        </h6>
		        
		      </div>
		    </nav>
			<!-- ���� Plan ���� ���� End //////////////////////////////////////////////////// -->
			
			
			
			<!-- top��ư �̵��� ���� div.... ����... -->
			<div id="gotop"></div>	
			
			<!-- Main ȭ�� ���� Start ///////////////////////////////////////////////////////////////////////////////////////// -->
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 container">
				
				<br/>
				
				<!--	 Plan Information START	//////////////////////// 	-->
				
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<div class="container">
						<h5>Plan Information</h5>
						<div class="row" style="background-color: #E7F4F4; width: 100%; padding: 15px; border-radius: 5px; ">
						
							<img src="/resources/images/planImg/${plan.planImg}" class="align-self-center mr-2" alt="https://travel-echo.com/wp-content/uploads/2019/11/polynesia-3021072_640-400x250.jpg" style="border-width: 1px; border-color: #D1D1D1; border-style: solid; width: 130px; height: 100px;">
						    <div class="media-body" style="margin-left: 13px; margin-top: 30px;">
						      <div style="margin: 3px 0;"><div style="font-weight: bolder; font-size: 21px; display: inline-block;">${plan.planTitle} </div> &emsp;
						      			<c:if test="${plan.planPartySize > 1}"><span data-feather="users"></span></c:if>
						                <c:if test="${plan.planPartySize == 1}"><span data-feather="user"></span></c:if>
						                 ${plan.planPartySize}
						      </div>
						      ${plan.startDateString} ~ ${plan.endDate} ( ${plan.planTotalDays}�� ) &nbsp;&nbsp;&nbsp;&nbsp; 
						      <c:if test="${plan.planDday == 0}"> D-Day </c:if>
						      <c:if test="${plan.planDday > 0}"> D - ${plan.planDday} </c:if>
						    </div>
							
							<div>
							<button type="button" class="btn btn-primary" id="updatePlanButton" style="margin-left: 10px;">�÷��� ����</button> 
							<c:if test="${ user.userId == plan.planMaster.userId }">
								<button type="button" class="btn btn-danger" id="deletePlanButton" style="margin-left: 10px;">�÷��� ����</button> 
							</c:if>
							<c:if test="${ user.userId != plan.planMaster.userId }">
								<button type="button" class="btn btn-secondary" id="exitPlanButton" style="margin-left: 10px;">�÷��� Ż��</button> 
							</c:if>
							<button type="button" class="btn btn-info" id="planCompleteButton" style="margin-left: 10px;">����Ϸ� Ȯ��</button>
							</div>
						</div>
					</div>
				</div>
				<!--	 Plan Information START	//////////////////////// 	-->
				<br/>
				
				
				<!--	 Plan Information START	//////////////////////// 	-->
				<%-- <div class="album py-5 bg-light">
					<div class="container">
						<h5>Plan Information</h5>
						<div class="row" style="background-color: #FFE86A; width: 100%; padding: 20px; border-radius: 5px; ">
						
							<img src="https://omakare.com/wp-content/uploads/2018/11/Travel.jpg" class="align-self-center mr-2" alt="https://travel-echo.com/wp-content/uploads/2019/11/polynesia-3021072_640-400x250.jpg" style="margin: 5px; border-width: 1px; border-color: gray; border-style: solid; width: 100px; height: 100px;">
						    <div class="media-body" style="margin-left: 25px; margin-top: 30px;">
						      <div><div style="font-weight: bolder; font-size: 20px; display: inline-block;">${plan.planTitle} </div> ${plan.planPartySize} ��</div>
						      ${plan.startDateString} ~ ${plan.endDate} ( ${plan.planTotalDays}�� ) &nbsp;&nbsp;&nbsp;&nbsp; 
						      <c:if test="${plan.planDday == 0}"> D-Day </c:if>
						      <c:if test="${plan.planDday > 0}"> D - ${plan.planDday} </c:if>
						    </div>
							
							<div>
							<button type="button" class="btn btn-primary" id="updatePlanButton" style="margin-left: 10px;">�÷��� ����</button> 
							<c:if test="${ user.userId == plan.planMaster.userId }">
								<button type="button" class="btn btn-primary" style="margin-left: 10px;">�÷��� ����</button> 
							</c:if>
							<button type="button" class="btn btn-primary" id="planCompleteButton" style="margin-left: 10px;">����Ϸ� Ȯ��</button>
							</div>
						</div>
					</div>
				</div>
				<!--	 Plan Information START	//////////////////////// 	-->
				<br/> --%>
				
				
				
				
				<!--	 Todo List : ���� ����Ʈ START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoTodoList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoTodoList">
				
					<div class="container">
						<h5>Todo List : ���� ����Ʈ</h5>
						<div class="row">
							
							
						</div>
					</div>
				</div>
				<!--	 Todo List : ���� ����Ʈ END	//////////////////////// 	-->
				<br/>
				
				
				<!--	 CityRoute List : �����Ʈ START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light" id="gotoCityRouteList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoCityRouteList">
					<div class="container">
						<h5>CityRoute List : �����Ʈ</h5>
						<div class="row">
						
							<div id="map" style="border:1px solid #e5e5e5;margin-bottom:0px;height:445px;float:left;width:50%;"></div>
							<div id='calendar-container' style="float:right;width:45%; margin: 5px 10px;max-width: 900px;">
							  <div id='calendar'></div>
							</div>
						</div>
					</div>
				</div>
				<!--	 CityRoute List : �����Ʈ END	//////////////////////// 	-->
				<br/>
				
				
				
				<!--	 BudgetOverview List : ���� ���� ����Ʈ START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoBudgetOverviewList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"  id="gotoBudgetOverviewList">
					<div class="container">
						<h5>BudgetOverview List : ���� ����Ʈ</h5>
						<div class="row">
							
							<!-- �̰� �ƴ϶� ����ǥó�� ������ �ε� �� ����Ʈ �����ͼ� �����ִ°� �����Ű��� -->
							<c:forEach var="budget" items="${plan.budgetOverviewList}">
								<div>
									<c:choose>
										<c:when test="${budget.dailyCate == 'D'}">����</c:when>
										<c:when test="${budget.dailyCate == 'T'}">����</c:when>
										<c:when test="${budget.dailyCate == 'V'}">����</c:when>
										<c:when test="${budget.dailyCate == 'R'}">����</c:when>
										<c:when test="${budget.dailyCate == 'F'}">�Ļ�</c:when>
										<c:when test="${budget.dailyCate == 'S'}">����</c:when>
										<c:when test="${budget.dailyCate == 'E'}">��Ÿ</c:when>
									</c:choose>
									- ${budget.budgetAmount} ��
								</div>
							</c:forEach>
							
							
							
							<div style="border:dashed thin #A7A7A7 ; border-radius:8px; padding:25px; background-color: white; width: 50%; ">
								<!-- �����ΰ� ��ũ��Ʈ���� �������� �����ϱ� -->
								<div class="budgetOverview" style="padding: 30px;">
									<div style="float:left;width:50%;">
										<div style="margin: 3px 0;"> <i class="fas fa-walking" style="font-size: 20px;"></i>���� : <span id="budget_D">0 ��</span></div>
										<div style="margin: 3px 0;"> <i class="fas fa-bus" style="font-size: 20px;"></i>���� : <span id="budget_T">0 ��</span></div>
										<div style="margin: 3px 0;"> <i class="fas fa-ticket-alt" style="font-size: 20px;"></i>���� : <span id="budget_V">0 ��</span></div>
										<div style="margin: 3px 0;"> <i class="fas fa-ellipsis-h" style="font-size: 20px;"></i>��Ÿ : <span id="budget_E">0 ��</span></div>
									</div>
									<div style="float:right;width:50%;">
										<div style="margin: 3px 0;"> <i class="fas fa-bed" style="font-size: 20px;"></i>���� : <span id="budget_R">0 ��</span></div>
										<div style="margin: 3px 0;"> <i class="fas fa-utensils" style="font-size: 20px;"></i>�Ļ� : <span id="budget_F">0 ��</span></div>
										<div style="margin: 3px 0;"> <i class="fas fa-shopping-cart" style="font-size: 20px;"></i>���� : <span id="budget_S">0 ��</span></div>
									</div>
									
									
								</div>
							</div>
							
						</div>
					</div>
				</div>
				<!--	 BudgetOverview List : ���� ���� ����Ʈ END	//////////////////////// 	-->
				<br/>
				
				

				<!--	 Daily List : ����ǥ START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light" id="gotoDailyList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoDailyList">
					<div class="container">
						<h5>����ǥ</h5>
						<div class="row">
							
							<div class="swiper-container">
							    <div class="swiper-wrapper">
							    
							    	<c:if test="${plan.dayList.size() != 0}">
							    		<c:forEach var="day" items="${plan.dayList}">
							    			<div class="swiper-slide" style="width: 40px;">
							    			<div>
							    				<div class="dayInfo" style="padding-top:10px;padding-left:10px;text-align:left;padding-left:8px;font-size:14pt;color:#696969;">
													${day.dateString}  <br/>
													<span style="font-size:11pt;color:#c0c0c0"> ${day.cityNames} &nbsp;&nbsp; ( ${day.dayNo} ���� )</span>
												</div>
												
												<div style="margin-top: 10px;">
													<c:forEach var="i" begin="9" end="20">
														
														<div class="dailys" style="border-top:1px solid #efefef; height:30px;font-size:8pt;color:#c0c0c0;padding-left:10px; padding: 5px;" onclick="openDailyEdit( '${day.cityNames}', '${day.dateString}' ,${day.dayNo},${i},${plan.planId});">
															${i} <div style=" margin-left:10px; background-color: white; font-size:10pt; display:inline-block;" id="daily_${day.dayNo}_${i}"></div></div>
													</c:forEach>
												</div>
											</div>
							    			</div>
							    		</c:forEach>
							    	</c:if>
							    	
							    </div>
							    
							    <div class="swiper-button-prev" ></div>
							    <div class="swiper-button-next"></div>
								<!-- <div class="swiper-pagination"> -->
							    <!-- <div class="swiper-scrollbar"></div> -->
							</div>
						</div>
					</div>
				</div>
				<!--	 Daily List : ����ǥ END	//////////////////////// 	-->
				<br/>
				
				
				<!--	 Stuff List : �غ� üũ����Ʈ START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoStuffList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoStuffList">
					<div class="container">
						<h5>�غ� üũ����Ʈ</h5> <div class="text-right" style="font-weight: bolder; font-size: 25px;" id="stuffMode">Edit Mode</div>
						<div class="row">
							
							<div style="border:dashed thin #A7A7A7 ; border-radius:8px; padding:25px; background-color: white; width: 100%; ">
								<span id="stuff_icon"><i class="fas fa-tasks" style="font-size: 25px; margin-right: 6px; margin-bottom: 15px;"></i></span> <span style="margin-left:10px; font-size:large; font-weight:bolder;"> �غ� ����Ʈ</span> <span id="stuffCount" style="margin-left: 15px;"></span> <br/>
								
								<div class="stuffItems">
								<!-- �� div ���� �� getStuffList() �ٷ� ȣ���ؼ� �����ϱ� -->
									<%-- <c:forEach var="stuff" items="${plan.stuffList}">
										<div class="stuffItem" style="margin: 7px;">
											<c:if test="${stuff.stuffCheck=='T'}">
												<input type="checkbox" name="stuff_${stuff.stuffId}" checked value="T" onchange="checkStuff('${stuff.stuffId}')"><span style="margin-left: 10px;"> ${stuff.stuffName}</span>
											</c:if>
											<c:if test="${stuff.stuffCheck=='F'}">
												<input type="checkbox" name="stuff_${stuff.stuffId}" value="F" onchange="checkStuff('${stuff.stuffId}')"><span style="margin-left: 10px;"> ${stuff.stuffName}</span>
											</c:if>
										</div>
									</c:forEach>
									
									<c:if test="${plan.stuffList.size() == 0}">
										<div class="addStuff">
											<i class="fas fa-pencil-alt" style="margin: 7px;"></i><input type="text" class="form-control" name="stuffName" style="margin-left:5px; margin-top:5px; width: 200px; display:inline-block;" placeholder="���ο� �׸� �Է�">
											<button style="margin-bottom: 5px; margin-left: 5px;" type="button" class="btn btn-primary" onclick="addStuff()">�߰�</button> 
										</div>
									</c:if> --%>
								</div> 
								
							</div>
							
						</div>
					</div>
				</div>
				<!--	 Stuff List : �غ� üũ����Ʈ END	//////////////////////// 	-->
				<br/>
				
				
				<!--	 Memo List : �޸� START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoMemoList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoMemoList">
					<div class="container">
						<h5>�޸�</h5>
						<div class="row">
							
							<br/><br/>
							<c:if test="${plan.memoList.size()!=0}">
								<c:forEach var="memo" items="${plan.memoList}">
								
									<div style="font-size:small;  background-color:#FFF38B;padding: 18px;margin: 10px;height: 250px;width: 250px;border: medium;border-color: navy;box-shadow:3px 2px 4px #898989;">
										�޸� ������� : &nbsp; ${memo.memoRegDate}<br/>
										����� : &nbsp; ${memo.regUserNickname}<br/><br/>
										${memo.memoDetail}<br/>
									</div>
								
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
				<!--	 Memo List : �޸� END	//////////////////////// 	-->
				<br/>
				
				<!-- Footer Start /////////////////////////// -->
				<div class="album py-5 bg-white text-center" style="font-weight: bolder;"> ~~~ ����� Footer�� �־�� �� �ڸ� ~~~ </div>
				<!-- Footer End	/////////////////////////// -->
			
			
			
				<!-- //////////////////////////////////////// ��޸�� ����  //////////////////////////////////////// -->
				<!-- /////////////////////	Modal : editPlan 	///////////////////// -->
				<div class="modal" id="editPlan">
				  <div class="modal-dialog" >
				  	<h4 style="color: #FFFFFF; margin-top: 100px;"> �÷��� ����</h4>
				  
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <div class="modal-title">
				        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>�÷��ʸ� �����մϴ�</h6>
				        </div>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('editPlan')">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body">
				        
				        <form class="form-horizontal editPlan" style="margin: 10px;">
				        	<br/>
							<div class="form-group row">
							    <label for="planTitle" style="text-align: right;" class="col-sm-4 col-form-label ">�÷��� ����</label>
							    <div class="col-sm-7">
							      <input type="text" class="form-control" id="planTitle" name="planTitle" placeholder="�÷��� ����" value="${plan.planTitle}">
							    </div>
							</div>
				        	
				        	<div class="form-group row">
								<label for="planType" style="text-align: right;" class="col-sm-4 col-form-label ">���� Ÿ��</label>
							    <div class="col-sm-7">
								    <select class="form-control" id="planType" name="planType"  value="${plan.planType}">
										<option value="A">����ȥ��</option>
										<option value="B">����ȥ��</option>
										<option value="C">���ڳ���</option>
										<option value="D">���ڳ���</option>
										<option value="E">��ü</option>
										<option value="F">�θ�԰�</option>
										<option value="G">Ŀ��</option>
									</select>
								</div>
							</div>
							
							<div class="form-group row">
							    <label for="planImgFile" style="text-align: right;" class="col-sm-4 col-form-label ">�÷��� �̹���</label>
							    <div class="col-sm-7 custom-file">
							    	<div class="input-group mb-2">
							    		<input type="file" class="form-control custom-file-input" id="planImgFile" name="planImgFile" placeholder="�÷��� �̹���" accept="image/*">
							      		<label class="custom-file-label" for="customFile"><i class="fas fa-camera-retro"> size 360x360</i></label>  
							    		
							    	</div>
							    </div>
							</div>
							
							<%-- <div class="form-group">
							    <label for="planImg" class="col-sm-offset-3 col-sm-5 control-label">�÷��� �̹���</label>
							    <div class="col-sm-5">
							      <input type="text" class="form-control" id="planImg" name="planImg" placeholder="�÷��� �̹���" value="${plan.planImg}">
							    </div>
							</div> --%>
							
							<div class="form-group row">
							    <label for="startDateString" style="text-align: right;" class="col-sm-4 col-form-label ">���� ������</label>
							    
							    <div class="col-sm-7">
								    <div class="input-group mb-2">
								      <input type="text" class="form-control" id="startDateString" name="startDateString" placeholder="���� ������" readonly="readonly"  value="${plan.startDateString.substring(0,10)}">
								      <div class="input-group-append">
								      	<div class="input-group-text"><span data-feather="calendar"></span></div>
								      </div>
								    </div>
							    </div>
							</div>
						
							<%-- <div class="form-group">
							    <label for="startDateString" class="col-sm-offset-3 col-sm-5 control-label">���� ������</label>
							    <div class="col-sm-5">
							      <input type="text" class="form-control" id="startDateString" name="startDateString" placeholder="���� ������" value="${plan.startDateString}">
							    </div>
							</div> --%>
							
							<!-- ����Ϸ� Ȯ�� �������� ���� ���� �� -->
							<input type="hidden" class="form-control" id="planStatus" name="planStatus" value="${plan.planStatus}">
							<input type="hidden" class="form-control" id="planId2" name="planId" value="${plan.planId}">
				        	
				        	<div class="alert alert-danger alert-dismissable" style="display: none;" >
							    <button type="button" class="close" >��</button>
							    <strong></strong><br/>���� �� �ٽ� �õ����ּ���.
							</div>
				        </form>
				        
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('editPlan')">Close</button>
				        <button type="button" class="btn btn-primary" id="updatePlan">����</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Modal : editPlan ��	///////////////////// -->
				
				<!-- /////////////////////	Modal : dailyEdit 	///////////////////// -->
				<div class="modal" id="dailyEdit" >
				  <div class="modal-dialog">
				  <h4 style="color: #FFFFFF; margin-top: 100px;">���� ���</h4>
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <div class="modal-title">
				        	<h4 class="daily-info city-names">cityNames</h4>
				        	<h5 class="daily-info city-date">cityDate</h5>
				        </div>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('dailyEdit')">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body">
				        
				        <form class="form-inline dailyEdit" style="margin: 10px;">
				        	<input type="hidden" class="form-control" id="dayNo" name="dayNo" value="">
				        	<input type="hidden" class="form-control" id="planId1" name="planId" value="${plan.planId}">
				        	<input type="hidden" class="form-control" id="dailyId" name="dailyId" value="">
				        	
							<div class="form-group" >
							    <label for="dayTime" style="font-weight: bold;">�ð� &nbsp;</label>
						    	<select class="form-control" id="dayTime" name="dayTime" disabled="disabled">
									<c:forEach var="j" begin="9" end="20">
										<option value="${j}">${j}</option>
									</c:forEach>
								</select>
								 &nbsp; &nbsp;
								<label for="dailyCate" style="font-weight: bold;" >ī�װ��� &nbsp;</label>
						    	<select class="form-control" id="dailyCate" name="dailyCate" >
									<option value="D">����</option>
									<option value="T">����</option>
									<option value="V">����</option>
									<!-- <option value="R">����</option> -->
									<option value="F">�Ļ�</option>
									<option value="S">����</option>
									<option value="E">��Ÿ</option>
								</select>
							</div>
							
							<div class="form-group" style="margin-top: 15px; margin-bottom: 20px; width: 440px;">
							    <label for="dailyDetail" class="control-label" style="font-weight: bold; margin-bottom: 5px;" >���� ����</label><br/>
							    <input type="text" class="form-control" id="dailyDetail" name="dailyDetail" placeholder="���� ������ �ۼ����ּ���" style="width:100%; height: 100px;">
							</div>
							
							<div class="form-group" >
								<label for="budgetAmount" style="font-weight: bold;" >���� &nbsp;</label>
						    	<input type="text" class="form-control" id="budgetAmount" name="budgetAmount" placeholder="0" style="width: 100px;"> 
								&nbsp; 
							    <label for="budgetCurrency" style="font-weight: bold;"> &nbsp;</label>
						    	<select class="form-control" id="budgetCurrency" name="budgetCurrency" >
									<option value="K">KRW</option>
									<option value="E">EUR</option>
									<option value="G">GBP</option>
								</select>
							</div>
					
				        </form>
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('dailyEdit')">Close</button>
				        <button type="button" class="btn btn-danger" id="deleteDaily">Delete Daily</button>
				        <button type="button" class="btn btn-primary" id="submitDaily">Edit Daily</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Modal : dailyEdit ��	///////////////////// -->
				
				
				<!-- /////////////////////	Modal : inviteUser	///////////////////// -->	
				<div class="modal" id="inviteUser">
				  <div class="modal-dialog modal-lg" >
				  	<h4 style="color: #FFFFFF; margin-top: 100px;"> �÷��ʿ� ģ�� �ʴ��ϱ�</h4>
				  
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <div class="modal-title">
				        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>ģ���� �ʴ��� �÷��ʸ� �Բ� �ۼ��ϰ� ������ ����������</h6>
				        </div>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('inviteUser')">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body">
				        
				        <form class="inviteUser" style="margin: 10px;">
				        	<!-- <input type="hidden" class="form-control" id="planId" name="planId" value="${plan.planId}">  -->
					        <div class="input-group flex-nowrap" style="margin: 0 auto; width: 40%;">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="addon-wrapping">@</span>
							  </div>
							  <input type="text" class="form-control" name="findUserId" id="findUserId" placeholder="���̵� �Է��ϼ���" aria-label="findUserId" aria-describedby="addon-wrapping">
								 &nbsp; &nbsp;<button type="button" class="btn btn-primary" id="findUser">�˻�</button>
							</div>
				        
				        	<br/>
				        	
							<div class="findUserResult" style="text-align: center;"></div>
							
							<div class="form-group" id="offerMsgForm" style="margin: 30px 10px 10px 10px; width:auto;">
							    <label for="offerMsg" class="control-label" style="font-weight: bold; margin-bottom: 7px;" ><span class="findUserResult"></span> �Կ��� ������ �ʴ� �޽���</label><br/>
							    <input type="text" class="form-control" id="offerMsg" name="offerMsg" placeholder="�ʴ� �޽����� �Է��ϼ���" style="width:100%; height: 100px;">
							</div>
				        </form>
				        
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('inviteUser')">Close</button>
				        <button type="button" class="btn btn-primary" id="addOffer">�ʴ��ϱ�</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Modal : inviteUser ��	///////////////////// -->	
				
				
				<!-- /////////////////////	Alert Modal : �÷��� ���� 	///////////////////// -->	
				<div class="modal" id="deletePlanAlert">
				  <div class="modal-dialog" >
				  	<h4 style="color: #FFFFFF; margin-top: 100px;"> �÷��� ����</h4>
				  
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <!-- <div class="modal-title">
				        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>ģ���� �ʴ��� �÷��ʸ� �Բ� �ۼ��ϰ� ������ ����������</h6>
				        </div> -->
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('deletePlanAlert')">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body text-center">
				        <br/><span style="font-size:20px; color:#00AACC; font-weight:bold;">${plan.planTitle}</span> <br/>
				        <span style="font-size:17px;"> �÷��ʸ� �����Ͻðڽ��ϱ�?</span>
				        <br/><br/>
				      </div>
				      
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('deletePlanAlert')">�ƴϿ�</button>
				        <button type="button" class="btn btn-primary" id="deletePlan">��</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Alert Modal : �÷��� ���� ��	///////////////////// -->
				
				
				<!-- /////////////////////	Alert Modal : ����Ϸ� Ȯ��	///////////////////// -->	
				<div class="modal" id="planCompleteAlert">
				  <div class="modal-dialog modal-lg" >
				  	<h4 style="color: #FFFFFF; margin-top: 100px;"> ����Ϸ� Ȯ��</h4>
				  
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <!-- <div class="modal-title">
				        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>ģ���� �ʴ��� �÷��ʸ� �Բ� �ۼ��ϰ� ������ ����������</h6>
				        </div> -->
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('planCompleteAlert')">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body text-center">
				        ${plan.startDateString} ���� ${plan.endDate} ����
				        <br/>
				        <span style="font-size:20px; color:#00AACC; font-weight:bold;">${plan.planTitle}</span> <span style="font-size:17px;"> ��̰� �ٳ���̳���?</span>
				        <br/><br/><br/>
				        
				        <span style="font-weight:bold;">����Ϸ� Ȯ��</span> �� <br/>
				        	�� �������� ��迡 �÷��� ������ ��ϵ˴ϴ�.
				      </div>
				      
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('planCompleteAlert')">Close</button>
				        <button type="button" class="btn btn-primary" id="planComplete">����Ϸ� Ȯ��</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Alert Modal : ����Ϸ� Ȯ�� ��	///////////////////// -->	
				
				
				<!-- /////////////////////	Alert Modal : �÷��� ��� ����	///////////////////// -->	
				<div class="modal" id="deletePlanPartyAlert">
				  <div class="modal-dialog" >
				  	<h4 style="color: #FFFFFF; margin-top: 100px;"> �÷��� ��� ����</h4>
				  
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <!-- <div class="modal-title">
				        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>ģ���� �ʴ��� �÷��ʸ� �Բ� �ۼ��ϰ� ������ ����������</h6>
				        </div> -->
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('deletePlanPartyAlert')">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body text-center">
				        <br/><span id="planMemberId" style="font-size:17px;font-weight:bold; color:#00AACC; "></span>
				        <span style="font-size:17px;"> ����</span> <br/> <span style="font-size:17px;">�÷��� �����ڿ��� ���ܽ�Ű�ðڽ��ϱ�? </span>
				        <br/><br/>
				        
				        <!-- �÷��� ��� ������ ���� �� -->
				        <form class="form-inline deleteMember">
				        	<input type="hidden" class="form-control" id="planId4" name="refId" value="${plan.planId}">
				        	<input type="hidden" class="form-control" id="partyUserId" name="partyUserId" value="">
				        	<input type="hidden" class="form-control" id="partyRole" name="partyRole" value="">
				        </form>
				        
				      </div>
				      
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('deletePlanPartyAlert')">�ƴϿ�</button>
				        <button type="button" class="btn btn-primary" id="deletePlanParty">��</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Alert Modal : �÷��� ��� ���� ��	///////////////////// -->	


				<!-- /////////////////////	Alert Modal : �÷��� Ż�� 	///////////////////// -->	
				<div class="modal" id="exitPlanAlert">
				  <div class="modal-dialog" >
				  	<h4 style="color: #FFFFFF; margin-top: 100px;"> �÷��� Ż��</h4>
				  
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <!-- <div class="modal-title">
				        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>ģ���� �ʴ��� �÷��ʸ� �Բ� �ۼ��ϰ� ������ ����������</h6>
				        </div> -->
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('exitPlanAlert')">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body text-center">
				        <br/><span style="font-size:20px; color:#00AACC; font-weight:bold;">${plan.planTitle}</span> <br/>
				        <span style="font-size:17px;"> �÷��ʸ� Ż���Ͻðڽ��ϱ�?</span>
				        <br/><br/>
				      </div>
				      
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('exitPlanAlert')">�ƴϿ�</button>
				        <button type="button" class="btn btn-primary" id="exitPlan">��</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Alert Modal : �÷��� Ż�� ��	///////////////////// -->


				<!-- //////////////////////////////////////// ��� ���� ��  //////////////////////////////////////// -->
				
			</main>
			<!-- Main ȭ�� ���� End ///////////////////////////// -->
			
			
		</div>
		<!-- �ٴ� ���̾ƿ� End ///////////////////////////// -->
		
	</div>
	<!-- ȭ�鱸�� div End ///////////////////////////// -->
	
	

	
	<!-- body �ε� �� ����Ǿ�� �ϴ� ��ũ��Ʈ ����  -->
	<script>
	
	 	/* ------------------------------------ Google Map Script ------------------------------------ */
		var map;
		var geocoder;
		var overlay;
		var marker=[];
		var routelines=[];
		
		var uluru = {lat: -25.344, lng: 131.036};
		var paris = {lat: 48.856667, lng: 2.350833};
		var korea = {lat:37.497957 , lng:127.027780};
	
		function initMap(){
			
			geocoder = new google.maps.Geocoder();
		    map = new google.maps.Map(document.getElementById('map'), {
		        center: paris,
		        zoom: 3,
		        /* zoom: 1:World, 5:Landmass/continent, 10:City, 15:Streets, 20:Buildings */
		        mapTypeId :'terrain' 
		    });
		     
		    marker = new google.maps.Marker({
		    	 position: paris, 
		    	 map: map,
		    	 title: 'marker Title!!'
	    	 });
		};
		/* ------------------------------------ Google Map Script ------------------------------------ */
		
		
		/* Plan Information ����Ϸ� ��ư  ���� �Լ� */
		var now = new Date();
		var planEndDate = "${plan.endDate}";
		var newPlanEndDate = new Date(planEndDate);
		console.log("now="+now+" / endDate="+newPlanEndDate);
		var planStatus = '${plan.planStatus}';
		
		if(now > newPlanEndDate && planStatus == 'R'){
			$('#planCompleteButton').show();
		}else{
			$('#planCompleteButton').hide();
		}
		
		
		/* ����ǥ ĭ ���콺���� �̺�Ʈ */
		$( ".dailys" ).hover(
		  function() {
		    $( this ).css("background", "#D4EFFA");
		  }, function() {
		    $( this ).css("background", "none");
		  }
		);
		
		/* icon ����� ���� ��ũ��Ʈ */
		/* https://github.com/feathericons/feather#feather ���� */
		feather.replace();
		
	</script>
	
	<!-- Swiper�� ���� ��ũ��Ʈ -->
	<script>
		new Swiper ('.swiper-container', {
		    //direction: 'vertical',
		    //loop: true
			navigation : {
				nextEl : '.swiper-button-next', // ���� ��ư Ŭ������
				prevEl : '.swiper-button-prev', // �̹� ��ư Ŭ������
			}
		  });
	</script>
	
	
	<!-- Google Map API -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMoE1_1g-id6crD_2M4nCDF4IsmcncLU4&callback=initMap" type="text/javascript"></script>

</body>
</html>