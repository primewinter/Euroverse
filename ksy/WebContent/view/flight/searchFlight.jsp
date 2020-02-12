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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	 <!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	
	
	
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
        
       /* 인원수 */
       row.justify-content-around {
        position:absolute;
 		 top:50%;
		  left:50%;
		}

	  th{
	  	text-align: center;
	  	 width: 70px;
  		 height: 100px;
   		line-height: 100px;
   		     
	  }
	  td{
	  font-size:13px;
	  text-align: center;
	  width : 80px;
	  }
	  #domestic ,  #europe  {
	  	z-index: 3;
	  }
	  #to , #from , div{
	  	z-index: 1;
	  }
	  table {
	   text-ailgn : center;
	   background-color: white;
		/*  border-collapse: separate;  */
		border:5px solid white;
	  }
	  .container{
	    position: relative; 
	  }
	  .container:after {
		background-color: #646464;
		font-size: 13px;
		font-family: "Nanum Gothic", malgun Gothic, dotum;
		/* letter-spacing: -.3px;
		padding: 25px 30px 23px 50px; */
		box-sizing: border-box;
		opacity: 80%;
	   }
	  
	  

	  
	  /* 이미지 배경 css */
	  .wrapper {
		   position: relative; /* #wrapper에 투명도를 주면 컨텐츠도 같이 투명해지기 때문에.. */
		}
		.wrapper:after {
		
		    content : "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    background-image: url('/resources/images/orderImg/AA.14077862.1.jpg'); 
		    width: 100%;
		    height: 460px;
		    opacity : 0.7;
		    z-index: -1;
		}
		/* 달력 css */
		.ui-datepicker { width: 20em; padding: .2em .2em 0;font-size: 14px; height:10px;}


    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function() {
	 $( '.form-group:contains("검")' ).on("click" , function() {
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
	/* $('.btn').on('click', function(e){
	    if($('input#from').val() == ''){
	        alert('시작일을 선택해주세요.');
	        $('input#from').focus();
	        return false;
	    }else if($('input#to').val() == ''){
	        alert('종료일을 선택해주세요.');
	        $('input#to').focus();
	        return false;
	    }
	 });
 */
	
});
/////////////////////////////
/* function doShow() { 
    if ($('#domestic').is(":visible")) { 
        $('#domestic').hide(); // id값을 받아서 숨기기 
        $('#icon').show();
    } else { 
        $('#domestic').show(); // id값을 받아서 보이기 
        $('#icon').hide();
       
    } 
} 

function Show() { 
    if ($('#europe').is(":visible")) { 
        $('#europe').hide(); // id값을 받아서 숨기기 
     //   $('#icon').show();
    
    } else { 
        $('#europe').show(); // id값을 받아서 보이기 
     //   $('#icon').hide();
    } 
}  */

function doShow() { 
		if ($('#domestic').css("display","none")) { 
			$("#domestic").css("display","block");
			$("#europe").css("display", "none");
		}
}
function Show() { 
	if ($('#europe').css("display","none")) { 
		$("#europe").css("display","block");
		$("#domestic").css("display","none");
	}
}

function domestic(obj) {
	// 현재 클릭된 Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
	var depCity = $("#depCity").val(obj);
	if ($('#domestic').css("display","block")) { 
		$("#domestic").css("display","none");
	}
	//alert(depCity);
};

function europe(obj) {
	// 현재 클릭된 Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
	var arrCity = $("#arrCity").val(obj);
	if ($('#europe').css("display","block")) { 
		$("#europe").css("display","none");
	}
	//alert(depCity);
};
/////////////////////////////////
	
</script>



</head>




<body>

<div class="wrapper">	
<br/>
<br/>
<br/>
		
			<div class="container" >
			  <div class="row">
			    <div class="col">
			    	 <input type="text" class="form-control" placeholder="출발지역을 입력하세요"  name="depCity" id="depCity" 
			 		  style="width:300px;height:30px;font-size:13px;float:left;"  onclick="javascript:doShow();">
					 <div class="input-group-append">
					  <span class="input-group-text" id="basic-addon2"><i class="fas fa-plane" id="iconf" style="font-size:15px;" ></i></span>
			   			
			  		</div>
			  		<table class="table" id="domestic"  style="width:300px;display:none;" >
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
			    
			    <div class="col">
			    	 <input type="text" class="form-control" placeholder="도착지역을 입력하세요"  name="arrCity" id="arrCity"
			 		  style="width:350px;height:30px;font-size:13px;float:left; "  onclick="javascript:Show();">
					 <div class="input-group-append">
					  <span class="input-group-text" id="basic-addon2"><i class="fas fa-plane" id="iconf" style="font-size:15px;" ></i></span>
		  			 </div>
		  			  <table  id="europe" class="table" style="width:350px;display: none;" >
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
			    </div>
			    
			    
			     <div class="row" id="icon">
			   		 <div class="col-sm-2">
			    	<input type="text" class="form-control" placeholder="출발날짜 선택" readonly="readonly"
					  style="width:125px;font-size:14px;height:30px;float:left;" id="from" name="depDate" >
					  <div class="input-group-append">
					    <span class="input-group-text" id="basic-addon2"><i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
					  </div>
					
					</div>
			   		 <div class="col-sm-2">
			   		 	 <input type="text" class="form-control" placeholder="도착날짜 선택" 
						  style="width:125px;font-size:14px;height:30px;float:left;" id="to" name="arrDate"
						  >
						  <div class="input-group-append">
						    <span class="input-group-text" id="basic-addon2"><i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
						  </div>
			   		 
			   		 </div>
			 		</div>
				<br/>
			  <!--   <div class="w-50"></div> -->
			  		<!-- <div class="row" id="icon">
			   		 <div class="col-sm-2">
			    	<input type="text" class="form-control" placeholder="출발날짜 선택"
					  style="width:125px;font-size:14px;height:30px;float:left;" id="from" name="depDate" >
					  <div class="input-group-append">
					    <span class="input-group-text" id="basic-addon2"><i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
					  </div>
					
					</div>
			   		 <div class="col-sm-2">
			   		 	 <input type="text" class="form-control" placeholder="도착날짜 선택" 
						  style="width:125px;font-size:14px;height:30px;float:left;" id="to" name="arrDate"
						  >
						  <div class="input-group-append">
						    <span class="input-group-text" id="basic-addon2"><i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
						  </div>
			   		 
			   		 </div>
			 		</div> -->
			</div>
			
			
</form>
		
<br /><br /><br />

		<button class="btn btn-default" data-target="#layerpop" data-toggle="modal">모달출력버튼</button><br/>
		<div class="modal fade" id="layerpop" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <!-- header -->
		      <div class="modal-header">
		        <!-- 닫기(x) 버튼 -->
		        <button type="button" class="close" data-dismiss="modal">×</button>
		        <!-- header title -->
		        <h4 class="modal-title">Header</h4>
		      </div>
		      <!-- body -->
		      <div class="modal-body">
		            Body 
		      </div>
		      <!-- Footer -->
		      <div class="modal-footer">
		        Footer
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>



</div>	



</body>
</html>