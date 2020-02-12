<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>

<span class='exchan' abc='EUR'></span>
 
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


	$(function() {

		/* var a = $("#exampleFormControlSelect2 option:selected");
		alert(a.val()); */
		
		$(".list-group-item").click(function() {
			
			alert($(this).text());
			
			});
	})

	$.ajax({
		url : "/api/json/exchange",
		method : "GET",
		dataType : "json",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(JSONData, status) {
			var conInfo = JSONData.response.body.items.item.basic;
			var conName = JSONData.response.body.items.item.countryName;
			var conFlag = JSONData.response.body.items.item.imgUrl;
			/* alert(conName); */
			/* $("#form-group").html(myItem); */

			/*  for (var i = 0; myItem.length; i++) {
				var output = item[i]+imgUrl2;
				myItem += output;
				alert(myItem); */
			/* 		$("#exchange").attr("value", myItem);
				},error:function(status){
					alert("sss");*/

			/* $("#exampleFormControlSelect2") */
			$("#JH").attr("src", conFlag);

		}

	});

	function exchange(data) {

		if ($(".exchan")) {
			$.getJSON('https://api.exchangeratesapi.io/latest?base=KRW').done(

					function(data) {

						var abc = $(".list-group-item-action.active").attr('abc');

						/* var cur1= $(".exchan").attr('cur');
						var cur2= $(".exchan").attr('cur');
						var cur3= $(".exchan").attr('cur');
						var cur4= $(".exchan").attr('cur');
						var cur5= $(".exchan").attr('cur');
						var cur6= $(".exchan").attr('cur');
						var cur7= $(".exchan").attr('cur');
						var cur8= $(".exchan").attr('cur');
						var cur9= $(".exchan").attr('cur');
						var cur10= $(".exchan").attr('cur');
						var cur11= $(".exchan").attr('cur');
						var cur12= $(".exchan").attr('cur');
						var cur13= $(".exchan").attr('cur');
						var cur14= $(".exchan").attr('cur'); */

						if (abc == undefined)
							return;
						var price = $("input[name='won']").val();
						/* var num = price/ data.rates[cur] */

						var num = Math.round(price.match(/\d+/)[0]
								/ data.rates[abc]);
						/* alert(num);
						alert(data.rates[abc]); */
						num = num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g,
								'$1,')
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
.list-group-item {
	font-weight: bold;
	size : 50px;
	padding-bottom : 0.20rem;
}

.list-group img {

	size : 20px;
}
</style>
<!-- <span class='exchan' cur='EUR'></span>
<span class='exchan' cur='EUR'></span>
<span class='exchan' cur='EUR'></span>
<span class='exchan' cur='EUR'></span>
<span class='exchan' cur='EUR'></span>
<span class='exchan' cur='EUR'></span> -->

<h3>exchange</h3>
<input type="text" class="form" id="won" name="won" placeholder="원화"
	value="" onkeydown="exchange()"> WON
<br />
<br />
<br />
<br />
<input type="text" id="result" placeholder="유로" readonly="readonly"
	value=""> EURO

<form>
	<div id="form-group">
		<label for="exampleFormControlSelect2">Example multiple select</label><br />
		<select multiple class="form-control" id="exampleFormControlSelect2"
			style='width: 400px'>
			<option class='a' abc='EUR'>영국</option>
			<option>2123123123123123123123123</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select>
	</div>



</form>
<img id="JH" alt="" src="">
<!-- <input type="text" id="exchange" > -->
<!-- <div id="a"></div> -->

</head>



<body>
<div class="container">
<div class="row">
  <div class="col-4">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action" id="a" data-toggle="list" href="#list-home" abc="EUR">
      <img src='http://www.0404.go.kr/imgsrc.mofa?atch_file_id=COUNTRY_159&amp;file_sn=1'/>영국</a>
      <a class="list-group-item list-group-item-action" id="b" data-toggle="list" href="#list-profile" abc="HUF">헝가리</a>
      <a class="list-group-item list-group-item-action" id="c" data-toggle="list" href="#list-messages" >Messages</a>
      <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" >Settings</a>
    </div>
</div>
</div>
</div>

</body>

</html>