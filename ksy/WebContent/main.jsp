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
    main div {
        margin-top: 30px;
        margin-bottom: 50px;
    }

    div.main-infinite {
        margin: 10%;
    }

    div.random-text {
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
        font-size: 1.3em;
        letter-spacing: 2px;
        font-weight: 100;
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

</style>

<body>
    <jsp:include page="toolbar/toolBar.jsp" />
    <main>
        <div id="main-carousel" class="carousel slide" data-ride="carousel">
            <!-- 슬라이드 쇼 -->
            <div class="carousel-inner">
                <!--첫번째 슬라이드-->
                <div class="carousel-item active">
                    <img class="d-block w-100" src="/resources/images/mainImg/london%20(2).jpg" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block" style="text-align: left;">
                        <h2>유럽여행의 시작</h2>
                        <p>당신을 기다리는 백만 개의 플래너와 함께하세요.</p>
                    </div>
                </div>
                <!--두번째 슬라이드-->
                <div class="carousel-item">
                    <div class="carousel-caption d-none d-md-block" style="text-align: right;">
                        <h5 style="color:dimgray;">유럽여행의 시작</h5>
                        <p style="color:dimgray;">당신을 기다리는 백만 개의 플래너와 함께하세요.</p>
                    </div>
                    <img class="d-block w-100" src="/resources/images/mainImg/paris_3840x2400%20(2).jpg" alt="First slide">
                </div>
                <!--세번째 슬라이드-->
                <div class="carousel-item">
                    <img class="d-block w-100" src="/resources/images/mainImg/rome.jpg" alt="Third slide">
                </div>
                <!-- / 슬라이드 쇼 끝 -->

                <!-- 왼쪽 오른쪽 화살표 버튼 시작 -->
                <a class="carousel-control-prev" href="#main-carousel" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <!-- <span>Previous</span> --> </a>

                <a class="carousel-control-next" href="#main-carousel" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <!-- <span>Next</span> --> </a>
                <!-- 왼쪽 오른쪽 화살표 버튼 끝 -->

                <!-- 인디케이터 -->
                <ul class="carousel-indicators">
                    <li data-target="#main-carousel" data-slide-to="0" class="active"></li>
                    <!--0번부터시작-->
                    <li data-target="#main-carousel" data-slide-to="1"></li>
                    <li data-target="#main-carousel" data-slide-to="2"></li>
                </ul>
                <!-- 인디케이터 끝 -->
            </div>
        </div>



        <div class="main-infinite">
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
        </div>
        <div class="main-best">
        </div>

        <script type="text/javascript">
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
                        $('h3').html(JSONData.info1 + JSONData.info2 + JSONData.info3 + JSONData.info4 + JSONData.info5);
                    }
                })
            }
            jQuery(document).ready(function($) {
                randomImage();

                $("figure.effect5").on("click", function() {
                    randomImage();
                });
            });

        </script>
    </main>
    <jsp:include page="toolbar/pushBar_sy.jsp" />
</body>

</html>
