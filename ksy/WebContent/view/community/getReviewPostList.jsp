<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="EUC-KR">
    <title>Euroverse</title>
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

    <!--owl carousel CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
        .post-date {
            font-size: 8pt;
        }

        figure.snip1384 {
            font-family: 'Raleway', Arial, sans-serif;
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
            padding: 40px;
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
            top: 10px;
            bottom: 10px;
            left: 10px;
            right: 10px;
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
        div.review-row {
            padding: 1em;
        }
        div.review-row:hover{
            box-shadow: 0 0 11px rgba(33, 33, 33, .2);
        }
        .card-icons{
            font-size: 10pt;
            color: #999999;
            //letter-spacing:1em;
            word-spacing: 0.7em;
        }
        .card-content p>img {
            display: none;
        }

    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">
        function fncGetUserList(currentPage) {
            $("#currentPage").val(currentPage)
            $("form").attr("method", "POST").attr("action", "/community/getPostList").submit();
        }

        $(function() {
            $(".fas.fa-search").on("click", function() {
                fncGetUserList(1);
            });
        });

        $(function() {

            var boardName = $("#boardName").val();

            if (boardName == 'D') {
                $("td:nth-child(3)").on("click", function() {
                    var postId = $(this).find($("input[name='postId']")).val();
                    self.location = "/community/getPost?postId=" + postId + "&boardName=" + boardName;
                });
            } else {
                $("td:nth-child(2)").on("click", function() {
                    var postId = $(this).find($("input[name='postId']")).val();
                    self.location = "/community/getPost?postId=" + postId + "&boardName=" + boardName;
                });
            }
        });

        $(function() {

            var boardName = $("#boardName").val();

            $("#addpost_view").on("click", function() {
                self.location = "/community/addPost?boardName=" + boardName;
            });

            $("#boardTitle").on("click", function() {
                self.location = "/community/getPostList?boardName=" + boardName;
            });
        });

        function qnaKategotie(sorting) {

            if (sorting == 0) {
                $("select[name='sorting']").val("0").prop("selected", true);
            } else if (sorting == 1) {
                $("select[name='sorting']").val("1").prop("selected", true);
            } else if (sorting == 2) {
                $("select[name='sorting']").val("2").prop("selected", true);
            } else if (sorting == 3) {
                $("select[name='sorting']").val("3").prop("selected", true);
            } else if (sorting == 4) {
                $("select[name='sorting']").val("4").prop("selected", true);
            } else {
                $("select[name='sorting']").val("5").prop("selected", true);
            }
            fncGetUserList(1);
        }

        function onKeyDown() {
            if (event.keyCode == 13) {
                fncGetUserList(1);
            }
        }
        

    </script>

</head>

<body>

    <!-- ToolBar Start /////////////////////////////////////-->
    <jsp:include page="/toolbar/toolBar.jsp" />
    <jsp:include page="/toolbar/pushBar.jsp" />
    <jsp:include page="/view/community/sidebar.jsp" />
    <!-- ToolBar End /////////////////////////////////////-->

    <!--  화면구성 div Start /////////////////////////////////////-->
    <div class="container" style="max-width: 1000px;" id="loadJquery">

        <div class="h4" id="boardTitle" style="font-weight: bold; margin-top: 40px;padding-left:10px;">
            <c:if test="${param.boardName=='F'}">
                여행후기ㅋ
            </c:if>
        </div>

        <!-- table 위쪽 검색 Start /////////////////////////////////////-->
        <div class="row">

            <div class="col-md-12 text-right" style="margin: 10px 0 15px 0">

                <form class="form-inline mt-2 mt-md-0" name="detailForm" style="float:right;">
                    <input type="hidden" id="boardName" name="boardName" value="${param.boardName}" />

                    <div class="form-group">
                        <select class="form-control" name="searchCondition" style="height: 35px; width: 85px; font-size: 13px; margin-right: 2px;">
                            <option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
                            <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
                            <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>태그</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="sr-only" for="searchKeyword">검색어</label>
                        <input type="text" class="form-control mr-sm-2" id="searchKeyword" name="searchKeyword" placeholder="검색어" value="${! empty search.searchKeyword ? search.searchKeyword : '' }" style="height: 35px; font-size: 13px;" onKeyDown="onKeyDown();">
                    </div>

                    &nbsp;<i class="fas fa-search"></i>

                    <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
                    <input type="hidden" id="currentPage" name="currentPage" value="" />

                </form>
            </div>

        </div>
        <!-- table 위쪽 검색 Start /////////////////////////////////////-->

        <div class="container">
            <c:set var="i" value="0" />
            <c:forEach var="post" items="${list}">
                <c:set var="i" value="${ i+1 }" />
                <div class="row review-row">
                        <div class="col-md-4">
                            <div style="position: relative;">
                                <figure class="snip1384">
                                    <img style="height:200px;width:300px;" src="/resources/images/planImg/${plan.planImg}" />
                                    <figcaption>
                                        <h3>제목</h3>
                                        <p>
                                            내용
                                        </p>
                                    </figcaption>
                                    <a href="#"></a>
                                </figure>
                                <input type="hidden" id="postId" name="postId" value="${post.postId}" />

                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <p class="card-icons">
                                    <fmt:formatDate value="${post.postDate}" pattern="yyyy.MM.dd"/> <i class="fas fa-comments"></i> ${post.comments} <i class="fas fa-heart"></i> ${post.postLikeCount} <i class="far fa-eye"></i> ${post.views}
                                </p>
                                <p class="card-title" style="font-size:14px;">${post.postTitle}</p>
                                <p class="card-content">${post.postContent}</p>
                                   
                                   
                                <img src='/resources/images/userImages/${post.user.userImg}' style='border-radius:50%;width:25px;height:25px;border:solid 2px #009688;margin-right:0.5em;'>${post.nickName}<br>
                                    
                                
                            </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!--  table End /////////////////////////////////////-->
        <button type="button" id="addpost_view" class="btn btn-dark">작성하기</button>

    </div>
    <!--  화면구성 div End /////////////////////////////////////-->

    <!-- PageNavigation Start... -->
    <jsp:include page="../../common/pageNavigator_new.jsp" />
    <!-- PageNavigation End... -->
    <jsp:include page="/toolbar/footer.jsp" />
</body>

</html>
