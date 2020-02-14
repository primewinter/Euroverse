<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>getPlan</title>
	
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
	
	
	<!-- jquery Ui 링크 (datePicker)  -->
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
      	width: 40px;
      	background-color: white;
      	margin: 4px;
      	padding: 10px;
      	border-radius: 4px;
      	box-shadow:1px 3px 2px #ACC1CB;
      	border-color: #DDDDDD;
      	border-style: solid;
      	border-width: 1px;
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
      
      /* 글자 */
      .stuffItem{
      	/* display:inline-block; */
		position:relative;
      }
      .stuffName{
      	bottom:0;
      	margin-left: 7px;
		position:absolute;
      }
      
      
      
      /* fullCalendar 스크롤 없애기 */
      .fc-scroller {
		   overflow-y: hidden !important;
		}
      
	</style>
	
	
	<!-- Custom styles for this template -->
	<!-- 왼쪽 사이드바를 위한 CSS... 안돼서 걍 스크립트 통째로 넣어둠 -->
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


	<!-- ICON 사용을 위한 스크립트 임포트 -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>



	<!-- 함수들 모음집 -->
	<script type="text/javascript">
	
		var planId = ${plan.planId};	//현재 조회중인 plan의 아이디 박아두기
		
		/* ---------------------------------		Daily List 관련 함수들		--------------------------------- */
		$(function(){
			$('#submitDaily').on('click', function(){
				submitDaily($(this).text());
			});
			
			$('#deleteDaily').on('click', function(){
				submitDaily($(this).text());
			});
		});
		
		function getDaily(planId, dayNo, dayTime){
			console.log("getDaily() 실행 "+planId+"/"+dayNo+"/"+dayTime);
			
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
					if( JSONData==null || JSONData=="" ){ 	//console.log("리턴데이터 없음");		//리턴데이터가 없을땐 request.status 200으로 날아옴
					}else{ 		//console.log("리턴데이터 있음1! => "+JSONData.dailyCate);	
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
					if( request.status == '200'){ 		//console.log("리턴데이터 없음");	
						$("input[name='dailyId']").val('');
						$('#deleteDaily').hide();
						$('#submitDaily').text('Add Daily');
					}
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
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
			//var planId = $("input[name='planId']").val();		//스크립트 맨 위에서 planId 박아두기 때문에 처리 안해줘도 ㄱㅊ!
			var dailyId = $("input[name='dailyId']").val();
			var dayNo = $("input[name='dayNo']").val();
			var dayTime = $("select[name='dayTime']").val();
			var dailyCate = $("select[name='dailyCate']").val();
			var dailyDetail = $("input[name='dailyDetail']").val();
			
			var budgetAmount = $("input[name='budgetAmount']").val();
			var budgetCurrency = $("select[name='budgetCurrency']").val();
			
			//if(budgetCurrency == null || budgetCurrency ==''){ budgetCurrency = 'K'; }; //예산 미입력시 기본값 설정 :: 0원 / KRW
			if(budgetAmount == null || budgetAmount =='' || budgetAmount=='0'){ budgetAmount = 0; };
			
			if(dailyDetail == null || dailyDetail ==''){
				alert("dailyDetail 을 입력해주세요");
				return false;
			}
			console.log("planId="+planId+", dailyId="+dailyId+", dayNo="+dayNo+", dayTime="+dayTime+", dailyCate="+dailyCate+", dailyDetail="+dailyDetail+", budgetAmount="+budgetAmount+", budgetCurrency="+budgetCurrency);
			
			/* addDaily */
			if(dailyButton == 'Add Daily'){
				console.log("Add Daily 버튼 클릭! ");
				
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
								console.log("리턴데이터 없음");	
							}else{
								console.log("리턴데이터 있음! => "+JSONData);	
								
								var dailyList = JSONData;
								for( var i in dailyList){
									setDaily(dailyList[i]);
								}
							}
							closeModal('dailyEdit');
						},
						error:function(request,status,error){
					        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					    } 
					});
				}
				
			/* updateDaily */
			}else if(dailyButton == 'Update Daily'){
				console.log("Update Daily 버튼 클릭! ");
				
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
								console.log("리턴데이터 없음");	
							}else{
								console.log("리턴데이터 있음! => "+JSONData);	
								
								var dailyList = JSONData;
								for( var i in dailyList){
									setDaily(dailyList[i]);
								}
							}
							closeModal('dailyEdit');
						},
						error:function(request,status,error){
					        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					    } 
					});
				} 
				
			/* deleteDaily */
			}else if(dailyButton == 'Delete Daily'){
				console.log("Delete Daily 버튼 클릭! ");
				
				if(dailyId != null && dailyId !='' ){
					$.ajax({
						url: "/planSub/json/deleteDaily/"+dailyId,
						method: "GET",
						dataType: "json",
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){
							/* if( JSONData==null || JSONData=="" ){ alert("리턴데이터 없음");	 }
							closeModal('dailyEdit'); */
						},
						error:function(request,status,error){
							if( request.status == '200'){ 		//alert("리턴데이터 없음");	 but 성공 (원래 void임)
								
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
					if( JSONData==null || JSONData=="" ){		//alert("리턴데이터 없음");	
					}else{		//alert("리턴데이터 있음! => JSONData = "+JSON.stringify(JSONData));	
						var dailyList = JSONData;
						for( var i in dailyList){
							setDaily(dailyList[i]);
						}
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    } 
			});
		} //getDailyList
		
		function setDaily( daily ){
			var dailyIdString = '#daily_'+daily.dayNo+"_"+daily.dayTime;
			
			var bcolor;		//관광(D), 교통(T), 투어(V), 숙소(R), 식사(F), 쇼핑(S), 기타(E)
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
		
		getDailyList(planId);	//페이지 로드 후 ajax로 일정 리스트 가져와서 만들어진 일정표에 심어주기
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		
		/* ---------------------------------		Stuff List 관련 함수들		--------------------------------- */
		$(function(){
			
			$('#stuffMode').on('click', function(){
				changeStuffMode($(this).text());
			});

		});
		
		function changeStuffMode(mode){
			console.log("changeStuffMode() 실행 :: moed="+mode);
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
			console.log("checkStuff(stuffId) 실행 => checked="+checked+", stuffId="+stuffId);
			
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
					if( JSONData==null || JSONData=="" ){ console.log("리턴데이터 없음");	 }
				},
				error:function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    } 
			});
		} //checkStuff(stuffId) END
		
		
		
		function getStuffList(planId, mode){
			console.log("getStuffList("+planId+", "+mode+") 실행 ");
			
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
					var addStuffHtml = '<div class="addStuff"><i class="fas fa-pencil-alt" style="margin: 7px;"></i><input type="text" class="form-control" name="stuffName" style="margin-left:5px; margin-top:5px; width: 200px; display:inline-block;" placeholder="새로운 항목 입력"> <button style="margin-bottom: 5px; margin-left: 5px;" type="button" class="btn btn-primary" onclick="addStuff()">추가</button> </div>';
					
					if( JSONData==null || JSONData=="" ){ 	
						console.log("리턴데이터 없음");	
						stuffItemsHtml += addStuffHtml;
						
					}else{ 		//alert("리턴데이터 있음1! => JSONData = "+JSON.stringify(JSONData));	

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
							for( var i in JSONData){ 	// html 이벤트걸어서 기존꺼 바꾸는 경우는 $(~).on("click") 이벤트가 적용되지 않음.... 그래서 태그 안에 onClick="실행함수" 를 넣어줘야 함수호출이 가능해짐
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
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    } 
			});
		} //getStuffList(planId, mode) END
		
		function deleteStuff(stuffId){
			alert("삭제된 준비물은 복구 불가능합니다")
			console.log('deleteStuff('+stuffId+') 실행! ');
			
			$.ajax({
				url: "/planSub/json/deleteStuff/"+stuffId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ 	//alert("리턴데이터 없음");	
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			        getStuffList(planId,'Edit Mode');			    
				} 
			});
		} //deleteStuff(stuffId) END
		
		function addStuff(){
			var stuffName = $("input[name='stuffName']").val();
			console.log('addStuff() 실행 : stuffName='+stuffName);
			
			if(stuffName == null || stuffName ==''){
				alert("stuffName 을 입력해주세요");
				return false;
			}
			
			$.ajax({		// GET방식으로 addStuff 했더니 한글이 깨져 들어가서 POST로 바꿈
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
						console.log("리턴데이터 없음");	
					}else{
						console.log("리턴데이터 있음! +> JSONData = "+JSON.stringify(JSONData));	
					}
					getStuffList(planId,'Edit Mode');
				},
				error:function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				} 
			});
		} //addStuff() END
		
		getStuffList(planId, 'List Mode');
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------		BudgetOverview 관련 함수들		--------------------------------- */
		
		function getBudgetOverviewList(planId){
			console.log("getBudgetOverviewList("+planId+") 실행 ");
			
			$.ajax({
				url: "/planSub/json/getBudgetOverviewList/"+planId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					//var budgetOverviewHtml = '';
					if( JSONData==null || JSONData=="" ){ 	
						console.log("리턴데이터 없음");	
					}else{ 		
						console.log("리턴데이터 있음1! => JSONData = "+JSON.stringify(JSONData));	

						var budget_total = 0;
						
						for( var i in JSONData ){
							budget_total = budget_total + JSONData[i].budgetAmount;
							switch ( JSONData[i].dailyCate ) {
						        case 'D': $('#budget_D').text(JSONData[i].budgetAmount);	//관광
						          break;
						        case 'T': $('#budget_T').text(JSONData[i].budgetAmount);	//교통
						          break;
						        case 'V': $('#budget_V').text(JSONData[i].budgetAmount);	//투어
						          break;
						        case 'R': $('#budget_R').text(JSONData[i].budgetAmount);	//숙소
						          break;
						        case 'F': $('#budget_F').text(JSONData[i].budgetAmount);	//식사
						          break;
						        case 'S': $('#budget_S').text(JSONData[i].budgetAmount);	//쇼핑
						          break;
						        case 'E': $('#budget_E').text(JSONData[i].budgetAmount);	//기타
						          break;
						        default:
						          var d = 'default';
						    } //switch
						}
					} //if-else
					$('#budget_total').text(budget_total);
					
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    } 
			});
		} //getBudgetOverviewList(planId) END
		
		getBudgetOverviewList(planId);
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------		Todo List 관련 함수들			--------------------------------- */
		
		$(function(){
			
			$('#todoMode').on('click', function(){
				alert("#todoMode 클릭 => changeTodoMode() 실행");
				changeTodoMode($(this).text());
			});

		});
		
		function changeTodoMode(mode){
			alert("changeTodoMode(mode) 실행");
		} //changeTodoMode 끝
		
		function checkTodo(todoId){
			alert("checkTodo(todoId) 실행");
		}	//checkTodo 끝
		
		function getTodoList(planId, mode){
			alert("getTodoList(planId, mode) 실행");
		}	//getTodoList 끝
		
		function deleteTodo(todoId){
			alert("deleteTodo(todoId) 실행");
		}	//deleteTodo 끝
		
		function addTodo(){
			alert("addTodo() 실행");
		}	//addTodo 끝
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------	CityRoute List 관련 함수들		--------------------------------- */
		
		$(function(){
			
		});
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------	PlanPartyMember 관련 함수들		--------------------------------- */
		$(function(){
			$('#findUser').on('click', function(){
				console.log("#findUser(검색) 클릭 => findUser("+$('#findUserId').val()+") 실행");
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
			console.log("inviteUser() 실행");
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
				console.log("deletePlanParty("+condition+") 실행 ==> "+partyUserId+" 강퇴시키기" );
			}else if( condition=='S'){
				partyUserId = '${user.userId}';
				console.log("deletePlanParty("+condition+") 실행 ==> "+partyUserId+" 셀프 탈퇴" );
			}
			
			$('#partyUserId').val(partyUserId);
			$('input[name="partyRole"]').val(condition);		//멤버의 셀프탈퇴:S, 마스터의 강퇴:F
			$('form.deleteMember').attr('method', 'POST').attr('action', '/plan/deletePlanParty').submit();
		}

		
		function findUser(findUserId) {
			console.log("findUser("+findUserId+") 실행");
			if(findUserId == ''){
				alert("검색할 회원의 아이디를 입력해주세요");
				return false;
			}
			
			$.ajax({
				url: "/plan/json/findUser/"+planId+"/"+findUserId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					console.log("리턴데이터 있음! +> JSONData = "+JSON.stringify(JSONData));	
					
					if(JSONData[0] == 'X'){	//초대 불가능
						$('.findUserResult').text(JSONData[1]);
						$('#offerMsgForm').hide();
						$('#addOffer').hide();
					}else if(JSONData[0] == 'A'){	//초대 가능
						$('.findUserResult').text(JSONData[1]);
						$('#offerMsgForm').show();
						$('#addOffer').show();
					}
					$("input[name='findUserId']").val('');
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    } 
			});
		}	//findUser 끝
		
		
		function addOffer() {	
			var toUserId = $($('.findUserResult')[0]).text();
			var offerMsg = $("input[name='offerMsg']").val();
			
			if(offerMsg == ''){
				alert("offerMsg를 입력해주세요");
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
					//String만 와서 여기는 거치지 않음..
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			        closeModal('inviteUser');
			        alert(request.responseText+" 님에게 초대 메시지를 보냈습니다.");
			        
			      	//초대 받는 사람에게 push 하기
					var receiverId = toUserId;
					var pushType = 'I';
					sendPush(receiverId, pushType);		//jsp:include로 포함된 toolBar.jsp에 있는 함수!
			    } 
			});
		}	//addOffer 끝
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------	Plan Information 관련 함수		--------------------------------- */
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
			
			/* 모달 뒤에 데이트피커가 가려지는 현상... 어거지로 해결 */
			$('#startDateString').on('click', function(){
				 $('#ui-datepicker-div').appendTo($('#editPlan'));
				 $(this).datepicker();
				 $(this).datepicker("show");
			});
			
			//지성이꺼 갖다씀 - 파일용량 체크
			$(".custom-file-input").on("change",function(){
				  var fileSize = this.files[0].size;
				    var maxSize = 360 * 360;
				    if(fileSize > maxSize) {
				        $(".custom-file-label").html("<i class='fas fa-camera-retro'> size 360x360</i>");
				        alert("파일용량을 초과하였습니다.");
				        //$("#preview").html("");
				        return;
				    }else{
						//readImg(this);
				    }
			});
			
			$(document).ready(function() {
				  bsCustomFileInput.init();
			});
			
			
			//alert-danger에서 x 클릭시 창 닫기
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
		
		function updatePlan(){		//플래너 수정
			console.log("updatePlan() 실행!");
		
			var submitAlert = $(".alert-danger");
			var alertMessage = $(".alert-danger strong");
			
			var planTitle = $("input[name='planTitle']").val();
			var planImg = $("input[name='planImg']").val();
			var planType = $("input[name='planType']").val();
			var startDateString = $("input[name='startDateString']").val();
			
			//유효성 체크
			if ($.trim(planTitle)=="") {
				submitAlert.prop("style","display : block");
				alertMessage.html("플래너 제목은 필수입니다.");
				return;
			}
			if ($.trim(startDateString)=="") {	//얜 필요없음..
				submitAlert.prop("style","display : block");
				alertMessage.html("여행 시작일을 지정해주세요.");
				return;
			}
			
			$('form.editPlan').attr('method', 'POST').attr("action" , "/plan/updatePlan").attr("enctype","multipart/form-data").submit();
		}
		
		function deletePlan(){		//플래너 삭제
			$('form.editPlan').attr('method', 'POST').attr('action', '/plan/deletePlan').submit();
		}
		
		function planComplete(){	//여행완료 확정
			$("input[name='planStatus']").val('C');
			$('form.editPlan').attr('method', 'POST').attr('action', '/plan/updatePlanStatus').attr("enctype","multipart/form-data").submit();
		}
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		
		
		/* GoogleMap control 버튼 클릭 */
		function controlClick(){
			console.log("controlClick() 실행")
			
			var string = "/plan/editRoute?planId="+planId;
			$(self.location).attr("href", string);
		}

	</script>
	
	<script>
	
		/* 모달창 닫기 */
		function closeModal(modalName) {
			console.log("closeModal : modalName="+modalName);
			if( typeof $("."+modalName)[0] != "undefined" ){
				$("."+modalName)[0].reset();		//form에 모달 이름과 같은 클래스명 주기
			}
			$("#"+modalName).hide();
		}
		
		/* 글자 흔들기 */
		function shakeThat(){
			var rnd  = Math.round(Math.random() * 4);
			$('.stuffItem .stuffName').css({ 'bottom':rnd}); 	//Edit Mode의 준비물 목록 글자 흔들기
		}
		setInterval(shakeThat, 45);
		
		/* 스크롤 부드럽게 */
		jQuery(document).ready(function($) { 
			$(".scroll").click(function(event){ 
				event.preventDefault(); 
				$('html,body').animate({
					scrollTop:$(this.hash).offset().top
					}, 500); 
			}); 
		}); 
		
	</script>
	
	<!-- 캘린더 생성 -->
	<script type="text/javascript">
	
		document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
		  //var draggebleEl = document.getElementById('draggable');
		  //var containerEl = document.getElementById('external-events');
		  //var checkbox = document.getElementById('drop-remove');
		  
		  var Calendar = FullCalendar.Calendar;
		  //var Draggable = FullCalendarInteraction.Draggable;
		  
		  
		  var cityEventList = ${cityEventList};
			//alert("  cityEventList[0] = "+cityEventList[0].title);	
			
		  var defaultDate = new Date();
		  if( cityEventList[0] != null ){
			  defaultDate = cityEventList[0].start;
		  }
		  
		  //var eventString = cityEventList[0]+", "+cityEventList[1];
		  
		  var calendar = new FullCalendar.Calendar(calendarEl, {
		    plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
		    defaultView: 'dayGridMonth',
		    defaultDate: defaultDate,
		    header: {
		      //left: 'prev, today',
		      left: 'prev',
		      center: 'title',
		      right: 'next'
		    },
		    height: 420,	// 캘린더 크기... 높이 지정!
		    editable: false,
		    droppable: false, // this allows things to be dropped onto the calendar
		    //locale: 'ko',
		    buttonIcons: true, // show the prev/next text
		    events:[
		    	/* { title: '존나세 생일', start: '2020-02-10' } */
		    	//eventString
		    ]
		    //,eventRender:function(event, eventElement) {
            //    if(event.imageurl) {
            //        eventElement.find("span.fc-title").prepend("<img src='" + event.imageurl + "'>");
            //    }
            //}

		  });
		  
		  for( var i in cityEventList ){
			  console.log("    "+JSON.stringify(cityEventList[i]) );
				calendar.addEvent( cityEventList[i] );
			}
		  
		  calendar.render();
		  
		}); 
	
	</script>
	

