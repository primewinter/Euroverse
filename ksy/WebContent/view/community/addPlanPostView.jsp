<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<title>Euroverse</title>	
    <!-- 참조 : http://getbootstrap.com/css/   참조 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/carousel/">
    <!-- sweetalert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">


    <!-- Use Swiper from CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    <script src="https://unpkg.com/swiper/js/swiper.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>


    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <!-- AOS CDN2 :: https://michalsnik.github.io/aos/-->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!--owl carousel CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    
    <!-- include summernote css/js-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

	<link href="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js">
	<link href="/resources/summernote/summernote.css" rel="stylesheet">
	<script src="/resources/summernote/summernote.min.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
    
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	function fncAddPost(){
		//Form 유효성 검증
	 	var postTitle = $("input[name='postTitle']").val();
		var postContent = $("textarea").val(); 
		var planId = $('select[name="planId"]').val();
		
		if(postTitle.trim() == 0 || postTitle.length<1){
			swal({
   				icon : 'warning',
   			    title : "제목은 반드시 입력하여야 합니다.",
   			    text : " ",
   			    button : false,
   			    timer : 700
   			});
			return;
		}
		if(postContent.trim() == 0 || postContent.length<1){
			swal({
   				icon : 'warning',
   			    title : "내용은 반드시 입력하셔야 합니다.",
   			    text : " ",
   			    button : false,
   			    timer : 700
   			});
			return;
		} 
		
		if( planId == null || planId.length < 1){
			swal({
   				icon : 'warning',
   			    title : "플래너를 선택해주세요.",
   			    text : " ",
   			    button : false,
   			    timer : 700
   			});
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
	
		//썸머노트
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
				swal({
	   				icon : 'warning',
	   			    title : "공백은 입력이 불가합니다.",
	   			    text : " ",
	   			    button : false,
	   			    timer : 700
	   			});
				return true;
			}else{

			for(var i = 0; i < $( 'dd' ).length; i++){
				if( $("#tagContent"+i+" input").val() == output ){
					swal({
		   				icon : 'warning',
		   			    title : "동일한 태그는 중복입력이 불가합니다.",
		   			    text : " ",
		   			    button : false,
		   			    timer : 700
		   			});
					return true;
				}
			}
			
			if( count <= 9 ){
				$("#appendTag").val('');
				
				var tag = "<dd style='float:left;margin-right:15px;font-size:12px;' class='tagdiv' id='tagContent"+count+"'><input type='hidden' name='tagContent' value='"+output+"'>"+output+" <i class='fas fa-trash-alt' onclick='deltag("+count+")'></i></dd>";
				$(".tagList").append(tag);
				
			}else{
				swal({
	   				icon : 'warning',
	   			    title : "태그는 10개까지만 등록 가능합니다.",
	   			    text : " ",
	   			    button : false,
	   			    timer : 700
	   			});
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
			 
            //시작일.
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
            
            //종료일
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
		 
	 	function onKeyDown() {
			if(event.keyCode == 13) {
		    	addTag();
		    }
		}
		
	</script>
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
	<jsp:include page="/toolbar/pushBar.jsp" />
	<jsp:include page="/view/community/sidebar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="max-width: 930px;">
	
	  <div class="page_head clear">
		<div class="h4" style="text-align:left;font-weight:bold;margin: 40px 0 30px 80px;">
		  플래너 게시글 등록
	    </div>
	  </div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			<input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>		
		  <div class="form-group">
		    <label for="postTitle" class="col-sm-1 control-label" style="font-size: 12px;">제목</label>
		  <c:if test="${user.userId != 'admin'}">
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="postTitle" name="postTitle" style="font-size: 12px;" maxlength="20" placeholder="제목을 입력하세요.">
		    </div>
		  </c:if>  
		  <c:if test="${user.userId == 'admin'}">
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="postTitle" name="postTitle" style="font-size: 12px;" maxlength="20" placeholder="제목을 입력하세요.">
		    </div>
		    <label for="postTitle" class="col-sm-2 control-label" style="font-size: 14px;padding-right: 40px;"><i class="fas fa-flag-checkered"></i> 공지등록
		      <input type="checkbox" id="postGrade" name="postGrade" value="N"></label>
		  </c:if>
		  </div>

		<div class="form-group">
	
		 	<label for="planId" class="col-sm-1 control-label" style="font-size: 12px;">플래너 &nbsp;선택</label>
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
		    <label for="postContent" class="col-sm-1 control-label" style="font-size: 12px;">내용</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" id="summernote" name="postContent"></textarea>
		    </div>
		</div>
	
		<br>
	
		<div class="form-group">
		    <label for="tagContent" class="control-label" style="font-size: 12px; float: left; margin-left: 30px;">태그등록</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="appendTag" value="" maxlength="15" style="font-size: 12px; height:23px; width:200px; float:left;" onKeyDown="onKeyDown();">
		      <i class="fas fa-plus" onclick="addTag()" style="float:left; margin-left:10px; margin-top:4px; font-size:12px;">등록</i>
		      <div class="tagList" id="tagList" style="width:800px;float:left;margin-top:10px;"></div>
		    </div>
		  </div>   
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">등 &nbsp;록</button>
			  <a id="cancel" class="btn btn-primary btn" href="#" role="button" style="color:white;">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		
	</div>

	<jsp:include page="/toolbar/footer.jsp"/>

</body>
</html>