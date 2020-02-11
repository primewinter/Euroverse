<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>



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
	
	
<script type="text/javascript">

$(function(){
	
var wait = document.getElementById("wait");

var Calendar = FullCalendar.Calendar;
var Draggable = FullCalendarInteraction.Draggable;

var containerEl = document.getElementById('external-events');
var calendarEl = document.getElementById('calendar');
var checkbox = document.getElementById('drop-remove');

var calendar = new Calendar(calendarEl, {
    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
    customButtons: {
        choolCheck: {
          text: '�⼮üũ',
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
								alert("�̹� �⼮üũ �ϼ̽��ϴ�.");
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
            console.log("�̰� �ǳ�;;");
            console.log(doc);
        }
    });
}
}],
    editable: false,
    eventLimit : true,
    cache : true,
    locale: 'ko'
  });
  wait.style.display = 'block';
 setTimeout(function() {
	 
  calendar.render();
  wait.style.display = 'none';
	}, 4000);
 
})









///////////////////////////////////////////////
 






</script>



</head>
<body>
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  �⼮üũ
</button> -->


<div class="modal fade" id="choolCheckModal">
	  <div class="modal-dialog">
		<div class="modal-content">

				
				
			 <!-- 	<div class="modal-header">
					<h4 class="modal-title">�� �� ü ũ</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>modal header End 
 -->
				 
				
				
				<div class="modal-body">
					<div id="calendar"></div>
					
					<div id="wait" style="display: none;">
						<div class="spinner-grow text-primary" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						<div class="spinner-grow text-secondary" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						<div class="spinner-grow text-success" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						<div class="spinner-grow text-danger" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						<div class="spinner-grow text-warning" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						<div class="spinner-grow text-info" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						<div class="spinner-grow text-primary" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						<div class="spinner-grow text-secondary" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						<div class="spinner-grow text-success" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						<div class="spinner-grow text-danger" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						<div class="spinner-grow text-warning" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						<div class="spinner-grow text-info" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
						
					</div>
					
					
					
					
				</div><!--modal body End  -->

		<!-- 		<div class="modal-footer">
      			  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>modal footer End 
 -->


			</div><!--modal content End  --> 
	  </div><!--modal dialog End  -->

</div><!--myModal End  -->

</body>
</html>