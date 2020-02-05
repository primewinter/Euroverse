<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>  -->
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

	<link href="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js">

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	function fncAddPost(){
		//Form ��ȿ�� ����
	 	var postTitle = $("input[name='postTitle']").val();
		/* var postContent = $("input[name='postContent']").val(); */
	
		if(postTitle == null || postTitle.length<1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		/* if(postContent == null || postContent.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		} */
	
		$("form").attr("method" , "POST").attr("enctype" , "multipart/form-data").attr("action" , "/community/addPost").submit();
		}
	
		$(function() {
			$( "button.btn.btn-primary" ).on("click" , function() {
				
				fncAddPost();
			});
		});
			
		$(function() {
			$( "a[href='#']" ).on("click" , function() {
					
				$("form")[0].reset();
			});
		});	
	
		//��ӳ�Ʈ
		$(document).ready(function() {
		     $('#summernote').summernote({
		             height: 300,                 // set editor height
		             minHeight: null,             // set minimum height of editor
		             maxHeight: null,             // set maximum height of editor
		             focus: true,                  // set focus to editable area after initializing summernote
		             lang: 'ko-KR', // default: 'en-US'
		             callbacks: {
		                 onImageUpload: function(files, editor, welEditable) {
		                   for (var i = files.length - 1; i >= 0; i--) {
		                     sendFile(files[i], this);
		                   }
		                 }
		             }
		     });
		});
		
		function sendFile(file, el) {
			
		      var form_data = new FormData();
		      form_data.append('file', file);
		      
		      $.ajax({
		        data: form_data,
		        type: "POST",
		        url: '/community/json/addFile',
		        cache: false,
		        contentType: false,
		        enctype: 'multipart/form-data',
		        processData: false,
		        success: function(img_name) {
		        	
		          $(el).summernote('editor.insertImage', img_name);
		        }
		      });
		}

		$(document).ready(function() {
			$('#summernote').summernote();
			$('.dropdown-toggle').dropdown();
		});
		
		function addTag(){
			
			$.ajax({
				url : '/community/json/addTag' ,
				type : "POST" ,
				dataType : "json" ,
				
			});
		}
		
	</script>
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">SHOW YOURSELF</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">�Խñ� ���</h3>
	    </div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			<input type="hidden" id="boardName" name="boardName" value="${boardName}"/>		
		  <div class="form-group">
		    <label for="postTitle" class="col-sm-offset-1 col-sm-1 control-label">����</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="postTitle" name="postTitle" placeholder="������ �Է��ϼ���.">
		    </div>
		  </div>
		
		<div class="form-group">
		    <label for="postContent" class="col-sm-offset-1 col-sm-1 control-label">����</label>
		    <div class="col-sm-8">
		      <textarea class="form-control" id="summernote" name="postContent"></textarea>
		    </div>
		  </div>
	
		<div class="form-group">
		    <label for="tagContent" class="col-sm-offset-1 col-sm-1 control-label">�±׵��</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="tagContent" name="tagContent" placeholder="�±׸� ����ϼ���.">
		      <button type="button" class="tag" onclick="addTag()">����ϱ�</button>
		    </div>
		  </div>   
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		
	</div>

	
</body>
</html>