<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>



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
	



<!-- 	<link href='/css/core/main.css' rel='stylesheet' />
    <link href='/css/daygrid/main.css' rel='stylesheet' />
    <link href='/css/list/main.css' rel='stylesheet' />
    <link href='/css/timegrid/main.css' rel='stylesheet' />
    
    
    <script src='/javascript/core/main.js'></script>
    <script src='/javascript/daygrid/main.js'></script>
	<script src='/javascript/list/main.js'></script>
	<script src='/javascript/interaction/main.js'></script>
	<script src='/javascript/timegrid/main.js'></script> -->
	
	
<style type="text/css">
      .fc-scroller {
		   overflow-y: hidden !important;
		}

/* @media screen and (min-width: 768px) {
          .modal:before {
            display: inline-block;
          vertical-align: middle;
            height: 100%; 
          }
        } */
/*         .modal-dialog {
          display: inline-block;
          vertical-align: middle;
         
        }
        .modal-body{
        
        } */



</style>




</head>
<body>
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  출석체크
</button> -->


<div class="modal fade" id="choolCheckModal">	
	  <div class="modal-dialog" id="modalBodyDiv" style="margin-top: 80px; display: none;">
		<h2 style="color: white;text-align: center;">Euroverse출석체크</h2>
		<div class="modal-content">
				<div class="modal-body"  >
					<div id="calendar"></div>
					
					
				</div><!--modal body End  -->
			</div><!--modal content End  --> 
	  </div><!--modal dialog End  -->

					<div id="wait" style="display: none; text-align: center; margin-top: 270px;">
						<div class="spinner-grow text-info" style="width: 200px; height: 200px;" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
					</div>
</div><!--myModal End  -->

</body>

<script type="text/javascript">

function openCal(){
	

	var Calendar = FullCalendar.Calendar;
	var Draggable = FullCalendarInteraction.Draggable;

	var containerEl = document.getElementById('external-events');
	var calendarEl = document.getElementById('calendar');
	var checkbox = document.getElementById('drop-remove');

	var calendar = new Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	    customButtons: {
	        choolCheck: {
	          text: '출석체크',
	          click: function() {
				var date = new Date();
	          	var currentDate = date.getFullYear() + "-"+ (date.getMonth()+1) + "-" +date.getDate();
	          	var stringDate = date.getFullYear() +""+(date.getMonth()+1) +date.getDate();
				$(function(){
					$.ajax({
						url : "/myPage/json/choolChecking",
						method : "post",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							currentDate : currentDate,
							year : date.getFullYear(),
							month : date.getMonth()+1,
							day : date.getDate(),
							stringDate : stringDate
						}),
						success : function(JSONData, Status) {
									
								if(JSONData.error == 'error'){
									alert("출석은 하루에 한번만 하실수 있습니다.");
								}else{
									calendar.addEvent(JSONData);
								}
							}
					})	
				})
	          }
	        }
	      },
	    header: {
	      left: 'title',
	      right : 'choolCheck'
	    },
				eventSources: [{

	events: function(start, callback) {
	    $.ajax({
	        url     : '/myPage/json/choolCheck',
	        type    : 'get',
	        dataType: 'json',
	        success : function(doc) {
	            
	           	callback(doc);
	        }
	    });
	}
	}],
	    editable: false,
	    eventLimit : true,
	    cache : true,
	    locale: 'ko',
	    height: 500
	  });
	
	calendar.render(); 
	
}





$(function(){
		
	var wait = document.getElementById("wait");
	var modalBodyDiv = document.getElementById("modalBodyDiv");
	/* 아래쪽에 있었는데 자꾸 setimeout이 안되고 잘 안나와서 위로 올림 */
	
	wait.style.display = 'block';
	setTimeout(function() {
		
		wait.style.display = 'none';
		openCal();
		modalBodyDiv.style.display='block';
			}, 3000);	 

})









///////////////////////////////////////////////
 






</script>

</html>