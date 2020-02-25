<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
 
 .sidebar{
	position: fixed;
	top: 200px;
 
}

</style>


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
		
		$(".nav-link:contains('플래너 초대 및 동행신청 목록')").on("click" ,function(){
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
		
		
		
		
	})
	
	
	

</script>



</head>
<body>

<div class="container-fluid sidebar" style="width: 270px;">
  <div class="row" style="width: 270px;">
 		<ul class="nav flex-column" style="text-align: center;" >
          
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
 <jsp:include page="/view/myPage/choolCheck.jsp"></jsp:include> 

</body>
</html>