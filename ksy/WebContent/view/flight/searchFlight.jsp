<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
<head>
<title>항공권 검색</title>
<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	

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
	  	z-index: 2;
	  }
	  table {
	   text-ailgn : center;
	   background-color: white;
		/*  border-collapse: separate;  */
		border:5px solid white;
	  }
/* 	  .container{
	   position: relative;
	   
	  }
	   .container:after{
	   		content : "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 300px;
		    opacity : 0.7;
	   		background-color: #646464;
			box-sizing: border-box;
			z-index : -1;
	  } */
	  

	  
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
		    background-image: url('/resources/images/orderImg/1.jpg'); 
		    width: 100%;
		    height: 460px;
		    opacity : 0.7;
		    z-index: -2;
		}
		/* 달력 css */
		.ui-datepicker { width: 20em; padding: .2em .2em 0;font-size: 14px; height:10px;}
		/* 인원 수량 */
		#decreaseQuantity , #decreaseQuantity2 , #decreaseQuantity3{
		word-break: break-all;
		list-style: none;
		cursor: pointer;
		padding: 0;
		margin: 0;
		font-family: "Nanum Gothic", malgun Gothic, dotum;
		letter-spacing: -.3px;
		width: 43px;
		height: 43px;
		color: #e25147;
		border: 0;
		vertical-align: top;
		position: relative;
		font-size: 0;
		line-height: 0;
		background: url("//openimage.interpark.com/tourpark/tour_ui/common/btn/btn_del.png") no-repeat 0 0;
		}
		#increaseQuantity , #increaseQuantity2 , #increaseQuantity3{
		word-break: break-all;
		list-style: none;
		cursor: pointer;
		padding: 0;
		margin: 0;
		font-family: "Nanum Gothic", malgun Gothic, dotum;
		letter-spacing: -.3px;
		width: 43px;
		height: 43px;
		color: #e25147;
		border: 0;
		vertical-align: top;
		position: relative;
		font-size: 0;
		line-height: 0;
		background: url("//openimage.interpark.com/tourpark/tour_ui/common/btn/plus.png") no-repeat 0 0;
		
		}
		/*  #numberUpDown{
		width: 300px;
		  height: 50px;
		  background-color: gray;
		  border: none;
		} */
		.round-trip.on{
		line-height: 1.2;
		color: #646464;
		word-break: break-all;
		list-style: none;
		padding: 0;
		margin: 0;
		font-size: 13px;
		font-family: "Nanum Gothic", malgun Gothic, dotum;
		letter-spacing: -.3px;
		display: table-cell;
		width: 33.33%;
		box-sizing: border-box;
		text-align: center;
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function() {
	 $( '.btn.btn-info' ).on("click" , function() {
			$("form").attr("method" , "POST").attr("action" , "/flight/searchFlight").submit();

	});
});	


