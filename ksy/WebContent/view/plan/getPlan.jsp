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
	
	<style>
		
		#calendar {
		  max-width: 900px;
		  width: auto;
		  height: auto;
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
		});
		
		function inviteUser() {
			console.log("inviteUser() 실행");
			$('#offerMsgForm').hide();
			$('#addOffer').hide();
			$('.findUserResult').text('');
			$("#inviteUser").show()
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
				alert("updatePlan 버튼 클릭 => updatePlan 함수 실행")
			});
			
			$('#planCompleteButton').on("click", function(){
				//$("#completePlan").show();
				alert("여행완료 확정 버튼 클릭 => 여행완료 확정 창 띄우기")
			});
		})
		
		/* ------------------------------------------------------------------------------------------------------ */
		
	</script>
	
	<script>
	
		function closeModal(modalName) {
			console.log("closeModal : modalName="+modalName);
			$("."+modalName)[0].reset();		//form에 모달 이름과 같은 클래스명 주기
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
	
	<script type="text/javascript">
	
		document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
		  //var draggebleEl = document.getElementById('draggable');
		  var containerEl = document.getElementById('external-events');
		  var checkbox = document.getElementById('drop-remove');
		  
		  var Calendar = FullCalendar.Calendar;
		  var Draggable = FullCalendarInteraction.Draggable;
		  
		 
		  var calendar = new FullCalendar.Calendar(calendarEl, {
		    plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
		    defaultView: 'dayGridMonth',
		    defaultDate: new Date(),
		    header: {
		      left: 'prev,next today addEventButton',
		      center: 'title',
		      right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		    },
		    customButtons: {
		        addEventButton: {
		          text: '이벤트 추가',
		          click: function() {
		            var dateStr = prompt('YYYY-MM-DD 형식으로 날짜 입력');
		            var date = new Date(dateStr + 'T00:00:00'); // will be in local time
		            var titleStr = prompt('이벤트 title 입력');
		            
		            if (!isNaN(date.valueOf())) { // valid?
		              calendar.addEvent({
		                title: titleStr,
		                start: date,
		                allDay: true
		              });
		              alert('Great. Now, update your database...');
		            } else {
		              alert('Invalid date.');
		            }
		          }
		        }
		      },
		    editable: true,
		    droppable: true, // this allows things to be dropped onto the calendar
		    locale: 'ko',
		    events:[
		    	{
		    		title: '이벤트 입력',
		    		start: '2019-12-31'
		    	}
		    ]
		  });
		  
		  calendar.render();
		  
		  
		}); 
	
	</script>
	
	


