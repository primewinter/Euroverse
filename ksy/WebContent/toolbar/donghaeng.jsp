<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- 부트스트랩 4.4 쓰려다가 빠꾸...............................했다가 다시 4.4로..  -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- sweetalert2 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	
	
	<!-- Use Swiper from CDN -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	
	
	<!-- FontAwesome CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

		body {
            padding-top : 90px;
            font-family:  'Noto Sans KR', sans-serif;
        }
         #accChat {
            color: #555;
            font-size: 9px;
            /* z-index: 999; */
            -webkit-box-shadow: 0 1px 2px 0 #777;
            box-shadow: 0 1px 2px 0 #777;
            background-color: lightblue;
        }
        .accLobby {
        	margin-top: 20px;
        }
        .accRoom {
        	padding: 3px;
        }

		.accChat.info {
			height:20px;
			padding: 5px;
		}
        .accChat.output {
            float: inherit;
            margin-top: 20px;
            height: 410px;
            overflow-y:auto;
            overflow-x:hidden;
        }

        .accChat.input {
            float: inherit;
            padding: 5px;
            height: auto;
            background-color: white;
        }
        
        .accRoom {
            text-align:left;
        }
        
        .bubble {
        	display: inline-block;
        	border-radius: 10px;
        	padding: 5px;
        	max-width: 200px;
        	word-wrap: break-word;
        }
        .bubble.mine {
		    border: 1 solid gold;
		    background:gold;
		    float:right;
		}    
		.bubble.other {
			border: 1 solid white;
		    background:white;
		    float:left;
		}
		.chat.system {
			text-align: center;
			margin: 20px;
			border: 1px solid black;
			border-radius:20px;
			background: black;
			padding: 2px;
			opacity: 40%;
		}
		.chat.mine {
			text-align:right;
			margin:10px;
		}
		.mine.msg.sendTime {
			margin-right: 3px;
			vertical-align:bottom;
		}
		.other.msg.sendTime {
			margin-left: 3px;
			vertical-align:bottom;
		}
		.none {
			display:none;
		}
		.right {
			text-align: right;
		}
		.row {
			display:inline-block;
			margin-right:1px;
		}
}

     </style>
	
</head>

<body>

	<jsp:include page="/toolbar/toolBar.jsp" />
			
   				  

	<script>
	        jQuery(document).ready(function($) {
	        	//connectPlanChat();
	        });
	        
	        $(function() {
	        	
	        	/* if($('div.bubble').hasClass('mine')) {
	        		$('div.bubble.mine').parent().addClass('right');
	        	} */
	        });
    </script>
<jsp:include page="/toolbar/pushBar_jay.jsp"/>
</body>
</html>