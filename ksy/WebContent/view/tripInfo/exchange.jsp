<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="euc-kr"%>

<!DOCTYPE html>

<html lang="ko">

<head>



 <!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- 부트스트랩 4.4 쓰려다가 빠꾸...............................했다가 다시 4.4로..  -->
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
	
 
 
<script>

/* 	$(".list-group-item-action").on('click', function() {
				
		alert($(this).attr('con')); 
		var conName = $(this).attr('con');
		
		conturyInfo(conName);
		
	}) */

$(function(){
	
	$.getJSON('').done('https://earthquake.kr:23490/query/KRWEUR')
	
})

		
$(function(){
 	$(".list-group-item-action").click(function() {
			
		alert($(this).attr('mon'));
		var conCode = $(this).attr('con');
		var conName = $(this).text();
		alert(conCode);
		alert(conName);
		conturyInfo(conCode);
		$()
			
	}); 
});

	function conturyInfo(conCode){
		
		alert('conturyInfo Start....');
		
		$.ajax({
			url : "/api/json/exchange/"+conCode ,
			method : "GET" ,
			dataType : "json" ,
			data: JSON.stringify({
				conCode : conCode 
			}),
			contentType: "application/x-www-form-urlencoded; charset=EUC-KR",
			headers : {
				"Accept" : "application/json" ,
				"Content-Type" : "application/json"
			} ,
			success : function(JSONData, status) {
				
				var conInfo = JSONData.response.body.items.item.basic;
				var contury = JSONData.response.body.items.item.countryName;
				var conFlag = JSONData.response.body.items.item.imgUrl;
				/* alert(conName); */
				/* $("#form-group").html(myItem); */
				$('#conturyInfo').html(conInfo);
			}
		});
		};
	
	function exchange(data) {
   	
	if ($(".list-group-item-action")) { 	
		$.getJSON('https://api.exchangeratesapi.io/latest?base=KRW').done(

					function(data) {

						var mon = $(".list-group-item-action.active").attr('mon');

						if (mon == undefined){
							alert('국가를 선택하세요.');
							$("input[name='won']").val("")
							.return;
						}
						
						var price = $("input[name='won']").val();
						/* var num = price/ data.rates[cur] */
						
						var num = Math.round(price.match(/\d+/)[0]
								/ data.rates[mon]);
						/* alert(num);
						alert(data.rates[abc]); */
						num = num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g,'$1,')
						/* $(this).html(
								old + ' <small>(약 ' + num
										+ '원)<small>'); */
						/* console.log(num) */
					
						$('#result').attr("value", "€ " + num);
					})
		 } 
	}
	
</script>

<style type='text/css'>
/* * { 
	box-sizing: border-box; 
}

body {
	display: flex; 
	align-items: center; 
	justify-content: center;
} */

body{

	margin: 0 auto;
	padding-bottom : 30px;
	background-color: gray;
	background-repeat: repeat;
	
	
	
}
.container{
	position: relative;
	align-items: center;
	justify-content: center;
	position: absolute;
	top: 50%;
	transform: translate(-50%,-50%);
	left: 50%;
}

#conturyInfo{
	width:300px;
	height : 300px;
	border: 1px solid red;
	border-radius : 10px;
	overflow:auto;

}

#conturyMoney{
	width:300px;
	height : 300px;
	border: 1px solid red;
	border-radius : 10px;
}
#wrapper{
	width:300px;
	height : 300px;
	border: 1px solid red;
	border-radius : 10px;
}


.list-group{
	width:300px;
	overflow:auto;
	height: 300px;
}

.list-group-item {
	font-weight: bold;
	size : 40px;
	padding-bottom : 0.3rem;
	padding-top : 0.3rem;
	border-radius : 10px;
	
}

.list-group img {
	width : 40px;
	vertical-align: sub;
}
.border-0 {
	width:40px;
	height : 30px;
}

