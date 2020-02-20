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
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

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
</head>
<style>
    main>div {
        margin-top: 50px;
        margin-bottom: 50px;
    }

    div.main-infinite {
        margin: 10%;
    }

    div.random-text {
        display: block;
        vertical-align: middle;
        text-align: right;
        margin: 3em;
    }

    div.carousel-inner {
        height: auto;

    }

    .carousel-inner {
        background-color: aquamarine;
    }

    .carousel-inner>.carousel-item {
        width: 100%;
        height: 450px;

    }


    /*����Ŭ�� �̹��� mouseHover CSS*/

    .effect-wrap {
        width: 400px;
        height: 300px;
        display: inline-block;
        float: left;
        justify-content: center;
        align-items: center;
    }

    .effect5 {
        position: relative;
        display: inline-block;
        vertical-align: middle;
        width: 400px;
        height: 300px;
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
            <!-- �����̵� �� -->
            <div class="carousel-inner">
                <!--ù��° �����̵�-->
                <div class="carousel-item active" style="background-color: darkslategray;">
                    <!--<img class="d-block w-100" src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="First slide">-->
                    <div class="carousel-caption d-none d-md-block" style="text-align: left;">
                        <h5>���������� ����</h5>
                        <p>����� ��ٸ��� �鸸 ���� �÷��ʿ� �Բ��ϼ���.</p>
                    </div>
                </div>
                <!--�ι�° �����̵�-->
                <div class="carousel-item" style="background-color: dimgray;">
                    <div class="carousel-caption d-none d-md-block" style="text-align: right;">
                        <h5>���������� ����</h5>
                        <p>����� ��ٸ��� �鸸 ���� �÷��ʿ� �Բ��ϼ���.</p>
                    </div>
                    <!--<img class="d-block w-100" src="https://images.pexels.com/photos/2355519/pexels-photo-2355519.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="Second slide">-->
                </div>
                <!--����° �����̵�-->
                <div class="carousel-item" style="background-color: cornflowerblue;">
                    �ٴٴٴٴٴٴ٤�
                    <!--<img class="d-block w-100" src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Third slide">-->
                </div>
                <!-- / �����̵� �� �� -->

                <!-- ���� ������ ȭ��ǥ ��ư ���� -->
                <a class="carousel-control-prev" href="#main-carousel" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <!-- <span>Previous</span> --> </a>

                <a class="carousel-control-next" href="#main-carousel" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <!-- <span>Next</span> --> </a>
                <!-- ���� ������ ȭ��ǥ ��ư �� -->

                <!-- �ε������� -->
                <ul class="carousel-indicators">
                    <li data-target="#main-carousel" data-slide-to="0" class="active"></li>
                    <!--0�����ͽ���-->
                    <li data-target="#main-carousel" data-slide-to="1"></li>
                    <li data-target="#main-carousel" data-slide-to="2"></li>
                </ul>
                <!-- �ε������� �� -->
            </div>
        </div>



        <div class="main-infinite">
            <div class="effect-wrap">
                <figure class="effect5">
                    <img id="infinityClick" src="https://tistory4.daumcdn.net/tistory/2141493/skin/images/simg06.png">
                    <figcaption>
                        <h3>������<em>��õ</em></h3>
                    </figcaption>
                </figure>
            </div>
            <div class="random-text">
                <h4>#������ ��õ</h4>
                ������ Ŭ���غ�����!
            </div>
        </div>
        <div class="main-best" style="margin-bottom:500px;">
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
</body>

</html>