</head>
<body>
	<!-- ToolBar 시작 -->
	<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
	
	<div hidden="hidden"></div>
	<div class="navbar fixed-top py-4 bg-light text-center"> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~````~ 원래는 Top ToolBar 있어야 할 자리 ~~~~~~~~~~~~~~~~~~1~~~~~~~~~~ </div>
	<!-- ToolBar 끝 -->
	
	
	<!-- 화면구성 div Start ///////////////////////////// -->
	<div class="container">
		
		<!-- 다단 레이아웃 Start ///////////////////////////// -->
		<div class="row">
		
		
			<!-- 좌측 Plan 툴바 구성 Start /////////////////////////////////////////////////////////// -->
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
		      <div class="sidebar-sticky">
		      
		        <ul class="nav flex-column">
		          <li class="nav-item">
		            <a class="nav-link active" href="/index.jsp">
		              <span data-feather="home"></span>
		              	메인으로 <span class="sr-only">(current)</span>
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
				
				<br/>
				
				<!--	 Plan Information START	//////////////////////// 	-->
				
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<div class="container">
						<h5>Plan Information</h5>
						<div class="row" style="background-color: #FFED94; width: 100%; padding: 15px; border-radius: 5px; ">
						
							<img src="https://travel-echo.com/wp-content/uploads/2019/11/polynesia-3021072_640-400x250.jpg" class="align-self-center mr-2" alt="https://travel-echo.com/wp-content/uploads/2019/11/polynesia-3021072_640-400x250.jpg" style="margin: 5px; border-width: 1px; border-color: gray; border-style: solid; width: 100px; height: 100px;">
						    <div class="media-body" style="margin-left: 25px; margin-top: 30px;">
						      <div><div style="font-weight: bolder; font-size: 20px; display: inline-block;">${plan.planTitle} </div> ${plan.planPartySize} 명</div>
						      ${plan.startDateString} ~ ${plan.endDate} ( ${plan.planTotalDays}일 ) &nbsp;&nbsp;&nbsp;&nbsp; 
						      <c:if test="${plan.planDday == 0}"> D-Day </c:if>
						      <c:if test="${plan.planDday > 0}"> D - ${plan.planDday} </c:if>
						    </div>
							
							<div>
							<button type="button" class="btn btn-primary" id="updatePlanButton" style="margin-left: 10px;">플래너 수정</button> 
							<c:if test="${ user.userId == plan.planMaster.userId }">
								<button type="button" class="btn btn-primary" style="margin-left: 10px;">플래너 삭제</button> 
							</c:if>
							<button type="button" class="btn btn-primary" id="planCompleteButton" style="margin-left: 10px;">여행완료 확정</button>
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
						      <div><div style="font-weight: bolder; font-size: 20px; display: inline-block;">${plan.planTitle} </div> ${plan.planPartySize} 명</div>
						      ${plan.startDateString} ~ ${plan.endDate} ( ${plan.planTotalDays}일 ) &nbsp;&nbsp;&nbsp;&nbsp; 
						      <c:if test="${plan.planDday == 0}"> D-Day </c:if>
						      <c:if test="${plan.planDday > 0}"> D - ${plan.planDday} </c:if>
						    </div>
							
							<div>
							<button type="button" class="btn btn-primary" id="updatePlanButton" style="margin-left: 10px;">플래너 수정</button> 
							<c:if test="${ user.userId == plan.planMaster.userId }">
								<button type="button" class="btn btn-primary" style="margin-left: 10px;">플래너 삭제</button> 
							</c:if>
							<button type="button" class="btn btn-primary" id="planCompleteButton" style="margin-left: 10px;">여행완료 확정</button>
							</div>
						</div>
					</div>
				</div>
				<!--	 Plan Information START	//////////////////////// 	-->
				<br/> --%>
				
				
				
				
				<!--	 Todo List : 투두 리스트 START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoTodoList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoTodoList">
				
					<div class="container">
						<h4>Todo List : 투두 리스트</h4>
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
						<h4>CityRoute List : 여행루트</h4>
						<div class="row">
						
							<div id="map" style="border:1px solid #e5e5e5;margin-bottom:0px;height:480px;float:left;width:50%; float: left;"></div>
							<!-- <div id='calendar-container'> -->
							  <div id='calendar' style="float:right;width:45%; margin: 10px;"></div>
							<!-- </div> -->
						</div>
					</div>
				</div>
				<!--	 CityRoute List : 여행루트 END	//////////////////////// 	-->
				<br/>
				
				
				
				<!--	 BudgetOverview List : 예산 간략 리스트 START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoBudgetOverviewList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"  id="gotoBudgetOverviewList">
					<div class="container">
						<h4>BudgetOverview List : 예산 리스트</h4>
						<div class="row">
							
							
						</div>
					</div>
				</div>
				<!--	 BudgetOverview List : 예산 간략 리스트 END	//////////////////////// 	-->
				<br/>
				
				

				<!--	 Daily List : 일정표 START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light" id="gotoDailyList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoDailyList">
					<div class="container">
						<h4>Daily List : 일정표</h4>
						<div class="row">
							
							<div class="swiper-container">
							    <div class="swiper-wrapper">
							    
							    	<c:if test="${plan.dayList.size() != 0}">
							    		<c:forEach var="day" items="${plan.dayList}">
							    			<div class="swiper-slide" style="width: 40px;">
							    			<div>
							    				<div class="dayInfo" style="padding-top:10px;padding-left:10px;text-align:left;padding-left:8px;font-size:14pt;color:#696969;">
													${day.dateString}  <br/>
													<span style="font-size:11pt;color:#c0c0c0"> ${day.cityNames} &nbsp;&nbsp; ( ${day.dayNo} 일차 )</span>
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
				<!--	 Daily List : 일정표 END	//////////////////////// 	-->
				<br/>
				
				
				<!--	 Stuff List : 준비물 체크리스트 START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoStuffList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoStuffList">
					<div class="container">
						<h4>Stuff List : 준비물 체크리스트</h4> <div class="text-right" style="font-weight: bolder; font-size: 25px;" id="stuffMode">Edit Mode</div>
						<div class="row">
							
							<div style="border:dashed thin #A7A7A7 ; border-radius:8px; padding:25px; background-color: white; width: 100%; ">
								<span id="stuff_icon"><i class="fas fa-tasks" style="font-size: 25px; margin-right: 6px; margin-bottom: 15px;"></i></span> <span style="margin-left:10px; font-size:large; font-weight:bolder;"> 준비물 리스트</span> <span id="stuffCount" style="margin-left: 15px;"></span> <br/>
								
								<div class="stuffItems">
								<!-- 빈 div 만든 후 getStuffList() 바로 호출해서 세팅하기 -->
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
				<br/>
				
				
				<!--	 Memo List : 메모 START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoMemoList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" id="gotoMemoList">
					<div class="container">
						<h4>Memo List : 메모</h4>
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
				<!-- /////////////////////	Medal : editPlan 	///////////////////// -->
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
							
				        </form>
				        
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('editPlan')">Close</button>
				        <button type="button" class="btn btn-primary" id="updatePlan">수정</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- /////////////////////	Medal : editPlan 끝	///////////////////// -->
				
				<!-- /////////////////////	Medal : dailyEdit 	///////////////////// -->
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
				        	<input type="hidden" class="form-control" id="planId" name="planId" value="${plan.planId}">
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
				<!-- /////////////////////	Medal : dailyEdit 끝	///////////////////// -->
				
				
				<!-- /////////////////////	Medal : inviteUser	///////////////////// -->	
				<div class="modal" id="inviteUser">
				  <div class="modal-dialog" >
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
				        	
					        <div class="input-group flex-nowrap" style="margin: 0 auto; width: 80%;">
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
				<!-- /////////////////////	Medal : inviteUser 끝	///////////////////// -->	
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
		
		
		/* Plan Information 여행완료 버튼  관련 함수 */
		var now = new Date();
		var planEndDate = "${plan.endDate}";
		var newPlanEndDate = new Date(planEndDate);
		console.log("now="+now+" / endDate="+newPlanEndDate);
		
		if(now > newPlanEndDate){
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
		
	</script>
	
	<!-- Swiper를 위한 스크립트 -->
	<script>
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