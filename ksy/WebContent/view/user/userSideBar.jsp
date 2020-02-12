<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


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
			alert("구현중");
			//$(self.location).attr("href","/user/getUser");
		});
		
		$(".nav-link:contains('북마크 목록')").on("click" ,function(){
			alert("구현중");
			//$(self.location).attr("href","/user/getUser");
		});
		
		$(".nav-link:contains('플래너 초대 및 동행신청 목록')").on("click" ,function(){
			alert("구현중");
			//$(self.location).attr("href","/user/getUser");
		});
		
		$(".nav-link:contains('다녀온 여행지 정보')").on("click" ,function(){
			alert("구현중");
			//$(self.location).attr("href","/user/getUser");
		});
		
		$(".nav-link:contains('찜한 상품 목록')").on("click" ,function(){
			alert("구현중");
			//$(self.location).attr("href","/user/getUser");
		});
		
		$(".nav-link:contains('1:1문의')").on("click" ,function(){
			alert("구현중");
			//$(self.location).attr("href","/user/getUser");
		});
		
		$(".nav-link:contains('1:1문의목록')").on("click" ,function(){
			alert("구현중");
			//$(self.location).attr("href","/user/getUser");
		});
		
	/* 	$(".nav-link:contains('출석체크')").on("click" ,function(){
			$(self.location).attr("href","/user/getUser");
		}); */
		
		$(".nav-link:contains('회원탈퇴')").on("click" ,function(){
			alert("구현중");
			//$(self.location).attr("href","/user/getUser");
		});
		
		
		
		
	})
	
	
	

</script>



</head>
<body>
<jsp:include page="/view/myPage/choolCheck.jsp"></jsp:include>
<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          
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
            <a class="nav-link" href="#">
              	플래너 초대 및 동행신청 목록
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              	다녀온 여행지 정보
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
            <a class="nav-link" href="#">
              	1:1문의목록
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="modal" data-target="#choolCheckModal">
              	출석체크
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              	회원탈퇴
            </a>
          </li>
        </ul>

<!--         <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="d-flex align-items-center text-muted" href="#">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Last quarter
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Social engagement
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Year-end sale
            </a>
          </li>
        </ul> -->
        
        
      </div>
    </nav>
<!-- 컨테이너랑 row div태그는 닫는거 없음 이유는 include받는곳에서 닫아줘야지 옆에 화면을 만들수있음 -->

<!--   </div>  
</div> -->


</body>
</html>