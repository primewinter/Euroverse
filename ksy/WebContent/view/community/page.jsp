<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
    <!-- jQuery UI toolTip ��� CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip ��� JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
</head>

<body>

	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" href="/view/community/page.jsp">EUROVERSE</a>
	  </li>
	  <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Ŀ�´�Ƽ</a>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="#">�α�۰Խ���</a>
	      <a class="dropdown-item" href="#">�÷��ʰ���</a>
	      <a class="dropdown-item" href="#">����ã��</a>
	      <a class="dropdown-item" href="#">�����ı�</a>
	      <a class="dropdown-item" href="#">��������</a>
	      <a class="dropdown-item" href="#">QnA</a>
	      <a class="dropdown-item" href="#">�����Խ���</a>
	    </div>
	  </li>
	</ul>

		<!-- ToolBar End /////////////////////////////////////-->
		
   	<script type="text/javascript">
		
	 	$( "a:contains('�����Խ���')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=A");
		});
	 	
	 	$( "a:contains('��������')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=B");
		}); 
	 	
	 	$( "a:contains('�α�۰Խ���')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=C");
		}); 
	 	
	 	$( "a:contains('����ã��')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=D");
		}); 
	 	
	 	$( "a:contains('�÷��ʰ���')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=E");
		}); 
	 	
	 	$( "a:contains('�����ı�')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=F");
		}); 
	 	
	 	$( "a:contains('QnA')" ).on("click" , function() {
	 		$(self.location).attr("href","/community/getPostList?boardName=G");
		}); 
	 	
	</script>  
	
</body>

</html>