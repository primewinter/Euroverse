<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
    <title>Euroverse, 유럽 여행의 시작</title>
    <meta charset="EUC-KR">

    <!-- 참조 : http://getbootstrap.com/css/   참조 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/carousel/">
    <!-- sweetalert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">


    <!-- Use Swiper from CDN -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    <script src="https://unpkg.com/swiper/js/swiper.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>


    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<style>
    @font-face {
        font-family: '양진체';
        src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    main section {
        margin-top: 30px;
        margin-bottom: 50px;
    }

    section.main-infinite {
        margin: 10%;
    }

    section.random-text {
        display: inline-block;
        vertical-align: bottom;
        text-align: left;
        margin: 3em;
    }

    /*메인 캐러셀*/
    div.carousel-inner {
        height: auto;

    }

    .carousel-inner>.carousel-item {
        width: 100%;
        height: 400px;
        vertical-align: baseline;

    }

    .carousel-inner>.carousel-item>img {
        width: 640px;
        height: 720px;
    }

    .carousel-caption {
        text-align: left;
    }


    /*무한클릭 이미지 mouseHover CSS*/

    .effect-wrap {
        width: 600px;
        height: 500px;
        display: inline-block;
        float: left;
        justify-content: center;
        align-items: center;
    }

    .effect5 {
        position: relative;
        display: inline-block;
        vertical-align: middle;
        width: 600px;
        height: 500px;
        overflow: hidden;
        /*box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);*/
    }

    .effect5 img {
        display: flex;
        width: 100%;
        height: 100%;
        filter: sepia(20%) saturate(60%);
    }

    .effect5 figcaption {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        z-index: 1;
        text-align: center;
        line-height: 1.7em;
        color: #fff;
        text-transform: uppercase;
        font-size: 20px;
        opacity: 0;
        transition: all 0.3s ease;
    }

    .effect5 figcaption h3 {
        font-family: '양진체';
        font-size: 1.3em;
        letter-spacing: 2px;
        /*font-weight: 100;*/
    }

    .effect5 figcaption em {
        display: block;
        font-weight: bold;
        letter-spacing: 1px;
        font-weight: 700;
    }

    .effect5:before,
    .effect5:after {
        content: '';
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-color: rgba(0, 0, 0, 0.3);
        border-top: 70px solid rgba(0, 0, 0, 0.4);
        border-bottom: 70px solid rgba(0, 0, 0, 0.4);
        transition: all 0.3s ease;
        z-index: 1;
        opacity: 0;
    }

    .effect5:before {
        transform: scaley(2);
    }

    .effect5:after {
        transform: scaley(2);
    }

    .effect5:hover:before,
    .effect5:hover:after {
        opacity: 1;
        transform: scale(1);
    }

    .effect5:hover>img {
        opacity: 0.7;
    }

    .effect5:hover figcaption {
        opacity: 1;
        transition-delay: 0.1s;
    }


    .story-entry__image-wrap {
        text-align: center;
        overflow: hidden;
        bottom: 0px;
        width: 300px;
        height: 300px;
    }

    .story-entry__image-wrap>img {
        width: auto;
        height: 400px;
        overflow: hidden;
    }

    .story-entry__image-wrap>img:hover {
        /* img 마우스 오버시*/
        cursor: pointer;
        transform: scale(1.1);
        /* 마우스 오버시 이미지 크기를 1.1 배만큼 확대시킨다. */
        -o-transform: scale(1.1);
        -moz-transform: scale(1.1);
        -webkit-transform: scale(1.1);
        transition: transform .35s;
        -o-transition: transform .35s;
        -moz-transition: transform .35s;
        -webkit-transition: transform .35s;
        /* 마우스 오버시 이미지가 즉시 커지지않고 30.5 second 의 시간에 걸쳐 커진다 애니메이션 효과*/
    }




    .story-entry__content__profile {
        text-align: right;
        font-size: 9pt;
    }

    .wrapping-crop {
        max-width: 200px;
        overflow: hidden;
    }

    .wrapping-post {
        width: 40%;
        margin: 10px auto;
        border: 1px solid #000000;
    }

    .wrapping-crop img {
        width: 100%;
        vertical-align: middle;
        max-width: initial;
        margin-left: 50%;
    }

    .wrapping-text {
        padding: 5px 10px;
        background-color: yellow;
        text-align: center;
    }


    .planner-info {
        display: none;
    }

    .left {
        text-align: left;
        margin: 10%;
        width: 80%;
    }

    .left.planner-info-img {
        /*        float: left;*/

    }

    .left.planner-info-text {
        /*        float: right;*/
    }

    .justify {
        text-align: center;
        margin: 10%;
        width: 80%;
    }

    .right {
        /*        text-align: right;*/
        margin: 10%;
        width: 80%;
        text-align: right;
    }

    .right.planner-info-img {
        /*        float: right;*/
    }

    .right.planner-info-text {
        /*        float: left;*/
    }


    #conturyMoney {
        width: 300px;
        height: 300px;
        border: 1px solid teal;
        border-radius: 10px;

    }

    /* 국가선택창 Box css  */
    #wrapper {
        width: 300px;
        height: 300px;
        /* border: 1px solid teal;
        border-radius: 10px;
        box-shadow: 5px 5px grey;*/
    }

    /* 국가선택창에 제목때문에 걸어둔 css  */
    h5 {
        padding-top: 0.6rem;
        text-align: center;
        font-weight: bold;
        font-family: "Noto Sans CJK KR", "Helvetica Neue", "Apple SD Gothic Neo", sans-serif;
        font-size: 26px;
    }


    .list-group {
        width: 300px;
        overflow: auto;
        height: 250px;
        padding-top: 1rem;
        padding-bottom: 0.1rem;
    }

    .list-group-item {
        font-weight: bold;
        size: 40px;
        padding-bottom: 0.3rem;
        padding-top: 0.3rem;
        border-radius: 10px;

    }

    .list-group img {
        width: 40px;
        vertical-align: sub;
    }

    .border-0 {
        width: 40px;
        height: 30px;
    }

    .flex-nowrap {
        height: 300px;
        /*border: 1px solid teal;
        border-radius: 10px;*/
        width: 300px;
    }


    /* 금액입력창 css  */
    .conturyMoney {
        width: 300px;
        top: 50px;
        position: relative;
        justify-content: center;
        text-align: right;
        color: #309EFE;
        font-size: 17px;

    }

