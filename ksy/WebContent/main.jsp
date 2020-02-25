<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
    <title>Euroverse, ���� ������ ����</title>
    <meta charset="EUC-KR">

    <!-- ���� : http://getbootstrap.com/css/   ���� -->
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    <script src="https://unpkg.com/swiper/js/swiper.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>


    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    
     <!-- AOS CDN2 :: https://michalsnik.github.io/aos/-->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>
<style>
    @font-face { font-family: 'GmarketSansBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff'); font-weight: normal; font-style: normal; }
    @font-face {
        font-family: '����ü';
        src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    main section {
        margin-top: 20em;
        margin-bottom: 5em;
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

    /*���� ĳ����*/
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


    /*����Ŭ�� �̹��� mouseHover CSS*/

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
        font-family: '����ü';
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
        overflow: hidden;
        bottom: 0px;
        width: 100%;
        height: 300px;
        font-style: oblique;
    }

    .topic {
        margin: 3em 1em 3em 1em;
    }

    .story-entry__image-wrap>img,
    .story-entry__image-wrap>figure>img {
        width: auto;
        vertical-align: middle;
        height: 300px;
        object-fit: cover;
        overflow: hidden;
    }

    .story-entry__image-wrap>img:hover,
    .story-entry__image-wrap>figure>img:hover {
        /* img ���콺 ������*/
        cursor: pointer;
        transform: scale(1.1);
        /* ���콺 ������ �̹��� ũ�⸦ 1.1 �踸ŭ Ȯ���Ų��. */
        -o-transform: scale(1.1);
        -moz-transform: scale(1.1);
        -webkit-transform: scale(1.1);
        transition: transform .35s;
        -o-transition: transform .35s;
        -moz-transition: transform .35s;
        -webkit-transition: transform .35s;
        /* ���콺 ������ �̹����� ��� Ŀ�����ʰ� 30.5 second �� �ð��� ���� Ŀ���� �ִϸ��̼� ȿ��*/
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



    #countryMoney {
        width: 300px;
        height: 300px;
        border: 1px solid teal;
        border-radius: 10px;

    }

    /* ��������â Box css  */
    #wrapper {
        width: 300px;
        height: 300px;
        /* border: 1px solid teal;
        border-radius: 10px;
        box-shadow: 5px 5px grey;*/
    }

    /* ��������â�� ���񶧹��� �ɾ�� css  */
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


    /* �ݾ��Է�â css  */
    .countryMoney {
        width: 300px;
        top: 50px;
        position: relative;
        justify-content: center;
        text-align: right;
        color: #309EFE;
        font-size: 17px;

    }



    @import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);

    figure.snip1384 {
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 230px;
        max-width: 315px;
        width: 100%;
        color: #ffffff;
        text-align: left;
        font-size: 16px;
        background-color: #000000;
    }

    figure.snip1384 * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: all 0.35s ease;
        transition: all 0.35s ease;
    }

    figure.snip1384 img {
        max-width: 100%;
        backface-visibility: hidden;
        vertical-align: top;
    }

    figure.snip1384:after,
    figure.snip1384 figcaption {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
    }

    figure.snip1384:after {
        content: '';
        background-color: rgba(0, 0, 0, 0.65);
        -webkit-transition: all 0.35s ease;
        transition: all 0.35s ease;
        opacity: 0;
    }

    figure.snip1384 figcaption {
        z-index: 1;
        top: 20px;
        left: 20px;
    }

    figure.snip1384 h3,
    figure.snip1384 .links {
        width: 100%;
        margin: 5px 0;
        padding: 0;
    }

    figure.snip1384 h3 {
        line-height: 1.1em;
        font-weight: 700;
        font-size: 1.4em;
        text-transform: uppercase;
        opacity: 0;
    }

    figure.snip1384 p {
        font-size: 0.8em;
        font-weight: 300;
        letter-spacing: 1px;
        opacity: 0;
        top: 50%;
        -webkit-transform: translateY(40px);
        transform: translateY(40px);
    }

    figure.snip1384 i {
        position: absolute;
        bottom: 10px;
        right: 10px;
        padding: 20px 25px;
        font-size: 34px;
        opacity: 0;
        -webkit-transform: translateX(-10px);
        transform: translateX(-10px);
    }

    figure.snip1384 a {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 1;
    }

    figure.snip1384:hover img,
    figure.snip1384.hover img {
        zoom: 1;
        filter: alpha(opacity=50);
        -webkit-opacity: 0.5;
        opacity: 0.5;
    }

    figure.snip1384:hover:after,
    figure.snip1384.hover:after {
        opacity: 1;
        position: absolute;
        top: 0px;
    }

    figure.snip1384:hover h3,
    figure.snip1384.hover h3,
    figure.snip1384:hover p,
    figure.snip1384.hover p,
    figure.snip1384:hover i,
    figure.snip1384.hover i {
        -webkit-transform: translate(0px, 0px);
        transform: translate(0px, 0px);
        opacity: 1;
    }



    /*ȯ�� ��������*/
    main-infinite.swiper-container {
        height: 120px;
    }

    .swiper-slide {
        text-align: center;
        display: flex;
        /* ������ �߾����� �ϱ����� flex ��� */
        align-items: center;
        /* ���Ʒ� ���� �߾����� */
        justify-content: center;
        /* �¿� ���� �߾����� */
        cursor: pointer;
    }

    .swiper-slide img {
        max-width: 80%;
        /* �̹��� �ִ�ʺ� ����, �����̵忡 �̹����� �������� �������� �ʿ� */
        /* �� �������� �ʿ��ؼ� �����߽��ϴ�. ��Ȳ������ �ٸ� �� �ֽ��ϴ�. */
    }

    .swiper-slide {
        opacity: 60%;
    }

    .swiper-slide:hover {
        opacity: 100%;
    }

    .swiper-slide.on {
        opacity: 100%;
    }

    .popupLayer {
        position: absolute;
        display: none;
        background-color: #ffffff;
        border: solid 2px #d0d0d0;
        width: 350px;
        height: auto;
        padding: 10px;
        font-size: 0.8em;
    }

    .popupLayer .popup-close {
        position: absolute;
        top: 5px;
        right: 10px
    }
    
    
    section > header {
        font-family: 'GmarketSansBold';
        font-style: italic;
        display: inline-block;
        background-color: #ffcf00;
        text-align:left;
        margin: 2em;
    }

