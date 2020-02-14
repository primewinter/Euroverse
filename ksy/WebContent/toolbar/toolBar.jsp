<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<a class="nav-link active" href="/">
		<h6>����</h6>
</a>
<jsp:include page="/view/user/login.jsp"></jsp:include>

<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">
�α��θ��
</button> -->

<c:if test="${user.userName != null}">
<p>
${user.nickname}�� �α�����....
</p>
<button type="button" class="btn btn-dark">�α׾ƿ�</button>
</c:if>
<c:if test="${user.userId == null}">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal" data-backdrop="static" data-keyboard="false">
�α���
</button>
</c:if>

<br/>
<a href="/view/flight/searchFlight.jsp">�װ��� �˻�</a> &ensp;&ensp;
<a href="/view/room/searchRoom.jsp">���� �˻�</a> &ensp;&ensp;
<a href="/order/getOrderList">�ֹ� ���</a> &ensp;&ensp; 
<a href="/toolbar/donghaeng.jsp">���� ä��</a> &ensp;&ensp;
<a href="/plan/getPlanList">�÷��� ����Ʈ</a> &ensp;&ensp;

<ul class="nav nav-tabs">
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
		$("button:contains('�α׾ƿ�')").on("click",function(){
			location.href="/user/logout";
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

