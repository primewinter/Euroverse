<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


<!-- 
<style>
 .sidebar{
	position: fixed;
	top: 200px;
 
}
@media screen and (max-width: 1000px) { 
.sidebar {
 display: none; 
 
 } 
 }
</style>
 -->

	<!-- Custom styles for this template -->
	<!-- 왼쪽 사이드바를 위한 CSS... 안돼서 걍 스크립트 통째로 넣어둠 -->
    <!-- <link href="/css/bootstrapDashboardCustomStyle.css" rel="stylesheet"> -->
	<style type="text/css">
		/* body {
		  font-size: .875rem;
		} */
		.feather {
		  width: 16px;
		  height: 16px;
		  vertical-align: text-bottom;
		}
		
		/* Sidebar */
		.sidebar {
		  position: fixed;
		  top: 240px;
		  bottom: 0;
		  left: 0;
		  z-index: 40; /* Behind the navbar */
		  padding: 48px 0 0; /* Height of navbar */
		  //box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
		  //background-color: white;
		}
		.sidebar-sticky {
		  position: relative;
		  top: 0;
		  height: calc(100vh - 48px);
		  padding-top: .5rem;
		  overflow-x: hidden;
		  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
		}
		@supports ((position: -webkit-sticky) or (position: sticky)) {
		  .sidebar-sticky {
		    position: -webkit-sticky;
		    position: sticky;
		  }
		}
		
		.sidebar .nav-link {
		  font-weight: 500;
		  color: #333;
		}
		.sidebar .nav-link .feather {
		  margin-right: 4px;
		  color: #999;
		}
		.sidebar .nav-link.active {
		  color: #007bff;
		}
		.sidebar .nav-link:hover .feather,
		.sidebar .nav-link.active .feather {
		  color: inherit;
		}
		.sidebar-heading {
		  font-size: .75rem;
		  text-transform: uppercase;
		}
		
		/* Content */
		
		[role="main"] {
		  padding-top: 133px; /* Space for fixed navbar */
		}
		@media (min-width: 768px) {
		  [role="main"] {
		    padding-top: 48px; /* Space for fixed navbar */
		  }
		}
		
		/* Navbar */
		/* .navbar-brand {
		  padding-top: .75rem;
		  padding-bottom: .75rem;
		  font-size: 1rem;
		  background-color: rgba(0, 0, 0, .25);
		  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
		} */
		.navbar .form-control {
		  padding: .75rem 1rem;
		  border-width: 0;
		  border-radius: 0;
		}
		.form-control-dark {
		  color: #fff;
		  background-color: rgba(255, 255, 255, .1);
		  border-color: rgba(255, 255, 255, .1);
		}
		.form-control-dark:focus {
		  border-color: transparent;
		  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
		}
	
	
		.bd-placeholder-img {
	        font-size: 1.125rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        -ms-user-select: none;
	        user-select: none;
	      }
	
	      @media (min-width: 768px) {
	        .bd-placeholder-img-lg {
	          font-size: 3.5rem;
	        }
	      }
	</style>
	
	<!-- ICON 사용을 위한 스크립트 임포트 -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>
	

	<script>
	
		$(function(){
			$(".nav-link:contains('내정보조회')").on("click" ,function(){
				$(self.location).attr("href","/user/getUser");
			});
			
			$(".nav-link:contains('내정보수정')").on("click" ,function(){
				$(self.location).attr("href","/user/updateUser");
			});
			
			$(".nav-link:contains('포인트 사용 목록')").on("click" ,function(){
				$(self.location).attr("href","/myPage/pointList");
			});
			
			$(".nav-link:contains('내 게시글 및 댓글')").on("click" ,function(){
				$(self.location).attr("href","/myPage/myPostCommentList");
			});
			
			$(".nav-link:contains('북마크 목록')").on("click" ,function(){
				$(self.location).attr("href","/myPage/myBookMarkList");
			});
			
			
			$(".nav-link:contains('플래너 초대 / 동행신청')").on("click" ,function(){
				//alert("구현중");
				$(self.location).attr("href","/myPage/likeOrderList");
			});
			
			$("#myOfferList").on("click" ,function(){
				$(self.location).attr("href","/myPage/myOfferList");
			});
			
			
			$(".nav-link:contains('찜한 상품 목록')").on("click" ,function(){
				//alert("구현중");
				$(self.location).attr("href","/myPage/likeOrderList");
			});
			
			$(".nav-link:contains('1:1문의')").on("click" ,function(){
				$(self.location).attr("href","/myPage/addQnaAndQnaList");
			});
			
			/* $(".nav-link:contains('1:1문의목록')").on("click" ,function(){
				alert("구현중");
				//$(self.location).attr("href","/user/getUser");
			});
			 */
		/* 	$(".nav-link:contains('출석체크')").on("click" ,function(){
				$(self.location).attr("href","/user/getUser");
			}); */
			
		});
		
	</script>





	<!-- 좌측 Plan 툴바 구성 Start /////////////////////////////////////////////////////////// -->
	<nav class="col-md-2 d-none d-md-block sidebar" style="padding-top:0px; padding-left:25px;padding-right: 20px;">
      <div class="sidebar-sticky">
      
        <ul class="nav flex-column" style="text-align: right;">
          
          <li class="nav-item">
            <a class="nav-link scroll" href="#E">
              내정보조회 &nbsp; <span data-feather="smile"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#F">
              내정보수정 &nbsp;<span data-feather="settings"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#B">
              포인트 사용 목록 &nbsp; <span data-feather="database"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#G">
              내 게시글 및 댓글 &nbsp; <span data-feather="edit"></span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link scroll" href="#A">
              북마크 목록 &nbsp; <span data-feather="bookmark"></span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link scroll" href="#D">
              플래너 초대 / 동행신청  &nbsp; <span data-feather="users"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#D">
              찜한 상품 목록  &nbsp; <span data-feather="heart"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#D">
              1:1문의  &nbsp; <span data-feather="help-circle"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#D" id="choolCheck">
              출석체크  &nbsp; <span data-feather="calendar"></span>
            </a>
          </li>
        </ul>


        <!-- Top 버튼 -->
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-5 mb-1 text-muted">
        	<span></span>
        	<span>
        		<a href="#" title="top" class="scroll"> top <span data-feather="arrow-up"></span></a>
        	</span>
        </h6>
        
      </div>
    </nav>
	<!-- 좌측 Plan 툴바 구성 End //////////////////////////////////////////////////// -->
	
	
	<script>
		/* icon 사용을 위한 스크립트 */
		/* https://github.com/feathericons/feather#feather 참고 */
		feather.replace();
	</script>

 	<jsp:include page="/view/myPage/choolCheck.jsp"></jsp:include> 


<!-- 
<div class="sidebar" style="width: 270px; margin-left: 30px;">
  <div class="row" style="width: 270px;">
  
 		<ul class="nav flex-column" style="text-align: left;" >
          
          <li class="nav-item">
            <a class="nav-link" href="#">
             	내정보조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
             	내정보수정
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
             	포인트 사용 목록
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
             	내 게시글 및 댓글
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              	북마크 목록
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" id="myOfferList">
              	플래너 초대 및<br>
           			&nbsp;&nbsp;&nbsp;   동행신청 목록
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              	찜한 상품 목록
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              	1:1문의
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" id="choolCheck" >
              	출석체크
            </a>
          </li>
          
        </ul>
  
  </div>  
</div> 
 -->
 