</style>

<body>
    <jsp:include page="toolbar/toolBar.jsp" />

    <main>
        <div style="clear:both">
            <div id="main-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <!-- �����̵� �� -->
                    <div class="carousel-item active">
                        <!--����--> <img class="d-block w-100" src="/resources/images/mainImg/london%20(2).jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h2>���������� ����</h2>
                            <p>����� ��ٸ��� �鸸 ���� �÷��ʿ� �Բ��ϼ���.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/resources/images/mainImg/paris_3840x2400%20(2).jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/resources/images/mainImg/rome.jpg" alt="Third slide">
                    </div> <!-- / �����̵� �� �� -->
                    <!-- ���� ������ ȭ��ǥ ��ư -->
                    <a class="carousel-control-prev" href="#main-carousel" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <!-- <span>Previous</span> --> </a>
                    <a class="carousel-control-next" href="#main-carousel" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <!-- <span>Next</span> --> </a> <!-- / ȭ��ǥ ��ư �� -->
                    <!-- �ε������� -->
                    <ul class="carousel-indicators">
                        <li data-target="#main-carousel" data-slide-to="0" class="active"></li>
                        <!--0�����ͽ���-->
                        <li data-target="#main-carousel" data-slide-to="1"></li>
                        <li data-target="#main-carousel" data-slide-to="2"></li>
                    </ul> <!-- �ε������� �� -->
                </div>
            </div>
        </div>



        <section class="main-infinite">
            <div class="effect-wrap">
                <figure class="effect5">
                    <img id="infinityClick" src="https://tistory4.daumcdn.net/tistory/2141493/skin/images/simg06.png">
                    <figcaption>
                        <h3>������<em>��õ</em></h3>
                    </figcaption>
                </figure>
            </div>
            <div class="random-text"></div>




            <!-- Ŭ�������� �����ϸ� �� �� -->
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><a id="a" data-toggle="list" href="#list-home" hwa='����' mon="EUR" con="GBR">
                            <img src='/resources/images/tripInfoimges/Europe.png' />
                            <p>EU</p>
                        </a></div>
                    <div class="swiper-slide"> <a id="b" data-toggle="list" href="#list-profile" hwa='����Ʈ' mon="HUF" con="HUN">
                            <img src='/resources/images/tripInfoimges/Hungary.gif' />
                            <p>�밡��</p>
                        </a></div>
                    <div class="swiper-slide"><a id="c" data-toggle="list" href="#list-messages" hwa='�ڷ糪' mon="CZK" con="CZE">
                            <img src='/resources/images/tripInfoimges/Czech.gif' />
                            <p>ü��</p>
                        </a></div>
                    <div class="swiper-slide"><a id="d" data-toggle="list" href="#list-settings" hwa='ũ�γ�' mon="DKK" con="DNK">
                            <img src='/resources/images/tripInfoimges/Denmark.gif' />
                            <p>����ũ</p>
                        </a></div>
                    <div class="swiper-slide"><a id="d" data-toggle="list" href="#list-settings" hwa='�Ŀ��' mon="GBP" con="GBR">
                            <img src='/resources/images/tripInfoimges/England.gif' />
                            <p>����</p>
                        </a></div>
                    <div class="swiper-slide"><a id="d" data-toggle="list" href="#list-settings" hwa='����' mon="RON" con="ROU">
                            <img src='/resources/images/tripInfoimges/Lithuania.gif' />
                            <p>�縶�Ͼ�</p>
                        </a></div>
                    <div class="swiper-slide"><a id="d" data-toggle="list" href="#list-settings" hwa='ũ�γ�' mon="SEK" con="SWE">
                            <img src='/resources/images/tripInfoimges/Sweden.gif' />
                            <p>������</p>
                        </a></div>
                    <div class="swiper-slide"> <a id="d" data-toggle="list" href="#list-settings" hwa='��' mon="HRK" con="HRV">
                            <img src='/resources/images/tripInfoimges/Croatia.gif' />
                            <p>ũ�ξ�Ƽ��</p>
                        </a></div>
                    <div class="swiper-slide"><a id="d" data-toggle="list" href="#list-settings" hwa='����' mon="CHF" con="CHE">
                            <img src='/resources/images/tripInfoimges/Swiss.gif' />
                            <p>������</p>
                        </a></div>
                    <div class="swiper-slide"> <a id="d" data-toggle="list" href="#list-settings" hwa='����' mon="BGN" con="BGR">
                            <img src='/resources/images/tripInfoimges/Bulgaria.gif' />
                            <p>�Ұ�����</p>
                        </a></div>
                    <div class="swiper-slide"><a id="d" data-toggle="list" href="#list-settings" hwa='����' mon="TRY" con="TUR">
                            <img src='/resources/images/tripInfoimges/Turkey.gif' />
                            <p>��Ű</p>
                        </a></div>
                    <div class="swiper-slide"> <a id="d" data-toggle="list" href="#list-settings" hwa='ũ�γ�' mon="NOK" con="NOR">
                            <img src='/resources/images/tripInfoimges/norway.gif' />
                            <p>�븣����</p>
                        </a></div>
                    <div class="swiper-slide"><a id="d" data-toggle="list" href="#list-settings" hwa='���Ƽ' mon="PLN" con="POL">
                            <img src='/resources/images/tripInfoimges/Poland.png' />
                            <p>������</p>
                        </a></div>
                </div>

                <!-- �׺���̼� -->
                <div class="swiper-button-next"></div><!-- ���� ��ư (�����ʿ� �ִ� ��ư) -->
                <div class="swiper-button-prev"></div><!-- ���� ��ư -->

            </div>


            <!-- ============����������� box ================ -->
            <div class="popupLayer">
                <div class="popup-close">
                    <span onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em" title="�ݱ�">
                        <i class="fas fa-times"></i>
                    </span>
                </div>
                <div class="country-content">
                    <img class="conImg" alt="" src="" />
                </div>
            </div>

            <div class="country-title">
                <div class="content">
                    <img class="conImg" alt="" src="" />
                </div>

            </div>

            <!-- =========== ȯ���ݾ��Է� ====================  -->
            <div class="input-group flex-nowrap">
                <div class="countryMoney">
                    <input type="text" name='conMoney1' class="form-control" placeholder="���ѹα�" aria-describedby="addon-wrapping" value="" onkeydown="exchange()">
                    ��<br /><br /><br /><br />
                    <input type="text" name='conMoney' id="result" class="form-control" placeholder="" readonly="readonly" value="">
                    <div class='text'>
                    </div>
                </div>
            </div>

        </section>

        <div style="clear: both"></div>



        <section class="new-plan aos-init aos-animate" data-aos="fade-right">
            <section class="container plan-section">
                <header class="plan-section__header">
                    <h2 class="col plan-section__header__content">NEW PLANNER</h2>
                </header>
                <ul class="row plan-stories__content">
                    <!--<div class="swiper-container">
                <div class="swiper-wrapper">
                
                 </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>-->

                </ul>
            </section>
        </section>



        <section class="container review-section aos-init aos-animate" data-aos="fade-right">
            <header class="review-section__header">
                <h2 class="col review-section__header__content">TRIP REVIEW</h2>
            </header>
            <ul class="row review-stories__content">
                <!--<div class="swiper-container">
                <div class="swiper-wrapper">
                
                 </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>-->
            </ul>
        </section>


        <section class="container recent aos-init aos-animate" data-aos="fade-right">
            <header class="recent__header">
                <h2 class="col recent__header__content">TRIP INFO</h2>
            </header>
            <ul class="row recent-stories__content">
                <!-- <div class="swiper-container">
                <div class="swiper-wrapper">
                
                 </div>
                    
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>-->
            </ul>
        </section>
    </main>






    <script type="text/javascript">
        jQuery(document).ready(function($) {
            randomImage();
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
            //var tag = "<div class=\"swiper-slide\">";
            tag += "<li class=\"col-6 col-md-3 best-stories__content__item\">"
            tag += "<article class=\"story-entry story-story-item\">"
            tag += "<a class=\"story-entry-link\" href=\"/community/getPost?postId=" + post.postId + "&boardName=E\">";
            tag += "<div class=\"story-entry__image-wrap\">"
            tag += "<figure class = \"snip1384\" >"
            tag += "<img src='/resources/images/planImg/" + plan.planImg + "'>";
            tag += "<figcaption>"
            tag += "<h3>" + post.postTitle + "</h3>"
            tag += "<p>"
            tag += "<img src='/resources/images/userImages/" + post.user.userImg + "' style='border-radius:50%;width:20px;height:20px;border:solid 2px white;margin-right:0.5em;'>"
            tag += post.nickName + "</p>"
            tag += "<i class=\"ion-ios-arrow-right\"></i></figcaption></figure>"
            tag += "</div>"
            tag += "</a>"
            tag += "</article></li>"
            //tag += "</div>"

            $('.plan-stories__content').append(tag);
            //$('section.new-plan > section > ul > div > div.swiper-wrapper').append(tag);
        }

        function appendTag(vo, boardName) {
            var tag = "";
            //var tag = "<div class=\"swiper-slide\">";
            
            var content = vo.postContent;
            var imgSrc = parseContent(content);
            tag += "<li class=\"col-6 col-md-3 best-stories__content__item\">"
            tag += "<article class=\"story-entry story-story-item\">"
            tag += "<a class=\"story-entry-link\" href=\"/community/getPost?postId=" + vo.postId + "&boardName=" + boardName + "\">";
            tag += "<div class='story-entry__wrap' style='position: relative;'>"
            tag += "<div class=\"story-entry__image-wrap\">"
            if (imgSrc != '') {
                tag += imgSrc;
            } else {
                tag += "<div class='topic'>"
                tag += "<div style='text-align:left;'><i class=\"fas fa-quote-left\ fa-2x\"></i></div>"
                tag += "<div style='text-align:center;'>" + vo.postTitle + "</div>";
                tag += "<div style='text-align:right;'><i class=\"fas fa-quote-left fa-2x fa-rotate-180\"></i></div>"
                tag += "</div>"
            }
            tag += "</div>"
            tag += "<div class=\"story-entry__content\" style=\"font-family:'Noto Sans KR';text-align:left;padding: 10px; width: 100%; bottom: 0px; font-size: 1em; font-weight: bold; position: absolute;background-color:black;opacity:70%;\">"
            tag += "<img src='/resources/images/userImages/" + vo.user.userImg + "' style='border-radius:50%;width:20px;height:20px;border:solid 2px white;margin-right:0.5em;'>"
            tag += "<span style='font-size:0.8em;color:#CCC;font-weight:400;'>" + vo.nickName + "</span>"
            tag += "</div>"
            tag += "</div></a>"
            tag += "</article></li>"
            //tag += "</div>"


            if (boardName == 'F') {
                $('.review-stories__content').append(tag);
                //$('section.main-best > section > ul > div > div.swiper-wrapper').append(tag);
            } else if (boardName == 'C') {
                $('.best-stories__content').append(tag);
            } else {
                $('.recent-stories__content').append(tag);
                //$('section.container.recent > ul > div > div.swiper-wrapper').append(tag);
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


        $(function() {

            $.getJSON('').done('https://earthquake.kr:23490/query/KRWEUR')

        })


        $(function() {
            $(".swiper-slide>a").click(function(e) {

                var conCode = $(this).attr('con');
                var conName = $(this).text();
                var conHwa = $(this).attr('hwa');
                countryInfo(conCode);
                $('input[name="conMoney"]').attr('placeholder', conName.trim());
                $('.text').html(conHwa);
                popup(e);
            });
        });

        function countryInfo(conCode) {


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
                    var country = JSONData.response.body.items.item.countryName;
                    var conFlag = JSONData.response.body.items.item.imgUrl;
                    /* alert(conName); */
                    //$("#form-group").html(myItem);
                    //$("img[class='conImg']").attr("src", conFlag);
                    //$('.country-title').html(country);
                    $('.country-content').html(conInfo);

                }
            });
        };

        function exchange(data) {

            if ($(".swiper-slide.on")) {
                $.getJSON('https://api.exchangeratesapi.io/latest?base=KRW').done(

                    function(data) {

                        var mon = $(".swiper-slide>a").attr('mon');

                        if (mon == undefined) {
                            $("#result").val("������ �����ϼ���")
                                .return;
                        }

                        var price = $("input[name='conMoney1']").val();
                        /* var num = price/ data.rates[cur] */

                        var num = Math.round(price.match(/\d+/) /
                            data.rates[mon]);
                        /* alert(num);
                        alert(data.rates[abc]); */
                        price = price.replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
                        num = num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')

                        $('#result').attr("value", num);
                    })
            }
        }

        new Swiper('.swiper-container', {

            slidesPerView: 4, // ���ÿ� ������ �����̵� ����
            spaceBetween: 30, // �����̵尣 ����
            slidesPerGroup: 2, // �׷����� ���� ��, slidesPerView �� ���� ���� �����ϴ°� ����
            //slidesPerColumn: 2,

            // �׷���� ���� ���� ��� ��ĭ���� �޿��
            // 3���� ���;� �Ǵµ� 1���� �ִٸ� 2���� ��ĭ���� ä���� 3���� ����
            //loopFillGroupWithBlank: false,

            loop: true, // ���� �ݺ�

            /*pagination: { // ����¡
                el: '.swiper-pagination',
                clickable: true, // ����¡�� Ŭ���ϸ� �ش� �������� �̵�, �ʿ�� ������ ��� ��� �۵�
            },*/
            navigation: { // �׺���̼�
                nextEl: '.swiper-button-next', // ���� ��ư Ŭ������
                prevEl: '.swiper-button-prev', // �̹� ��ư Ŭ������
            },
        });

        new Swiper('section.new-plan > section > div.swiper-container', {

            slidesPerView: 4, // ���ÿ� ������ �����̵� ����
            spaceBetween: 30, // �����̵尣 ����
            slidesPerGroup: 2, // �׷����� ���� ��, slidesPerView �� ���� ���� �����ϴ°� ����
            //slidesPerColumn: 2,

            // �׷���� ���� ���� ��� ��ĭ���� �޿��
            // 3���� ���;� �Ǵµ� 1���� �ִٸ� 2���� ��ĭ���� ä���� 3���� ����
            //loopFillGroupWithBlank: false,

            loop: false, // ���� �ݺ�

            /*pagination: { // ����¡
                el: '.swiper-pagination',
                clickable: true, // ����¡�� Ŭ���ϸ� �ش� �������� �̵�, �ʿ�� ������ ��� ��� �۵�
            },*/
            navigation: { // �׺���̼�
                nextEl: '.swiper-button-next', // ���� ��ư Ŭ������
                prevEl: '.swiper-button-prev', // �̹� ��ư Ŭ������
            },
        });


        $('.swiper-slide').on('click', function() {
            $('.swiper-slide').removeClass('on');
            $(this).toggleClass('on');
        })

        function closeLayer(obj) {
            $(obj).parent().parent().hide();
        }

        function popup(e) {

            /* Ŭ�� Ŭ���� Ŭ���� Ŭ���� ��ġ ��ó�� ���̾ ��Ÿ����. */
            var sWidth = window.innerWidth;
            var sHeight = window.innerHeight;

            var oWidth = $('.popupLayer').width();
            var oHeight = $('.popupLayer').height();

            // ���̾ ��Ÿ�� ��ġ�� �����Ѵ�.
            var divLeft = e.clientX + 10;
            var divTop = e.clientY + 5;

            // ���̾ ȭ�� ũ�⸦ ����� ��ġ�� �ٲپ� ��ġ�Ѵ�.
            if (divLeft + oWidth > sWidth) divLeft -= oWidth;
            if (divTop + oHeight > sHeight) divTop -= oHeight;

            // ���̾� ��ġ�� �ٲپ����� ��ܱ�����(0,0) ������ ����ٸ� ��ܱ�����(0,0)�� ��ġ����.
            if (divLeft < 0) divLeft = 0;
            if (divTop < 0) divTop = 0;

            $('.popupLayer').css({
                "top": divTop,
                "left": divLeft,
                "position": "absolute"
            }).show();
        }
        
        var myAOS = function() {
            AOS.init({
                easing: 'ease-out-back'
                //duration: 1500
            });
        }
        myAOS();

    </script>

    <jsp:include page="toolbar/pushBar.jsp" />
    <jsp:include page="toolbar/footer.jsp" />

</body>

</html>