</style>

<body>
    <jsp:include page="toolbar/toolBar.jsp" />

    <main>
        <div style="clear:both">
            <div id="main-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <!-- 슬라이드 쇼 -->
                    <div class="carousel-item active">
                        <!--가로--> <img class="d-block w-100" src="/resources/images/mainImg/london%20(2).jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h2>유럽여행의 시작</h2>
                            <p>당신을 기다리는 백만 개의 플래너와 함께하세요.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/resources/images/mainImg/paris_3840x2400%20(2).jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/resources/images/mainImg/rome.jpg" alt="Third slide">
                    </div> <!-- / 슬라이드 쇼 끝 -->
                    <!-- 왼쪽 오른쪽 화살표 버튼 -->
                    <a class="carousel-control-prev" href="#main-carousel" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <!-- <span>Previous</span> --> </a>
                    <a class="carousel-control-next" href="#main-carousel" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <!-- <span>Next</span> --> </a> <!-- / 화살표 버튼 끝 -->
                    <!-- 인디케이터 -->
                    <ul class="carousel-indicators">
                        <li data-target="#main-carousel" data-slide-to="0" class="active"></li>
                        <!--0번부터시작-->
                        <li data-target="#main-carousel" data-slide-to="1"></li>
                        <li data-target="#main-carousel" data-slide-to="2"></li>
                    </ul> <!-- 인디케이터 끝 -->
                </div>
            </div>
        </div>



        <section class="main-infinite">
            <div class="effect-wrap">
                <figure class="effect5">
                    <img id="infinityClick" src="https://tistory4.daumcdn.net/tistory/2141493/skin/images/simg06.png">
                    <figcaption>
                        <h3>여행지<em>추천</em></h3>
                    </figcaption>
                </figure>
            </div>
            <div class="random-text">
                <div id="wrapper" class="wrapper" style="overflow:hidden;">
                    <h5>오늘의 환율</h5>
                    <div class="list-group" id="list-tab" role="tablist">
                        <a class="list-group-item list-group-item-action" id="a" data-toggle="list" href="#list-home" hwa='유로' mon="EUR" con="GBR">
                            <img src='/resources/images/tripInfoimges/Europe.png' />&nbsp; 유럽</a>
                        <a class="list-group-item list-group-item-action" id="b" data-toggle="list" href="#list-profile" hwa='포린트' mon="HUF" con="HUN">
                            <img src='/resources/images/tripInfoimges/Hungary.gif' />&nbsp; 헝가리</a>
                        <a class="list-group-item list-group-item-action" id="c" data-toggle="list" href="#list-messages" hwa='코루나' mon="CZK" con="CZE">
                            <img src='/resources/images/tripInfoimges/Czech.gif' />&nbsp; 체코</a>
                        <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" hwa='크로네' mon="DKK" con="DNK">
                            <img src='/resources/images/tripInfoimges/Denmark.gif' />&nbsp; 덴마크</a>
                        <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" hwa='파운드' mon="GBP" con="GBR">
                            <img src='/resources/images/tripInfoimges/England.gif' />&nbsp; 영국</a>
                        <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" hwa='레우' mon="RON" con="ROU">
                            <img src='/resources/images/tripInfoimges/Lithuania.gif' />&nbsp; 루마니아</a>
                        <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" hwa='크로나' mon="SEK" con="SWE">
                            <img src='/resources/images/tripInfoimges/Sweden.gif' />&nbsp; 스웨덴</a>
                        <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" hwa='쿠나' mon="HRK" con="HRV">
                            <img src='/resources/images/tripInfoimges/Croatia.gif' />&nbsp; 크로아티아</a>
                        <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" hwa='프랑' mon="CHF" con="CHE">
                            <img src='/resources/images/tripInfoimges/Swiss.gif' />&nbsp; 스위스</a>
                        <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" hwa='레바' mon="BGN" con="BGR">
                            <img src='/resources/images/tripInfoimges/Bulgaria.gif' />&nbsp; 불가리아</a>
                        <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" hwa='리라' mon="TRY" con="TUR">
                            <img src='/resources/images/tripInfoimges/Turkey.gif' />&nbsp; 터키</a>
                        <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" hwa='크로네' mon="NOK" con="NOR">
                            <img src='/resources/images/tripInfoimges/norway.gif' />&nbsp; 노르웨이</a>
                        <a class="list-group-item list-group-item-action" id="d" data-toggle="list" href="#list-settings" hwa='즈워티' mon="PLN" con="POL">
                            <img src='/resources/images/tripInfoimges/Poland.png' />&nbsp; 폴란드</a>
                    </div>
                </div>

                <!-- ============국가정보출력 box ================ -->

                <div class="title">
                    <div class="content">
                        <img class="conImg" alt="" src="" />
                    </div>

                </div>

                <!-- =========== 환율금액입력 ====================  -->
                <div class="input-group flex-nowrap">
                    <div class="conturyMoney">
                        <input type="text" name='conMoney1' class="form-control" placeholder="대한민국" aria-describedby="addon-wrapping" value="" onkeydown="exchange()">
                        원<br /><br /><br /><br />
                        <input type="text" name='conMoney' id="result" class="form-control" placeholder="" readonly="readonly" value="">
                        <div class='text'>
                        </div>
                    </div>
                </div>
                <!-- 현재 한국 시간 구하기 : <span id="toNow"></span> -->


                <!--  <script type="text/javascript">
		    var IScroll = $.AMUI.iScroll;
		    var myScroll = new IScroll('#wrapper', { click: true });
		</script> -->
            </div>
        </section>

        <div style="clear: both"></div>



        <section class="new-plan">
            <section class="container plan-section">
                <header class="row plan-section__header">
                    <h2 class="col plan-section__header__content">새로운 플래너</h2>
                </header>
                <ul class="row plan-stories__content">

                </ul>
            </section>
        </section>



        <section class="main-best">
            <section class="container review-section">
                <header class="row review-section__header">
                    <h2 class="col review-section__header__content">여행후기</h2>
                </header>
                <ul class="row review-stories__content">

                </ul>
            </section>
        </section>


        <section class="container recent">
            <header class="row recent__header">
                <h2 class="col recent__header__content">여행정보</h2>
            </header>
            <ul class="row recent-stories__content">

            </ul>
        </section>
    </main>






    <script type="text/javascript">
        jQuery(document).ready(function($) {
            //randomImage();
            $("figure.effect5").on("click", function() {
                randomImage();
            });
            //getBestList();
            //getRecentList("C");
            getRecentList("B");
            getRecentList("F");
            getMainPlanner("E");
        });

        function randomImage() {
            $.ajax({
                url: "/api/json/infinityClick",
                method: "GET",
                dataType: "json",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                success: function(JSONData, status) {
                    $('#infinityClick').attr('src', JSONData.url);
                    $('figcaption h3').html(JSONData.info1 + JSONData.info2 + JSONData.info3 + JSONData.info4 + JSONData.info5);
                }
            })
        }

        function getBestList() {
            $.ajax({
                url: "/main/json/getBestList?boardName=C&searchCondition=0",
                method: "GET",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                success: function(result) {
                    var list = result;
                    console.log(result);
                    $.each(list, function(index, vo) {
                        console.log(vo);
                        //appendTag(vo, 'C');
                    })
                },
                error: function(err) {
                    console.log(err);
                }
            })

        }

        function getRecentList(boardName) {
            $.ajax({
                url: "/main/json/getRecentList?boardName=" + boardName,
                method: "GET",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                success: function(result) {
                    console.log(boardName + " :: " + result);
                    $.each(result, function(index, vo) {
                        appendTag(vo, boardName)
                    })
                },
                error: function(err) {
                    console.log(err);
                }
            })
        }

        function getMainPlanner(boardName) {
            $.ajax({
                url: "/main/json/getMainPlanner?boardName=" + boardName,
                method: "GET",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                success: function(result) {
                    console.log(result.list);
                    console.log(result.planList);
                    $.each(result.planList, function(i, plan) {
                        $.each(result.list, function(j, post) {
                            if (plan.planId == post.planId) {
                                appendPlanner(plan, post);
                                console.log(plan + " || " + post);
                            }
                        })
                    })
                },
                error: function(err) {
                    console.log(err);
                }
            })
        }

        function appendPlanner(plan, post) {
            var tag = "";
            tag += "<li class=\"col-6 col-md-3 best-stories__content__item\">"
            tag += "<article class=\"story-entry story-story-item\"><a class=\"story-entry-link\" href=\"/community/getPost?postId=" + post.postId + "&boardName=E\">";
            tag += "<div class=\"story-entry__image-wrap\">"
            tag += "<img src='/resources/images/planImg/" + plan.planImg + "'>";
            tag += "</div>"
            tag += "<div class=\"story-entry__content-wrap\">"
            tag += "<div class=\"story-entry__content\">"
            tag += "<div class=\"story-entry__content__title\">" + post.postTitle;
            //tag += "<i class=\"far fa-eye\" style='float:right;font-size:1;'>" + vo.views + "</i>"
            tag += "</div><div class=\"story-entry__content__profile\" style='text-align: right;font-size:1;'>"
            tag += "<span class=\"story-entry__content__profile__name\"><br>by. " + post.nickName + "</span></div></div></div></a></article></li>"

            $('.plan-stories__content').append(tag);
        }

        function appendTag(vo, boardName) {
            var tag = "";
            tag += "<li class=\"col-6 col-md-3 best-stories__content__item\">"
            tag += "<article class=\"story-entry story-story-item\"><a class=\"story-entry-link\" href=\"/community/getPost?postId=" + vo.postId + "&boardName=" + boardName + "\">";
            tag += "<div class=\"story-entry__image-wrap\">"
            var content = vo.postContent;
            var imgSrc = parseContent(content);
            console.log("content ::: " +imgSrc);
            if( imgSrc != '' ) {
                console.log("이미지 있다^^")
                tag += imgSrc;
            } else {
                tag += "<i class=\"fas fa-quote-left\ fa-2x\"></i>";
            }
            tag += "</div>"
            tag += "<div class=\"story-entry__content-wrap\">"
            tag += "<div class=\"story-entry__content\">"
            tag += "<div class=\"story-entry__content__title\">" + vo.postTitle;
            tag += "</div><div class=\"story-entry__content__profile\" style='text-align: right;font-size:1;'>"
            tag += "<span class=\"story-entry__content__profile__name\"><br>by. " + vo.nickName + "</span></div></div></div></a></article></li>"


            if (boardName == 'F') {
                $('.review-stories__content').append(tag);
            } else if (boardName == 'C') {
                $('.best-stories__content').append(tag);
            } else {
                $('ul.recent-stories__content').append(tag);
            }

        }

        function parseContent(content) {
            if (content.includes('<img')) {
                var startInt = content.indexOf('img');
                var endInt = content.indexOf('>', startInt);
                var result = content.substring(startInt - 1, endInt + 1);
                return result;
            } else {
                return "";
            }

        }


        function showBest(vo) {
            var tag = "";
            tag += "<table width=95%>"
            tag += "<tr>"
            tag += "<td style='margin:auto;text-align:center' width='10%'>"
            tag += "<input type='checkbox' name='chk' id='" + vo.post + "' value='" + vo.pushId + "'>"; // style='display:none;'
            tag += "</td>"
            tag += "<td style='text-align:left;margin-left:10'>"
            tag += "<font size='2'  font color='black'>"
            tag += "<a href='/community/getPost?postId=" + vo.refId + "&boardName=" + vo.boardName + "'>";
            tag += "<a href='/myPage/myOfferList' >"; // 초대 목록 리스트 링크
            tag += "<a href='/community/getPost?postId=" + vo.refId + "&boardName=D' >" // 동행 신청 목록 리스트 링크
            tag += vo.pushMsg + "</font></td>";
            tag += "<tr>";
            tag += "<td colspan='2' style='text-align:right;vertical-align:top;'>";
            tag += "<font size='1' font color='gray'>" + vo.pushTime + "</font></a>";
            tag += "</td>";
            tag += "</tr>";

            tag += "</table>"
            tag += "<style>"
            tag += "label { font-weight: normal; font-color: white; }"
            tag += "</style>";

            //$(".main-best").append(tag);
        }



        function printTime() {
            var clock = document.getElementById("clock");
            var now = new Date();

            clock.innerHTML = now.getFullYear() + "년 " +
                (now.getMonth() + 1) + "월 " +
                now.getDate() + "일 " +
                now.getHours() + "시 " +
                now.getMinutes() + "분 " +
                now.getSeconds() + "초";

            setTimeout("printTime()", 1000);
        }

        window.onload = function() {
            printTime();
        };




        document.addEventListener("DOMContentLoaded", function() {

            var toTime = new Date();

            document.getElementById("toNow").innerHTML = toTime.toString();
        });
        /* 	$(".list-group-item-action").on('click', function() {
        				
        		alert($(this).attr('con')); 
        		var conName = $(this).attr('con');
        		
        		conturyInfo(conName);
        		
        	}) */

        $(function() {

            $.getJSON('').done('https://earthquake.kr:23490/query/KRWEUR')

        })


        $(function() {
            $(".list-group-item-action").click(function() {

                var conCode = $(this).attr('con');
                var conName = $(this).text();
                var conHwa = $(this).attr('hwa');
                conturyInfo(conCode);
                $('input[name="conMoney"]').attr('placeholder', conName.trim());
                $('.text').html(conHwa);

            });
        });

        function conturyInfo(conCode) {


            $.ajax({
                url: "/api/json/exchange/" + conCode,
                method: "GET",
                dataType: "json",
                data: JSON.stringify({
                    conCode: conCode
                }),
                contentType: "application/x-www-form-urlencoded; charset=EUC-KR",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                success: function(JSONData, status) {

                    var conInfo = JSONData.response.body.items.item.basic;
                    var contury = JSONData.response.body.items.item.countryName;
                    var conFlag = JSONData.response.body.items.item.imgUrl;
                    /* alert(conName); */
                    /* $("#form-group").html(myItem); */
                    /* $("img[class='conImg']").attr("src", conFlag);
                    $('.title').html(contury); */
                    $('.content').html(conInfo);

                }
            });
        };

        function exchange(data) {

            if ($(".list-group-item-action")) {
                $.getJSON('https://api.exchangeratesapi.io/latest?base=KRW').done(

                    function(data) {

                        var mon = $(".list-group-item-action.active").attr('mon');

                        if (mon == undefined) {
                            $("input[name='conMoney1']").val("국가를 선택하세요")
                                .return;
                        }

                        var price = $("input[class='form-control']").val();
                        /* var num = price/ data.rates[cur] */

                        var num = Math.round(price.match(/\d+/)[0] /
                            data.rates[mon]);
                        /* alert(num);
                        alert(data.rates[abc]); */
                        price = price.replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
                        num = num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')

                        $('#result').attr("value", num);
                    })
            }
        }

    </script>

    <jsp:include page="toolbar/pushBar.jsp" />
    <jsp:include page="toolbar/footer.jsp" />

</body>

</html>