////////////////////////////////달력

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
	 $('.btn.btn-info').on('click', function(e){
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
 
	
});
///////////////////////////// table 숨기기, 나타내기
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
			$("#depIcon").hide();
			$("#arrIcon").hide();
			$("#search").show();
			$("#totalNum").show();
			$("#totalNum").css("margin-left","51.3%");
		}
}
function Show() { 
	if ($('#europe').css("display","none")) { 
		$("#europe").css("display","block");
		$("#domestic").css("display","none");
		$("#depIcon").show();
		$("#arrIcon").show();
		$("#search").hide();
		$("#totalNum").hide();
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
		$("#depIcon").show();
		$("#arrIcon").show();
		$("#totalNum").css("margin-left","18%");
		
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
		$("#search").show();
		$("#totalNum").show();
		
	}
	//alert(depCity);
};
///////////////////////////////// 인원수 증가, 감소
	/* 성인 수 */
	$(function(){
		$('#decreaseQuantity').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown').val();
			var num = parseInt(stat,10);
			num--;
		if(num<=0){
			alert('더이상 줄일수 없습니다.');
			num =1;
		}
		$('#numberUpDown').val(num);
		$("#peopleChoice").val("총	 "+adult+child+inf);
		});
			$('#increaseQuantity').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown').val();
			var num = parseInt(stat,10);
			num++;
		
				if(num>10){
					alert('더이상 늘릴수 없습니다.');
					num=10;
				}
			var adult = $('#numberUpDown').val(num);
			var grade = $("#grade").text();
			$("#peopleChoice").val("총	 "+adult+child+inf);
			});
		});
		
	/* 소아수 */
	$(function(){
		$('#decreaseQuantity2').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown2').val();
			var num = parseInt(stat,10);
			num--;
		if(num<=-1){
			alert('더이상 줄일수 없습니다.');
			num =0;
		}
		$('#numberUpDown2').val(num);
		$("#peopleChoice").val(total+"/소아"+num+"명 ")
		});
			$('#increaseQuantity2').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown2').val();
			var num = parseInt(stat,10);
			num++;
		
				if(num>10){
					alert('더이상 늘릴수 없습니다.');
					num=10;
				}
			var child = $('#numberUpDown2').val(num);
			$("#peopleChoice").val("총	 "+adult+child+inf);
			});
		});
	/* 유아수 */
	$(function(){
		$('#decreaseQuantity3').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown3').val();
			var num = parseInt(stat,10);
			num--;
		if(num<=-1){
			alert('더이상 줄일수 없습니다.');
			num =0;
		}
		$('#numberUpDown3').val(num);
		});
			$('#increaseQuantity3').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown3').val();
			var num = parseInt(stat,10);
			num++;
		
				if(num>10){
					alert('더이상 늘릴수 없습니다.');
					num=10;
				}
			var inf = $('#numberUpDown3').val(num);
			$("#peopleChoice").val("총	 "+adult+child+inf);
			});
		});
	
	
</script>



</head>




<body>
 	<jsp:include page="/toolbar/toolBar.jsp" />
<form>
<div class="wrapper">	
<br>
<br>
<br>
			<div class="row" style="Padding-left:200px;">
              		<button type="button" class="btn btn-outline-light">왕복구간 검색</button>
              		&nbsp;&nbsp;&nbsp;&nbsp;
                	<button type="button" class="btn btn-outline-light" style="">편도구간 검색</button>
            </div>
            <br/><br/>
			<div class="container">
			  <div class="row">
			    <div class="col">
			    	 <input type="text" class="form-control" placeholder="출발지역을 입력하세요" name="depCity" id="depCity" style="width:300px;height:30px;font-size:13px;float:left;" onclick="javascript:doShow();">
					 <div class="input-group-append">
					  <span class="input-group-text" id="basic-addon2"><i class="fas fa-plane" id="iconf" style="font-size:15px;"></i></span>
			  			<i class="fas fa-arrows-alt-h" style="font-size:25px;Padding-left:100px;"></i>
			  			
			  		</div>
			    </div>
			    <div class="col">
			    	 <input type="text" class="form-control" placeholder="도착지역을 입력하세요" name="arrCity" id="arrCity" style="width:350px;height:30px;font-size:13px;float:left; " onclick="javascript:Show();">
					 <div class="input-group-append">
					  <span class="input-group-text" id="basic-addon2"><i class="fas fa-plane" id="iconf" style="font-size:15px;"></i></span>
		  			 </div>
		  			
		  		</div> 
		  		
		  		
			    
			  </div>
			    
			   
			    
			    <br/>
				<div class="row">
			   		 <div class="col-sm-2" id="depIcon">
			    	<input type="text" class="form-control" placeholder="출발날짜 선택" style="width:120px;font-size:14px;height:30px;float:left;" id="from" name="depDate">
					  <div class="input-group-append">
					    <span class="input-group-text" id="basic-addon2"><i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
					  </div>
					
					</div>
			   		 <div class="col-sm-2" id="arrIcon">
			   		 	 <input type="text" class="form-control" placeholder="도착날짜 선택"  style="width:120px;font-size:14px;height:30px;float:left;" id="to" name="arrDate">
						  <div class="input-group-append">
						    <span class="input-group-text" id="basic-addon2"><i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
						  </div>
			   	
			   		 </div>
			   		 <div class="col-sm-2" style="margin-left: 18%" id="totalNum">
			   		 	<input type="text" id="peopleChoice" value="성인 1명 / 일반석" style="width:150px;" 
			   		 	 title="인원 및 좌석 등급 선택" class="form-control" readonly="readonly" data-toggle="modal" data-target="#flightNum">
			   		 </div>
			   		 &nbsp;&nbsp;&nbsp;&nbsp;
			   		 <div class="btn-area" id="search">
	                  <button type="button" id="searchButton" class="btn btn-info" title="항공권 검색">
	                    <span class="ico-search">항공권 검색</span>
	                  </button>
	                </div>
			 		</div>
			 		<div>
		  			<div>
			  		<table class="table" id="domestic" style="width: 300px; display: none;">
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
		  		
			     	<div style="right">
		  			  <table id="europe" class="table" style="margin-left: 52%; width: 350px; display: none;">
						<tbody>	
						<tr>
						<th rowspan="9" align="center">유럽</th>
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
			    </div><br>
			</div>
			
			

		
