<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

	<link href="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js">
	<link href="/resources/summernote/summernote.css" rel="stylesheet">
	<script src="/resources/summernote/summernote.min.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	function fncAddPost(){
		//Form 유효성 검증
	 	var postTitle = $("input[name='postTitle']").val();
		/* var postContent = $("input[name='postContent']").val(); */
	
		if(postTitle == null || postTitle.length<1){
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		/* if(postContent == null || postContent.length<1){
			alert("내용은 반드시 입력하셔야 합니다.");
			return;
		} */
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
			$( "a[href='#']" ).on("click" , function() {
					
				$("form")[0].reset();
			});
		});	
	
		//썸머노트
		$(document).ready(function() {
		     $('#summernote').summernote({
		             height: 300,                 // set editor height
		             minHeight: null,             // set minimum height of editor
		             maxHeight: null,             // set maximum height of editor
		             focus: true,                 // set focus to editable area after initializing summernote
		             lang : 'ko-KR',
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
		        	console.log(countt);
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
			if(output.trim() == 0) { 
			/* if(output.search(/\s/) != -1) {  */
				alert("공백은 입력이 불가합니다.");
				return true;
			}else{

			for(var i = 0; i < $( 'dd' ).length; i++){
				if( $("#tagContent"+i+" input").val() == output ){
					alert("동일한 태그는 중복입력이 불가합니다.");
					return true;
				}
			}
			
			if( count <= 9 ){
				$("#appendTag").val('');
				
				var tag = "<dd class='tagdiv' id='tagContent"+count+"'><input type='text' readonly='readonly' name='tagContent' value='"+output+"'><button type='button' onclick='deltag("+count+")'>삭제</button></dd>";
				$(".tagList").append(tag);
				
			}else{
				alert("태그는 10개까지만 등록 가능합니다.");
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
					$("button[onclick='deltag("+g+")']").attr('onclick','deltag('+i+')');
				}
			}
		}
		
		 $(function() {
             //시작일.
             $('#startDate').datepicker({
                 dateFormat: "yy-mm-dd",             // 날짜의 형식
                 changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                 minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 시작일(fromDate) datepicker가 닫힐때
                     // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }                
             });
             //종료일
             $('#endDate').datepicker({
                 dateFormat: "yy-mm-dd",
                 changeMonth: true,
                 minDate: 0, // 오늘 이전 날짜 선택 불가
                 onClose: function( selectedDate ) {
                     // 종료일(toDate) datepicker가 닫힐때
                     // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }                
             });
         });
		
	</script>
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/view/community/page.jsp">EUROVERSE</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">게시글 등록</h3>
	    </div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			<input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>		
		  <div class="form-group">
		    <label for="postTitle" class="col-sm-1 control-label">제목</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="postTitle" name="postTitle" placeholder="제목을 입력하세요.">
		    </div>
		    <label for="accPerson" class="col-sm-1 control-label">인원</label>
		    <div class="col-sm-3">
		      <select class="form-control" id="accPerson" name="accPerson">
			    <c:forEach var="i" begin="1" end="30" >
			      <option value="${i}">${i}</option>
			    </c:forEach>
		      </select>
		    </div>
		   </div>
	
		<div class="form-group">
		    <label for="accDate" class="col-sm-1 control-label">동행날짜</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="startDate" name="accStartDateStr" placeholder="동행 시작날짜를 입력하세요.">
		    </div>
		     <div class="col-sm-5">
		      <input type="text" class="form-control" id="endDate" name="accEndDateStr" placeholder="동행 종료날짜를 입력하세요.">
		    </div>
		  </div>
		
		<div class="form-group">
		    <label for="postContent" class="col-sm-1 control-label">내용</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" id="summernote" name="postContent"></textarea>
		    </div>
		  </div>
	
		<div class="form-group">
		    <label for="tagContent" class="col-sm-1 control-label">태그등록</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="appendTag" value="">
		      <button type="button" class="tag" onclick="addTag()">등록하기</button>
		      <div class="tagList" id="tagList"></div>
		    </div>
		  </div>   
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		
	</div>

</body>
</html>