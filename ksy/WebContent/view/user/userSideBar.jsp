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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.sidebar{
	width: 100px;
	font-size: 12px;
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
			alert("������");
			//$(self.location).attr("href","/user/getUser");
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
		
		$(".nav-link:contains('ȸ��Ż��')").on("click" ,function(){
			alert("������");
			//$(self.location).attr("href","/user/getUser");
		});
		
		
		
		
	})
	
	
	

</script>



</head>
<body>
<jsp:include page="/view/myPage/choolCheck.jsp"></jsp:include>
<div class="container-fluid">
  <div class="row">
 <nav class="col-md-2 d-none d-md-block sidebar">
      <div class="sidebar-sticky" style="  border-right: 1px solid black;height: 700px;">
        <ul class="nav flex-column" >
          
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
<!--           <li class="nav-item">
            <a class="nav-link" href="#">
              	1:1���Ǹ��
            </a>
          </li> -->
          <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="modal" data-target="#choolCheckModal">
              	�⼮üũ
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              	ȸ��Ż��
            </a>
          </li>
          
        
        
        
        
        </ul>

        
      </div>
    </nav> 
    
    
    
    
<!-- �����̳ʶ� row div�±״� �ݴ°� ���� ������ include�޴°����� �ݾ������ ���� ȭ���� ��������� -->

<!--   </div>  
</div> -->


</body>
</html>