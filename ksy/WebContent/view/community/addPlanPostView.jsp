<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

	<link href="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js">
	<link href="/resources/summernote/summernote.css" rel="stylesheet">
	<script src="/resources/summernote/summernote.min.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	
	<link rel="stylesheet" href="/resources/css/kronos.css" />
	<script src="/resources/javascript/kronos.js"></script>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	function fncAddPost(){
		//Form ��ȿ�� ����
	 	var postTitle = $("input[name='postTitle']").val();
		var postContent = $("textarea").val(); 
		var planId = $('select[name="planId"]').val();
		
		if(postTitle.trim() == 0 || postTitle.length<1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(postContent.trim() == 0 || postContent.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		} 
		
		if( planId == null || planId.length < 1){
			alert("�÷��ʸ� �������ּ���.");
			return;
		}
		
		if($('dd').length == 0){
			tag = "<input type='hidden' name='tagContent' value=''>";
			$(".tagList").append(tag);
		}
	
		$("form").attr("method" , "POST").attr("enctype" , "multipart/form-data").attr("action" , "/community/addPost").submit();
		}
	
		$(function() {
			$( "button.btn.btn-primary" ).on("click" , function() {
				
				fncAddPost();
			});
		});
			
		$(function() {
			$( "#cancel" ).on("click" , function() {
					
				$("form")[0].reset();
			});
		});	
	
		//��ӳ�Ʈ
		$(document).ready(function() {
		     $('#summernote').summernote({
		             height: 300,                 // set editor height
		             minHeight: null,             // set minimum height of editor
		             maxHeight: null,             // set maximum height of editor
		             focus: true,                 // set focus to editable area after initializing summernote
		             //lang : 'ko-KR',
		             callbacks: {
		                 onImageUpload: function(files, editor, welEditable) {
		                   for (var i = files.length - 1; i >= 0; i--) {
		                     sendFile(files[i], this);
		                   }
		                 }
		             }
		     });
		});
		
		var count=0;
		var countt=0;
		
		function sendFile(file, el) {
			
		    var form_data = new FormData();
		    form_data.append('file', file);
		   
	  		var render = new FileReader();
	  		render.onload = function(e){
		  		$(el).summernote('editor.insertImage', e.target.result, function($image){
		  			$image.attr('data-filename', 'retriever'+count+'');
		  			count++;
		  		});
		  	}
		  	render.readAsDataURL(file);  
		  	 
		      $.ajax({
		        data: form_data,
		        type: "POST",
		        url: '/community/json/addFile',
		        cache: false,
		        contentType: false,
		        enctype: 'multipart/form-data',
		        processData: false,
		        success: function(img_name) {
		        	$("img[data-filename='retriever"+countt+"']").attr('src',img_name);
		        	countt++;
		        	console.log(countt);;
		        }
		    }); 
		}
		
		$(document).ready(function() {
			$('#summernote').summernote();
			$('.dropdown-toggle').dropdown();
		});
		
		function addTag(){
			
			var count = $( 'dd' ).length;
			var output = $('#appendTag').val();
			
			if(output.trim() == 0 || output.search(/\s/gi, "") != -1) { 
				alert("������ �Է��� �Ұ��մϴ�.");
				return true;
			}else{

			for(var i = 0; i < $( 'dd' ).length; i++){
				if( $("#tagContent"+i+" input").val() == output ){
					alert("������ �±״� �ߺ��Է��� �Ұ��մϴ�.");
					return true;
				}
			}
			
			if( count <= 9 ){
				$("#appendTag").val('');
				
				var tag = "<dd style='float:left;margin-right:15px;font-size:12px;' class='tagdiv' id='tagContent"+count+"'><input type='hidden' name='tagContent' value='"+output+"'>"+output+" <i class='fas fa-trash-alt' onclick='deltag("+count+")'></i></dd>";
				$(".tagList").append(tag);
				
			}else{
				alert("�±״� 10�������� ��� �����մϴ�.");
			}
			}
		}
		
		function deltag(count){
			$("#tagContent"+count).remove();
			sorting(count);
		}
		
		function sorting(count){
		
			for(var i=0; i < $('dd').length; i++){
				if( count <= i ){
					var g = i + 1;
					$("#tagContent"+g).attr('id','tagContent'+i+'');
					$("i[onclick='deltag("+g+")']").attr('onclick','deltag('+i+')');
				}
			}
		}
		
		 $(function() {
			 
            //������.
            $('#startDate').kronos({
                format: "yyyy-mm-dd", 
                select: true,
                selectYear: {
	             	start: -1,
	             	end: 1
                },
                button: {
	                month :true,
	            	year :true,
	            	trigger :true,
	            	today :true
                },
                periodTo: '#endDate'
            });
            
            //������
            $('#endDate').kronos({
                format: "yyyy-mm-dd",
                select: true,
                selectYear: {
	             	start: -1,
	             	end: 1
                },
                button: {
	                month :true,
	            	year :true,
	            	trigger :true,
	            	today :true
                },
                periodFrom: '#startDate'
            });
        });
		
	</script>
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
	<jsp:include page="/toolbar/pushBar.jsp" />
	<jsp:include page="/view/community/sidebar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container" style="max-width: 930px;">
	
	  <div class="page_head clear">
		<div class="h4" style="text-align:left;font-weight:bold;margin: 40px 0 30px 80px;">
		  �÷��� �Խñ� ���
	    </div>
	  </div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			<input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>		
		  <div class="form-group">
		    <label for="postTitle" class="col-sm-1 control-label" style="font-size: 12px;">����</label>
		  <c:if test="${user.userId != 'admin'}">
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="postTitle" name="postTitle" style="font-size: 12px;" placeholder="������ �Է��ϼ���.">
		    </div>
		  </c:if>  
		  <c:if test="${user.userId == 'admin'}">
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="postTitle" name="postTitle" style="font-size: 12px;" placeholder="������ �Է��ϼ���.">
		    </div>
		    <label for="postTitle" class="col-sm-2 control-label" style="font-size: 14px;padding-right: 40px;"><i class="fas fa-flag-checkered"></i> �������
		      <input type="checkbox" id="postGrade" name="postGrade" value="N"></label>
		  </c:if>
		  </div>

		<div class="form-group">
	
		 	<label for="planId" class="col-sm-1 control-label" style="font-size: 12px;">�÷��� &nbsp;����</label>
		     <div class="col-sm-5">
		     
		      <select class="form-control" id="planId" name="planId">
			    <c:forEach items="${planList}" var="plan">
			    <c:if test="${planId == plan.planId}">
			    	<option value="${plan.planId}" selected>${plan.planTitle}</option>
			    </c:if>
			    <c:if test="${planId != plan.planId}">
			    	<option value="${plan.planId}">${plan.planTitle}</option>
			    </c:if>
			    </c:forEach>
		      </select>
		    </div>
		</div>
		
		<div class="form-group">
		    <label for="postContent" class="col-sm-1 control-label" style="font-size: 12px;">����</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" id="summernote" name="postContent"></textarea>
		    </div>
		</div>
	
		<br>
	
		<div class="form-group">
		    <label for="tagContent" class="control-label" style="font-size: 12px; float: left; margin-left: 30px;">�±׵��</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="appendTag" value="" style="font-size: 12px; height:23px; width:200px; float:left;">
		      <i class="fas fa-plus" onclick="addTag()" style="float:left; margin-left:10px; margin-top:4px; font-size:12px;">���</i>
		      <div class="tagList" id="tagList" style="width:800px;float:left;margin-top:10px;"></div>
		    </div>
		  </div>   
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">�� &nbsp;��</button>
			  <a id="cancel" class="btn btn-primary btn" href="#" role="button" style="color:white;">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		
	</div>

	<jsp:include page="/toolbar/footer.jsp"/>

</body>
</html>