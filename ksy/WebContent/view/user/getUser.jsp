<%@page import="com.ksy.service.domain.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%User user = (User)session.getAttribute("user"); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>



<!-- ��������Ʈ -->
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">



<style>

	




/* img{
	width: 200px;
	height: 200px;
	border-radius: 100px;
	-moz-border-radius: 100px;
	-khtml-border-radius: 100px;
	-webkit-border-radius: 100px;
} */
.nicknameClass{

font-family: 'Hi Melody', cursive;
font-size: 30px;
margin-left: 250px;
}
.badge{
font-family: 'Hi Melody', cursive;
align-content: center;
}

.userData{
	margin: 20px;
	font-size: 15px;
}

</style>
<!-- ���ͷ���Ʈ ���̾ƿ� -->
<style>
     #columns{
        column-width:300px;
        column-gap: 15px;
      }
      #columns figure{
        display: inline-block;
        border:1px solid rgba(0,0,0,0.2);
        margin:0;
        margin-bottom: 15px;
        padding:10px;
        box-shadow: 2px 2px 5px rgba(0,0,0,0.5);;
      }
      #columns figure img{
        width:100px;
        height: 100px;
      }
      #columns figure figcaption{
        border-top:1px solid rgba(0,0,0,0.2);
        padding:10px;
        margin-top:11px;
      }
</style>

<script>
 
</script>

</head>
<body>

<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>

 	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">��������ȸ</h1>
      </div> 
<%--       <div class="row">
					<div class="col-md-2">
					</div>
					
                    <div class="col-md-3">
                        <div class="profile-img">
                         <img src="/resources/images/userImages/${user.userImg}" alt="�����̹���" style="width: 200px;height: 200px; border: 3px solid black; border-radius: 100px;-moz-border-radius: 100px;-khtml-border-radius: 100px;-webkit-border-radius: 100px;"> 
                       	 <!--�̹��� Ŭ���ϸ� �����ʻ��� �����ϰ��ϱ�... -->
                        </div>
                    	<c:if test="${user.role == 'G' }">
                    	<span class="badge badge-secondary" style="width:200px;">������ȸ��</span>
                    	</c:if>
                    	<c:if test="${user.role == 'Q' }">
                    	<span class="badge badge-info" style="width:200px;">����ȸ��</span>
                    	</c:if>
                    	<c:if test="${user.role == 'A' }">
                    	<span class="badge badge-info" style="width:200px;">������</span>
                    	</c:if>
                    </div>
                    <div class="col-md-2">
                    </br>
                    	<h4>�̸� </h4>
                    	<h4>�г���</h4>
                    	<h4>������ ����Ʈ</h4>
                    	<h4>���԰���</h4>
                    	<h4>�̸���</h4>
                    	<h4>����</h4>
                    	<h4>�ڵ�����ȣ</h4>
                    	<h4>����</h4>
                    	<h4>ȸ����������</h4>
                    	<h4>�˸����ſ���</h4>
                    	<h4></h4>
                    	
                    </div>
                                             
                    <div class="col-md-4">
                    	</br>
                    	<h4>${user.userName}</h4>
                    	<h4>${user.nickname}</h4>
                    	<h4>${user.totalPoint}</h4>
                    	<h4>${user.slot}</h4>
                    	<h4>${user.email}</h4>
                    	<h4>${user.birth}</h4>
                    	<h4>${user.phone}</h4>
                    	<h4>
	                    	<c:if test="${user.sex=='M'}">
	                    		����
	                    	</c:if>
	                    	<c:if test="${user.sex=='F'}">
	                    		����
	                    	</c:if>
                    	</h4>
                    	<h4>${user.regDate}</h4>
                    	<h4>
	                    	<c:if test="${user.pushAgree == 'T'}">
								������
							</c:if>		
							<c:if test="${user.pushAgree == 'F'}">
								�ź���
							</c:if>
                    	</h4>
                    	
                    </div>
		</div><!--row -->
		
		<hr class="one" style="height: 30" >
		<div class="row">
			<div class="col-md-5">
			</div>
			
			<h3>������� ���� </h3>
		</div>
		<div class="row">
			<div class="col-md-5"></div>
 				<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
					<c:if test="${tripSurvey.surveyType=='D'}">
						<div class="card" style="width: 100px;">
						  <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" class="card-img-top" alt="...">
						  <div class="card-body">
						    <p class="card-text">${tripSurvey.surveyChoice}</p>
						  </div>
						</div>
					</c:if>
				</c:forEach> 
		</div>
		<div class="row">
			<div class="col-md-5">
			</div>
			<h3>���� ���� ��Ÿ�� </h3>
		</div>
		<div class="row">
			<div class="col-md-5"></div>
				<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
						<c:if test="${tripSurvey.surveyType=='T'}">
						<div class="card" style="width: 100px;">
						  <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" class="card-img-top" alt="...">
						  <div class="card-body">
						    <p class="card-text">${tripSurvey.surveyChoice}</p>
						  </div>
						</div>
						</c:if>
				</c:forEach> 
		</div>
		
		
		
		
		
		<hr class="one" style="height: 30" >
		<div class="row">
			<div class="col-md-5">
			</div>
			<h3>������ �ӹ� �ð� </h3>
		</div>
		<div class="row">
			<div class="col-md-4">
			</div>
			<div class="col-md-1">
				${travelDate}��  
			</div>
			<div class="col-md-1">
				${travelHour}�ð�
			</div>
			<div class="col-md-1">
				${travelMin}��
			</div>
		</div>
		
		<div class="row">
		
		</div>
		
      
       --%>
      

      
      	<div class="d-flex align-items-start bd-highlight ">
		  <div class="p-2" style="margin-left: 100px;margin-right: 20px">
		  <img alt="" src="/resources/images/userImages/defaultUserImage.jpg" style="width: 200px;height: 200px;	border-radius: 100px;	-moz-border-radius: 100px;	-khtml-border-radius: 100px;	-webkit-border-radius: 100px;">
		  </div>
