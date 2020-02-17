<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>Plan test page</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- 부트스트랩 4.4 쓰려다가 빠꾸...............................했다가 다시 4.4로..  -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>




<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">




<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>



	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->

	<!-- Bootstrap Dropdown Hover CSS -->
   	<!-- <link href="/css/animate.min.css" rel="stylesheet">
  	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> -->
   
    <!-- Bootstrap Dropdown Hover JS -->
   <!-- 	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->


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
	</style>


<script type="text/javascript">
	
	$(function(){
		$('#ajax').on('click', function(){
			
			console.log("에이작스 버튼 클릭");
			var planId = $("input[name='planId']").val();
			
			
			$.ajax({
				url: "/plan/json/getTodoList/"+planId,
				method: "GET",
				dataType: "json",
				headers: {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success: function(JSONData, status){
					if( JSONData==""){
						alert("리턴데이터 없음");	
					}else{
						var appendHtml = "<div>"+" JSONData[0].todoName = "+JSONData[0].todoName+"</div>"
						$("#myModal1 .modal-body").append(appendHtml);
					}
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    } 
			});
		});
		
		$('#ajaxTest').on('click', function(){
			$('#myModal2').show();
		});
		
		
		$('#addMemo').on('click', function(){
			
			console.log("addMemo() 시작");
			var planId = $("input[name='planId2']").val();
			var memoDetail = $("input[name='memoDetail']").val();
			var memoRegUser = $("input[name='memoRegUser']").val();
			
			
			$.ajax({
				url: "/planSub/json/addMemo",
				method: "POST",
				dataType: "json",
				data: JSON.stringify({
					planId: planId,
					memoDetail: memoDetail,
					memoRegUser: memoRegUser
				}),
				headers: {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success: function(JSONData, status){
					
					alert("JSONData[0] : "+JSONData[0].memoDetail+"\n JSONData[1] : "+JSONData[1].memoDetail);
				
					/* var appendHtml = "<div>"+" JSONData[0] = "+JSONData[0]+"</div>"
					$('.modal-body').append(appendHtml); */
					
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    } 
			});
		});
		
	});
	
	
</script>

</head>
<body>


블라블라<br/>

<a href="/index.jsp" >다시 메인으로</a><br/><br/>
<button type="button" class="btn btn-primary" id="ajaxTest">ajax 테스트 버튼</button><br/><br/>


<a href="/plan/getPlanList?userId=admin">getPlanList</a><br/><br/>

<div class="container-fluid">
  <div class="row">
  
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="#">
              <span data-feather="home"></span>
              Todo 리스트 <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file"></span>
             	여행루트
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="shopping-cart"></span>
             	예산
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="users"></span>
             	일정
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="bar-chart-2"></span>
              	준비물 리스트
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="layers"></span>
              	메모
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="d-flex align-items-center text-muted" href="#">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Last quarter
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Social engagement
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Year-end sale
            </a>
          </li>
        </ul>
      </div>
    </nav>

 	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
 	
 	<div>
 		<button type="button" class="btn btn-primary" id="test">test 버튼</button><br/><br/>
 		<div id="map"></div>
 		<br/><br/>
 	</div>
 
 	
 	
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group mr-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            This week
          </button>
        </div>
      </div>

      <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

      <h2>Section title</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>#</th>
              <th>Header</th>
              <th>Header</th>
              <th>Header</th>
              <th>Header</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1,001</td>
              <td>Lorem</td>
              <td>ipsum</td>
              <td>dolor</td>
              <td>sit</td>
            </tr>
            <tr>
              <td>1,002</td>
              <td>amet</td>
              <td>consectetur</td>
              <td>adipiscing</td>
              <td>elit</td>
            </tr>
            <tr>
              <td>1,003</td>
              <td>Integer</td>
              <td>nec</td>
              <td>odio</td>
              <td>Praesent</td>
            </tr>
            <tr>
              <td>1,003</td>
              <td>libero</td>
              <td>Sed</td>
              <td>cursus</td>
              <td>ante</td>
            </tr>
            <tr>
              <td>1,004</td>
              <td>dapibus</td>
              <td>diam</td>
              <td>Sed</td>
              <td>nisi</td>
            </tr>
            <tr>
              <td>1,005</td>
              <td>Nulla</td>
              <td>quis</td>
              <td>sem</td>
              <td>at</td>
            </tr>
            
          </tbody>
        </table>
        <br/><br/><br/><br/>
      </div>
  
    </main>
  </div>
</div>









<script>

	var map;
	var geocoder;
	var overlay;
	var marker=[];
	var routelines=[];
	
	var uluru = {lat: -25.344, lng: 131.036};
	var paris = {lat: 48.856667, lng: 2.350833};
	var korea = {lat:37.497957 , lng:127.027780};

	function initMap() {
		console.log("initMap 실행하기~~~~");
		
		geocoder = new google.maps.Geocoder();
	    map = new google.maps.Map(document.getElementById('map'), {
	        center: paris,
	        zoom: 3,
	        /* zoom: 1: World
	        5: Landmass/continent
	        10: City
	        15: Streets
	        20: Buildings */
	        mapTypeId :'terrain' 
	    });
	     
	    marker = new google.maps.Marker({
	    	 position: paris, 
	    	 map: map,
	    	 title: 'marker Title!!'
	    	 });
	};

	function clickEvent(marker , contentString){
		 var infoWindow = new google.maps.InfoWindow({
			 content:contentString
		 });
		 marker.addListener('click',function(){
			 alert("여기는"+marker.get('position'));
			 alert('오옹~'+infoWindow.getContent());
			 infoWindow.open(map,marker);
		 });
	};
	

	
	$(function() {
		$('#test').on('click', function() {
			console.log("버튼 클릭");
			
			marker[0] = new google.maps.Marker({
		    	 position: paris, 
		    	 map: map,
		    	 title: '파리',
		    		zIndex: 10000
		    	 });
			marker[1] = new google.maps.Marker({
		          map: map,
		          position: {lat:50.8466245793837, lng: 4.3511438369751},
		            title: "브뤼셀",
		            zIndex: 5000
		        });
			
			var path = [marker[0].getPosition(), marker[1].getPosition()];
			routelines[0] = new google.maps.Polyline({
		        strokeColor: '#696969',
		          strokeOpacity: 1.0,
		          strokeWeight:1,
		          geodesic: false,
		          icons: [{
		            offset: '95%'
		          }],
		          map: map
		        });
			routelines[0].setPath(path);
			
			var bounds = new google.maps.LatLngBounds();
			bounds.extend(marker[0].getPosition());
			
			map.fitBounds(bounds);
			
			map.setCenter(paris);
			map.setZoom(5);
			
			
			var infoWindow = new google.maps.InfoWindow({
				
				//content : "마커찍기 테스트 <br/><br/><button type='button' class='btn btn-primary' id='button01'  data-toggle='modal' data-target='#myModal' >버튼01</button><br/>"
				content : "마커찍기 테스트 <br/><br/><button type='button' class='btn btn-primary' id='button01'  onClick='button01Click()'>버튼01</button><br/>"
			});
			infoWindow.open(map, marker[0]);
			
			
		});
	});
	
	
	var leftControlDiv = document.createElement('div');
	var thtml = '<div style="margin-bottom:5px;margin-left:10px;font-size:10pt;" onclick="openStartDateModal()">20200202</div>';
	leftControlDiv.innerHTML = thtml;
	map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(leftControlDiv);
	
	

	
	
	var moTitle;
	var moHtml;
	
	function openInvitationPage(){
		modalTitle = "플래너 일행 초대하기";
		moHtml = "";
		console.log("openInvitationPage() ");
		$('#myModal1').show();
		
	}
	
	function button01Click() {
		console.log("버튼01 클릭!!!");
		
		openInvitationPage();
	}
	
	function closeMyModal(number) {
		$("#myModal"+number).hide();
	}

</script>


<div class="modal"  id="myModal1" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeMyModal(1)">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
        
        <form class="form-horizontal">
        	<div class="form-group">
			    <label for="planId" class="col-sm-offset-1 col-sm-3 control-label">플랜 아이디</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="planId" name="planId" placeholder="플랜 아이디 입력">
			    </div>
			</div>
			
        </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeMyModal(1)">Close</button>
        <button type="button" class="btn btn-primary" id="ajax">getTodoList</button>
      </div>
    </div>
  </div>
</div>



<div class="modal"  id="myModal2" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeMyModal(2)">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>AddMemo 테스트</p>
        
        <form class="form-horizontal">
        	<div class="form-group">
			    <label for="planId2" class="col-sm-offset-3 col-sm-5 control-label">플랜 아이디</label>
			    <div class="col-sm-5">
			      <input type="text" class="form-control" id="planId2" name="planId2" placeholder="플랜 아이디 입력">
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="memoDetail" class="col-sm-offset-3 col-sm-5 control-label">메모 내용</label>
			    <div class="col-sm-5">
			      <input type="text" class="form-control" id="memoDetail" name="memoDetail" placeholder="메모 내용">
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="memoRegUser" class="col-sm-offset-3 col-sm-5 control-label">메모 등록자 아이디</label>
			    <div class="col-sm-5">
			      <input type="text" class="form-control" id="memoRegUser" name="memoRegUser" placeholder="메모 등록자 아이디">
			    </div>
			</div>
        </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeMyModal(2)">Close</button>
        <button type="button" class="btn btn-primary" id="addMemo">Add Memo</button>
      </div>
    </div>
  </div>
</div>

<!-- https://blog.naver.com/qkrquddyd94/221345117645 -->


<script async defer src="https://maps.googleapis.com/maps/api/js?key=&callback=initMap" type="text/javascript"></script>

</body>
</html>