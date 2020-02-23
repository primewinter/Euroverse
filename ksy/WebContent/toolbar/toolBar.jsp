<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Nanum+Gothic:400,700|Noto+Sans+KR:300,400,500&display=swap&subset=korean" rel="stylesheet">
<style>
    @font-face { font-family: 'BBTreeGB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGB.woff') format('woff'); font-weight: normal; font-style: normal; }
    @font-face { font-family: 'Handon3gyeopsal600g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal600g.woff') format('woff'); font-weight: normal; font-style: normal; }
    @font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 400; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype'); } @font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 700; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf') format('truetype') } @font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 300; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf') format('truetype'); } .nanumbarungothic * { font-family: 'NanumBarunGothic', sans-serif; }
    
    body {
/*        font-family: 'BBTreeGB';*/
/*        font-family: 'Handon3gyeopsal600g'*/
/*        font-family: 'Noto Sans KR', sans-serif;*/
        font-family: 'NanumBarunGothic';
        font-weight: 500;
        overflow-y: scroll;
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

    .login-control>font:hover, a:hover {
        color: #339999;
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
        font-size: 15pt;
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

    /*    ���� ����*/
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
            <font data-toggle="modal" data-target="#loginModal">�α���</font>|<font>ȸ������</font>
        </c:if>
        <c:if test="${user.userId != null}">
            <c:if test="${user.role == 'A'}">
                <font><i class="fas fa-cog"></i>ȸ������</font>|<font><i class="fas fa-cog"></i>�ֹ�����</font>|<font><i class="fas fa-cog"></i>QnA</font>
            </c:if>
            <font>�ֹ�����</font>|<font>����������</font>|<font>�α׾ƿ�</font>
        </c:if>
    </span>
    <header class="blog-header py-3"></header>
    <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-center toolbar-logo" style="font-size: 20pt;">
            <a href="/main.jsp">Euroverse</a>
        </nav>
    </div>
    <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-center menu">
            <ul class="myMenu">
                <li class="menu1"><a href="/plan/getPlanList"><span>�÷���</span></a></li>
                <li class="menu2"><a href="/view/flight/searchFlight.jsp"><span>�װ�</span></a></li>
                <li class="menu3"><a href="/view/room/searchRoom.jsp"><span>����</span></a></li>
                <li class="menu4"><a href="#"><span>Ŀ�´�Ƽ</span></a>
                    <ul class="menu4_s submenu">
                        <p></p>
                        <li><a href="#">
                                <p>�α�۰Խ���</p>
                            </a></li>
                        <li><a href="#">
                                <p>�÷��ʰ���</p>
                            </a></li>
                        <li><a href="#">
                                <p>�����ı�</p>
                            </a></li>
                        <li><a href="#">
                                <p>��������</p>
                            </a></li><br />
                        <li><a href="#">
                                <p>QnA</p>
                            </a></li>
                        <li><a href="#">
                                <p>�����Խ���</p>
                            </a></li>
                        <!--<li><a href="#"><p>���� ã��</p></a></li>-->
                    </ul>
                </li>
                <li class="menu5"><a href="#"><span>����</span></a></li>
            </ul>
        </nav>
    </div>
</div>



<script type="text/javascript">
    $("font:contains('����������')").on("click", function() {
        location.href = "/user/getUser";
    });
    $("font:contains('�α׾ƿ�')").on("click", function() {
        location.href = "/user/logout";
    });
    $("font:contains('ȸ������')").on("click", function() {
        location.href = "/user/addUser";
    });
    $("font:contains('ȸ������')").on("click", function() {
        location.href = "/admin/getUserList";
    });
    $("font:contains('QnA')").on("click", function() {
	    location.href = "/admin/getAdminQnAList";
    });
    $("font:contains('�ֹ�����')").on("click", function() {
        location.href = "/order/getOrderListAdmin";
    });
    $("font:contains('�ֹ�����')").on("click", function() {
        location.href = "/order/getOrderList";
    });


    $("a:contains('�����Խ���')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=A");
    });

    $("a:contains('��������')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=B");
    });

    $("a:contains('�α�۰Խ���')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=C");
    });

    $("a:contains('����ã��')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=D");
    });

    $("a:contains('�÷��ʰ���')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=E");
    });

    $("a:contains('�����ı�')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=F");
    });

    $("a:contains('QnA')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=G");
    });
    $("a:contains('����')").on("click", function() {
        $(self.location).attr("href", "/community/getPostList?boardName=D");
    });

    $('li.menu4').find('ul').show().hide();
    $('li.menu4').hover(function() {
        $(this).children('ul').stop().fadeIn(300);
    }, function() {
        $(this).children('ul').stop().fadeOut('fast');
    });

</script>