.flex-nowrap{
	height : 300px;
	border: 1px solid red;
	border-radius : 10px;
	width:300px;
}
.form-control{
	top:30%;
}

.form-control2{
	top:60%
}

</style>

</head>


<body>

<h3>exchange</h3>



<div class="container">
	<div class="row">
	  
<!-- ============== 여기는 국가를 선택하는 html ============  -->
	<div id="wrapper" class="wrapper" style="overflow:hidden;">	
	오늘의 환율	  
	    <div class="list-group" id="list-tab" role="tablist" >
	      <a class="list-group-item list-group-item-action" id="a" data-toggle="list" href="#list-home" mon="EUR" con="GBR">
	      <img src='/resources/images/tripInfoimges/Europe.png'/>&nbsp; 유럽 </a>
	      <a class="list-group-item list-group-item-action" id="b" data-toggle="list" href="#list-profile" mon="HUF" con="HUN">
	      <img src='/resources/images/tripInfoimges/Hungary.gif'/>&nbsp; 헝가리</a>
	      <a class="list-group-item list-group-item-action" id="c" data-toggle="list" href="#list-messages" mon="CZK" con="CZE">
	      <img src='/resources/images/tripInfoimges/Czech.gif'/>&nbsp; 체코</a>
	      <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" mon="DKK" con="DNK">
	      <img src='/resources/images/tripInfoimges/Denmark.gif'/>&nbsp; 덴마크</a>
	      <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" mon="GBP" con="GBR">
	      <img src='/resources/images/tripInfoimges/England.gif'/>&nbsp; 영국</a>
	      <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" mon="RON" con="ROU">
	     <img src='/resources/images/tripInfoimges/Lithuania.gif'/>&nbsp; 루마니아</a>
	      <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" mon="SEK" con="SWE">
	     <img src='/resources/images/tripInfoimges/Sweden.gif'/>&nbsp; 스웨덴</a>
	      <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" mon="HRK" con="HRV">
	     <img src='/resources/images/tripInfoimges/Croatia.gif'/>&nbsp; 크로아티아</a>
	      <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" mon="CHF" con="CHE">
	     <img src='/resources/images/tripInfoimges/Swiss.gif'/>&nbsp; 스위스</a>
	      <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" mon="BGN" con="BGR">
	     <img src='/resources/images/tripInfoimges/Bulgaria.gif'/>&nbsp; 불가리아</a>
	      <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" mon="TRY" con="TUR">
	     <img src='/resources/images/tripInfoimges/Turkey.gif'/>&nbsp; 터키</a>
	      <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" mon="NOK" con="NOR">
	      <img src='/resources/images/tripInfoimges/norway.gif'/>&nbsp; 노르웨이</a>
	      <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" mon="PLN" con="POL">
	     <img src='/resources/images/tripInfoimges/Poland.png'/>&nbsp; 폴란드</a>
	     </div>
		</div>
		
		<!-- ============여기는 국가정보가 나타나는 box ================ -->
	
		<div id="conturyInfo"></div>
		 
	   <!-- =========== 여기는 금액을 입력하는 칸 ====================  -->  
	  <div class="input-group flex-nowrap">
	  	<div class="conturyMoney">
  		<input type="text" class="form-control" placeholder="Username" aria-describedby="addon-wrapping" value="" onkeydown="exchange()">
		<br/>
		<div class="conturyMoney2">
		<input type="text" class="form-control" placeholder="Username"  readonly="readonly" value="">
		</div>
		
	    <div id="conturyMoney">
	    <input type="text" class="form" id="won" name="won" placeholder="원화" value="" onkeydown="exchange()"> WON
		<br /><br /><br /><br />
		<input type="text" id="result" placeholder="유로" readonly="readonly" value=""> EURO
	    </div>
	    
	    
	    
	   <!--  <script type="text/javascript">
		    var IScroll = $.AMUI.iScroll;
		    var myScroll = new IScroll('#wrapper', { click: true });
		</script> -->
	</div>
</div>

</body>

</html>