<%-- 		  <div class="p-2 flex-grow-1 bd-highlight">
		 				<c:if test="${user.role == 'G' }">
                    	<span class="badge badge-secondary">������ȸ��</span>
                    	</c:if>
                    	<c:if test="${user.role == 'Q' }">
                    	<span class="badge badge-info">����ȸ��</span>
                    	</c:if>
                    	<c:if test="${user.role == 'A' }">
                    	<span class="badge badge-info" >������</span>
                    	</c:if>
		 	 <br><span class="nicknameClass">
						 ${user.nickname}
		  		</span>
		  	<br><br>
		  	<span>
		  		${user.totalPoint}Point
		  	
		  	</span>
		  </div> --%>
		  
		<div class="container mt-3">  
				  <div class="d-flex flex-md-column mb-3">
				    <div class="p-2">
				    
				    <span class="nicknameClass">
						 ${user.nickname}
		  			</span>
				 		<c:if test="${user.role == 'G' }">
                    		<span class="badge badge-secondary">������ȸ��</span>
                    	</c:if>
                    	<c:if test="${user.role == 'Q' }">
                    		<span class="badge badge-info">����ȸ��</span>
                    	</c:if>
                    	<c:if test="${user.role == 'A' }">
                    		<span class="badge badge-info" >������</span>
                    	</c:if>
		  			<br><br>
		  			
	<%-- 	  			<span class="userData">
		  				Point<br>
		  				${user.totalPoint}
		  			</span>
		  			
		  			<span class="userData">
		  				��������
		  				<br>${travelDate}��
		  			</span>
		  			
		  			<span class="userData">
		  				�⼮�ϼ�
		  				<br>0��
		  			</span>
		  			
		  			<span class="userData">
		  				�Խñۼ�
		  				<br>0��
		  			</span>
		  			
		  			<span class="userData">
		  				��ۼ�
		  				<br>0��
		  			</span>
		  			
		  			<span class="userData">
		  				�����������<br>
		  				�ĸ� , �׸���
				  		<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
							<c:if test="${tripSurvey.surveyType=='D'}">
								 ${tripSurvey.surveyChoice}
							</c:if>
						</c:forEach> 
		  			
		  			
		  			
		  			</span>
		  			
		  			<span class="userData">
		  				���ེŸ��<br>
		  				�� , �Թ� , ����
		  					<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
									<c:if test="${tripSurvey.surveyType=='T'}">
									    ${tripSurvey.surveyChoice}
									</c:if>
							</c:forEach>
		  			</span>
		  			 --%>
		  			
		  			
		  					  			
					  <div class="d-flex flex-wrap align-content-around" style="height:100px">
					   	<div class="p-2 userData">
					   		Point
					   		<br>${user.totalPoint}P
						</div>
					    
					    <div class="p-2 userData">
					    	��������
							<br>&nbsp;&nbsp;${travelDate}��
						</div>
						
					    <div class="p-2 userData">
					    	 �⼮�ϼ�
							 <br>&nbsp;&nbsp;0��
						</div>
						
					    <div class="p-2 userData">
					    	�Խñۼ�
							<br>&nbsp;&nbsp;0��
						</div>
						
					    <div class="p-2 userData">
					    	��ۼ�
							<br>&nbsp;&nbsp;0��
						</div>
					    
					    <div class="p-2 userData">
					    	�����������
					    	<br>�ĸ� , �׸���
					  		<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
								<c:if test="${tripSurvey.surveyType=='D'}">
									 ${tripSurvey.surveyChoice}
								</c:if>
							</c:forEach> 
						</div>
						
						
					    <div class="p-2 userData">
					    	���ེŸ��
					    	<br>�� , �Թ� , ����
		  					<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
									<c:if test="${tripSurvey.surveyType=='T'}">
									    ${tripSurvey.surveyChoice}
									</c:if>
							</c:forEach>
						</div>
					 
					 
					 
					 
					  </div>
		  		
		  			
		  			
		  			
		  			
		  			
		  			</div>
				  </div>
			</div>
	      </div>
        <div id="columns">
      <figure>
        <figcaption>���� ���ͷ���Ʈ ���̾ƿ� �Ұž� ��۸�� , �Խñ۸�� , ����Ʈ��� , �ϸ�ũ��� �ð����� �����Ұž�~~</figcaption>
      </figure>
 
      <figure>
        <figcaption>�����ٶ�</figcaption>
      </figure>
 
      <figure>
			<img alt="" src="/resources/images/userImages/360x360.png">
        <figcaption>
        	���� : ���౸�մϴ�.
        	�׸�������~
		</figcaption>
      </figure>
 
      <figure>
        <figcaption>
        2020�� 02�� 14�� 
        <br>�⼮üũ
        <br>+100Point			
        </figcaption>
      </figure>
 
      <figure>
        <figcaption>
		<b>����</b>�ƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾ�
		</figcaption>
      </figure>
 
      <figure>
        <figcaption>Pocahontas based on 17th century Powhatan costume</figcaption>
      </figure>
 
      <figure>
        <img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/snow-white.jpg">
        <figcaption></figcaption>
      </figure>    
 
      <figure>
		<h2>��������</h2>
        <figcaption>
        	�ȳ�
        </figcaption>
      </figure>
 
      <figure>
        <img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/tiana.jpg">
        <figcaption></figcaption>
      </figure>   
    </div>
      	
      
    </main>
    </div><!-- include ���̵�ٿ� �̾���  row End-->
    </div><!-- include ���̵�ٿ� �̾��� container End -->


</body>
</html>