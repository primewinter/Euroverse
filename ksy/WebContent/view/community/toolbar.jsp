<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ToolBar Start /////////////////////////////////////-->
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