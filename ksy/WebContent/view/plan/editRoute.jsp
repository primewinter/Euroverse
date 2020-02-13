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
	
		var planId = ${plan.planId};	//���� ��ȸ���� plan�� ���̵� �ھƵα�
	
		$(function(){
			$('#updatePlanButton').on('click', function(){
				alert('#updatePlanButton Ŭ��! �÷��� ���� �Լ� ȣ��');
			});
			
			$('#deletePlanButton').on('click', function(){
				alert('#deletePlanButton Ŭ��! �÷��� ���� �Լ� ȣ��');
			});
			
			$('#exitPlanButton').on('click', function(){
				alert('#exitPlanButton Ŭ��! �÷��� Ż�� �Լ� ȣ��');
			});
			
			$('#planCompleteButton').on('click', function(){
				alert('#planCompleteButton Ŭ��! �÷��� ����Ϸ� �Լ� ȣ��');
			});
			
			
		});
		
		
		function reorder() {
			console.log("reorder() ����")
			
		    $(".city_route").each(function(i, box) {
		    	var cityId = $(box).find(".city_id").text().trim();
		    	var index = $(".city_route").index($(box));
		        $(box).find(".visit_order").html(i);
		        console.log(" reorder ����! => "+$(box)+"/cityId="+ cityId +", i="+i + ", index="+index );
		        if( i == 1){
		        	$(box).find(".tran_type").hide();
		        }else{
		        	$(box).find(".tran_type").show();
		        }
		        
		        updateVisitOrder( cityId, i );
		    });
		}
		
		function updateVisitOrder( cityId, visitOrder ){
			console.log("updateVisitOrder("+ cityId +", "+ visitOrder +") ����");
			
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
						console.log("���ϵ����� ����");	
					}else{
						console.log("���ϵ����� ����! => "+JSON.stringify(JSONData) );	
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			}); //ajax
			
		} //updateVisitOrder( )
		
		
		function deleteCityRoute( cityId, visitOrder ){
			var visitOrderNew  = visitOrder+1;	//���� �� �̹� �ο��� ���� ����... �ʿ����!!!!!!
			var indexNew = $(".city_id").index( $(".city_id:contains('"+cityId+"')") )+1;
			
			if(confirm( "������ ��δ� ������ �Ұ����մϴ�.\n���� �����Ͻðڽ��ϱ�? "+"/ indexNew="+indexNew ))
			{
				console.log( indexNew + "��° cityRoute ����"  );
				$($(".city_route")[indexNew] ).remove();
				//$("#cityblock"+idx).remove();
				
				console.log("cityId="+ cityId +" ������");
				
				$.ajax({
					url: "/planSub/json/deleteCityRoute/"+cityId+"/"+planId ,	//planId �ʿ������..
					method: "GET",
					dataType: "json",
					headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
					success: function(JSONData, status){
						if( JSONData==null || JSONData=="" ){
							console.log("���ϵ����� ����");	
						}else{
							console.log("���ϵ����� ����! => "+JSON.stringify(JSONData) );	
						}
					},
					error:function(request,status,error){
				        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
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
				
				/* �巡�� ���۽� ȣ��Ǵ� �̺�Ʈ �ڵ鷯 */
				start: function(event, ui){	
					console.log("sortable start!");
					
					ui.item.data('start_pos', ui.item.index());		
					// ui.item.index() <- �巡���ϴ� �������� ��ġ�� ������ (ù��° ������=0)
					// ui.item.data(key, value) <- �����ۿ� Ű,�� ������ �����͸� ����
				},
				/* ����� ȣ��Ǵ� �̺�Ʈ �ڵ鷯 */
				stop: function(event, ui){	// = stop: function(e,ui) ????
					console.log("sortable stop!");
					var spos = ui.item.data('start_pos');
					var epos = ui.item.index();
					
					reorder();	//���� ����� ��� itemBox ���� itemNum(�Է��ʵ� ���� ����)�� ��ȣ�� ������� �ٽ� ����
				}
			});
			
			$('.city_route_list').disableSelection();
		});
		
		
		function addCityRoute(cityName){
			var nextVisitOrder = $(".city_route").size();
			alert("addCityRoute() ����! : cityName="+cityName+" (planId="+planId+") / nextVisitOrder="+nextVisitOrder);
			
			
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
						console.log("���ϵ����� ����");	
					}else{
						console.log("���ϵ����� ����! => "+JSON.stringify(JSONData) );	
						
						var crHtml = '<div class="city_route"  style="margin: 5px; padding: 5px; border: 1px solid gray; background-color: white;">';
						crHtml = crHtml + '<span class="float-right" onclick="deleteCityRoute(\''+ JSONData.cityId +'\', 0 )">X</span>';
						crHtml = crHtml + '<div class="trans">';
						crHtml = crHtml + '<div class="tran_type" style="border-bottom: 1px solid red;">';
						
						if( JSONData.tranType == 'T' ){
							crHtml = crHtml + '���� <i class="fas fa-train" style="font-size: 30px;"></i>';
						}else if( JSONData.tranType == 'B' ){
							crHtml = crHtml + '���� <i class="fas fa-bus" style="font-size: 30px;"></i>';
						}else if( JSONData.tranType == 'A' ){
							crHtml = crHtml + '�װ� <i class="fas fa-plane" style="font-size: 30px;"></i>';
						}else if( JSONData.tranType == 'F' ){
							crHtml = crHtml + '�丮 <i class="fas fa-ship" style="font-size: 30px;"></i>';
						}else if( JSONData.tranType == 'E' ){
							crHtml = crHtml + '��Ÿ <i class="fas fa-guitar" style="font-size: 30px;"></i>';
						}else if( JSONData.tranType == null || JSONData.tranType == '' ){
							crHtml = crHtml + '���� <i class="fas fa-guitar" style="font-size: 30px;"></i>';
						}
						
						
						crHtml = crHtml + '</div>';
						crHtml = crHtml + '</div>';
						
						crHtml = crHtml + '<div>';
						crHtml = crHtml + '<div class="cr_cityName">'+JSONData.cityName+'</div>';
						crHtml = crHtml + '�湮����: <span class="visit_order">'+JSONData.visitOrder+'</span> , ����ID: <span class="city_id">'+ JSONData.cityId +'</span>';
						crHtml = crHtml + '<div class="cr_term">'+ JSONData.startDateStr +' ~ '+ JSONData.endDateStr +'</div>';
						crHtml = crHtml + '</div>';
						crHtml = crHtml + '<div class="cr_cityDuration">city_duration: '+ JSONData.cityDuration +'</div>';
						crHtml = crHtml + '</div>';
						
						$(crHtml).appendTo('.city_route_list');
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			}); //ajax
			
			//reorder();
		}
	
	
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
				
				<!-- ���� �����̳� ��� plan_info Start ///////////////////////////// -->
				<div class="plan_info" style="background-color: #F3F7F6; width: 100%; padding: 10px; height: 17%;">
				
					<div class="media" style="width: 100%; padding: 10px;">
					
						<img src="/resources/images/planImg/${plan.planImg}" class="align-self-center mr-2" alt="https://travel-echo.com/wp-content/uploads/2019/11/polynesia-3021072_640-400x250.jpg" style="border-width: 1px; border-color: #D1D1D1; border-style: solid; width: 100px; height: 100px;">

						<div class="media-body">	
						
						    <div style="margin-left: 13px;height: 100px; font-size: 13px;">
						    	<span style="color: #EE0D0D; font-weight: bolder;"><c:if test="${plan.planStatus == 'C'}">����Ϸ�!</c:if></span>
						    	<div class="plan_type plan_buttons">
									<c:choose>
										<c:when test="${plan.planType == 'A'}">����ȥ��</c:when>
										<c:when test="${plan.planType == 'B'}">����ȥ��</c:when>
										<c:when test="${plan.planType == 'C'}">���ڳ���</c:when>
										<c:when test="${plan.planType == 'D'}">���ڳ���</c:when>
										<c:when test="${plan.planType == 'E'}">��ü</c:when>
										<c:when test="${plan.planType == 'F'}">�θ�԰�</c:when>
										<c:when test="${plan.planType == 'G'}">Ŀ��</c:when>
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
							      ${plan.startDateString} <c:if test="${plan.endDate != null}"> ~ ${plan.endDate}</c:if> ( ${plan.planTotalDays}�� ) &nbsp;&nbsp;&nbsp;&nbsp; 
							      <c:if test="${plan.planDday == 0}"> D-Day </c:if>
							      <c:if test="${plan.planDday > 0}"> D - ${plan.planDday} </c:if>
						    </div>
						    
						    
							
						</div> <!-- media body -->
						
					</div>
					
				</div>
				<!-- ���� �����̳� ��� plan_info End ///////////////////////////// -->
				
				
				<!-- ���� �����̳� �ϴ� city_route Start ///////////////////////////// -->
				<div class="city_route" style="background-color: #FFFFFF; width: 100%; height: 83%; overflow: hidden auto;">
				
					<div class="city_route_list ui-sortable">
						<c:if test="${!empty plan.cityList}">
							<c:forEach var="cityRoute" items="${plan.cityList}">
								
								
								<!-- city_route item  start /////////////////////////////////////////////////////// -->
								<div class="city_route"  style="margin: 5px; padding: 5px; border: 1px solid gray; background-color: white;">
									<span class="float-right" onclick="deleteCityRoute('${cityRoute.cityId}',${plan.cityList.indexOf(cityRoute)} )">X</span>
									<div class="trans">
										<div class="tran_type" style="border-bottom: 1px solid red;">
											<c:choose>
												<c:when test="${cityRoute.tranType == 'T'}">���� <i class="fas fa-train" style="font-size: 30px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'B'}">���� <i class="fas fa-bus" style="font-size: 30px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'A'}">�װ� <i class="fas fa-plane" style="font-size: 30px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'F'}">�丮 <i class="fas fa-ship" style="font-size: 30px;"></i></c:when>
												<c:when test="${cityRoute.tranType == 'E'}">��Ÿ <i class="fas fa-guitar" style="font-size: 30px;"></i></c:when>
											</c:choose>
											
										</div>
									</div>
									
									<div>
										<div class="cr_cityName">${cityRoute.cityName}</div>
										�湮����: <span class="visit_order">${cityRoute.visitOrder}</span> , ����ID: <span class="city_id">${cityRoute.cityId}</span>
										<div class="cr_term">${cityRoute.startDateStr} ~ ${cityRoute.endDateStr}</div>
									</div>
									
									<div class="cr_cityDuration">city_duration: ${cityRoute.cityDuration}</div> 
								</div>
								<!-- city_route item  end ////////////////////////////////////////////////////////// -->
								
							</c:forEach>
						</c:if>
						
						
						
					</div> 
					<!-- city_route_list end -->
					
					
					<div id="addCityRoute_here" class="text-center" style="margin: 20px 40px; padding: 20px; border: 1px solid white; border-radius:5px; background-color: #7DCFCA;">
						���� �߰��ϱ�
					</div>
					
				</div>
				<!-- ���� �����̳� �ϴ� city_route End ///////////////////////////// -->
				
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

	<!-- <div style="position: absolute; top: 10px; right: 20px; background-color: white; border: 1px solid; width: 200px; height: 300px;"> 
		�׽�Ʈ�� â<br/> 
		00: <span id="s00">01</span><br/>
		01: <span id="s01">02</span><br/>
		02: <span id="s02">03</span><br/>
		03: <span id="s03">04</span><br/>
		04: <span id="s04">05</span><br/>
	</div> -->

	
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
		        	  { "featureType": "water", "elementType": "geometry", "stylers": [ { "color": "#DAF8F6" } ] },
		        	  /* { "featureType": "water", "elementType": "labels.text", "stylers": [ { "visibility": "off" } ] } */
		        ]
		    });
		    
	    	 
	    	/* ��ũ��(zoom) �Ҷ����� ���ø���Ʈ �����ͼ� �ѷ��ִ� �̺�Ʈ �߻� */
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
								
								//var imgUrl = '/resources/images/cityImg/city_img.jpg';
								
								var getPosition = new google.maps.LatLng( cityList[i].cityLat , cityList[i].cityLng );
								
								//��Ŀ �����
								/* var getMarker = new google.maps.Marker({
									position: getPosition, map: map, icon: myIcon, shape: shape, title: cityList[i].cityName
								}); */
								
								var getMarker = createMarker( cityList[i].cityName, cityList[i].country, getPosition, cityList[i].cityImg, cityList[i].cityInfo );
								getMarker.setMap(map);
								allMarkers.push(getMarker);
								
							} //for��
						} //if-else
					},
					error:function(request,status,error){
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
				    } 
	    		});	//ajax(getCityListByScroll) ��
	    		
	    	});	//addListener : tilesloaded
	    	 
	    	
	    	function createMarker( city, country, mPosition, img, cityInfo ){
	    		console.log("create Marker........ city="+city+", country="+country+", mPosition="+mPosition+", img="+img+", cityInfo="+cityInfo );
	    		//var image = { url: imgUrl};
	    		
	    		var makingMarker = new google.maps.Marker({
					position: mPosition,
					icon: myIcon,
					shape: shape,
					title: city
				}); 
	    		
	    		google.maps.event.addListener(makingMarker, 'click', function() {
					console.log("city name = "+makingMarker.title);
					
					if(prv_infowindow){
						prv_infowindow.close();
					}
					
					var markerLatLng = new google.maps.LatLng( mPosition.lat() , mPosition.lng() );		//������ �Լ��� ���� LatLng ��ü�� lat() �̷����� �Լ��� �� �̾���� ��
					//console.log(mPosition.lat()+"/"+mPosition.lng() );
					
					var infowindow = new google.maps.InfoWindow();
					
					var contentHtml = '<div class="media" style="width:300px; height:120px; padding:5px;">';
					//contentHtml = contentHtml + '<div style="height:50px; margin-bottom:10px;">';
					contentHtml = contentHtml + '<img class="align-self-start mr-2" src="/resources/images/cityImg/'+img+'" width="60px" height="60px">';
					
					contentHtml = contentHtml + '<div class="media-body">';
					contentHtml = contentHtml + '<h5 class="mt-0">'+ makingMarker.title +  '<div class="badge badge-primary text-wrap" style="width: 3rem; margin-left:10px; margin-top:0;" onClick="addCityRoute(\'' + makingMarker.title + '\' )">'+'add'+'</div>'  +'</h5>';
					contentHtml = contentHtml + '<p>'+  cityInfo  +'</p>';
					contentHtml = contentHtml + '</div>';
					contentHtml = contentHtml + '</div>';
					
					
					//contentHtml = contentHtml + '<div class="badge badge-primary text-wrap" style="width: 6rem;" onClick="addCityRoute(\'' + makingMarker.title + '\' )">'+'This text should wrap.'+'</div>';
					//contentHtml = contentHtml + '<button type="button" class="btn btn-primary" id="addCityRouteButton" onClick="addCityRoute(\'' + makingMarker.title + '\' )">+</button>'+'</div>';
					//contentHtml = contentHtml + '<div style="height:90px;">'+ cityInfo +'</div>';
					//contentHtml = contentHtml + '</div>';
					
					
					infowindow.setContent(contentHtml);
					infowindow.setPosition(markerLatLng);
					infowindow.open(map);
					
					prv_infowindow = infowindow;
				}); 
	    		
	    		return makingMarker;
	    	}
	    	 
	    	 
	    	function clearAllMarkers() {
	    		console.log("clearAllMarkers......");
	    		for(i=0;i<allMarkers.length;i++)
	    			allMarkers[i].setMap(null);
	    		allMarkers=[];
	    	} 
	    	function clearMyMarkers() {
	    		console.log("clearMyMarkers......");
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
		 	
		 	var myIcon = new google.maps.MarkerImage("/resources/images/icon/red_circle.png", null, null, null, new google.maps.Size(12,12));
	    	 
		    /* GoogleMap �� �Ѹ� �͵�  */
			function initMapItems(){
				console.log("initMapItems() ����");
				
				var bounds = new google.maps.LatLngBounds();
				
				var cityMarkerList = ${cityMarkerList};
				
				//�޾ƿ� ��Ŀ����Ʈ�� ���� �ѷ��ֱ�
				for( var i in cityMarkerList ){
					console.log("cityMarkerList[i] = "+cityMarkerList[i])
					
					marker[i] = new google.maps.Marker({
							position: cityMarkerList[i].position,
							map: map,
							icon: myIcon,
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
						alert(" ��Ŀ Ŭ�� => cityName="+cityMarkerList[i].title);
					}); */
					
				} //for�� end
				
				map.fitBounds(bounds);
				
				
			} //initMapItems ��
			
			initMapItems();
			
			
			/* setTimeout(function(){
				map.setCenter(korea);
				map.setZoom(5);
			}, 50); */
			
			
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
	
		
		
		
		$($('.tran_type')[0]).hide();
	</script>
	
	
	<!-- Google Map API -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMoE1_1g-id6crD_2M4nCDF4IsmcncLU4&callback=initMap" type="text/javascript"></script>
	

</body>
</html>