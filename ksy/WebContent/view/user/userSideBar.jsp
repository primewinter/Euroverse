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
		$(".nav-link:contains('��������ȸ')").on("click" ,function(){
			$(self.location).attr("href","/user/getUser");
		});
		
		$(".nav-link:contains('����������')").on("click" ,function(){
			$(self.location).attr("href","/user/updateUser");
		});
		
		$(".nav-link:contains('����Ʈ ��� ���')").on("click" ,function(){
			$(self.location).attr("href","/myPage/pointList");
		});
		
		$(".nav-link:contains('�� �Խñ� �� ���')").on("click" ,function(){
			$(self.location).attr("href","/myPage/myPostCommentList");
		});
		
		$(".nav-link:contains('�ϸ�ũ ���')").on("click" ,function(){
			$(self.location).attr("href","/myPage/myBookMarkList");
		});
		
		$(".nav-link:contains('�÷��� �ʴ� �� �����û ���')").on("click" ,function(){
			$(self.location).attr("href","/myPage/myOfferList");
		});
		$(".nav-link:contains('���� ��ǰ ���')").on("click" ,function(){
			//alert("������");
			$(self.location).attr("href","/myPage/likeOrderList");
		});
		
		$(".nav-link:contains('1:1����')").on("click" ,function(){
			$(self.location).attr("href","/myPage/addQnaAndQnaList");
		});
		
		/* $(".nav-link:contains('1:1���Ǹ��')").on("click" ,function(){
			alert("������");
			//$(self.location).attr("href","/user/getUser");
		});
		 */
	/* 	$(".nav-link:contains('�⼮üũ')").on("click" ,function(){
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
             	��������ȸ
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
             	����������
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
             	����Ʈ ��� ���
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
             	�� �Խñ� �� ���
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              	�ϸ�ũ ���
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              	�÷��� �ʴ� �� �����û ���
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              	���� ��ǰ ���
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              	1:1����
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" id="choolCheck" >
              	�⼮üũ
            </a>
          </li>
          
        
        
        
        
        </ul>
  

  </div>  
</div> 
 <jsp:include page="/view/myPage/choolCheck.jsp"></jsp:include> 

</body>
</html>