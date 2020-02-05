<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>getPlan</title>
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- ��Ʈ��Ʈ�� 4.4 �����ٰ� ����...............................�ߴٰ� �ٽ� 4.4��..  -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	
	
	<!-- Use Swiper from CDN -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	
	
	<!-- FontAwesome CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- fontawesome CDN -->
	<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script> -->
	<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script> -->
	



	<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
        width: 70%;
        background-color: grey;
      }
      /* Optional: Makes the sample page fill the window. */
      
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #floating-panel {
        width: 440px;
      }
      #place-id {
        width: 250px;
      }
      
      .modal{
	    background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
      }
      
      .swiper-container {
      	border: 1px gray;
      	//padding: 5px;
      	height: 500px;
      }
      .swiper-wrapper {
      }
      .swiper-slide {
      	height: 480px;
      	background-color: white;
      	margin: 4px;
      	padding: 10px;
      	border-radius: 7px;
      	box-shadow:2px 1px 2px #898989;
      }
      
	</style>


	<script type="text/javascript">
	
		var planId = ${plan.planId};
		
		function getDaily(planId, dayNo, dayTime){
			console.log("getDaily() ���� "+planId+"/"+dayNo+"/"+dayTime);
			
			$.ajax({
				url: "/planSub/json/getDaily",
				method: "POST",
				dataType: "json",
				data: JSON.stringify({
					planId: planId,
					dayNo: dayNo,
					dayTime: dayTime
				}),
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){
						//alert("���ϵ����� ����");		//���� �𸣰ڴµ� �ȶ�..��...
					}else{
						//alert("���ϵ����� ����1! => "+JSONData.dailyCate);	
						
						$("input[name='dailyId']").val(JSONData.dailyId);
						$("select[name='dailyCate']").val(JSONData.dailyCate);
						$("input[name='dailyDetail']").val(JSONData.dailyDetail);
						
						$("input[name='budgetAmount']").val(JSONData.budgetAmount);
						$("select[name='budgetCurrency']").val(JSONData.budgetCurrency);
						
						$('#deleteDaily').show();
						$('#submitDaily').text('Update Daily');
					}
				},
				error:function(request,status,error){
					if( request.status == '200'){ 	//alert("���ϵ����� ����");	
						
						$("input[name='dailyId']").val('');
						$('#deleteDaily').hide();
						$('#submitDaily').text('Add Daily');
					}
			        //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		}
	
		function openDailyEdit(cityNames, dateString, dayNo, dayTime, planId) {
			console.log("cityNames="+cityNames+", dateString="+dateString+", dayNo="+dayNo +", dayTime="+dayTime+", planId="+planId);
			
			getDaily(planId, dayNo, dayTime);
			
			$('.city-names').text(cityNames);
			$('.city-date').text(dateString+",  D"+dayNo);
			
			$('#dayNo').val(dayNo);
			$('#dayTime').val(dayTime);
			
			setTimeout(function(){
				$("#dailyEdit").show()
			},100);
		}
		
		function submitDaily(dailyButton){
			
			//var planId = $("input[name='planId']").val();
			var dailyId = $("input[name='dailyId']").val();
			var dayNo = $("input[name='dayNo']").val();
			var dayTime = $("select[name='dayTime']").val();
			var dailyCate = $("select[name='dailyCate']").val();
			var dailyDetail = $("input[name='dailyDetail']").val();
			
			var budgetAmount = $("input[name='budgetAmount']").val();
			var budgetCurrency = $("select[name='budgetCurrency']").val();
			
			
			//if(budgetCurrency == null || budgetCurrency ==''){ budgetCurrency = 'K'; }; //���� ���Է½� �⺻�� ���� :: 0�� / KRW
			if(budgetAmount == null || budgetAmount =='' || budgetAmount=='0'){ budgetAmount = 0; };
			
			if(dailyDetail == null || dailyDetail ==''){
				alert("dailyDetail �� �Է����ּ���");
				return false;
			}
			
			console.log("planId="+planId+", dailyId="+dailyId+", dayNo="+dayNo+", dayTime="+dayTime+", dailyCate="+dailyCate+", dailyDetail="+dailyDetail+", budgetAmount="+budgetAmount+", budgetCurrency="+budgetCurrency);
			
			
			if(dailyButton == 'Add Daily'){
				console.log("Add Daily ��ư Ŭ��! ");
				
				if(dailyId == null || dailyId=='' ){
					//alert(" dailyId == null => addDaily() ����");
					
					$.ajax({
						url: "/planSub/json/addDaily",
						method: "POST",
						dataType: "json",
						data: JSON.stringify({
							planId: planId,
							dayNo: dayNo,
							dayTime: dayTime,
							dailyCate: dailyCate,
							dailyDetail: dailyDetail,
							budgetAmount: budgetAmount,
							budgetCurrency: budgetCurrency
						}),
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){
							if( JSONData==null || JSONData=="" ){
								console.log("���ϵ����� ����");	
							}else{
								console.log("���ϵ����� ����1! => "+JSONData);	
								
								var dailyList = JSONData;
								for( var i in dailyList){
									//alert("daily = "+dailyList[i].dailyId);
									setDaily(dailyList[i]);
								}
							}
							closeModal('dailyEdit');
						},
						error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
					    } 
					});
				}
				//addDaily
			}else if(dailyButton == 'Update Daily'){
				console.log("Update Daily ��ư Ŭ��! ");
				
				if(dailyId != null && dailyId !='' ){
					console.log(" dailyId != null => updateDaily() ����");
					
					$.ajax({
						url: "/planSub/json/updateDaily",
						method: "POST",
						dataType: "json",
						data: JSON.stringify({
							planId: planId,
							dailyId: dailyId,
							dayNo: dayNo,
							dayTime: dayTime,
							dailyCate: dailyCate,
							dailyDetail: dailyDetail,
							budgetAmount: budgetAmount,
							budgetCurrency: budgetCurrency
						}),
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){
							if( JSONData==null || JSONData=="" ){
								console.log("���ϵ����� ����");	
							}else{
								console.log("���ϵ����� ����1! => "+JSONData);	
								
								var dailyList = JSONData;
								for( var i in dailyList){
									setDaily(dailyList[i]);
								}
							}
							closeModal('dailyEdit');
						},
						error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
					    } 
					});
				} //updateDaily
			}else if(dailyButton == 'Delete Daily'){
				console.log("Delete Daily ��ư Ŭ��! ");
				
				if(dailyId != null && dailyId !='' ){
					console.log(" dailyId != null => deleteDaily() ����");
					
					$.ajax({
						url: "/planSub/json/deleteDaily/"+dailyId,
						method: "GET",
						dataType: "json",
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){
							/* if( JSONData==null || JSONData=="" ){ alert("���ϵ����� ����");	 }
							closeModal('dailyEdit'); */
						},
						error:function(request,status,error){
							if( request.status == '200'){ 		//alert("���ϵ����� ����");	 but ���� (���� void��)
								
								var dailyIdString = '#daily_'+dayNo+"_"+dayTime;
								$(dailyIdString).text('');
								closeModal('dailyEdit');
							}
					    } 
					});
				}
			}	//deleteDaily 
		}
		
		
		$(function(){
			
			$('#submitDaily').on('click', function(){
				submitDaily($(this).text());
			});
			
			$('#deleteDaily').on('click', function(){
				submitDaily($(this).text());
			});

		});
		
		
		function getDailyList(planId){
			console.log("getDailyList("+planId+") ���� ");
			
			$.ajax({
				url: "/planSub/json/getDailyList/"+planId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){
						//alert("���ϵ����� ����");	
					}else{
						//alert("���ϵ����� ����1! => JSONData = "+JSON.stringify(JSONData));	
						var dailyList = JSONData;
						for( var i in dailyList){
							setDaily(dailyList[i]);
						}
					}
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		}
		
		function setDaily( daily ){
			var dailyIdString = '#daily_'+daily.dayNo+"_"+daily.dayTime;
			
			var bcolor;		//����(D), ����(T), ����(V), ����(R), �Ļ�(F), ����(S), ��Ÿ(E)
			if( daily.dailyCate =='D' ){ bcolor = 'yellow';
			}else if( daily.dailyCate =='T' ){ bcolor = 'red';
			}else if( daily.dailyCate =='V' ){ bcolor = 'navy';
			}else if( daily.dailyCate =='R' ){ bcolor = 'blue';
			}else if( daily.dailyCate =='F' ){ bcolor = 'green';
			}else if( daily.dailyCate =='S' ){ bcolor = 'orange';
			}else if( daily.dailyCate =='E' ){ bcolor = 'purple';
			}
			
			$(dailyIdString).text(daily.dailyDetail);		//$(dailyIdString).text(daily.dailyDetail).css("background-color", bcolor);
			var appendString = '<span style="padding-left:5px; border-right-width:10px; border-right-style: solid; border-color: '+bcolor+';"></span>'
			$(dailyIdString).append(appendString);
		}
		
		getDailyList(planId);	//������ �ε� �� ajax�� ���� ����Ʈ �����ͼ� ������� ����ǥ�� �ɾ��ֱ�
		
		
		
		
		/* ------------------------------------------------------------------------------------------------------ */
		/* ---------------------------------		Stuff List ���� �Լ���		--------------------------------- */
		
		$(function(){
			
			$('#stuffMode').on('click', function(){
				changeStuffMode($(this).text());
			});

		});
		
		function changeStuffMode(mode){
			console.log("changeStuffMode() ���� :: moed="+mode);
			var stuffIconHtml;
			
			if(mode == 'Edit Mode'){
				$('#stuffMode').text('List Mode');
				stuffIconHtml = '<i class="fas fa-edit" style="font-size: 25px; margin-right: 3px; margin-bottom: 15px;"></i>';
				
			}else if(mode == 'List Mode'){
				$('#stuffMode').text('Edit Mode');
				stuffIconHtml = '<i class="fas fa-tasks" style="font-size: 25px; margin-right: 6px; margin-bottom: 15px;"></i>';
			}
			$('#stuff_icon').html(stuffIconHtml);
			getStuffList(planId, mode);
		} //changeStuffMode(mode) END
		
		function checkStuff(stuffId){
			var checked = $("input[name='stuff_"+stuffId+"']").val();
			console.log("checkStuff(stuffId) ���� => checked="+checked+", stuffId="+stuffId);
			
			if(checked =='T'){
				checked = 'F';
			}else if(checked=='F'){
				checked = 'T';
			}
			$("input[name='stuff_"+stuffId+"']").val(checked);
			
			$.ajax({
				url: "/planSub/json/checkStuff/"+checked+"/"+stuffId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ console.log("���ϵ����� ����");	 }
				},
				error:function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //checkStuff(stuffId) END
		
		function getStuffList(planId, mode){
			console.log("getStuffList("+planId+", "+mode+") ���� ");
			
			$.ajax({
				url: "/planSub/json/getStuffList/"+planId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					
					var stuffItemsHtml = '<div class="stuffItems">';
					var addStuffHtml = '<div class="addStuff"><i class="fas fa-pencil-alt" style="margin: 7px;"></i><input type="text" class="form-control" name="stuffName" style="margin-left:5px; margin-top:5px; width: 200px; display:inline-block;" placeholder="���ο� �׸� �Է�"> <button style="margin-bottom: 5px; margin-left: 5px;" type="button" class="btn btn-primary" onclick="addStuff()">�߰�</button> </div>';
					
					if( JSONData==null || JSONData=="" ){ 	
						console.log("���ϵ����� ����");	
						stuffItemsHtml += addStuffHtml;
						
					}else{ 		//alert("���ϵ����� ����1! => JSONData = "+JSON.stringify(JSONData));	
						if(mode == 'List Mode'){
							for( var i in JSONData){
								if( JSONData[i].stuffCheck == 'T' ){
									stuffItemsHtml += '<div class="stuffItem" style="margin: 7px;"> <input type="checkbox" name="stuff_'+JSONData[i].stuffId+'" checked value="T" onchange="checkStuff('+JSONData[i].stuffId+')"><span style="margin-left: 10px;"> '+JSONData[i].stuffName+'</span> </div>';
								}else if( JSONData[i].stuffCheck == 'F' ){
									stuffItemsHtml += '<div class="stuffItem" style="margin: 7px;"> <input type="checkbox" name="stuff_'+JSONData[i].stuffId+'" value="F" onchange="checkStuff('+JSONData[i].stuffId+')"><span style="margin-left: 10px;"> '+JSONData[i].stuffName+'</span> </div>';
								}
							}
						}else if(mode == 'Edit Mode'){
							for( var i in JSONData){ 	// html �̺�Ʈ�ɾ ������ �ٲٴ� ���� $(~).on("click") �̺�Ʈ�� ������� ����.... �׷��� �±� �ȿ� onClick="�����Լ�" �� �־���� �Լ�ȣ���� ��������
								stuffItemsHtml += '<div class="stuffItem" style="margin: 7px;"> <i class="fas fa-minus-circle" onClick="deleteStuff('+JSONData[i].stuffId+')"></i> <span id="stuff_'+JSONData[i].stuffId+'" style="margin-left: 7px;"> '+JSONData[i].stuffName+'</span> </div>';
							}
							stuffItemsHtml += addStuffHtml;
						}
					}
					
					stuffItemsHtml += '</div>';
					$(".stuffItems").replaceWith(stuffItemsHtml);
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //getStuffList(planId, mode) END
		
		function deleteStuff(stuffId){
			alert("������ �غ��� ���� �Ұ����մϴ�")
			console.log('deleteStuff('+stuffId+') ����! ');
			
			$.ajax({
				url: "/planSub/json/deleteStuff/"+stuffId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ 	//alert("���ϵ����� ����");	
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			        getStuffList(planId,'Edit Mode');			    
				} 
			});
		} //deleteStuff(stuffId) END
		
		function addStuff(){
			var stuffName = $("input[name='stuffName']").val();
			console.log('addStuff() ���� : stuffName='+stuffName);
			
			if(stuffName == null || stuffName ==''){
				alert("stuffName �� �Է����ּ���");
				return false;
			}
			
			$.ajax({		// GET������� addStuff �ߴ��� �ѱ��� ���� ���� POST�� �ٲ�
				url: "/planSub/json/addStuff" ,
				method: "POST",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				data: JSON.stringify({
					planId: planId,
					stuffName: stuffName
				}),
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ 	
						console.log("���ϵ����� ����");	
					}else{
						console.log("���ϵ����� ����! +> JSONData = "+JSON.stringify(JSONData));	
					}
					getStuffList(planId,'Edit Mode');
				},
				error:function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
				} 
			});
		} //addStuff() END
		
		getStuffList(planId, 'List Mode');
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		/* ------------------------------------------------------------------------------------------------------ */
		/* ---------------------------------		Todo List ���� �Լ���			--------------------------------- */
		
		$(function(){
			
			$('#todoMode').on('click', function(){
				alert("#todoMode Ŭ�� => changeTodoMode() ����");
				changeTodoMode($(this).text());
			});

		});
		
		function changeTodoMode(mode){
			alert("changeTodoMode(mode) ����");
		}
		
		function checkTodo(todoId){
			alert("checkTodo(todoId) ����");
		}
		
		function getTodoList(planId, mode){
			alert("getTodoList(planId, mode) ����");
		}
		
		function deleteTodo(todoId){
			alert("deleteTodo(todoId) ����");
		}
		
		function addTodo(){
			alert("addTodo() ����");
		}
		
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		
		/* ------------------------------------------------------------------------------------------------------ */
		/* ---------------------------------	CityRoute List ���� �Լ���		--------------------------------- */
		
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		
	</script>
	
	<script>
		
		function closeModal(modalName) {
			console.log("closeModal : modalName="+modalName);
			$("."+modalName)[0].reset();		//form�� ��� �̸��� ���� Ŭ������ �ֱ�
			$("#"+modalName).hide();
		}
		
	</script>

</head>
<body>
	
	<div class="album py-4 bg-white text-center">
		~~~ ������ Top ToolBar �־�� �� �ڸ� ~~~
	</div>
	
	<!-- navigation-list  -->
	<div class="navigation-list" style="padding:10px; background-color: white; display:scroll; position:fixed; top:100px; left:20px; margin: 15px; width: 150px;">
		<a href="/index.jsp">��������</a><br/><br/>
		<h6><a href="#gotoTodoList">Todo ����Ʈ</a></h6>
		<h6><a href="#gotoCityRouteList">�����Ʈ</a></h6>
		<h6><a href="#gotoDailyList">����ǥ</a></h6>
		<h6><a href="#gotoBudgetOverviewList">����</a></h6>
		<h6><a href="#gotoStuffList">�غ�</a></h6>
		<h6><a href="#gotoMemoList">�޸�</a></h6>
	</div>

	<!-- Top ��ư -->
	<a style="background-color:lime; padding:5px; display:scroll;position:fixed;bottom:50px;right:140px; margin: 15px; font-weight: bolder; font-size: x-large;" href="#" title="top">TOP</a>
	
	
	<!--	 Todo List : ���� ����Ʈ	 	-->
	<div class="album py-5 bg-light"  id="gotoTodoList">
		<div class="container">
			<h3>Todo List : ���� ����Ʈ</h3>
			<div class="row">
				
				
			</div>
		</div>
	</div>
	<br/>
	
	
	<!-- 	CityRoute List : �����Ʈ 	-->
	<div class="album py-5 bg-light" id="gotoCityRouteList">
		<div class="container">
			<h3>CityRoute List : �����Ʈ</h3>
			<div class="row">
			
				<div id="map" style="border:1px solid #e5e5e5;margin-bottom:0px;height:480px;float:left;width:60%"></div>
				
			</div>
		</div>
	</div>
	<br/>
	
	<!--	 BudgetOverview List : ���� ���� ����Ʈ	 	-->
	<div class="album py-5 bg-light"  id="gotoBudgetOverviewList">
		<div class="container">
			<h3>BudgetOverview List : ���� ���� ����Ʈ</h3>
			<div class="row">
				
				
			</div>
		</div>
	</div>
	<br/>
	
	
	<!--	 Daily List : ����ǥ 	-->
	<div class="album py-5 bg-light" id="gotoDailyList">
		<div class="container">
			<h3>Daily List : ����ǥ</h3>
			<div class="row">
				
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				    
				    	<c:if test="${plan.dayList.size() != 0}">
				    		<c:forEach var="day" items="${plan.dayList}">
				    			<div class="swiper-slide" style="width: 40px;">
				    			<div>
				    				<div class="dayInfo" style="padding-top:10px;padding-left:10px;text-align:left;padding-left:8px;font-size:14pt;color:#696969;">
										${day.dateString}  <br/>
										<span style="font-size:11pt;color:#c0c0c0"> ${day.cityNames} &nbsp;&nbsp; ( ${day.dayNo} ���� )</span>
									</div>
									
									<div style="margin-top: 10px;">
										<c:forEach var="i" begin="9" end="20">
											
											<div style="border-top:1px solid #efefef; height:30px;font-size:8pt;color:#c0c0c0;padding-left:10px; padding: 5px;" ondblclick="openDailyEdit( '${day.cityNames}', '${day.dateString}' ,${day.dayNo},${i},${plan.planId});">
												${i} <div style=" margin-left:10px; background-color: white; font-size:10pt; display:inline-block;" id="daily_${day.dayNo}_${i}"></div></div>
										</c:forEach>
									</div>
								</div>
				    			</div>
				    		</c:forEach>
				    	</c:if>
				    	
				    </div>
				    
				    <div class="swiper-button-prev" ></div>
				    <div class="swiper-button-next"></div>
					<!-- <div class="swiper-pagination"> -->
				    <!-- <div class="swiper-scrollbar"></div> -->
				</div>
			</div>
		</div>
	</div>
	<br/>
	
	
	<!--	 Stuff List : �غ� üũ����Ʈ 	-->
	<div class="album py-5 bg-light"  id="gotoStuffList">
		<div class="container">
			<h3>Stuff List : �غ� üũ����Ʈ</h3>
			<div class="row">
				
				<div style="border:dashed thin ; border-radius:8px; padding:25px; padding-bottom:5px; background-color: white; width: 100%; ">
					<span id="stuff_icon"><i class="fas fa-tasks" style="font-size: 25px; margin-right: 6px; margin-bottom: 15px;"></i></span> <span style="margin-left:10px; font-size:large; font-weight:bolder;"> �غ� ����Ʈ</span> <br/>
					
					<div class="stuffItems">
					<!-- �� div ���� �� getStuffList() �ٷ� ȣ���ؼ� �����ϱ� -->
						<%-- <c:forEach var="stuff" items="${plan.stuffList}">
							<div class="stuffItem" style="margin: 7px;">
								<c:if test="${stuff.stuffCheck=='T'}">
									<input type="checkbox" name="stuff_${stuff.stuffId}" checked value="T" onchange="checkStuff('${stuff.stuffId}')"><span style="margin-left: 10px;"> ${stuff.stuffName}</span>
								</c:if>
								<c:if test="${stuff.stuffCheck=='F'}">
									<input type="checkbox" name="stuff_${stuff.stuffId}" value="F" onchange="checkStuff('${stuff.stuffId}')"><span style="margin-left: 10px;"> ${stuff.stuffName}</span>
								</c:if>
							</div>
						</c:forEach>
						
						<c:if test="${plan.stuffList.size() == 0}">
							<div class="addStuff">
								<i class="fas fa-pencil-alt" style="margin: 7px;"></i><input type="text" class="form-control" name="stuffName" style="margin-left:5px; margin-top:5px; width: 200px; display:inline-block;" placeholder="���ο� �׸� �Է�">
								<button style="margin-bottom: 5px; margin-left: 5px;" type="button" class="btn btn-primary" onclick="addStuff()">�߰�</button> 
							</div>
						</c:if> --%>
					</div> 
					
					<p class="text-right" style="font-weight: bolder;" id="stuffMode">Edit Mode</p>
				</div>
				
			</div>
		</div>
	</div>
	<br/>
	
	
	<!--	 Memo List : �޸� 	-->
	<div class="album py-5 bg-light"  id="gotoMemoList">
		<div class="container">
			<h3>Memo List : �޸�</h3>
			<div class="row">
				
				<br/><br/>
				<c:if test="${plan.memoList.size()!=0}">
					<c:forEach var="memo" items="${plan.memoList}">
					
						<div style="font-size:small;  background-color:#FAFF5F;padding: 18px;margin: 10px;height: 300px;width: 300px;border: medium;border-color: navy;box-shadow:3px 2px 4px #898989;">
							�޸� ������� : &nbsp; ${memo.memoRegDate}<br/>
							����� : &nbsp; ${memo.regUserNickname}<br/><br/>
							${memo.memoDetail}<br/>
						</div>
					
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
			
	
	
	<!--	 Medal : dailyEdit	 	-->
	<div class="modal" id="dailyEdit" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <div class="modal-title">
	        	<h4 class="daily-info city-names">cityNames</h4>
	        	<h5 class="daily-info city-date">cityDate</h5>
	        </div>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('dailyEdit')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	        
	        <form class="form-inline dailyEdit" style="margin: 10px;">
	        	<input type="hidden" class="form-control" id="dayNo" name="dayNo" value="">
	        	<input type="hidden" class="form-control" id="planId" name="planId" value="${plan.planId}">
	        	<input type="hidden" class="form-control" id="dailyId" name="dailyId" value="">
	        	
				<div class="form-group" >
				    <label for="dayTime" style="font-weight: bold;">�ð� &nbsp;</label>
			    	<select class="form-control" id="dayTime" name="dayTime" disabled="disabled">
						<c:forEach var="j" begin="9" end="20">
							<option value="${j}">${j}</option>
						</c:forEach>
					</select>
					 &nbsp; &nbsp;
					<label for="dailyCate" style="font-weight: bold;" >ī�װ� &nbsp;</label>
			    	<select class="form-control" id="dailyCate" name="dailyCate" >
						<option value="D">����</option>
						<option value="T">����</option>
						<option value="V">����</option>
						<!-- <option value="R">����</option> -->
						<option value="F">�Ļ�</option>
						<option value="S">����</option>
						<option value="E">��Ÿ</option>
					</select>
				</div>
				
				
				<div class="form-group" style="margin-top: 15px; margin-bottom: 20px; width: 440px;">
				    <label for=dailyDetail class="control-label" style="font-weight: bold; margin-bottom: 5px;" >���� ����</label><br/>
				    <input type="text" class="form-control" id="dailyDetail" name="dailyDetail" placeholder="���� ������ �ۼ����ּ���" style="width:100%; height: 100px;">
				</div>
				
				<div class="form-group" >
					<label for="budgetAmount" style="font-weight: bold;" >���� &nbsp;</label>
			    	<input type="text" class="form-control" id="budgetAmount" name="budgetAmount" placeholder="0" style="width: 100px;"> 
					&nbsp; 
				    <label for="budgetCurrency" style="font-weight: bold;"> &nbsp;</label>
			    	<select class="form-control" id="budgetCurrency" name="budgetCurrency" >
						<option value="K">KRW</option>
						<option value="E">EUR</option>
						<option value="G">GBP</option>
					</select>
				</div>
		
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('dailyEdit')">Close</button>
	        <button type="button" class="btn btn-danger" id="deleteDaily">Delete Daily</button>
	        <button type="button" class="btn btn-primary" id="submitDaily">Edit Daily</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="album py-5 bg-white text-center" style="font-weight: bolder;">
		~~~ ����� Footer�� �־�� �� �ڸ� ~~~
	</div>
	
	<!-- Swiper�� ���� ��ũ��Ʈ -->
	<script>
		new Swiper ('.swiper-container', {
		    //direction: 'vertical',
		    //loop: true
			navigation : {
				nextEl : '.swiper-button-next', // ���� ��ư Ŭ������
				prevEl : '.swiper-button-prev', // �̹� ��ư Ŭ������
			},
		  })
	</script>
	
	<!-- Google Map Script -->
	<script>
		var map;
		var geocoder;
		var overlay;
		var marker=[];
		var routelines=[];
		
		var uluru = {lat: -25.344, lng: 131.036};
		var paris = {lat: 48.856667, lng: 2.350833};
		var korea = {lat:37.497957 , lng:127.027780};
	
		function initMap() {
			console.log("initMap ����");
			
			geocoder = new google.maps.Geocoder();
		    map = new google.maps.Map(document.getElementById('map'), {
		        center: paris,
		        zoom: 3,
		        /* zoom: 1: World
		        5: Landmass/continent
		        10: City
		        15: Streets
		        20: Buildings */
		        mapTypeId :'terrain' 
		    });
		     
		    marker = new google.maps.Marker({
		    	 position: paris, 
		    	 map: map,
		    	 title: 'marker Title!!'
		    	 });
		};
	
	</script>
	
	
	
	<!-- Google Map API -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMoE1_1g-id6crD_2M4nCDF4IsmcncLU4&callback=initMap" type="text/javascript"></script>

</body>
</html>