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
			$("form").attr("method" , "POST").attr("action" , "/flight/searchFlight").submit();

	});
});	


////////////////////////////////

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
/////////////////////////////
function doShow() { 
    if ($('#city').is(":visible")) { 
        $('#city').hide(); // id값을 받아서 숨기기 
    } else { 
        $('#city').show(); // id값을 받아서 보이기 
    } 
} 

function Show() { 
    if ($('#arr').is(":visible")) { 
        $('#arr').hide(); // id값을 받아서 숨기기 
    } else { 
        $('#arr').show(); // id값을 받아서 보이기 
    } 
} 

function domestic(obj) {
	// 현재 클릭된 Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
	var depCity = $("#depCity").val(obj);
	doShow();
	//alert(depCity);
};

function europe(obj) {
	// 현재 클릭된 Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
	var arrCity = $("#arrCity").val(obj);
	Show();
	//alert(depCity);
};
/////////////////////////////////
	
</script>



</head>




<body>
	
	<div class="container">
		<div class="page-header">
			<h3>Selenium</h3>
		
		
		
		
		
		
		</div>
  </div>
		
		
<form name="detailForm" class="form-horizontal">

		<div class="row justify-content-around">
		<input	type="text" name="depCity" id="depCity" class="col-6 col-md-4"  onclick="javascript:doShow();">
		<input	type="text" name="arrCity" id="arrCity" class="col-6 col-md-4"  onclick="javascript:Show();">
		
		
		<div class="row justify-content-around">
		<table id="city" width="200" class="table table-bordered table-hover text-center">
	
			<tbody>	
			<tr>
			<th rowspan="5" align="center">국내</th>
			</tr>			
				<tr>			
					<td onclick="javascript:domestic($(this).closest('td').text());">인천</td>
					<td onclick="javascript:domestic($(this).closest('td').text());">김포</td>
				</tr>
				<tr>
					<td onclick="javascript:domestic($(this).closest('td').text());">부산</td>
					<td onclick="javascript:domestic($(this).closest('td').text());">대구</td>
				</tr>
				<tr>
					<td onclick="javascript:domestic($(this).closest('td').text());">청주</td>
					<td onclick="javascript:domestic($(this).closest('td').text());">제주</td>
				</tr>
				<tr>
					<td onclick="javascript:domestic($(this).closest('td').text());">무안</td>
					<td onclick="javascript:domestic($(this).closest('td').text());"></td>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="row justify-content-around">
		<table id="arr" width="200" class="table table-bordered table-hover text-center">
			<tbody>	
			<tr>
			<th rowspan="5" align="center">유럽</th>
			</tr>			
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">파리</td>
					<td onclick="javascript:europe($(this).closest('td').text());">런던</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">로마</td>
					<td onclick="javascript:europe($(this).closest('td').text());">프라하</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">프랑크푸르트</td>
					<td onclick="javascript:europe($(this).closest('td').text());">마드리드</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">바르셀로나</td>
					<td onclick="javascript:europe($(this).closest('td').text());">취리히</td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
<!--  테이블   -->
	<table class="table table-bordered">
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>

<!--  테이블   -->
	<div class="form-group">
   	 <div class="col-sm-offset-4  col-sm-4 text-center">
      <button type="button" class="btn btn-primary"  >검&nbsp;색</button>
     </div>
 	</div>

</table>
</form>
</div>

	<jsp:include page="../common/pageNavigator_new.jsp"/>			 

</body>
</html>