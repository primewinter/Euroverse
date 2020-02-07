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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	
	
	
	
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
        h3{
        	color: white;
        	font-family : Consolas;
        }
       row.justify-content-around {
        position:absolute;
 		 top:50%;
		  left:50%;
		}

	  th{
	  	text-align: center;
	  	 width: 50px;
  		 height: 100px;
   		line-height: 100px;
   		     
	  }
	  td{
	  font-size:13px;
	  }
	  #arrDate,#depDate{
	  position:fixed;
	  }
	  #domestic ,  #europe  {
	  	z-index: 3;
	  }
	  #depDate , #arrDate , div{
	  	z-index: 2;
	  }
	  table {
	   background-color: white;
	  }
	  
	  .wrapper {
		   position: relative; /* #wrapper에 투명도를 주면 컨텐츠도 같이 투명해지기 때문에.. */
		}
		.wrapper:after {
		    content : "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    background-image: url('/images/AA.14077862.1.jpg'); 
		    width: 100%;
		    height: 460px;
		    opacity : 0.7;
		    z-index: -1;
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
$(function(){
	$('#decreaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var num = parseInt(stat,10);
	num--;
	if(num<=0){
	alert('더이상 줄일수 없습니다.');
	num =1;
	}
	$('#numberUpDown').text(num);
	});
	$('#increaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var num = parseInt(stat,10);
	num++;
	
	if(num>5){
	alert('더이상 늘릴수 없습니다.');
	num=5;
	}
	$('#numberUpDown').text(num);
	});
	});

////////////////////////////////

var rangeDate = 500; // set limit day
var setSdate, setEdate;
$(function() {
$("#depDate").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    onSelect: function(selectDate){
        var stxt = selectDate.split("-");
            stxt[1] = stxt[1] - 1;
        var sdate = new Date(stxt[0], stxt[1], stxt[2]);
        var edate = new Date(stxt[0], stxt[1], stxt[2]);
            edate.setDate(sdate.getDate() + rangeDate);
        
        $('#arrDate').datepicker('option', {
            minDate: selectDate,
            beforeShow : function () {
                $("#arrDate").datepicker( "option", "maxDate", edate );                
                setSdate = selectDate;
                console.log(setSdate)
        }});
        //to 설정
    }
    //from 선택되었을 때
});
});
$(function() {
	$("#arrDate").datepicker({ 
	    dateFormat: 'yy-mm-dd',
	    onSelect : function(selectDate){
	        setEdate = selectDate;
	        console.log(setEdate)
	    }
	});
	$('.btn').on('click', function(e){
	    if($('input#depDate').val() == ''){
	        alert('시작일을 선택해주세요.');
	        $('input#depDate').focus();
	        return false;
	    }else if($('input#arrDate').val() == ''){
	        alert('종료일을 선택해주세요.');
	        $('input#arrDate').focus();
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
    if ($('#domestic').is(":visible")) { 
        $('#domestic').hide(); // id값을 받아서 숨기기 
    } else { 
        $('#domestic').show(); // id값을 받아서 보이기 
    } 
} 

function Show() { 
    if ($('#europe').is(":visible")) { 
        $('#europe').hide(); // id값을 받아서 숨기기 
    } else { 
        $('#europe').show(); // id값을 받아서 보이기 
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
	

		
<form name="detailForm" class="form-horizontal">

<div class="wrapper">	
<br/>
<br/>
<br/>
		<div class="row justify-content-around" style="margin-left:auto; margin-right:auto; width:65%">
		<input	placeholder="출발지역을 입력하세요" type="text" name="depCity" id="depCity"  style="width:350px;height:30px;font-size:13px;"  onclick="javascript:doShow();">
		<input	 placeholder="도착지역을 입력하세요" type="text" name="arrCity" id="arrCity"  style="width:450px;height:30px;font-size:13px;" onclick="javascript:Show();">
		
		</div>
		
		<br/>
		
		
		<div class="row justify-content-around" style="width:44%;float: left; Padding-left:350px; height:20px;">
		
		<input	placeholder="출발날짜 선택" type="text" name="depDate" id="depDate"  style="width:300px;height:30px;font-size:13px;" >
		
		<br/><br/><br/>
		
		<!-- <div>
		
		 <label id="adultNum" for="adultNum" class="col-sm-offset-1 col-sm-3 control-label">성인수</label>
		 <input id="adultNum" type=button value="-" onClick="javascript:this.form.amount.value--;">
		<input id="adultNum" type=text name=amount value=1>
		<input id="adultNum" type=button value="+" onClick="javascript:this.form.amount.value++;">
		</div> -->
		<table  id="domestic" class="table table-bordered table-hover text-center">
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
		<div class="row justify-content-around" style="width:50%;float: right;  Padding-right:350px; height:40px;"  >
		<input	placeholder="도착날짜 선택"  type="text" name="arrDate" id="arrDate"  style="width:400px;height:30px;font-size:13px;" >
		<table  id="europe" class="table table-bordered table-hover text-center"  >
			<tbody>	
			<tr>
			<th rowspan="9" align="center" >유럽</th>
			</tr>			
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">파리</td>
					<td onclick="javascript:europe($(this).closest('td').text());">런던</td>
					<td onclick="javascript:europe($(this).closest('td').text());">아테네</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">로마</td>
					<td onclick="javascript:europe($(this).closest('td').text());">프라하</td>
					<td onclick="javascript:europe($(this).closest('td').text());">이스탄불</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">프랑크푸르트</td>
					<td onclick="javascript:europe($(this).closest('td').text());">마드리드</td>
					<td onclick="javascript:europe($(this).closest('td').text());">밀라노</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">바르셀로나</td>
					<td onclick="javascript:europe($(this).closest('td').text());">취리히</td>
					<td onclick="javascript:europe($(this).closest('td').text());">베르사유</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">나폴리</td>
					<td onclick="javascript:europe($(this).closest('td').text());">헬싱키</td>
					<td onclick="javascript:europe($(this).closest('td').text());">제네바</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">베니스</td>
					<td onclick="javascript:europe($(this).closest('td').text());">부다페스트</td>
					<td onclick="javascript:europe($(this).closest('td').text());">베를린</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">암스테르담</td>
					<td onclick="javascript:europe($(this).closest('td').text());">뮌헨</td>
					<td onclick="javascript:europe($(this).closest('td').text());">리스본</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">두브로브니크</td>
					<td onclick="javascript:europe($(this).closest('td').text());">모스크바</td>
					<td onclick="javascript:europe($(this).closest('td').text());">베오그라드</td>
				</tr>
			</tbody>
		</table>
		
		</div>

<br /><br /><br />


</div>	

</form>


</body>
</html>