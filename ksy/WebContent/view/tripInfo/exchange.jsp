<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>

<html lang="ko">

<span class='exchan' cur='EUR'></span>

<script src='//code.jquery.com/jquery.min.js'></script>
<script>
	function exchange(data) {
		console.log("exchange()")
		
		if ($(".exchan")) {
			$.getJSON('https://api.exchangeratesapi.io/latest?base=KRW').done(
					
								function(data) {
									var cur = $(".exchan").attr('cur');
									if (cur == undefined)
										return;
									var price = $("input[name='won']").val();
									var num = Math.round(price.match(/\d+/)[0]
											/ data.rates[cur]);
									num = num.toString().replace(
											/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
									/* $(this).html(
											old + ' <small>(약 ' + num
													+ '원)<small>'); */
									console.log(num)
									$('#result').attr("value","€ "+num);
					})
		}
	}
	
</script>
<h3>exchange</h3>
<input type="text" class="form" id="won" name="won" placeholder="원화" onkeydown="exchange()"> WON<br/><br/><br/><br/>
<input type="text" id="result" placeholder="유로" readonly="readonly"> EURO

<iframe src="http://community.fxkebhana.com/fxportal/jsp/RS/DEPLOY_EXRATE/11171_0.html" 
height="185" width="175" frameBorder="0" >
</iframe>

