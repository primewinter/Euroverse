<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-default">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">SHOW YOURSELF</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
  
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >�Խ���</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
		                         <li><a href="#">�α�۰Խ���</a></li>
		                         <li><a href="#">�÷��ʰ���</a></li>
		                         <li><a href="#">����ã��</a></li>
		                         <li><a href="#">�����ı�</a></li>
		                         <li><a href="#">��������</a></li>
		                         <li><a href="#">QnA</a></li>
		                         <li><a href="#">�����Խ���</a></li>
		                     </ul>
	                 </li>
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">�α׾ƿ�</a></li>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->

   	<script type="text/javascript">
	
		//============= logout Event  ó�� =============	
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		});
	
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