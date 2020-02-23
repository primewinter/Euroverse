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
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    <script src="https://unpkg.com/swiper/js/swiper.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>


    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<style>
    @font-face {
        font-family: '����ü';
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
        width: 640px; height: 720px; 
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
    
    
    
    
    .story-entry__image-wrap>img{
        width: 200px;
        height:auto;
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
                    <h5>���������� ����</h5>
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
            <div class="random-text">
                <h4>#������ ��õ</h4>
                ������ Ŭ���غ�����!
            </div>
        </section>




        <section class="main-best">
            <section class="container best-section today-best">
                <header class="row best-section__header">
                    <h2 class="col best-section__header__content">������ �α��</h2>
                </header>
                <ul class="row best-stories__content">
                    <li class="col-6 col-md-3 best-stories__content__item">
                        <article class="story-entry story-story-item"><a class="story-entry-link" href="/projects/19527?affect_type=Home&amp;affect_id=0">
                                <div class="story-entry__image-wrap">
                                    <!--<img class="story-entry__image" alt="" src="�̹����ּ�" srcset="�̹����ּ� 1.5x,�̹����ּ� 2x,�̹����ּ� 3x">-->
                                </div>
                                <div class="story-entry__content-wrap">
                                    <div class="story-entry__content">
                                        <div class="story-entry__content__title">���� �����ϴ� �������� ���� ä������ �Ҽ��� ��ſ�<br> </div>
                                        <div class="story-entry__content__profile"><img class="story-entry__content__profile__image" src=""><span class="story-entry__content__profile__name">��������</span></div>
                                    </div>
                                </div>
                            </a>
                        </article>
                    </li>
                </ul>
            </section>
            <section class="container best-section week-best">
                <header class="row week-section__header">
                    <h2 class="col week-section__header__content">�����ı�</h2>
                </header>
                <ul class="row best-stories__content">
                    <li class="col-6 col-md-3 best-stories__content__item">
                        <article class="story-entry story-story-item"><a class="story-entry-link" href="/projects/19527?affect_type=Home&amp;affect_id=0">
                                <div class="story-entry__image-wrap">
                                <!--<img class="story-entry__image" alt="" src="" srcset="�̹����ּ� 1.5x,�̹����ּ� 2x,�̹����ּ� 3x">-->
                                </div>
                                <div class="story-entry__content-wrap">
                                    <div class="story-entry__content">
                                        <div class="story-entry__content__title"><br> </div>
                                        <div class="story-entry__content__profile"><img class="story-entry__content__profile__image" src="" srcset=""><span class="story-entry__content__profile__name">��������</span></div>
                                    </div>
                                </div>
                            </a>
                        </article>
                    </li>
                </ul>
            </section>
        </section>
        
         <section class="container recent">
                <header class="row recent__header">
                    <h2 class="col recent__header__content">�ֽű�</h2>
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
                //getRecentList("A");
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
                        })
                    },
                    error: function(err) {
                        console.log(err);
                    }
                })

            }
            
            function getRecentList(boardName) {
                $.ajax({
                     url: "/main/json/getRecentList?boardName="+boardName,
                    method: "GET",
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json"
                    },
                    success: function(result) {
                        console.log(boardName + " :: "+result);
                        $.each(result, function(index, vo) {
                            //if(boardName == 'F') {
                                showTripReview(vo, boardName)
                            //}
                            //console.log(vo);
                        })
                    },
                    error: function(err) {
                        console.log(err);
                    }
                })
            }
            
            function showTripReview(vo, boardName) {
                var tag = "";
                tag += "<li class=\"col-6 col-md-3 best-stories__content__item\">"
                tag += "<article class=\"story-entry story-story-item\"><a class=\"story-entry-link\" href=\"/community/getPost?postId="+vo.postId+"&boardName=F\">";
                tag += "<div class=\"story-entry__image-wrap\">"
                var content = vo.postContent;
                var imgSrc = parseContent(content);
                tag += imgSrc;
                tag += "</div>"
                tag += "<div class=\"story-entry__content-wrap\">"
                tag += "<div class=\"story-entry__content\">"
                tag += "<div class=\"story-entry__content__title\">"+vo.postTitle+"<br></div>"
                tag += "<div class=\"story-entry__content__profile\">"
                tag += "<span class=\"story-entry__content__profile__name\">by. "+vo.nickName+"</span></div></div></div></a></article></li>"
                
                $('ul.recent-stories__content').append(tag);
                
            }
            
            function parseContent(content) {
                if( content.includes('<img')) {
                    var startInt = content.indexOf('img');
                    var endInt = content.indexOf('>',startInt);
                    var result = content.substring(startInt-1, endInt+1);
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
                tag += "<a href='/myPage/myOfferList' >"; // �ʴ� ��� ����Ʈ ��ũ
                tag += "<a href='/community/getPost?postId=" + vo.refId + "&boardName=D' >" // ���� ��û ��� ����Ʈ ��ũ
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
