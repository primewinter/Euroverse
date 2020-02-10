<%@page import="com.ksy.service.domain.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%User user = (User)session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-3">
				<h1>��������ȸ</h1>
			</div>
		</div>
					
		<div class="row">
					<div class="col-md-1">
					</div>
					
                    <div class="col-md-3">
                        <div class="profile-img">
                         <img src="${user.userImg}" alt="" style="width: 200px;height: 200px; border: 3px solid black; border-radius: 100px;-moz-border-radius: 100px;-khtml-border-radius: 100px;-webkit-border-radius: 100px;"> 
                       	 <!--�̹��� Ŭ���ϸ� �����ʻ��� �����ϰ��ϱ�... -->
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                    	</br>
                    	<h4>�� ��:${user.userName}</h4>
                    	<h4>�г���:${user.nickname}</h4>
                    	<h4>������ ����Ʈ:${user.totalPoint}</h4>
                    	<h4>���԰���:${user.slot}</h4>
                    	
                    	<c:if test="${user.role == 'G' }">
                    	<span class="badge badge-secondary">������ȸ��</span>
                    	</c:if>
                    	<c:if test="${user.role == 'Q' }">
                    	<span class="badge badge-info">����ȸ��</span>
                    	</c:if>
                    </div>
                    
                    <div class="col-md-3">
                    </br>
                    <div class="btn-group-vertical" role="group" aria-label="Basic example">
					  <button type="button" class="btn btn-secondary"  data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">�󼼺���</button>
					  <button type="button" class="btn btn-secondary">ȸ����������</button>
					  <button type="button" class="btn btn-secondary">ȸ��Ż��</button>
					</div>
                    </div>
                    
                   

		</div><!--row -->
		
		<div class="row">
			<div class="col-md-3">
			
			</div>
			
			<div class="col-md-6">
				<div class="collapse" id="collapseExample">
				  <div class="card card-body">
				   	�̸���:${user.email}</br>
				   	����:${user.birth}</br>
				   	�ڵ�����ȣ:${user.phone}</br>
				   	����:
				   	<%if(user.getSex().equals("M")){ %>
				   	����
				   <%}else{ %>
				   	����
				   <%} %></br>
				   	ȸ����������:${user.regDate}</br>
				   	
				   	
				   	
				   	�˸����� ����:
					<c:if test="${user.pushAgree == 'T'}">
						������
					</c:if>		
					<c:if test="${user.pushAgree == 'F'}">
						�ź���
					</c:if>		
				   
				  </div>
				</div>
			</div>
		
		</div>
		
		
	</div>
</body>
</html>