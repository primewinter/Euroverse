<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>editRoute</title>
	
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
	
	
	<!-- FontAwesome CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- jquery Ui 링크 (datePicker)  -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!--datePicker CDN  -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	
	<!-- ICON 사용을 위한 스크립트 임포트 : https://feathericons.com/ -->
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
	
	
	
	

	<!-- 함수들 모음집 -->
	<script type="text/javascript">
	
		var planId = ${plan.planId};	//현재 조회중인 plan의 아이디 박아두기
	
		var routeList = [];
		routeList = ${cityMarkerList};
		
		//alert("routeList => "+routeList);
		
		$(function(){
			$('#updatePlanButton').on('click', function(){
				alert('#updatePlanButton 클릭! 플래너 수정 함수 호출');
			});
			
			$('#deletePlanButton').on('click', function(){
				alert('#deletePlanButton 클릭! 플래너 삭제 함수 호출');
			});
			
			$('#exitPlanButton').on('click', function(){
				alert('#exitPlanButton 클릭! 플래너 탈퇴 함수 호출');
			});
			
			$('#planCompleteButton').on('click', function(){
				alert('#planCompleteButton 클릭! 플래너 여행완료 함수 호출');
			});
			
			
			$('.tran_type').on('click', function(){
				alert(".tran_type 클릭 => "+ ($('.tran_type').index($(this))+1) );
			});
			$('.cr_cityDuration_parent').on('click', function(){
				alert(".cr_cityDuration_parent 클릭 => "+ ($('.cr_cityDuration_parent').index($(this))+1) );
				//alert( "cityId = " );
			});
		});
		
		
		function reorder() {
			console.log("reorder() 실행")
			
		    $(".city_route").each(function(i, box) {
		    	var cityId = $(box).find(".city_id").text().trim();
		    	var index = $(".city_route").index($(box));
		        $(box).find(".visit_order").html(i);
		        console.log(" reorder 실행! => "+$(box)+"/cityId="+ cityId +", i="+i + ", index="+index );
		        if( i == 1){
		        	$(box).find(".tran_type").hide();
		        }else{
		        	$(box).find(".tran_type").show();
		        }
		        
		        updateVisitOrder( cityId, i );
		    });
			
			//getCityRouteList( planId );
		}
		
		function updateVisitOrder( cityId, visitOrder ){
			//console.log("updateVisitOrder("+ cityId +", "+ visitOrder +") 실행");
			$.ajax({
				url: "/planSub/json/updateVisitOrder",
				method: "POST",
				dataType: "json",
				data: JSON.stringify({
					planId: planId,
					cityId: cityId,
					visitOrder: visitOrder
				}),
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){
						console.log("리턴데이터 없음");	
					}else{
						console.log("리턴데이터 있음! => "+JSON.stringify(JSONData) );	
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    } 
			}); //ajax
		} //updateVisitOrder( )
		
		
		
		function deleteCityRoute( cityId, visitOrder ){
			var visitOrderNew  = visitOrder+1;	//삭제 후 이미 부여된 순서 오류... 필요없음!!!!!!
			var indexNew = $(".city_id").index( $(".city_id:contains('"+cityId+"')") )+1;
			
			if(confirm( "삭제된 경로는 복구가 불가능합니다.\n정말 삭제하시겠습니까? "+"/ indexNew="+indexNew ))
			{
				console.log( indexNew + "번째 cityRoute 삭제"  );
				$($(".city_route")[indexNew] ).remove();
				//$("#cityblock"+idx).remove();
				
				console.log("cityId="+ cityId +" 삭제됨");
				
				$.ajax({
					url: "/planSub/json/deleteCityRoute/"+cityId+"/"+planId ,	//planId 필요없지만..
					method: "GET",
					dataType: "json",
					headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
					success: function(JSONData, status){
						if( JSONData==null || JSONData=="" ){
							console.log("리턴데이터 없음");	
						}else{
							console.log("리턴데이터 있음! => "+JSON.stringify(JSONData) );	
						}
					},
					error:function(request,status,error){
				        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				    } 
				}); //ajax
				
				
				//clearLisnes();
				//routelist.splice(idx, 1);
				
				reorder();
				
				/* if(citylist.length>0) {
					lastcity=cities[citylist[citylist.length-1]];
				}else {
					lastcity=0;
				} */
			}
		}
		

		$(function(){
			$('.city_route_list').sortable({
				items: ".city_route",
				
				/* 드래그 시작시 호출되는 이벤트 핸들러 */
				start: function(event, ui){	
					console.log("sortable start!");
					
					ui.item.data('start_pos', ui.item.index());		
					// ui.item.index() <- 드래그하는 아이템의 위치를 가져옴 (첫번째 아이템=0)
					// ui.item.data(key, value) <- 아이템에 키,값 쌍으로 데이터를 저장
				},
				/* 드랍시 호출되는 이벤트 핸들러 */
				stop: function(event, ui){	// = stop: function(e,ui) ????
					console.log("sortable stop!");
					var spos = ui.item.data('start_pos');
					var epos = ui.item.index();
					
					reorder();	//순서 변경시 모든 itemBox 내의 itemNum(입력필드 앞의 숫자)의 번호를 순서대로 다시 붙임
					//getCityRouteList( planId );
				}
			});
			
			$('.city_route_list').disableSelection();
		});
		
		
		function addCityRoute(cityName){
			var nextVisitOrder = $(".city_route").size();
			
			if(confirm( "addCityRoute() 실행! : cityName="+cityName+" (planId="+planId+") / nextVisitOrder="+nextVisitOrder +"\n 경로를 추가하시겠습니까?" ))
			{	
				$.ajax({
					url: "/planSub/json/addCityRoute",
					method: "POST",
					dataType: "json",
					data: JSON.stringify({
						planId: planId,
						cityName: cityName,
						visitOrder: nextVisitOrder
					}),
					headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
					success: function(JSONData, status){
						if( JSONData==null || JSONData=="" ){
							console.log("리턴데이터 없음");	
						}else{
							console.log("리턴데이터 있음! => "+JSON.stringify(JSONData) );	
							
							/* var crHtml = '<div class="city_route"  style="margin: 5px; padding: 5px; border: 1px solid gray; background-color: white;">';
							crHtml = crHtml + '<span class="float-right" onclick="deleteCityRoute(\''+ JSONData.cityId +'\', 0 )">X</span>';
							crHtml = crHtml + '<div class="trans">';
							crHtml = crHtml + '<div class="tran_type" style="border-bottom: 1px solid red;">';
							
							if( JSONData.tranType == 'T' ){
								crHtml = crHtml + '기차 <i class="fas fa-train" style="font-size: 30px;"></i>';
							}else if( JSONData.tranType == 'B' ){
								crHtml = crHtml + '버스 <i class="fas fa-bus" style="font-size: 30px;"></i>';
							}else if( JSONData.tranType == 'A' ){
								crHtml = crHtml + '항공 <i class="fas fa-plane" style="font-size: 30px;"></i>';
							}else if( JSONData.tranType == 'F' ){
								crHtml = crHtml + '페리 <i class="fas fa-ship" style="font-size: 30px;"></i>';
							}else if( JSONData.tranType == 'E' ){
								crHtml = crHtml + '기타 <i class="fas fa-guitar" style="font-size: 30px;"></i>';
							}else if( JSONData.tranType == null || JSONData.tranType == '' ){
								crHtml = crHtml + 'ㄴㄴ <i class="fas fa-plus" style="font-size: 30px;"></i>';
							}
							crHtml = crHtml + '</div>';
							crHtml = crHtml + '</div>';
							
							crHtml = crHtml + '<div>';
							crHtml = crHtml + '<div class="cr_cityName">'+JSONData.cityName+'</div>';
							crHtml = crHtml + '방문순서: <span class="visit_order">'+JSONData.visitOrder+'</span> , 도시ID: <span class="city_id">'+ JSONData.cityId +'</span>';
							crHtml = crHtml + '<div class="cr_term">'+ JSONData.startDateStr +' ~ '+ JSONData.endDateStr +'</div>';
							crHtml = crHtml + '</div>';
							crHtml = crHtml + '<div class="cr_cityDuration">city_duration: '+ JSONData.cityDuration +'</div>';
							crHtml = crHtml + '</div>'; */
							
							
							var crHtml = '<div class="city_route"  style="margin: 5px; padding: 6px;">';
							crHtml = crHtml + '<div class="trans d-flex justify-content-center">';
							crHtml = crHtml + '<div class="tran_type" style="font: 7px gray;">';
							
							if( JSONData.tranType == 'T' ){
								crHtml = crHtml + '기차 <i class="fas fa-train" style="font-size: 50px;"></i>';
							}else if( JSONData.tranType == 'B' ){
								crHtml = crHtml + '버스 <i class="fas fa-bus" style="font-size: 50px;"></i>';
							}else if( JSONData.tranType == 'A' ){
								crHtml = crHtml + '항공 <i class="fas fa-plane" style="font-size: 50px;"></i>';
							}else if( JSONData.tranType == 'F' ){
								crHtml = crHtml + '페리 <i class="fas fa-ship" style="font-size: 50px;"></i>';
							}else if( JSONData.tranType == 'E' ){
								crHtml = crHtml + '기타 <i class="fas fa-guitar" style="font-size: 50px;"></i>';
							}else if( JSONData.tranType == null || JSONData.tranType == '' ){
								crHtml = crHtml + '선택<i class="fas fa-plus" style="font-size: 50px;"></i>';
							}
							crHtml = crHtml + '</div>';
							crHtml = crHtml + '</div>';
							
							crHtml = crHtml + '<button type="button" class="close" aria-label="Close" onclick="deleteCityRoute(\''+ JSONData.cityId +'\', 0 )"> <span aria-hidden="true">&times;</span> </button>';
	
							crHtml = crHtml + '<div class="media mt-4" style="border: 1px solid #CDD8D8; padding: 15px 35px 0px 35px;">';
							crHtml = crHtml + '<div hidden="hidden">방문순서: <span class="visit_order">'+ JSONData.visitOrder +'</span> , 도시ID: <span class="city_id">'+ JSONData.cityId +'</span></div>';
							crHtml = crHtml + '<img alt="" src="/resources/images/planImg/defaultPlanImage.jpg" class="align-self-center mr-3 city_img" style="width: 50px; height: auto;" hidden="hidden">';
							crHtml = crHtml + '<div class="media-body">';
							crHtml = crHtml + '<h5 class="cr_cityName mt-0" style="font-weight:600;">'+ JSONData.cityName +'</h5>';
							crHtml = crHtml + '<p class="cr_term">'+ JSONData.startDateStr +' ~ '+ JSONData.endDateStr +'</p>';
							crHtml = crHtml + '</div>';
							crHtml = crHtml + '<div class="rounded-circle" style="border:3px solid #33B9B1; padding: 12px; font-weight: 600;">';
							crHtml = crHtml + '<span class="cr_cityDuration">'+ (JSONData.cityDuration-1) +'</span>박';
							crHtml = crHtml + '</div>';
							crHtml = crHtml + '</div>';
							crHtml = crHtml + '</div>';
							
							$(crHtml).appendTo('.city_route_list');
						}
					},
					error:function(request,status,error){
				        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				    } 
				}); //ajax
				
				//reorder();
			}//confirm if
		}
		
		
		/* GoogleMap control 버튼 클릭 */
		function controlClick(){
			var string = '/plan/getPlan?planId='+planId;
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
	
	
	
	
	
	
	<!-- body 로드 후 실행되어야 하는 스크립트 모음  -->
	<!-- Map 관련 스크립트 -->
	<script>
	
	 	/* ------------------------------------ Google Map Script ------------------------------------ */
		var map;
		var geocoder;
		var overlay;
		var marker=[];
		var routeLines=[];
		
		var allMarkers = [];
		var myMarkers = [];
		var prv_infowindow;
		
		var korea = {lat:37.497957 , lng:127.027780};
		
		
		
	
		/* initMap !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! */
		function initMap(){
			
			geocoder = new google.maps.Geocoder();
		    map = new google.maps.Map(document.getElementById('map'), {
		        center: korea,
		        zoom: 3,			/* zoom: 1:World, 5:Landmass/continent, 10:City, 15:Streets, 20:Buildings */
		        //mapTypeId :'terrain',
		        styles: [
		        	/* { "elementType": "geometry", "stylers": [ { "color": "#ffffff" } ] }, */
		        	  { "elementType": "labels.icon", "stylers": [ { "color": "#e5e5e5" }, { "visibility": "off" } ] },
		        	  { "elementType": "labels.text.fill", "stylers": [ { "color": "#c3c3c3" } ] },
		        	  { "featureType": "administrative", "elementType": "geometry", "stylers": [ { "visibility": "off" } ] },
		        	  /* { "featureType": "administrative.land_parcel", "stylers": [ { "visibility": "off" } ] },
		        	  { "featureType": "administrative.locality", "stylers": [ { "visibility": "simplified" } ] },
		        	  { "featureType": "administrative.neighborhood", "stylers": [ { "visibility": "off" } ] },
		        	  { "featureType": "poi", "stylers": [ { "visibility": "off" } ] },
		        	  /* { "featureType": "road", "stylers": [ { "visibility": "off" } ] }, */
		        	  { "featureType": "transit", "stylers": [ { "visibility": "off" } ] },
		        	  { "featureType": "water", "elementType": "geometry", "stylers": [ { "color": "#DAF8F6" } ] },
		        	  /* { "featureType": "water", "elementType": "labels.text", "stylers": [ { "visibility": "off" } ] } */
		        ]
		    });
		    
	    	 
	    	/* 스크롤(zoom) 할때마다 도시리스트 가져와서 뿌려주는 이벤트 발생 */
	    	google.maps.event.addListener(map, 'tilesloaded', function(){
	    		
	    		zoomLevel = map.getZoom();
	    		console.log("tilesloaded : zoomLevel="+zoomLevel);
	    		
	    		$.ajax({
	    			url: "/planSub/json/getCityListByScroll/"+zoomLevel ,
					method: "GET",
					dataType: "json",
					headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
					success: function(JSONData, status){
						//console.log("리턴데이터 있음! => JSONData = "+JSON.stringify(JSONData));	
						//console.log("리턴데이터 리스트...\n cityLat="+JSONData[0].cityLat+"/ cityLng="+JSONData[0].cityLat+"/ cityName="+JSONData[0].cityName);
						
						clearAllMarkers();
						
						var cityList = JSONData;
						for( var i in cityList ){
							var getPosition = new google.maps.LatLng( cityList[i].cityLat , cityList[i].cityLng );
							
							var getMarker = createMarker( cityList[i].cityName, cityList[i].country, getPosition, cityList[i].cityImg, cityList[i].cityInfo );
							getMarker.setMap(map);
							allMarkers.push(getMarker);
							
							//마커 만들기
							/* var getMarker = new google.maps.Marker({ position: getPosition, map: map, icon: myIcon, shape: shape, title: cityList[i].cityName }); */
						} //for문
					},
					error:function(request,status,error){
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				    } 
	    		});	//ajax(getCityListByScroll) 끝
	    		
	    	});	//addListener : tilesloaded
	    	 
	    	
	    	/* function clearAllMarkers() {
	    		for(i=0;i<allMarkers.length;i++){ allMarkers[i].setMap(null);} 
	    		allMarkers=[];
	    	} 
	    	function clearMyMarkers() {
	    		for(i=0;i<myMarkers.length;i++){ myMarkers[i].setMap(null); }
	    		myMarkers=[];
	    	} */
	    	/* function clearRouteLines() {
	    		for(i=0;i<routeLines.length;i++){ routeLines[i].setMap(null); }
	    		routeLines=[];
	    	} */
	    	
	    	
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
		 	
		 	var markerIcon = new google.maps.MarkerImage("/resources/images/icon/circle_red.png", null, null, null, new google.maps.Size(9,9));
		 	var myIcon = new google.maps.MarkerImage("/resources/images/icon/circle_blue.png", null, null, null, new google.maps.Size(12,12));
			
			
			/* 마커 생성 */
	    	function createMarker( city, country, mPosition, img, cityInfo ){
	    		//console.log("create Marker........ city="+city+", country="+country+", mPosition="+mPosition+", img="+img+", cityInfo="+cityInfo );
	    		
	    		//var markerIcon = new google.maps.MarkerImage("/resources/images/icon/circle_red.png", null, null, null, new google.maps.Size(9,9));
	    		
	    		var makingMarker = new google.maps.Marker({
					position: mPosition,
					icon: markerIcon,
					shape: shape,
					title: city
					, zIndex: 1000 
				}); 
	    		
	    		google.maps.event.addListener(makingMarker, 'click', function() {
					console.log("city name = "+makingMarker.title);
					
					if(prv_infowindow){ prv_infowindow.close(); }
					
					var markerLatLng = new google.maps.LatLng( mPosition.lat() , mPosition.lng() );		//구글의 함수로 만든 LatLng 객체라서 lat() 이런식의 함수로 수 뽑아줘야 함
					
					var infowindow = new google.maps.InfoWindow();
					
					var contentHtml = '<div class="media" style="width:300px; height:120px; padding:5px;">';
					contentHtml = contentHtml + '<img class="align-self-start mr-2" src="/resources/images/cityImg/'+img+'" width="60px" height="60px">';
					contentHtml = contentHtml + '<div class="media-body">';
					contentHtml = contentHtml + '<h5 class="mt-0">'+ makingMarker.title +  '<div class="badge badge-primary text-wrap" style="width: 3rem; margin-left:10px; margin-top:0;" onClick="addCityRoute(\'' + makingMarker.title + '\' )">'+'add'+'</div>'  +'</h5>';
					contentHtml = contentHtml + '<p>'+  cityInfo  +'</p>';
					contentHtml = contentHtml + '</div>';
					contentHtml = contentHtml + '</div>';
					
					infowindow.setContent(contentHtml);
					infowindow.setPosition(markerLatLng);
					infowindow.open(map);
					
					prv_infowindow = infowindow;
				}); 
	    		
	    		return makingMarker;
	    	} //createMarker( city, country, mPosition, img, cityInfo )
	    	
	    	
	    	/* 시티루트 리스트의 마커 생성... 나중에 함수 취합 */
	    	function createMyMarker( city, country, mPosition, img, cityInfo ){
	    		console.log("create My Marker.... city="+city+", country="+country+", mPosition="+mPosition+", img="+img+", cityInfo="+cityInfo );
	    		
	    		//var myIcon = new google.maps.MarkerImage("/resources/images/icon/circle_blue.png", null, null, null, new google.maps.Size(12,12));
	    		
	    		var myMarker = new google.maps.Marker({
					position: mPosition,
					icon: myIcon,
					shape: shape,
					title: city
					, zIndex: 2000 
				});
	    		
	    		google.maps.event.addListener(myMarker, 'click', function() {
					console.log("city name = "+myMarker.title);
					
					if(prv_infowindow){ prv_infowindow.close(); }
					
					//var markerLatLng = new google.maps.LatLng( mPosition.lat() , mPosition.lng() );		//구글의 함수로 만든 LatLng 객체라서 lat() 이런식의 함수로 수 뽑아줘야 함
					//console.log(mPosition.lat()+"/"+mPosition.lng() );
					
					var infowindow = new google.maps.InfoWindow();
					
					var contentHtml = '<div class="media" style="width:300px; height:120px; padding:5px;">';
					contentHtml = contentHtml + '<img class="align-self-start mr-2" src="/resources/images/cityImg/'+img+'" width="60px" height="60px">';
					contentHtml = contentHtml + '<div class="media-body">';
					contentHtml = contentHtml + '<h5 class="mt-0">'+ city +  '<div class="badge badge-primary text-wrap" style="width: 3rem; margin-left:10px; margin-top:0;" onClick="addCityRoute(\'' + myMarker.title + '\' )">'+'add'+'</div>'  +'</h5>';
					
					contentHtml = contentHtml + '<p> 시티루트에 담긴 도시입니다~~~~~ </p>';
					contentHtml = contentHtml + '<p>'+  cityInfo  +'</p>';
					contentHtml = contentHtml + '</div>';
					contentHtml = contentHtml + '</div>';
					
					infowindow.setContent(contentHtml);
					infowindow.setPosition(myMarker.position);	//infowindow.setPosition(markerLatLng);
					infowindow.open(map);
					
					prv_infowindow = infowindow;
				}); 
	    		
	    		return myMarker;
	    	} //createMyMarker( city, country, mPosition, img, cityInfo )
	    	
	    	
	    	
	    	
		    /* GoogleMap 에 뿌릴 것들  */
			function initMapItems(){
				
				var bounds = new google.maps.LatLngBounds();
				
				clearMyMarkers();
				
				var cityMarkerList = ${cityMarkerList};
				
				//받아온 마커리스트를 통해 뿌려주기
				for( var i in cityMarkerList ){
					//console.log("cityMarkerList[i] = "+cityMarkerList[i].title)
					//var getPosition = new google.maps.LatLng( cityMarkerList[i].cityLat , cityMarkerList[i].cityLng );
					
					var getMyMarker = createMyMarker( cityMarkerList[i].title, cityMarkerList[i].country, cityMarkerList[i].position, cityMarkerList[i].cityImg, cityMarkerList[i].cityInfo );
					getMyMarker.setMap(map);
					myMarkers.push(getMyMarker);
					
					if( i > 0 ){
						var path = [ myMarkers[i-1].getPosition() , myMarkers[i].getPosition() ];
						routeLines[i-1] = new google.maps.Polyline({
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
						routeLines[i-1].setPath(path);
					}
					bounds.extend(getMyMarker.getPosition()); 
					
				} //for문 
				map.fitBounds(bounds);
			} //initMapItems 끝
			
			
			initMapItems();
			
			/* setTimeout(function(){
				map.setCenter(korea);
				map.setZoom(5);
			}, 50); */
			
			/* 지도 내에 버튼 만들기 */ 
			var leftControlDiv = document.createElement('div');
			var thtml = '<div class="text-center" style="margin-bottom:5px;margin-left:10px;font-weight:bold; background-color:#29B4AC; font-size:10pt;border:solid thin #DDDDDD ; border-radius:5px; padding:10px; color: white;" onClick="controlClick()"><i class="fas fa-door-open" style="font-size: 35px; margin:5px;"></i><br/>플래너 페이지로</div>';
			leftControlDiv.innerHTML = thtml;
			map.controls[google.maps.ControlPosition.LEFT_TOP].push(leftControlDiv);
		    
		};	//initMap()
		/* ------------------------------------ Google Map Script ------------------------------------ */
		
		
		
		function clearAllMarkers() {
    		for(i=0;i<allMarkers.length;i++){ 
    			allMarkers[i].setMap(null); 
    		}
    		allMarkers=[];
    	} 
    	function clearMyMarkers() {
    		console.log("clearMyMarkers......");
    		for(i=0;i<myMarkers.length;i++){
    			myMarkers[i].setMap(null);	
    		}
    		myMarkers=[];
    	}
		function clearRouteLines() {
    		alert("clearRouteLines......");
    		for(i=0;i<routeLines.length;i++){
    			routeLines[i].setMap(null);
    		}
    		routeLines=[];
    	}
		
		
		function getCityRouteList( planId ){
			alert("getCityRouteList("+ planId +") 실행! ");
			
			$.ajax({
				url: "/planSub/json/getCityRouteList/"+planId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){
						alert("리턴데이터 없음");	
					}else{
						alert("리턴데이터 있음! => "+JSON.stringify(JSONData) );	
						
						var bounds = new google.maps.LatLngBounds();
						clearMyMarkers();
						clearRouteLines();
						
						var cityMarkerList = JSONData;
						
						for( var i in JSONData ){
							var getMyMarker = createMyMarker( cityMarkerList[i].title, cityMarkerList[i].country, cityMarkerList[i].position, cityMarkerList[i].cityImg, cityMarkerList[i].cityInfo );
							getMyMarker.setMap(map);
							myMarkers.push(getMyMarker);
							
							if( i > 0 ){
								var path = [ myMarkers[i-1].getPosition() , myMarkers[i].getPosition() ];
								routeLines[i-1] = new google.maps.Polyline({
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
								routeLines[i-1].setPath(path);
							}
							bounds.extend(getMyMarker.getPosition()); 
						}
						map.fitBounds(bounds);
						
						
					}
				},
				error:function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    } 
			}); //ajax
			
		}
		
		
		/* icon 사용을 위한 스크립트 */
		/* https://github.com/feathericons/feather#feather 참고 */
		feather.replace();
		
		//$($('.tran_type')[0]).hide();	//맨 밑으로 보내야함(초기설정 위해)
		
	</script>
	
	<!-- Google Map API -->
	<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMoE1_1g-id6crD_2M4nCDF4IsmcncLU4" type="text/javascript"></script> -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMoE1_1g-id6crD_2M4nCDF4IsmcncLU4&callback=initMap" type="text/javascript"></script>

	
<head>

<meta charset="EUC-KR">
<title>editRoute</title>

</head>
<body ><!-- onload="initializeMap()" -->

	<!-- 화면구성 div Start ///////////////////////////// -->
	<!-- <div class="container"> -->
		<!-- 다단 레이아웃 Start ///////////////////////////// -->
		<!-- <div class="row"> -->
			
			<!-- 좌측 컨테이너 Start ///////////////////////////// -->
			<div id="city_route_list_container" style="width: 28%; height:786px; float: left; border-right: 1 #DEDEDE solid; margin-left: 0px;margin-top: 0px;">
				
				<!-- 좌측 컨테이너 상단 plan_info Start ///////////////////////////// -->
				<div class="plan_info" style="background-color: #ADDFDC; width: 100%; padding: 7px; height: 16%;">
				
					<div class="media" style="width: 100%; padding: 10px;">
					
						<img src="/resources/images/planImg/${plan.planImg}" class="align-self-center mr-2" alt="https://travel-echo.com/wp-content/uploads/2019/11/polynesia-3021072_640-400x250.jpg" style="border-width: 1px; border-color: #D1D1D1; border-style: solid; width: 100px; height: 100px;">

						<div class="media-body">	
						
						    <div style="margin-left: 13px;height: 100px; font-size: 13px;">
						    	<span style="color: #EE0D0D; font-weight: bolder;"><c:if test="${plan.planStatus == 'C'}">여행완료!</c:if></span>
						    	<div class="plan_type plan_buttons">
									<c:choose>
										<c:when test="${plan.planType == 'A'}">여자혼자</c:when>
										<c:when test="${plan.planType == 'B'}">남자혼자</c:when>
										<c:when test="${plan.planType == 'C'}">여자끼리</c:when>
										<c:when test="${plan.planType == 'D'}">남자끼리</c:when>
										<c:when test="${plan.planType == 'E'}">단체</c:when>
										<c:when test="${plan.planType == 'F'}">부모님과</c:when>
										<c:when test="${plan.planType == 'G'}">커플</c:when>
									</c:choose>
									
									<span class="float-right">
										<i id="updatePlanButton" class="fas fa-globe-europe" style="font-size: 15px;"></i>
										<c:if test="${ user.userId == plan.planMaster.userId }">
											<i id="deletePlanButton" class="fas fa-globe-asia" style="font-size: 15px;"></i>
										</c:if>
										<c:if test="${ user.userId != plan.planMaster.userId }">
											<i id="exitPlanButton" class="fas fa-globe-asia" style="font-size: 15px;"></i>
										</c:if>
										<i id="planCompleteButton" class="fas fa-globe-asia" style="font-size: 15px;"></i>
									</span>
								</div>
								
							      <div style="margin: 3px 0;">
							      		<div style="font-weight: bolder; font-size: 19px; display: inline-block;">${plan.planTitle} </div> &emsp;
							      			<c:if test="${plan.planPartySize > 1}"><span data-feather="users"></span></c:if>
							                <c:if test="${plan.planPartySize == 1}"><span data-feather="user"></span></c:if> ${plan.planPartySize}
							      </div>
							      ${plan.startDateString} <c:if test="${plan.endDate != null}"> ~ ${plan.endDate}</c:if> ( ${plan.planTotalDays}일 ) &nbsp;&nbsp;&nbsp;&nbsp; 
							      <c:if test="${plan.planDday == 0}"> D-Day </c:if>
							      <c:if test="${plan.planDday > 0}"> D - ${plan.planDday} </c:if>
						    </div>
						    
						</div> <!-- media body -->
						
					</div>
					
				</div>
				<!-- 좌측 컨테이너 상단 plan_info End ///////////////////////////// -->
				
				
				<!-- 좌측 컨테이너 하단 city_route Start ///////////////////////////// -->
				<div class="city_route" style="background-color: #FFFFFF; width: 100%; height: 84%; overflow: hidden auto;">
				
					<div class="city_route_list ui-sortable">
						<c:if test="${!empty plan.cityList}">
							<c:forEach var="cityRoute" items="${plan.cityList}">
								
								
								<!-- city_route item  start /////////////////////////////////////////////////////// -->
								<%-- <div class="city_route"  style="margin: 5px; padding: 5px; border: 1px solid gray; background-color: white;">
									<span class="float-right" onclick="deleteCityRoute('${cityRoute.cityId}',${plan.cityList.indexOf(cityRoute)} )">X</span>
									<button type="button" class="close" aria-label="Close" onclick="deleteCityRoute('${cityRoute.cityId}',${plan.cityList.indexOf(cityRoute)} )"> <span aria-hidden="true">&times;</span> </button>
									<div class="trans">
										<div class="tran_type" style="border-bottom: 1px solid red;">
											<c:choose>
												<c:when test="${cityRoute.tranType == 'T'}">기차 <i class="fas fa-train" style="font-size: 30px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'B'}">버스 <i class="fas fa-bus" style="font-size: 30px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'A'}">항공 <i class="fas fa-plane" style="font-size: 30px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'F'}">페리 <i class="fas fa-ship" style="font-size: 30px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'E'}">기타 <i class="fas fa-guitar" style="font-size: 30px;"></i></c:when>
												<c:when test="${empty cityRoute.tranType || cityRoute.tranType == ''}">ㄴㄴ<i class="fas fa-plus" style="font-size: 30px;"></i></c:when>
											</c:choose>
											
										</div>
									</div>
									
									<div>
										<div class="cr_cityName">${cityRoute.cityName}</div>
										방문순서: <span class="visit_order">${cityRoute.visitOrder}</span> , 도시ID: <span class="city_id">${cityRoute.cityId}</span>
										<div class="cr_term">${cityRoute.startDateStr} ~ ${cityRoute.endDateStr}</div>
									</div>
									
									<div class="cr_cityDuration">city_duration: ${cityRoute.cityDuration}</div> 
								</div> --%>
								<!-- city_route item   end ////////////////////////////////////////////////////////// -->
								
								
								<!-- ---------------------------------------------------------------------------------------------------------------------- -->
								
								
								<!-- city_route item  NEW  start /////////////////////////////////////////////////////// -->
								<div class="city_route"  style="margin: 5px; padding: 6px;">
									
									<!-- tran_type -->
									<div class="trans d-flex justify-content-center"><!-- 가운데 정렬 -->
										<div class="tran_type" style="font: 7px gray;">
											<c:choose>
												<c:when test="${cityRoute.tranType == 'T'}">기차 <i class="fas fa-train" style="font-size: 50px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'B'}">버스 <i class="fas fa-bus" style="font-size: 50px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'A'}">항공 <i class="fas fa-plane" style="font-size: 50px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'F'}">페리 <i class="fas fa-ship" style="font-size: 50px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'E'}">기타 <i class="fas fa-guitar" style="font-size: 50px;"></i></c:when>
												<c:when test="${empty cityRoute.tranType || cityRoute.tranType == ''}">선택<i class="fas fa-plus" style="font-size: 50px;"></i></c:when>
											</c:choose>
										</div>
									</div>
									
									<!-- X 버튼 -->
									<button type="button" class="close" aria-label="Close" onclick="deleteCityRoute('${cityRoute.cityId}',${plan.cityList.indexOf(cityRoute)} )"> <span aria-hidden="true">&times;</span> </button>
									
									
									<!-- city_route 정보 -->
									<div class="media mt-4" style="border: 1px solid #CDD8D8; padding: 15px 35px 0px 35px;"> <!-- 상 우 하 좌 -->
									
										<!-- hidden 정보 (방문순서, 도시ID) -->
										<div hidden="hidden">방문순서: <span class="visit_order">${cityRoute.visitOrder}</span> , 도시ID: <span class="city_id">${cityRoute.cityId}</span></div>
										
										<img alt="" src="/resources/images/planImg/defaultPlanImage.jpg" class="align-self-center mr-3 city_img" style="width: 50px; height: auto;" hidden="hidden">
										
										<div class="media-body">
											<h5 class="cr_cityName mt-0" style="font-weight:600;">${cityRoute.cityName}</h5>
											<p class="cr_term">${cityRoute.startDateStr} ~ ${cityRoute.endDateStr}</p>
										</div> <!-- media-body -->
									
										<div class="cr_cityDuration_parent rounded-circle" style="border:3px solid #33B9B1; padding: 12px; font-weight: 600;">
											<span class="cr_cityDuration">${cityRoute.cityDuration-1}</span>박
										</div>
									</div> <!-- media -->
								
								</div>
								<!-- city_route item  NEW  end ////////////////////////////////////////////////////////// -->
								
								
							</c:forEach>
						</c:if>
						
						
					</div> 
					<!-- city_route_list end -->
					
					<div style="height: 50px;">
					
					</div>
					
					<!-- <div id="addCityRoute_here" class="text-center" style="margin: 20px 40px; padding: 20px; border: 1px solid white; border-radius:5px; background-color: #7DCFCA;">
						도시 추가하기
					</div> -->
					
				</div>
				<!-- 좌측 컨테이너 하단 city_route End ///////////////////////////// -->
				
			</div>
			<!-- 좌측 컨테이너 End ///////////////////////////// -->
			
			
			
			<!-- 지도 컨테이너 Start ///////////////////////////// -->
			<div id="map_container" style="width: 72%;height:786px;float: left;">
				<div id="map" style="border:1px solid #e5e5e5;width:100%;height: 100%;"></div>
			</div>
			<!-- 지도 컨테이너 End ///////////////////////////// -->
			
			
			
		<!-- </div> -->
		<!-- 다단 레이아웃 End ///////////////////////////// -->
	<!-- </div> -->
	<!-- 화면구성 div End ///////////////////////////// -->


	<!-- <div style="position: absolute; top: 10px; right: 20px; background-color: white; border: 1px solid; width: 200px; height: 300px;"> 
		테스트용 창<br/> 
		00: <span id="s00">01</span><br/>
		<div id="click" style="border: 1px solid gray; background-color: black; padding: 10px;" onclick="clearRouteLines()">clearButton</div>
	</div> -->
	
	

	<script type="text/javascript">
	
		$($('.tran_type')[0]).hide();
		
	</script>
	
</body>
</html>