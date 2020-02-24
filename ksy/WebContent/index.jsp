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

    }

    .story-entry__image-wrap>img {
        width: 200px;
        height: auto;
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

    
    .planner-info{
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
                <h4>#여행지 추천</h4>
                사진을 클릭해보세요!
            </div>
        </section>

        <div style="clear: both"></div>



        <section class="planner-info">
            <div class="left">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/planner.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>당신의 플래너를 만들어보세요</h4>

                </div>
            </div>
            <div class="right">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/todo.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>간편한 투두 리스트</h4>

                </div>
            </div>
            <div class="left">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/route.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>예산과 여행 경로를 한 눈에</h4>
                </div>
            </div>
            <div class="justify">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/routeDetail.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>여행 루트는 빠르고 쉽게</h4>
                </div>
            </div>
            <div class="right">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/daily.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>다이어리처럼 쓸 수 있는 일정표</h4>
                </div>
            </div>
            <div class="justify">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/memo.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>어디에나 붙일 수 있는 포스트잇</h4>
                </div>
            </div>
            <div class="left">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/chat.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>친구들과 함께 짜는 여행</h4>
                </div>
            </div>

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










        <script type="text/javascript">
            jQuery(document).ready(function($) {
                randomImage();
                $("figure.effect5").on("click", function() {
                    randomImage();
                });
                getBestList();
                //getRecentList("C");
                getRecentList("B");
                getRecentList("F");
                //getRecentList("G");
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

            function appendTag(vo, boardName) {
                var tag = "";
                tag += "<li class=\"col-6 col-md-3 best-stories__content__item\">"
                tag += "<article class=\"story-entry story-story-item\"><a class=\"story-entry-link\" href=\"/community/getPost?postId=" + vo.postId + "&boardName=" + boardName + "\">";
                tag += "<div class=\"story-entry__image-wrap\">"
                var content = vo.postContent;
                var imgSrc = parseContent(content);
                tag += imgSrc;
                tag += "</div>"
                tag += "<div class=\"story-entry__content-wrap\">"
                tag += "<div class=\"story-entry__content\">"
                tag += "<div class=\"story-entry__content__title\">" + vo.postTitle;
                //tag += "<i class=\"far fa-eye\" style='float:right;font-size:1;'>" + vo.views + "</i>"
                tag += "</div><div class=\"story-entry__content__profile\" style='text-align: right;font-size:1;'>"
                tag += "<span class=\"story-entry__content__profile__name\"><br>by. " + vo.nickName + "</span></div></div></div></a></article></li>"
                //                tag += "<li><div class='wrapping-post'>"
                //                tag += "<div class='wrapping-crop'>"
                //                tag += imgSrc;
                //                tag += "</div>"
                //                tag += "<div class=\"wrapping-text\">"
                //                tag += "<p>" + vo.postTitle + "</p>";
                //                tag += "</div>"
                //                tag += "</div></li>"


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

        </script>
    </main>
    <jsp:include page="toolbar/pushBar.jsp" />
    <jsp:include page="toolbar/footer.jsp" />
</body>

</html>
