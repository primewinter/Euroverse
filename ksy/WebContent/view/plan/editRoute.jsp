<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>editRoute</title>
	
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
	
	
	<!-- FontAwesome CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- jquery Ui ��ũ (datePicker)  -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!--datePicker CDN  -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	
	<!-- ICON ����� ���� ��ũ��Ʈ ����Ʈ : https://feathericons.com/ -->
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

	<!-- �Լ��� ������ -->
	<script type="text/javascript">
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

<head>

<meta charset="EUC-KR">
<title>editRoute</title>

</head>
<body>

	<!-- ȭ�鱸�� div Start ///////////////////////////// -->
	<!-- <div class="container"> -->
		<!-- �ٴ� ���̾ƿ� Start ///////////////////////////// -->
		<!-- <div class="row"> -->
			
			<!-- ���� �����̳� Start ///////////////////////////// -->
			<div id="city_route_list_container" style="width: 28%; height:786px; float: left; border-right: 1 #DEDEDE solid; margin-left: 0px;margin-top: 0px;">
			
				<div class="plan_info" style="background-color: #F3F7F6; width: 100%; padding: 10px; height: 20%;">
				
					<div class="row" style="width: 100%; padding: 10px;">
					
						<img src="/resources/images/planImg/${plan.planImg}" class="align-self-center" alt="https://travel-echo.com/wp-content/uploads/2019/11/polynesia-3021072_640-400x250.jpg" style="border-width: 1px; border-color: #D1D1D1; border-style: solid; width: 100px; height: 90px;">
					    
					    <div style="margin-left: 13px; height: 100px; font-size: 13px;">
					    
					    
						    <div>
								<i id="updatePlanButton" class="fas fa-globe-europe" style="font-size: 30px;"></i>
								<c:if test="${ user.userId == plan.planMaster.userId }">
									<i id="deletePlanButton" class="fas fa-globe-asia" style="font-size: 30px;"></i>
								</c:if>
								<c:if test="${ user.userId != plan.planMaster.userId }">
									<i id="exitPlanButton" class="fas fa-globe-asia" style="font-size: 30px;"></i>
								</c:if>
								<i id="planCompleteButton" class="fas fa-globe-asia" style="font-size: 30px;"></i>
							</div>
					    
					    
					    
					    	<span style="color: #EE0D0D; font-weight: bolder;"><c:if test="${plan.planStatus == 'C'}">����Ϸ�!</c:if></span>
					    	<div class="plan_type">
								<c:choose>
									<c:when test="${plan.planType == 'A'}">����ȥ��</c:when>
									<c:when test="${plan.planType == 'B'}">����ȥ��</c:when>
									<c:when test="${plan.planType == 'C'}">���ڳ���</c:when>
									<c:when test="${plan.planType == 'D'}">���ڳ���</c:when>
									<c:when test="${plan.planType == 'E'}">��ü</c:when>
									<c:when test="${plan.planType == 'F'}">�θ�԰�</c:when>
									<c:when test="${plan.planType == 'G'}">Ŀ��</c:when>
								</c:choose>
							</div>
						      <div style="margin: 3px 0;">
						      		<div style="font-weight: bolder; font-size: 19px; display: inline-block;">${plan.planTitle} </div> &emsp;
						      			<c:if test="${plan.planPartySize > 1}"><span data-feather="users"></span></c:if>
						                <c:if test="${plan.planPartySize == 1}"><span data-feather="user"></span></c:if> ${plan.planPartySize}
						      </div>
						      ${plan.startDateString} <c:if test="${plan.endDate != null}"> ~ ${plan.endDate}</c:if> ( ${plan.planTotalDays}�� ) &nbsp;&nbsp;&nbsp;&nbsp; 
						      <c:if test="${plan.planDday == 0}"> D-Day </c:if>
						      <c:if test="${plan.planDday > 0}"> D - ${plan.planDday} </c:if>
					    
					    
					    
					    
					    
					    </div>
					    
					    
					    
					    
					    
					    
					</div>
					
					    
					
					
				</div>
				
				
				
				
				<div class="city_route" style="background-color: #D6F0EE; width: 100%; height: 80%; overflow: hidden auto;">
				
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>
					city_route area<br/>

				
					
				
				</div>
				
				
				
			</div>
			<!-- ���� �����̳� End ///////////////////////////// -->
			
			
			<!-- ���� �����̳� Start ///////////////////////////// -->
			<div id="map_container" style="width: 72%;height:786px;float: left;">
			
				<div id="map" style="border:1px solid #e5e5e5;width:100%;height: 100%;"></div>
				
			</div>
			<!-- ���� �����̳� End ///////////////////////////// -->
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		
		
		<!-- </div> -->
		<!-- �ٴ� ���̾ƿ� End ///////////////////////////// -->
	<!-- </div> -->
	<!-- ȭ�鱸�� div End ///////////////////////////// -->



	
	<!-- body �ε� �� ����Ǿ�� �ϴ� ��ũ��Ʈ ����  -->
	<script>
	
	 	/* ------------------------------------ Google Map Script ------------------------------------ */
		var map;
		var geocoder;
		var overlay;
		var marker=[];
		var routelines=[];
		
		var allMarkers = [];
		var myMakers = [];
		var prv_infowindow;
		
		var korea = {lat:37.497957 , lng:127.027780};
	
		// initMap !!!!!!!!!!!
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
		        	  { "featureType": "water", "elementType": "geometry", "stylers": [ { "color": "#C3FFFB" } ] },
		        	  /* { "featureType": "water", "elementType": "labels.text", "stylers": [ { "visibility": "off" } ] } */
		        ]
		    });
		    
	    	 
	    	// ��ũ��(zoom) �Ҷ����� �̺�Ʈ �߻�
	    	google.maps.event.addListener(map, 'tilesloaded', function(){
	    		
	    		zoomLevel = map.getZoom();
	    		console.log("tilesloaded : zoomLevel="+zoomLevel);
	    		
	    		$.ajax({
	    			url: "/planSub/json/getCityListByScroll/"+zoomLevel ,
					method: "GET",
					dataType: "json",
					headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
					success: function(JSONData, status){
						if( JSONData==null || JSONData=="" ){		
							console.log("���ϵ����� ����");	
						}else{		
							console.log("���ϵ����� ����! => JSONData = "+JSON.stringify(JSONData));	
							console.log("���ϵ����� ����Ʈ...\n cityLat="+JSONData[0].cityLat+"/ cityLng="+JSONData[0].cityLat+"/ cityName="+JSONData[0].cityName);
							
							clearAllMarkers();
							
							var cityList = JSONData;
							
							
							
							for( var i in cityList ){
								var getPosition = new google.maps.LatLng( cityList[i].cityLat , cityList[i].cityLng );
								var getMarker = new google.maps.Marker({
									position: getPosition,
									map: map,
									icon: myIcon,
									shape: shape,
									title: cityList[i].cityName
								});
								
								allMarkers.push(getMarker);
									
								/* marker[i] = new google.maps.Marker({
									position: cityMarkerList[i].position,
									map: map,
									icon: myIcon,
									shape: shape,
									title: cityMarkerList[i].title
								}); */
							}
						
						}
					},
					error:function(request,status,error){
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
				    } 
	    		});	//ajax(getCityListByScroll) ��
	    		
	    		
	    		
	    		
	    		
	    	});
	    	 
	    	 
	    	 
	    	 
	    	function clearAllMarkers() {
	    		for(i=0;i<allMarkers.length;i++)
	    			allMarkers[i].setMap(null);
	    		allMarkers=[];
	    	} 
	    	function clearMyMarkers() {
	    		for(i=0;i<myMarkers.length;i++)
	    			myMarkers[i].setMap(null);
	    		myMarkers=[];
	    	}
	    	 
	    	
	    	 
	    	
	    	 
	    	/* ��������! */
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
		 	
		 	var myIcon = new google.maps.MarkerImage("/resources/images/icon/red_circle.png", null, null, null, new google.maps.Size(20,20));
	    	 
		    /* GoogleMap �� �Ѹ� �͵�  */
			function initMapItems(){
				console.log("initMapItems() ����");
				
				var bounds = new google.maps.LatLngBounds();
				
				var cityMarkerList = ${cityMarkerList};
				
				
				for( var i in cityMarkerList ){
					console.log("cityMarkerList[i] = "+cityMarkerList[i])
					
					marker[i] = new google.maps.Marker({
							position: cityMarkerList[i].position,
							map: map,
							icon: myIcon,
							shape: shape,
							title: cityMarkerList[i].title
					});
					
					
					var string = " ��Ŀ Ŭ�� => cityName="+cityMarkerList[i].title;
					
					
					google.maps.event.addListener(marker[i], 'click', function() {
						
						console.log(string);
						
						if(prv_infowindow){
							prv_infowindow.close();
						}
						
						var infowindow = new google.maps.InfoWindow();
						
						infowindow.setContent(" info window content ");
						infowindow.setPosition(cityMarkerList[i].position);
						infowindow.open(map);
						
						
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
						alert(" ��Ŀ Ŭ�� => cityName="+cityMarkerList[i].title);
					}); */
					
				}
				map.fitBounds(bounds);
				
			} //initMapItems ��
			
			initMapItems();
			
			
			
			
			
			
			
			
			
			//map.setCenter(cityMarkerList[0].position);
			//map.setZoom(5);
		    
			/* ���� ���� ��ư ����� */ 
			var leftControlDiv = document.createElement('div');
			var thtml = '<div style="margin-bottom:5px;margin-left:10px;font-weight:bold; color:#383AE4; font-size:10pt;border:solid thin #DDDDDD ; border-radius:5px; padding:10px; background-color: white;" onClick="controlClick()">${plan.startDateString.substring(0,10)} ���</div>';
			leftControlDiv.innerHTML = thtml;
			map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(leftControlDiv);
		    
		};
		/* ------------------------------------ Google Map Script ------------------------------------ */
		
		/* icon ����� ���� ��ũ��Ʈ */
		/* https://github.com/feathericons/feather#feather ���� */
		feather.replace();
	
	</script>
	
	
	<!-- Google Map API -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMoE1_1g-id6crD_2M4nCDF4IsmcncLU4&callback=initMap" type="text/javascript"></script>
	

</body>
</html>