<br><br><br>

			

		
</div>	
		<!-- Modal 안에 내용 -->
		<div class="modal fade" id="flightNum" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content"  >
		      <div class="modal-header" style="background-color:gray;">
		        <h5 class="modal-title" id="exampleModalLabel" style="color:white;font-size:13px;">> 인원 및 좌석 등급 선택</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div class="number">
		        	<li>
					<label for="Adt"><strong>성인</strong><br/>
										만 12세 이상</label>
					<span class="ctrl-num">
			        	<button type="button" id="decreaseQuantity" class="plus"></button>
							 <input style="font-size:15px;width:5%;display: table-cell;margin-bottom:20px;text-align: center;vertical-align: middle;border: none;" 
							 		id="numberUpDown" name="adultNum" type="text" value="1" > 
						<button type="button" id="increaseQuantity" class="del"></button>
					</span>
					<br/>
					<li>
					<label for="Chd"><strong>소아</strong><br/>
										만 12세 미만</label>
					<span class="ctrl-num">
			        	<button type="button" id="decreaseQuantity2" class="plus"></button>
							 <input style="font-size:15px;width:5%;display: table-cell;margin-bottom:20px;text-align: center;vertical-align: middle;border: none;"
							 		 id="numberUpDown2" name="childNum" type="text" value="0" > 
						<button type="button" id="increaseQuantity2" class="del"></button>
					</span>
					</li>
					<li>
					<label for="Inf"><strong>유아</strong><br/>
										만 2세 미만</label>&nbsp;
					<span class="ctrl-num">
			        	<button type="button" id="decreaseQuantity3" class="plus"></button>
							 <input style="font-size:15px;width:5%;display: table-cell;margin-bottom:20px;text-align: center;vertical-align: middle;border: none;"
							 		 id="numberUpDown3" name="infantNum" type="text" value="0" > 
						<button type="button" id="increaseQuantity3" class="del"></button>
					</span>
					</li>
					<hr/>
						<div class="input-group">
						  <label for="seatGrade" id="seatGrade" style="text-align: center; font-size:14px;">좌석 등급 선택</label>
						 &nbsp;&nbsp;&nbsp;&nbsp;
						  <div class="input-group-append">
							   <select class="form-control" id="grade" name="seatGrade" style="width:80%;">
								 	<option value="0">일반석</option>
									<option value="1">프리미엄 일반석</option>
									<option value="2">비즈니스석</option>
									<option value="3">일등석</option>
								</select>
						</div>
						
		           </div>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
	
</form>			
</body>
</html>