<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<meta charset="EUC-KR">
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
<style type="text/css">
     .fc-scroller {
	   overflow-y: hidden !important;
	}
</style>


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
									
									swal({
										   icon : 'warning',
										  title : "출석체크 실패!",
										  text:"내일 다시 시도해주세요.",
										 
										})
									
								}else{
									calendar.addEvent(JSONData);
									
									swal({
										   icon : 'success',
										  title : "출석체크 성공!",
										  text:"100Point 적립 ",
										})
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
 	$("#choolCheck").on("click",function(){
		 var m_chk1 = 0
		 var choolCheckModal = $("#choolCheckModal").modal()
		 choolCheckModal.on('shown.bs.modal', function () {
				//shown.bs.modal이벤트가 다중으로 발생하는 걸 방지하기 위한 부분
				m_chk1++
				if( m_chk1 == 1){
						
					var wait = document.getElementById("wait");
					var modalBodyDiv = document.getElementById("modalBodyDiv");
					
					wait.style.display = 'block';
					setTimeout(function() {
						
						wait.style.display = 'none';
						openCal();
						modalBodyDiv.style.display='block';
							}, 3000);
		
				}
			})
 	})
})

</script>

</html>