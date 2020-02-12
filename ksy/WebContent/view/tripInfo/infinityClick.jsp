<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>

<style>
* {
	box-sizing: border-box;
}

body {
	background: #f1f1f1;
	color: #333333;
	font-family: 'Cairo', sans-serif;
	font-size: 30px;
	height: 100vh;

}

.fa-question-circle, .dialog__action {
	/* border: 3px solid #333333;
	background: #f1f1f1;
	padding: 15px 20px;
	font-size: 1.5rem;
	text-transform: uppercase;
	display: block;
	-webkit-transition: all 150ms ease-out;
	transition: all 150ms ease-out;
	-webkit-transform: translateY(0px);
	transform: translateY(0px); */
	color : #CECECE;
}

.fa-question-circle:hover, .dialog__action:hover {
	-webkit-transform: translateY(-5px);
	transform: translateY(-5px);
	-webkit-transition: all 100ms ease-in; /*�ִϸ��̼� �ӵ�*/
	transition: all 100ms ease-in; /*�ִϸ��̼� �ӵ�*/
	box-shadow: 0 5px 10px rgba(51, 51, 51, 0.4); /*�׸���*/
}

.fa-question-circle:focus, .dialog__action:focus {
	outline: 0;
}

.fa-question-circle:active, .dialog__action:active {
	-webkit-transform: translateY(-3px);
	transform: translateY(-3px);
}

.dialog {
	background: #f1f1f1;
	width: 70%;
	position: absolute;
	left: calc(50% - 35%);
	top: 0;
	padding: 30px;
	box-shadow: 0 10px 30px rgba(51, 51, 51, 0.4);
	border: 3px solid #333333;
	visibility: hidden;
	opacity: 0;
	-webkit-transition: all 180ms ease-in;
	transition: all 180ms ease-in;
}

@media ( max-width : 600px) {
	.dialog {
		width: 90%;
		left: calc(50% - 45%);
	}
}

.dialog.dialog--active {
	top: 10%;
	visibility: visible;
	opacity: 1;
	-webkit-transition: all 250ms ease-out;
	transition: all 250ms ease-out;
}

.dialog .dialog__close {
	font-size: 2rem;
	line-height: 2rem;
	position: absolute;
	right: 15px;
	top: 15px;
	cursor: pointer;
	padding: 15px;
	-webkit-transition: color 150ms ease;
	transition: color 150ms ease;
}

.dialog .dialog__close:hover {
	color: #E74C3C;
}

.dialog .dialog__title {
	font-size: 2rem;
	font-family: 'Slabo 27px', serif;
	font-weight: 100;
	margin: 0;
	padding: 0 0 15px 0;
	border-bottom: 2px solid #333333;
}

.dialog .dialog__content {
	font-size: 1.1rem;
	line-height: 2rem;
}

.dialog .dialog__action {
	margin: 0;
	font-size: 1rem;
}
</style>


<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script src='//code.jquery.com/jquery.min.js'></script>
<script type="text/javascript">

	 $(function() {
		 
		$("#LSH").on("click", function() {
	 		$.ajax({

	 		url : "/api/json/infinityClick",
	 		method : "GET",
	 		dataType : "json",
	 		headers : {
	 			"Accept" : "application/json",
	 			"Content-Type" : "application/json"
	 		},

	 			success : function(JSONData, status) {
	 				$("#LSH").attr("src", JSONData.url);
	 				
					$(".dialog__title").text(JSONData.info1+JSONData.info2+JSONData.info3+JSONData.info4+JSONData.info5);
					
					
	 			}
	 		})
	 	}); 
	 });

	function dialog() {

		var dialogBox = $('.dialog'), 
		dialogTrigger = $('.fa-question-circle'), 
		dialogClose = $('.dialog__close'), 
		dialogTitle = $('.dialog__title'), 
		dialogContent = $('.dialog__content'), 
		dialogAction = $('.dialog__action');

		// Open the dialog
		dialogTrigger.on('click', function(e) {
			dialogBox.toggleClass('dialog--active');
			e.stopPropagation()
		});

		// Close the dialog - click close button
		dialogClose.on('click', function() {
			dialogBox.removeClass('dialog--active');
		});

		// Close the dialog - press escape key // key#27
		$(document).keyup(function(e) {
			if (e.keyCode === 27) {
				dialogBox.removeClass('dialog--active');
			}
		});

		// Close dialog - click outside
		$(document).on("click", function(e) {
			if ($(e.target).is(dialogBox) === false
				&& $(e.target).is(dialogTitle) === false
				&& $(e.target).is(dialogContent) === false
				&& $(e.target).is(dialogAction) === false) {
				dialogBox.removeClass("dialog--active");
			}
		});

	};

	// Run function when the document has loaded
	$(function() {
		dialog();
	});

</script>
<style>
	#infinityclick {
		position: relative;
		height: 300px;
		width : 1400px;
	}
	#infinityclick img {
		height: 300px;
		width: 1400px;
	}
	#infinityclick i{
	position : absolute;
	left : 13px;
	top: 13px;
	}
</style>

</head>
<body>

	<h3>infinityClick</h3>
	<div id="infinityclick" style="background-color:red">
		<img id="LSH" alt="" src="${tripInfo.url}">
		 <i class="far fa-question-circle"></i>
		<!-- <button class="dialog__trigger">������</button> -->
	</div>

	<div class="dialog">
		<span class="dialog__close">&#x2715;</span>
		<h2 class="dialog__title"> ${tripInfo.info1}, ${tripInfo.info2},
									${tripInfo.info3}, ${tripInfo.info4}</h2>
		<p class="dialog__content">Lorem ipsum dolor sit amet, consectetur
			adipisicing elit. Impedit necessitatibus illo deleniti doloremque
			culpa voluptas recusandae, sunt eligendi amet, ut modi voluptatibus
			ipsa quas voluptatem consectetur atque, velit reprehenderit debitis.</p>
		<button class="dialog__action">Read more &#8594;</button>

	</div>

<!-- 	<script async
		src="https://cse.google.com/cse.js?cx=015063284203154978978:emahxddazvy"></script>
	<div class="gcse-search"></div> -->


</body>


</html>