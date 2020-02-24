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


    <!-- Animation CDN :: https://github.com/daneden/animate.css-->
    <!--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">-->


    <!-- AOS CDN2 :: https://michalsnik.github.io/aos/-->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

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

    .planner-info>div {
        display: inline-block;
        /*        background-color: darkseagreen;*/
        margin: 13%;
    }

    .planner-info>div.left>div.planner-info-img,
    .planner-info>div.left>div.planner-info-text {
        float: left;
    }

    .planner-info>div.right>div.planner-info-img,
    .planner-info>div.right>div.planner-info-text {
        float: right;
    }

</style>

<body>
    <div class="aos-init aos-animate" data-aos="fade-up">
        <div class="planner-info-img">
            <img src='/resources/images/mainImg/planner.png' style='width:50%'>
        </div>
        <div class="planner-info-text">
            <h4>당신의 플래너를 만들어보세요</h4>
        </div>
    </div>
    <h1>AOS - Animate on Scroll</h1>
<section>
    <h2>FADE</h2>
    <div data-aos="fade-up">data-aos="fade-up"</div>
    <div data-aos="fade-down">data-aos="fade-down"</div>
    <div data-aos="fade-right">data-aos="fade-right"</div>
    <div data-aos="fade-left">data-aos="fade-left"</div>
    <div data-aos="fade-up-right">data-aos="fade-up-right"</div>
    <div data-aos="fade-up-left">data-aos="fade-up-left"</div>
    <div data-aos="fade-down-right">data-aos="fade-down-right"</div>
    <div data-aos="fade-down-left">data-aos="fade-down-left"</div>
</section>
<section>
    <h2>Flip</h2>
    <div data-aos="flip-left">data-aos="flip-left"</div>
    <div data-aos="flip-right">data-aos="flip-right"</div>
    <div data-aos="flip-up">data-aos="flip-up"</div>
    <div data-aos="flip-down">data-aos="flip-down"</div>
</section>
<section>
    <h2>ZOOM</h2>
    <div data-aos="zoom-in">data-aos="zoom-in"</div>
    <div data-aos="zoom-in-up">data-aos="zoom-in-up"</div>
    <div data-aos="zoom-in-down">data-aos="zoom-in-down"</div>
    <div data-aos="zoom-in-left">data-aos="zoom-in-left"</div>
    <div data-aos="zoom-in-right">data-aos="zoom-in-right"</div>
    <div data-aos="zoom-out">data-aos="zoom-out"</div>
</section>
<section>
    <h2></h2>
</section>
    
    


    <main data-aos-easing="ease-out-back">


        <section class="planner-info">
            <div class="left aos-init aos-animate" data-aos="fade-up">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/planner.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>당신의 플래너를 만들어보세요</h4>
                </div>
            </div>
            <div class="right aos-init aos-animate" data-aos="fade-up">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/todo.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>간편한 투두 리스트</h4>

                </div>
            </div>
            <div class="left aos-init aos-animate" data-aos="fade-left">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/route.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>예산과 여행 경로를 한 눈에</h4>
                </div>
            </div>
            <div class="justify aos-init aos-animate" data-aos="fade-up">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/routeDetail.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>여행 루트는 빠르고 쉽게</h4>
                </div>
            </div>
            <div class="right aos-init aos-animate" data-aos="fade-right">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/daily.png' style='width:50%'>
                </div>
                <div class="planner-info-text" data-aos-anchor="#example-anchor">
                    <h4>다이어리처럼 쓸 수 있는 일정표</h4>
                </div>
            </div>
            <div class="justify aos-init aos-animate" data-aos="fade-up">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/memo.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>어디에나 붙일 수 있는 포스트잇</h4>
                </div>
            </div>
            <div class="left aos-init aos-animate" data-aos="fade-left" data-aos-offset="-500">
                <div class="planner-info-img">
                    <img src='/resources/images/mainImg/chat.png' style='width:50%'>
                </div>
                <div class="planner-info-text">
                    <h4>친구들과 함께 짜는 여행</h4>
                </div>
            </div>

        </section>










    </main>
    <jsp:include page="toolbar/footer.jsp" />
    <script type="text/javascript">
        var myAOS = function() {
            AOS.init({
                easing: 'ease-out-back'
                //duration: 1500
            });
        }
        myAOS();
        //$("div.planner-info[div]").attr("data-aos", "fadeInUp");

        /*const element = document.querySelector('.planner-info div');
        element.classList.add('animated', 'fadeInUp');*/

    </script>
</body>

</html>
