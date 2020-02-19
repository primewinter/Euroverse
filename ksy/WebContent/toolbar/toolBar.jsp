<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<style>
        body {
            padding-top : 70px;
        }
   	</style>



<jsp:include page="/view/user/login.jsp"></jsp:include>


	<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #FFFFFF; border-bottom: 1px solid gray;">
    	<a class="navbar-brand" href="/main.jsp">Eurovers</a>
    	
    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
      		<span class="navbar-toggler-icon"></span>
    	</button>

    	<div class="collapse navbar-collapse" id="navbarsExample09">
      		<ul class="navbar-nav mr-auto">
      		
        		<li class="nav-item active">
          			<a class="nav-link" href="/main.jsp">Home <span class="sr-only">(current)</span></a>
        		</li>
        		
        		<!-- �÷��� -->
        		<li class="nav-item">
          			<a class="nav-link" href="/plan/getPlanList">�÷���</a>
        		</li>
        		
        		<!-- Ŀ�´�Ƽ ��Ӵٿ� -->
        		<li class="nav-item dropdown">
          			<a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ŀ�´�Ƽ</a>
          			<div class="dropdown-menu" aria-labelledby="dropdown01">
          				<a class="dropdown-item" href="#">�α�۰Խ���</a>
					    <a class="dropdown-item" href="#">�÷��ʰ���</a>
					    <a class="dropdown-item" href="#">����ã��</a>
					    <a class="dropdown-item" href="#">�����ı�</a>
					    <a class="dropdown-item" href="#">��������</a>
					    <a class="dropdown-item" href="#">QnA</a>
					    <a class="dropdown-item" href="#">�����Խ���</a>
          			</div>
        		</li>
        		
        		<!-- �װ� / ���� -->
        		<li class="nav-item">
          			<a class="nav-link" href="/view/flight/searchFlight.jsp">�װ�</a>
        		</li>
        		
        		<li class="nav-item">
          			<a class="nav-link" href="/view/room/searchRoom.jsp">����</a>
        		</li>
        		
        		<!-- ������������.. -->
        		<li class="nav-item">
          			<a class="nav-link" href="/order/getOrderList">�ֹ����</a>
        		</li>
        		
        		<!-- ����������ȸ ��Ӵٿ� -->
        		<li class="nav-item dropdown">
          			<a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">��������</a>
          			<div class="dropdown-menu" aria-labelledby="dropdown02">
            			<a class="dropdown-item" href="/api/infinityClick">����Ŭ��</a>
            			<a class="dropdown-item" href="/view/tripInfo/exchange.jsp">ȯ��</a>
            			<a class="dropdown-item" href="#">Something else here</a>
          			</div>
        		</li>
        		
        		
        		&ensp;&ensp;
        		
        		<li class="nav-item">
          			<a class="nav-link" href="/toolbar/donghaeng.jsp">����ä��</a>
        		</li>
        		&ensp;&ensp;
        		
        		<li class="nav-item">
        		<c:if test="${user.role != 'A'}">
        			<a class="nav-link" href="/user/getUser">������ ��ȸ</a>
        		</c:if>
        		<c:if test="${user.role == 'A'}">
        			<a class="nav-link" href="/admin/getUserList">ȸ��������ȸ</a>
        		</c:if>
        		</li>
        		
        		<!-- <li class="nav-item"> <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> </li> -->
      		</ul>
      		
      		
      		<div class="mr-3">
	      		<c:if test="${user.userName != null}">
					<span>${user.nickname}&nbsp;&nbsp;</span> <button type="button" class="btn btn-dark">�α׾ƿ�</button>
				</c:if>
				<c:if test="${user.userId == null}">
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">�α���</button>
				</c:if>
			</div>
				
      		<form class="form-inline my-2 my-md-0">
        		<input class="form-control" type="text" placeholder="Search" aria-label="Search">
      		</form>
    	</div>
	</nav>

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






<%-- 
<c:if test="${user.userName != null}">
	<span> ${user.nickname}�� �α�����.... </span> <button type="button" class="btn btn-dark">�α׾ƿ�</button>
</c:if>
<c:if test="${user.userId == null}">
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal" data-backdrop="static" data-keyboard="false">�α���</button>
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
 --%>