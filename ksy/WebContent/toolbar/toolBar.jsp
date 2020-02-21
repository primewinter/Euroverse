<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Noto+Sans+KR:300,400,500&display=swap&subset=korean" rel="stylesheet">
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        font-weight: 500;
    }

    ul.submenu {
        font-family: 'Nanum Gothic Coding', monospace;
        font-size: 10pt;
    }

    span.login-control {
        top: 0px;
        display: inline-block;
        float: right;
        color: #858585;
        font-size: 10pt;
    }

    span.login-control font {
        margin-left: 3px;
        margin-right: 3px;
    }

    a:link {
        color: black;
        text-decoration: none;
    }

    a:visited {
        color: black;
        text-decoration: none;
    }

    a:hover {
        color: #858585;
        text-decoration: none;
    }

    ul,
    ol,
    li {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    ul.myMenu>li {
        display: inline-block;
        width: 100px;
        text-align: center;
        position: relative;
    }

    ul.myMenu>li:hover {}

    ul.myMenu>li ul.submenu {
        display: none;
        position: absolute;
        padding: 20px;
        width: 130px;
        height: auto;
        top: 25px;
        left: -15px;
        background-color: white;
        text-align: left;
        z-index: 10;
        border: solid 1px #E4E4E4;
        box-shadow: 0px 0px 10px -5px GRAY;
    }

    ul.myMenu>li:hover ul.submenu {
        display: block;
    }

    ul.myMenu>li ul.submenu>li {
        color: darkgray;
        display: inline-block;
    }

    ul.myMenu>li ul.submenu>li:hover {
        color: black;
    }

    /*    예쁜 밑줄*/
    ul.myMenu li>a>span {
        text-transform: uppercase;
        text-decoration: none;
        position: relative;
        display: block;
    }

    [class^="menu-"] {
        display: inline-block;
        margin: 2em 2em 0 2em;
    }

    ul.myMenu li>a>span:before,
    ul.myMenu li>a>span:after {
        content: '';
        border-bottom: solid 1px black;
        position: absolute;
        bottom: 0;
        width: 0;
    }

    ul.myMenu li>a>span:before {
        left: 0;
    }

    ul.myMenu li>a>span:after {
        right: 0;
    }

    ul.myMenu li>a>span:hover:before,
    ul.myMenu li>a>span:hover:after {
        width: 50%;
    }

    ul.myMenu li>a>span:before,
    ul.myMenu li>a>span:after {
        -webkit-transition: all 0.2s ease;
        transition: all 0.2s ease;
    }

</style>

<jsp:include page="/view/user/login.jsp"></jsp:include>
<div class="container toolbar">
    <span class="login-control">
        <c:if test="${user.userId == null}">
            <font data-toggle="modal" data-target="#loginModal">로그인</font>|<font>회원가입</font>
        </c:if>
        <c:if test="${user.userId != null}">
            <c:if test="${user.role == 'A'}">
                <font>회원정보보기</font>|
            </c:if>
            <font>마이페이지</font>|
            <font>로그아웃</font>
        </c:if>
    </span>
    <header class="blog-header py-3"></header>
    <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-center toolbar-logo">
            <a href="/main.jsp">Euroverse</a>
        </nav>
    </div>
    <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-center menu">
            <ul class="myMenu">
                <li class="menu1"><a href="/plan/getPlanList"><span>플래너</span></a></li>
                <li class="menu2"><a href="/view/flight/searchFlight.jsp"><span>항공</span></a></li>
                <li class="menu3"><a href="/view/room/searchRoom.jsp"><span>숙소</span></a></li>
                <li class="menu4"><a href=""><span>커뮤니티</span></a>
                    <ul class="menu4_s submenu">
                        <p></p>
                        <li><a href="#">
                                <p>인기글게시판</p>
                            </a></li>
                        <li><a href="#">
                                <p>플래너공유</p>
                            </a></li>
                        <li><a href="#">
                                <p>여행후기</p>
                            </a></li>
                        <li><a href="#">
                                <p>여행정보</p>
                            </a></li><br />
                        <li><a href="#">
                                <p>QnA</p>
                            </a></li>
                        <li><a href="#">
                                <p>자유게시판</p>
                            </a></li>
                        <!--<li><a href="#"><p>동행 찾기</p></a></li>-->
                    </ul>
                </li>
                <li class="menu5"><a href="#"><span>동행</span></a></li>
            </ul>
        </nav>
    </div>
</div>




<script type="text/javascript">
    $("font:contains('마이페이지')").on("click", function() {
        location.href = "/user/getUser";
    });
    $("font:contains('로그아웃')").on("click", function() {
        location.href = "/user/logout";
    });
    $("font:contains('회원가입')").on("click", function() {
        location.href = "/user/addUser";
    });
    $("font:contains('회원정보보기')").on("click", function() {
        location.href = "/admin/getUserList";
    });


    $("a:contains('자유게시판')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=A");
    });

    $("a:contains('여행정보')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=B");
    });

    $("a:contains('인기글게시판')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=C");
    });

    $("a:contains('동행찾기')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=D");
    });

    $("a:contains('플래너공유')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=E");
    });

    $("a:contains('여행후기')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=F");
    });

    $("a:contains('QnA')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=G");
    });
    $("a:contains('동행')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=D");
    });

    $('li.menu4').find('ul').show().hide();
    $('li.menu4').hover(function() {
        $(this).children('ul').stop().fadeIn(300);
    }, function() {
        $(this).children('ul').stop().fadeOut('fast');
    });

</script>




<%-- 

  <ul class="navbar-nav">
            <li class="nav-item">
                <a href="/plan/getPlanList"><span>플래너</span></a>
            </li>
            <li class="nav-item">
                <a href="/view/flight/searchFlight.jsp"><span>항공</span></a>
            </li>
            <li class="nav-item">
                <a href="/view/room/searchRoom.jsp"><span>숙소</span></a>
            </li>
            <li class="nav-item">
                <a href=""><span>커뮤니티</span></a>
            </li>
            <li class="nav-item">
                <a href="#"><span>동행</span></a>
            </li>
        </ul>

<c:if test="${user.userName != null}">
	<span> ${user.nickname}님 로그인중.... </span> <button type="button" class="btn btn-dark">로그아웃</button>
</c:if>
<c:if test="${user.userId == null}">
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal" data-backdrop="static" data-keyboard="false">로그인</button>
</c:if>

<br/>
<a href="/view/flight/searchFlight.jsp">항공권 검색</a> &ensp;&ensp;
<a href="/view/room/searchRoom.jsp">숙소 검색</a> &ensp;&ensp;
<a href="/order/getOrderList">주문 목록</a> &ensp;&ensp; 
<a href="/toolbar/donghaeng.jsp">동행 채팅</a> &ensp;&ensp;
<a href="/plan/getPlanList">플래너 리스트</a> &ensp;&ensp;

<ul class="nav nav-tabs">
	  <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="#">인기글게시판</a>
	      <a class="dropdown-item" href="#">플래너공유</a>
	      <a class="dropdown-item" href="#">동행찾기</a>
	      <a class="dropdown-item" href="#">여행후기</a>
	      <a class="dropdown-item" href="#">정보공유</a>
	      <a class="dropdown-item" href="#">QnA</a>
	      <a class="dropdown-item" href="#">자유게시판</a>
	    </div>
	  </li>
	</ul>
 --%>
