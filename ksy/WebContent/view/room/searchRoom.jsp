<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
<head>
<title>구매 목록조회</title>
<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
             padding-top : 50px;
            background: linear-gradient(-100deg, mistyrose,pink, lightpink) fixed;

        }
        image {
        	border : 1px solid lightpink;
        }
        h3{
        	color: white;
        	font-family : Consolas;
        }
      
        
        
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function() {
	 $( '.form-group:contains("검")' ).on("click" , function() {
		 	//alert("검색")
			$("form").attr("method" , "POST").attr("action" , "/room/searchRoom").submit();

	});
});	

////////////////////////

var rangeDate = 500; // set limit day
var setSdate, setEdate;
$(function() {
$("#from").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    onSelect: function(selectDate){
        var stxt = selectDate.split("-");
            stxt[1] = stxt[1] - 1;
        var sdate = new Date(stxt[0], stxt[1], stxt[2]);
        var edate = new Date(stxt[0], stxt[1], stxt[2]);
            edate.setDate(sdate.getDate() + rangeDate);
        
        $('#to').datepicker('option', {
            minDate: selectDate,
            beforeShow : function () {
                $("#to").datepicker( "option", "maxDate", edate );                
                setSdate = selectDate;
                console.log(setSdate)
        }});
        //to 설정
    }
    //from 선택되었을 때
});
});
$(function() {
	$("#to").datepicker({ 
	    dateFormat: 'yy-mm-dd',
	    onSelect : function(selectDate){
	        setEdate = selectDate;
	        console.log(setEdate)
	    }
	});
	$('.btn').on('click', function(e){
	    if($('input#from').val() == ''){
	        alert('시작일을 선택해주세요.');
	        $('input#from').focus();
	        return false;
	    }else if($('input#to').val() == ''){
	        alert('종료일을 선택해주세요.');
	        $('input#to').focus();
	        return false;
	    }

   /*  var t1 = $('input#from').val().split("-");
    var t2 = $('input#to').val().split("-");
    var t1date = new Date(t1[0], t1[1], t1[2]);
    var t2date = new Date(t2[0], t2[1], t2[2]);
    var diff = t2date - t1date;
    var currDay = 24 * 60 * 60 * 1000;
    if(parseInt(diff/currDay) > rangeDate){
        alert('로그 조회 기간은 ' + rangeDate + '일을 초과할 수 없습니다.');        
        return false;
    } */
	});
});

	
</script>



</head>




<body>
	
	<div class="container">
		<div class="page-header">
			<h3>Selenium</h3>
		
		
		
		
		
		
		</div>
		
		
		
<form name="detailForm" class="form-horizontal">
<table class="table table-hover table-striped" >		


	
	<div class="form-group">
		<label for="roomCity" class="col-sm-offset-1 col-sm-3 control-label">도착 도시</label>
		<div class="col-sm-4">
		<input	type="text" name="roomCity" id="roomCity" class="form-control">
		</div>
	</div>

	<div class="wrap">
	<h4 align="center">기간 선택</h4>
	 <label for="checkIn" class="col-sm-offset-1  control-label">출발일자</label>
	  <div>
	      <input type="text" id="from" name="checkIn">
	  </div>
	 <label for="checkOut" class="col-sm-offset-1control-label">도착일자</label>
	  <div>
	      <input type="text" id="to" name="checkOut">
	  </div>  
	</div>

	<div class="form-group">
		<label for="roomNum" class="col-sm-offset-1 col-sm-3 control-label">객실</label>
		<div class="col-sm-4">
			<select class="form-control" id="roomNum" name="roomNum" >
				<c:set var="i" value="0" />
				<c:forEach  begin="0" end="3">
				<c:set var="i" value="${i+1}"/>
				<option>${i}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
		<div class="form-group">
		<label for="adultNum" class="col-sm-offset-1 col-sm-3 control-label">성인수</label>
		<div class="col-sm-4">
			<select class="form-control" id="adultNum" name="adultNum" >
				<c:set var="i" value="0" />
				<c:forEach  begin="0" end="9">
				<c:set var="i" value="${i+1}"/>
				<option>${i}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
	<div class="form-group">
		<label for="childNum" class="col-sm-offset-1 col-sm-3 control-label">유아수</label>
		<div class="col-sm-4">
			<select class="form-control" id="childNum" name="childNum" >
				<c:set var="i" value="0" />
				<c:forEach  begin="0" end="8">
				<option>${i}</option>
				<c:set var="i" value="${i+1}"/>
				</c:forEach>
			</select>
		</div>
	</div>

	<div class="form-group">
   	 <div class="col-sm-offset-4  col-sm-4 text-center">
      <button type="button" class="btn btn-primary"  >검&nbsp;색</button>
     </div>
 	</div>

</table>
</form>
</div>


</body>
</html>