</head>
<body>
	<!-- ToolBar 시작 -->
	<%-- <jsp:include page="/toolbar/toolBar.jsp"></jsp:include> --%>
	
	<!-- <div class="navbar fixed-top py-4 bg-light text-center"> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~````~ 원래는 Top ToolBar 있어야 할 자리 ~~~~~~~~~~~~~~~~~~1~~~~~~~~~~ </div> -->
	<!-- ToolBar 끝 -->
	
	
	<!-- 화면구성 div Start ///////////////////////////// -->
	<div class="container">
		
		<!-- 다단 레이아웃 Start ///////////////////////////// -->
		<div class="row">
		
		
			<!-- 좌측 Plan 툴바 구성 Start /////////////////////////////////////////////////////////// -->
			<nav class="col-md-2 d-none d-md-block bg-light sidebar" style="padding-left:7px;">
		      <div class="sidebar-sticky">
		      
		        <ul class="nav flex-column">
		          <li class="nav-item">
		            <a class="nav-link active" href="/plan/getPlanList">
		              <span data-feather="home"></span>
		              	플랜 리스트로 <span class="sr-only">(current)</span>
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoTodoList">
		              <span data-feather="check-square"></span>Todo 리스트
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoCityRouteList">
		              <span data-feather="map"></span>여행루트
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoBudgetOverviewList">
		              <span data-feather="dollar-sign"></span>예산
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoDailyList">
		              <span data-feather="calendar"></span>일정표
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoStuffList">
		              <span data-feather="briefcase"></span>준비물
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoMemoList">
		              <span data-feather="edit-3"></span>메모
		            </a>
		          </li>
		        </ul>
		        <!-- navigation-list  -->
				<!-- <div class="list-group navigation-list" style="display:scroll; position:fixed; top:40px; left:20px; margin: 15px; width: 165px;">
				  <a href="/index.jsp" class="list-group-item list-group-item-action">메인으로</a>
				  <a href="#gotoTodoList" class="list-group-item list-group-item-action scroll">Todo 리스트</a>
				  <a href="#gotoCityRouteList" class="list-group-item list-group-item-action scroll">여행루트</a>
				  <a href="#gotoBudgetOverviewList" class="list-group-item list-group-item-action  scroll">예산</a>
				  <a href="#gotoDailyList" class="list-group-item list-group-item-action  scroll">일정표</a>
				  <a href="#gotoStuffList" class="list-group-item list-group-item-action  scroll">준비물</a>
				  <a href="#gotoMemoList" class="list-group-item list-group-item-action  scroll">메모</a>
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
		        
		        <!-- Top 버튼 -->
		        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
		        	<span></span>
		        	<span>
		        		<a href="#gotop" title="top" class="scroll"> top <span data-feather="arrow-up"></span></a>
		        	</span>
		        </h6>
		        
		      </div>
		    </nav>
			<!-- 좌측 Plan 툴바 구성 End //////////////////////////////////////////////////// -->
			
			
			
			<!-- top버튼 이동을 위한 div.... 구림... -->
			<div id="gotop"></div>	
			
			<!-- Main 화면 구성 Start ///////////////////////////////////////////////////////////////////////////////////////// -->
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 container">
				
				<!--	 Plan Information START	//////////////////////// 	-->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
					<div class="container">
						<!-- <h5>Plan Information</h5> -->
						<div class="row" style="background-color: #F3F7F6; width: 100%; padding: 15px; border-radius: 5px; ">
							<div class="media">
							
								<img src="/resources/images/planImg/${plan.planImg}" class="align-self-center mr-2" alt="https://travel-echo.com/wp-content/uploads/2019/11/polynesia-3021072_640-400x250.jpg" style="border-width: 1px; border-color: #D1D1D1; border-style: solid; width: 130px; height: 100px;">
							    <div class="media-body" style="margin-left: 13px; margin-top: 25px; height: 100px;">
							    	<span style="color: #EE0D0D; font-weight: bolder;"><c:if test="${plan.planStatus == 'C'}">여행완료!</c:if></span>
							    	<div class="plan_type">
										<c:choose>
											<c:when test="${plan.planType == 'A'}">여자혼자</c:when>
											<c:when test="${plan.planType == 'B'}">남자혼자</c:when>
											<c:when test="${plan.planType == 'C'}">여자끼리</c:when>
											<c:when test="${plan.planType == 'D'}">남자끼리</c:when>
											<c:when test="${plan.planType == 'E'}">단체</c:when>
											<c:when test="${plan.planType == 'F'}">부모님과</c:when>
											<c:when test="${plan.planType == 'G'}">커플</c:when>
										</c:choose>
									</div>
								      <div style="margin: 3px 0;"><div style="font-weight: bolder; font-size: 21px; display: inline-block;">${plan.planTitle} </div> &emsp;
								      			<c:if test="${plan.planPartySize > 1}"><span data-feather="users"></span></c:if>
								                <c:if test="${plan.planPartySize == 1}"><span data-feather="user"></span></c:if>
								                 ${plan.planPartySize}
								      </div>
								      ${plan.startDateString} <c:if test="${plan.endDate != null}"> ~ ${plan.endDate}</c:if> ( ${plan.planTotalDays}일 ) &nbsp;&nbsp;&nbsp;&nbsp; 
								      <c:if test="${plan.planDday == 0}"> D-Day </c:if>
								      <c:if test="${plan.planDday > 0}"> D - ${plan.planDday} </c:if>
							    
							    </div> <!-- media body -->
								
								<div>
									<c:if test="${plan.planStatus != 'C' }">
										<button type="button" class="btn btn-info" id="planCompleteButton" style="margin-left: 10px;">여행완료 확정</button>
										<button type="button" class="btn btn-primary" id="updatePlanButton" style="margin-left: 10px;">플래너 수정</button> 
									</c:if>
									
									<c:if test="${ user.userId == plan.planMaster.userId }">
										<button type="button" class="btn btn-danger" id="deletePlanButton" style="margin-left: 10px;">플래너 삭제</button> 
									</c:if>
									<c:if test="${ user.userId != plan.planMaster.userId }">
										<button type="button" class="btn btn-secondary" id="exitPlanButton" style="margin-left: 10px;">플래너 탈퇴</button> 
									</c:if>
								</div>
								
							</div>
						</div>
					</div>
				</div>
				<!--	 Plan Information START	//////////////////////// 	-->
				
				<br/>
				
				<!--	 Todo List : 투두 리스트 START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoTodoList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoTodoList">
				
					<div class="container">
						<h5>Todo List</h5>
						<div class="row">
							
							
						</div>
					</div>
				</div>
				<!--	 Todo List : 투두 리스트 END	//////////////////////// 	-->
				<br/>
				
				
				<!--	 CityRoute List : 여행루트 START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light" id="gotoCityRouteList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoCityRouteList">
					<div class="container">
						<h5>여행루트</h5>
						<div class="row">
						
							<div id="map" style="border:1px solid #e5e5e5;margin-bottom:0px;height:445px;float:left;width:50%;"></div>
							<div id='calendar-container' style="float:right;width:45%; margin: 5px 10px;max-width: 900px;">
							  <div id='calendar'></div>
							</div>
						</div>
					</div>
				</div>
				<!--	 CityRoute List : 여행루트 END	//////////////////////// 	-->
			
				
				
				
				<!--	 BudgetOverview List : 예산 간략 리스트 START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoBudgetOverviewList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"  id="gotoBudgetOverviewList">
					<div class="container">
						<h6>예산 정보</h6>
						<div class="row">
							
							<div class="text-center" style="border:solid thin #DDDDDD ; border-radius:5px; padding: 5px 10px; background-color: white; width: 50%; ">
								<!-- 만들어두고 스크립트에서 포문돌려 셋팅하기 -->
								<div class="budgetOverview" style="padding: 5px;">
									<div style="float:left;width:45%;">
										<div style="margin: 4px 0;"> <i class="fas fa-walking" 		style="width:40px; font-size: 20px;"></i>관광  <div class="budget_amount" id="budget_D" style="display: inline-block; width: 50%; text-align: right;">0</div> 원</div>
										<div style="margin: 4px 0;"> <i class="fas fa-bus" 			style="width:40px; font-size: 20px;"></i>교통  <div class="budget_amount" id="budget_T" style="display: inline-block; width: 50%; text-align: right;">0</div> 원</div>
										<div style="margin: 4px 0;"> <i class="fas fa-ticket-alt" 	style="width:40px; font-size: 20px;"></i>투어  <div class="budget_amount" id="budget_V" style="display: inline-block; width: 50%; text-align: right;">0</div> 원</div>
										<div style="margin: 4px 0;"> <i class="fas fa-ellipsis-h" 	style="width:40px; font-size: 20px;"></i>기타  <div class="budget_amount" id="budget_E" style="display: inline-block; width: 50%; text-align: right;">0</div> 원</div>
									</div>
									<div style="float:right;width:45%;">
										<div style="margin: 4px 0;"> <i class="fas fa-bed" 			style="width:40px; font-size: 20px;"></i>숙소  <div class="budget_amount" id="budget_R" style="display: inline-block; width: 50%; text-align: right;">0</div> 원</div>
										<div style="margin: 4px 0;"> <i class="fas fa-utensils" 	style="width:40px; font-size: 20px;"></i>식사  <div class="budget_amount" id="budget_F" style="display: inline-block; width: 50%; text-align: right;">0</div> 원</div>
										<div style="margin: 4px 0;"> <i class="fas fa-shopping-cart" style="width:40px; font-size:20px;"></i>쇼핑  <div class="budget_amount" id="budget_S" style="display: inline-block; width: 50%; text-align: right;">0</div> 원</div>
										<div style="margin: 5px 0;text-align: right; color:#32D0BF;"> 총  <div id="budget_total" style="font-size:23px; display: inline-block; width: 50%; text-align: right;">0</div> 원</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				<!--	 BudgetOverview List : 예산 간략 리스트 END	//////////////////////// 	-->
				
				

				<!--	 Daily List : 일정표 START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light" id="gotoDailyList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoDailyList">
					<div class="container">
						<h5>일정표</h5>
						<div class="row">
						
							<c:if test="${plan.dayList.size() != 0}">
								<div class="swiper-container">
								    <div class="swiper-wrapper">
							    
							    		<c:forEach var="day" items="${plan.dayList}">
							    			<div class="swiper-slide">
							    			<div>
							    				<div class="dayInfo" style="padding-top:10px;padding-left:10px;text-align:left;padding-left:8px;font-size:14pt;color:#696969; font-weight: bold;">
													${day.dateString}  <br/>
													<span style="font-size:11pt;color:#32D0BF"> ${day.cityNames} &nbsp;&nbsp; ( ${day.dayNo} 일차 )</span>
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
								    	
								    </div>
								    
								    <div class="swiper-button-prev" ></div>
								    <div class="swiper-button-next"></div>
									<!-- <div class="swiper-pagination"> -->
								    <!-- <div class="swiper-scrollbar"></div> -->
								</div>
							</c:if>
							
						</div>
					</div>
				</div>
				<!--	 Daily List : 일정표 END	//////////////////////// 	-->

				
				
				<!--	 Stuff List : 준비물 체크리스트 START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoStuffList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoStuffList">
					<div class="container">
						<!-- <h5>준비물 체크리스트</h5>  -->
						<div class="text-right" style="font-weight: bolder; font-size: 18px;" id="stuffMode">Edit Mode</div>
						<div class="row">
							
							<div style="border:solid thin #DDDDDD ; border-radius:5px; padding:20px; background-color: white; width: 100%; ">
								<span id="stuff_icon"><i class="fas fa-tasks" style="font-size: 25px; margin-right: 6px; margin-bottom: 15px;"></i></span> <span style="margin-left:10px; font-size:large; font-weight:bolder;"> 준비물 체크리스트</span> <span id="stuffCount" style="margin-left: 15px;"></span> <br/>
								
								<div class="stuffItems"> <!-- 빈 div 만든 후 getStuffList() 바로 호출해서 세팅하기 -->
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
											<i class="fas fa-pencil-alt" style="margin: 7px;"></i><input type="text" class="form-control" name="stuffName" style="margin-left:5px; margin-top:5px; width: 200px; display:inline-block;" placeholder="새로운 항목 입력">
											<button style="margin-bottom: 5px; margin-left: 5px;" type="button" class="btn btn-primary" onclick="addStuff()">추가</button> 
										</div>
									</c:if> --%>
								</div> 	
							</div>
							
						</div>
					</div>
				</div>
				<!--	 Stuff List : 준비물 체크리스트 END	//////////////////////// 	-->

				
				
				<!--	 Memo List : 메모 START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoMemoList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoMemoList">
					<div class="container">
						<h5>메모</h5>
						<div class="row">
							
							<br/><br/>
							<c:if test="${plan.memoList.size()!=0}">
								<c:forEach var="memo" items="${plan.memoList}">
								
									<div style="font-size:small;  background-color:#FFF38B;padding: 18px;margin: 10px;height: 250px;width: 250px;border: medium;border-color: navy;box-shadow:3px 2px 4px #898989;">
										메모 등록일자 : &nbsp; ${memo.memoRegDate}<br/>
										등록자 : &nbsp; ${memo.regUserNickname}<br/><br/>
										${memo.memoDetail}<br/>
									</div>
								
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
				<!--	 Memo List : 메모 END	//////////////////////// 	-->
				<br/>
				
				<!-- Footer Start /////////////////////////// -->
				<div class="album py-5 bg-white text-center" style="font-weight: bolder;"> ~~~ 여기는 Footer가 있어야 할 자리 ~~~ </div>
				<!-- Footer End	/////////////////////////// -->
			
			
			
				<!-- //////////////////////////////////////// 모달모달 모음  //////////////////////////////////////// -->
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
				        	<br/>
							<div class="form-group row">
							    <label for="planTitle" style="text-align: right;" class="col-sm-4 col-form-label ">플래너 제목</label>
							    <div class="col-sm-7">
							      <input type="text" class="form-control" id="planTitle" name="planTitle" placeholder="플래너 제목" value="${plan.planTitle}">
							    </div>
							</div>
				        	
				        	<div class="form-group row">
								<label for="planType" style="text-align: right;" class="col-sm-4 col-form-label ">여행 타입</label>
							    <div class="col-sm-7">
								    <select class="form-control" id="planType" name="planType"  value="${plan.planType}">
										<option value="A" <c:if test="${plan.planType == 'A'}">selected </c:if> >여자혼자</option>
										<option value="B" <c:if test="${plan.planType == 'B'}">selected </c:if> >남자혼자</option>
										<option value="C" <c:if test="${plan.planType == 'C'}">selected </c:if>>여자끼리</option>
										<option value="D" <c:if test="${plan.planType == 'D'}">selected </c:if>>남자끼리</option>
										<option value="E" <c:if test="${plan.planType == 'E'}">selected </c:if>>단체</option>
										<option value="F" <c:if test="${plan.planType == 'F'}">selected </c:if>>부모님과</option>
										<option value="G" <c:if test="${plan.planType == 'G'}">selected </c:if>>커플</option>
									</select>
								</div>
							</div>
							
							<div class="form-group row">
							    <label for="planImgFile" style="text-align: right;" class="col-sm-4 col-form-label ">플래너 이미지</label>
							    <div class="col-sm-7 custom-file">
							    	<div class="input-group mb-2">
							    		<input type="file" class="form-control custom-file-input" id="planImgFile" name="planImgFile" placeholder="플래너 이미지" accept="image/*">
							      		<label class="custom-file-label" for="customFile"><i class="fas fa-camera-retro"> size 360x360</i></label>  
							    		
							    	</div>
							    </div>
							</div>
							
							<%-- <div class="form-group">
							    <label for="planImg" class="col-sm-offset-3 col-sm-5 control-label">플래너 이미지</label>
							    <div class="col-sm-5">
							      <input type="text" class="form-control" id="planImg" name="planImg" placeholder="플래너 이미지" value="${plan.planImg}">
							    </div>
							</div> --%>
							
							<div class="form-group row">
							    <label for="startDateString" style="text-align: right;" class="col-sm-4 col-form-label ">여행 시작일</label>
							    
							    <div class="col-sm-7">
								    <div class="input-group mb-2">
								      <input type="text" class="form-control" id="startDateString" name="startDateString" placeholder="여행 시작일" readonly="readonly"  value="${plan.startDateString.substring(0,10)}">
								      <div class="input-group-append">
								      	<div class="input-group-text"><span data-feather="calendar"></span></div>
								      </div>
								    </div>
							    </div>
							</div>
						
							<%-- <div class="form-group">
							    <label for="startDateString" class="col-sm-offset-3 col-sm-5 control-label">여행 시작일</label>
							    <div class="col-sm-5">
							      <input type="text" class="form-control" id="startDateString" name="startDateString" placeholder="여행 시작일" value="${plan.startDateString}">
							    </div>
							</div> --%>
							
							<!-- 여행완료 확정 폼제출을 위한 히든 값 -->
							<input type="hidden" class="form-control" id="planStatus" name="planStatus" value="${plan.planStatus}">
							<input type="hidden" class="form-control" id="planId2" name="planId" value="${plan.planId}">
				        	
				        	<div class="alert alert-danger alert-dismissable" style="display: none;" >
							    <button type="button" class="close" >×</button>
							    <strong></strong><br/>수정 후 다시 시도해주세요.
							</div>
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
				
				<!-- /////////////////////	Modal : dailyEdit 	///////////////////// -->
				<div class="modal" id="dailyEdit" >
				  <div class="modal-dialog">
				  <h4 style="color: #FFFFFF; margin-top: 100px;">일정 등록</h4>
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
							    <label for="dayTime" style="font-weight: bold;">시간 &nbsp;</label>
						    	<select class="form-control" id="dayTime" name="dayTime" disabled="disabled">
									<c:forEach var="j" begin="9" end="20">
										<option value="${j}">${j}</option>
									</c:forEach>
								</select>
								 &nbsp; &nbsp;
								<label for="dailyCate" style="font-weight: bold;" >카테고리 &nbsp;</label>
						    	<select class="form-control" id="dailyCate" name="dailyCate" >
									<option value="D">관광</option>
									<option value="T">교통</option>
									<option value="V">투어</option>
									<!-- <option value="R">숙소</option> -->
									<option value="F">식사</option>
									<option value="S">쇼핑</option>
									<option value="E">기타</option>
								</select>
							</div>
							
							<div class="form-group" style="margin-top: 15px; margin-bottom: 20px; width: 440px;">
							    <label for="dailyDetail" class="control-label" style="font-weight: bold; margin-bottom: 5px;" >일정 내용</label><br/>
							    <input type="text" class="form-control" id="dailyDetail" name="dailyDetail" placeholder="일정 내용을 작성해주세요" style="width:100%; height: 100px;">
							</div>
							
							<div class="form-group" >
								<label for="budgetAmount" style="font-weight: bold;" >예산 &nbsp;</label>
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
				<!-- /////////////////////	Modal : dailyEdit 끝	///////////////////// -->
				
				
				<!-- /////////////////////	Modal : inviteUser	///////////////////// -->	
				<div class="modal" id="inviteUser">
				  <div class="modal-dialog modal-lg" >
				  	<h4 style="color: #FFFFFF; margin-top: 100px;"> 플래너에 친구 초대하기</h4>
				  
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <div class="modal-title">
				        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>친구를 초대해 플래너를 함께 작성하고 여행을 떠나보세요</h6>
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
							  <input type="text" class="form-control" name="findUserId" id="findUserId" placeholder="아이디를 입력하세요" aria-label="findUserId" aria-describedby="addon-wrapping">
								 &nbsp; &nbsp;<button type="button" class="btn btn-primary" id="findUser">검색</button>
							</div>
				        
				        	<br/>
				        	
							<div class="findUserResult" style="text-align: center;"></div>
							
							<div class="form-group" id="offerMsgForm" style="margin: 30px 10px 10px 10px; width:auto;">
							    <label for="offerMsg" class="control-label" style="font-weight: bold; margin-bottom: 7px;" ><span class="findUserResult"></span> 님에게 전송할 초대 메시지</label><br/>
							    <input type="text" class="form-control" id="offerMsg" name="offerMsg" placeholder="초대 메시지를 입력하세요" style="width:100%; height: 100px;">
							</div>
				        </form>
				        
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('inviteUser')">Close</button>
				        <button type="button" class="btn btn-primary" id="addOffer">초대하기</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Modal : inviteUser 끝	///////////////////// -->	
				
				
				<!-- /////////////////////	Alert Modal : 플래너 삭제 	///////////////////// -->	
				<div class="modal" id="deletePlanAlert">
				  <div class="modal-dialog" >
				  	<h4 style="color: #FFFFFF; margin-top: 100px;"> 플래너 삭제</h4>
				  
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <!-- <div class="modal-title">
				        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>친구를 초대해 플래너를 함께 작성하고 여행을 떠나보세요</h6>
				        </div> -->
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('deletePlanAlert')">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body text-center">
				        <br/><span style="font-size:20px; color:#00AACC; font-weight:bold;">${plan.planTitle}</span> <br/>
				        <span style="font-size:17px;"> 플래너를 삭제하시겠습니까?</span>
				        <br/><br/>
				      </div>
				      
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('deletePlanAlert')">아니오</button>
				        <button type="button" class="btn btn-primary" id="deletePlan">예</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Alert Modal : 플래너 삭제 끝	///////////////////// -->
				
				
				<!-- /////////////////////	Alert Modal : 여행완료 확정	///////////////////// -->	
				<div class="modal" id="planCompleteAlert">
				  <div class="modal-dialog modal-lg" >
				  	<h4 style="color: #FFFFFF; margin-top: 100px;"> 여행완료 확정</h4>
				  
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <!-- <div class="modal-title">
				        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>친구를 초대해 플래너를 함께 작성하고 여행을 떠나보세요</h6>
				        </div> -->
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('planCompleteAlert')">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body text-center">
				        ${plan.startDateString} 부터 ${plan.endDate} 까지
				        <br/>
				        <span style="font-size:20px; color:#00AACC; font-weight:bold;">${plan.planTitle}</span> <span style="font-size:17px;"> 즐겁게 다녀오셨나요?</span>
				        <br/><br/><br/>
				        
				        <span style="font-weight:bold;">여행완료 확정</span> 시 <br/>
				        	내 여행정보 통계에 플래너 정보가 등록됩니다.
				      </div>
				      
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('planCompleteAlert')">Close</button>
				        <button type="button" class="btn btn-primary" id="planComplete">여행완료 확정</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Alert Modal : 여행완료 확정 끝	///////////////////// -->	
				
				
				<!-- /////////////////////	Alert Modal : 플래너 멤버 강퇴	///////////////////// -->	
				<div class="modal" id="deletePlanPartyAlert">
				  <div class="modal-dialog" >
				  	<h4 style="color: #FFFFFF; margin-top: 100px;"> 플래너 멤버 강퇴</h4>
				  
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <!-- <div class="modal-title">
				        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>친구를 초대해 플래너를 함께 작성하고 여행을 떠나보세요</h6>
				        </div> -->
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('deletePlanPartyAlert')">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body text-center">
				        <br/><span id="planMemberId" style="font-size:17px;font-weight:bold; color:#00AACC; "></span>
				        <span style="font-size:17px;"> 님을</span> <br/> <span style="font-size:17px;">플래너 참여자에서 제외시키시겠습니까? </span>
				        <br/><br/>
				        
				        <!-- 플래너 멤버 삭제용 제출 폼 -->
				        <form class="form-inline deleteMember">
				        	<input type="hidden" class="form-control" id="planId4" name="refId" value="${plan.planId}">
				        	<input type="hidden" class="form-control" id="partyUserId" name="partyUserId" value="">
				        	<input type="hidden" class="form-control" id="partyRole" name="partyRole" value="">
				        </form>
				        
				      </div>
				      
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('deletePlanPartyAlert')">아니오</button>
				        <button type="button" class="btn btn-primary" id="deletePlanParty">예</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Alert Modal : 플래너 멤버 강퇴 끝	///////////////////// -->	


				<!-- /////////////////////	Alert Modal : 플래너 탈퇴 	///////////////////// -->	
				<div class="modal" id="exitPlanAlert">
				  <div class="modal-dialog" >
				  	<h4 style="color: #FFFFFF; margin-top: 100px;"> 플래너 탈퇴</h4>
				  
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <!-- <div class="modal-title">
				        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>친구를 초대해 플래너를 함께 작성하고 여행을 떠나보세요</h6>
				        </div> -->
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('exitPlanAlert')">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body text-center">
				        <br/><span style="font-size:20px; color:#00AACC; font-weight:bold;">${plan.planTitle}</span> <br/>
				        <span style="font-size:17px;"> 플래너를 탈퇴하시겠습니까?</span>
				        <br/><br/>
				      </div>
				      
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('exitPlanAlert')">아니오</button>
				        <button type="button" class="btn btn-primary" id="exitPlan">예</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Alert Modal : 플래너 탈퇴 끝	///////////////////// -->


				<!-- //////////////////////////////////////// 모달 모음 끝  //////////////////////////////////////// -->
				
			</main>
			<!-- Main 화면 구성 End ///////////////////////////// -->
			
			
		</div>
		<!-- 다단 레이아웃 End ///////////////////////////// -->
		
	</div>
	<!-- 화면구성 div End ///////////////////////////// -->
	
	

	
	<!-- body 로드 후 실행되어야 하는 스크립트 모음  -->
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
		        zoom: 3,			/* zoom: 1:World, 5:Landmass/continent, 10:City, 15:Streets, 20:Buildings */
		        //mapTypeId :'terrain',
		        styles: [
		        	/* {
		        	    "elementType": "geometry",
		        	    "stylers": [
		        	      {
		        	        "color": "#ffffff"
		        	      }
		        	    ]
		        	  }, */
		        	  {
		        	    "elementType": "labels.icon",
		        	    "stylers": [
		        	      {
		        	        "color": "#e5e5e5"
		        	      },
		        	      {
		        	        "visibility": "off"
		        	      }
		        	    ]
		        	  },
		        	  {
		        	    "elementType": "labels.text.fill",
		        	    "stylers": [
		        	      {
		        	        "color": "#c3c3c3"
		        	      }
		        	    ]
		        	  },
		        	  {
		        	    "featureType": "administrative",
		        	    "elementType": "geometry",
		        	    "stylers": [
		        	      {
		        	        "visibility": "off"
		        	      }
		        	    ]
		        	  },
		        	  /* {
		        	    "featureType": "administrative.land_parcel",
		        	    "stylers": [
		        	      {
		        	        "visibility": "off"
		        	      }
		        	    ]
		        	  }, */
		        	  {
		        	    "featureType": "administrative.locality",
		        	    "stylers": [
		        	      {
		        	        "visibility": "simplified"
		        	      }
		        	    ]
		        	  },
		        	  {
		        	    "featureType": "administrative.neighborhood",
		        	    "stylers": [
		        	      {
		        	        "visibility": "off"
		        	      }
		        	    ]
		        	  },
		        	  /* {
		        	    "featureType": "poi",
		        	    "stylers": [
		        	      {
		        	        "visibility": "off"
		        	      }
		        	    ]
		        	  }, */
		        	  /* {
		        	    "featureType": "road",
		        	    "stylers": [
		        	      {
		        	        "visibility": "off"
		        	      }
		        	    ]
		        	  }, */
		        	  {
		        	    "featureType": "transit",
		        	    "stylers": [
		        	      {
		        	        "visibility": "off"
		        	      }
		        	    ]
		        	  },
		        	  {
		        	    "featureType": "water",
		        	    "elementType": "geometry",
		        	    "stylers": [
		        	      {
		        	        "color": "#B5F8FF"
		        	      }
		        	    ]
		        	  },
		        	  /* {
		        	    "featureType": "water",
		        	    "elementType": "labels.text",
		        	    "stylers": [
		        	      {
		        	        "visibility": "off"
		        	      }
		        	    ]
		        	  } */
		        ]
		    });
		    /* marker = new google.maps.Marker({
		    	 position: paris, 
		    	 map: map,
		    	 title: 'marker Title!!'
	    	 }); */
		    
	    	 
	    	/* 도구모음! */
	    	var shape = {
		    			coords: [1, 1, 1, 12, 12, 12, 12, 1],
		    	        type: 'poly'
	    	        };
		 	var lineSymbol_TRAIN_RL = {
		 			    path: google.maps.SymbolPath.FORWARD_OPEN_ARROW,
		 			    fillColor: '#696969',
		 			    fillOpacity: 1,
		 			    strokeWeight: 1,
		 			    scale: 1
		 			}
		 	var lineSymbol_TRAIN_LR = {
		 			    path: google.maps.SymbolPath.FORWARD_OPEN_ARROW,
		 			    fillColor: '#696969',
		 			    fillOpacity: 1,
		 			    strokeWeight: 1,
		 			    scale: 1,
		 				rotation: 0,
		 				anchor: new google.maps.Point(0,0)
		 			}
	    	 
		    /* GoogleMap 에 뿌릴 것들  */
			function initMapItems(){
				console.log("initMapItems() 실행");
				
				var bounds = new google.maps.LatLngBounds();
				
				var cityMarkerList = ${cityMarkerList};
				
				for( var i in cityMarkerList ){
					console.log("cityMarkerList[i] = "+cityMarkerList[i])
					marker[i] = new google.maps.Marker({
							position: cityMarkerList[i].position,
							map: map,
							//icon: icon,
							shape: shape,
							title: cityMarkerList[i].title
					});
					
					if( i > 0 ){
						var path = [ marker[i-1].getPosition() , marker[i].getPosition() ];
						routelines[i-1] = new google.maps.Polyline({
							map: map,
							strokeColor: '#696969',
					        strokeOpacity: 1.0,
					        strokeWeight:1,
					        geodesic: false,
					        icons: [{
					            icon: lineSymbol_TRAIN_LR,
					            offset: '95%'
					        }]
						});
						routelines[i-1].setPath(path);
					}
					
					bounds.extend(marker[i].getPosition());
					
					/* marker[i].addListener('click', function() {
						alert(" 마커 클릭 => cityName="+cityMarkerList[i].title);
					}); */
				}
				map.fitBounds(bounds);
				
			} //initMapItems 끝
			
			initMapItems();
			
			//map.setCenter(cityMarkerList[0].position);
			//map.setZoom(5);
		    
			/* 지도 내에 버튼 만들기 */ 
			var leftControlDiv = document.createElement('div');
			var thtml = '<div class="text-center" style="margin-bottom:5px;margin-left:10px;font-weight:bold; color:#395E62; font-size:10pt;border:solid thin #DDDDDD ; border-radius:5px; padding:10px; background-color: white;" onClick="controlClick()"><div style="margin:5px 0;"><i class="fas fa-globe-europe" style="font-size: 30px;"></i></div><div>여행루트 수정</div></div>';
			leftControlDiv.innerHTML = thtml;
			map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(leftControlDiv);
		    
		};
		/* ------------------------------------ Google Map Script ------------------------------------ */
		
		
		
		
		
		
		
		
		
		
		/* Plan Information 여행완료 버튼  관련 함수 */
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
		
		
		/* 일정표 칸 마우스오버 이벤트 */
		$( ".dailys" ).hover(
		  function() {
		    $( this ).css("background", "#D4EFFA");
		  }, function() {
		    $( this ).css("background", "none");
		  }
		);
		
		/* icon 사용을 위한 스크립트 */
		/* https://github.com/feathericons/feather#feather 참고 */
		feather.replace();
		
		/* Swiper를 위한 스크립트 */
		new Swiper ('.swiper-container', {
		    //direction: 'vertical',
		    //loop: true
			navigation : {
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			}
		  });
		
	</script>
	
	
	<!-- Google Map API -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMoE1_1g-id6crD_2M4nCDF4IsmcncLU4&callback=initMap" type="text/javascript"></script>

</body>
</html>