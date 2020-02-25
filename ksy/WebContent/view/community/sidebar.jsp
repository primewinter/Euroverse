<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

	<!-- <style>
		body {
		  margin: 0;
		}
		
		.sidebar {
		  margin: 0;
		  padding: 0;
		  width: 200px;
		  background-color: #f1f1f1;
		  position: fixed;
		  height: 100%;
		  overflow: auto;
		}
		
		.sidebar a {
		  display: block;
		  color: black;
		  padding: 16px;
		  text-decoration: none;
		}
		 
		.sidebar a.active {
		  background-color: #45CCE2;
		  color: white;
		}
		
		.sidebar a:hover:not(.active) {
		  background-color: #555;
		  color: white;
		}
		
		div.content {
		  margin-left: 200px;
		  padding: 1px 16px;
		  height: 1000px;
		}
		
		@media screen and (max-width: 700px) {
		  .sidebar {
		    width: 100%;
		    height: auto;
		    position: relative;
		  }
		  .sidebar a {float: left;}
		  div.content {margin-left: 0;}
		}
		
		@media screen and (max-width: 400px) {
		  .sidebar a {
		    text-align: center;
		    float: none;
		  }
		}
	</style> -->
	
	<!-- ICON ����� ���� ��ũ��Ʈ ����Ʈ -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>
	
	
	<!-- Custom styles for this template -->
	<!-- ���� ���̵�ٸ� ���� CSS... �ȵż� �� ��ũ��Ʈ ��°�� �־�� -->
    <!-- <link href="/css/bootstrapDashboardCustomStyle.css" rel="stylesheet"> -->
	<style type="text/css">
		/* body {
		  font-size: .875rem;
		} */
		.feather {
		  width: 16px;
		  height: 16px;
		  vertical-align: text-bottom;
		}
		
		/* Sidebar */
		.sidebar {
		  position: fixed;
		  top: 200px;
		  bottom: 0;
		  left: 0;
		  z-index: 40; /* Behind the navbar */
		  padding: 48px 0 0; /* Height of navbar */
		  //box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
		  //background-color: white;
		}
		.sidebar-sticky {
		  position: relative;
		  top: 0;
		  height: calc(100vh - 48px);
		  padding-top: .5rem;
		  overflow-x: hidden;
		  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
		}
		@supports ((position: -webkit-sticky) or (position: sticky)) {
		  .sidebar-sticky {
		    position: -webkit-sticky;
		    position: sticky;
		  }
		}
		
		.sidebar .nav-link {
		  font-weight: 500;
		  color: #333;
		}
		.sidebar .nav-link .feather {
		  margin-right: 4px;
		  color: #999;
		}
		.sidebar .nav-link.active {
		  color: #007bff;
		}
		.sidebar .nav-link:hover .feather,
		.sidebar .nav-link.active .feather {
		  color: inherit;
		}
		.sidebar-heading {
		  font-size: .75rem;
		  text-transform: uppercase;
		}
		
		/* Content */
		
		[role="main"] {
		  padding-top: 133px; /* Space for fixed navbar */
		}
		@media (min-width: 768px) {
		  [role="main"] {
		    padding-top: 48px; /* Space for fixed navbar */
		  }
		}
		
		/* Navbar */
		/* .navbar-brand {
		  padding-top: .75rem;
		  padding-bottom: .75rem;
		  font-size: 1rem;
		  background-color: rgba(0, 0, 0, .25);
		  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
		} */
		.navbar .form-control {
		  padding: .75rem 1rem;
		  border-width: 0;
		  border-radius: 0;
		}
		.form-control-dark {
		  color: #fff;
		  background-color: rgba(255, 255, 255, .1);
		  border-color: rgba(255, 255, 255, .1);
		}
		.form-control-dark:focus {
		  border-color: transparent;
		  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
		}
	
	
		.bd-placeholder-img {
	        font-size: 1.125rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        -ms-user-select: none;
	        user-select: none;
	      }
	
	      @media (min-width: 768px) {
	        .bd-placeholder-img-lg {
	          font-size: 3.5rem;
	        }
	      }
	</style>
	
	<script>

		$(function(){
		
			$("a:contains('�α�۰Խ���')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=C");
			});
			
			$("a:contains('�÷��ʰ���')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=E");
			});
			
			$("a:contains('�����ı�')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=F");
			});
			
			$("a:contains('��������')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=B");
			});
			
			$("a:contains('QnA')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=G");
			});
			
			$("a:contains('�����Խ���')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=A");
			});
			
			$("a:contains('����')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=D");
			});
			
			
			
			
		});
		
		function checkBoard(){

			var boardName = '${param.boardName}';
			
			$('.nav-link').each( function(index){
				
				var boardNameThis = $(this).attr('href').substring(1,2);
				console.log(boardNameThis);
				
				if( boardNameThis == boardName ){
					//var appendHtml = '<span class="sr-only">(current)</span>';
					//$(this).append(appendHtml);
					$(this).addClass('active');
				}
			});
		}
		
		setTimeout(function(){
			checkBoard();
		},5);
	
	</script>

	<!-- <div class="sidebar">
	  <a class="active" href="/main.jsp">EUROVERSE</a>
	  <a href="#C">�α�۰Խ���</a>
	  <a href="#E">�÷��ʰ���</a>
	  <a href="#F">�����ı�</a>
	  <a href="#B">��������</a>
	  <a href="#G">QnA</a>
	  <a href="#A">�����Խ���</a>
	  <a href="#D">����</a>
	</div> -->
	
	
	
	<!-- ���� Plan ���� ���� Start /////////////////////////////////////////////////////////// -->
	<nav class="col-md-2 d-none d-md-block sidebar" style="padding-top:0px; padding-left:25px;padding-right: 20px;">
      <div class="sidebar-sticky">
      
        <ul class="nav flex-column" style="text-align: right;">
          <li class="nav-item">
            <a class="nav-link" href="#C">
              �α�۰Խ��� &nbsp; <span data-feather="star"></span>
              	
            </a>
          </li>
          
          
          
          <li class="nav-item">
            <a class="nav-link scroll" href="#E">
              �÷��ʰ��� &nbsp; <span data-feather="cloud"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#F">
              �����ı� &nbsp;<span data-feather="image"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#B">
              �������� &nbsp; <span data-feather="book-open"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#G">
              QnA &nbsp; <span data-feather="help-circle"></span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link scroll" href="#A">
              �����Խ��� &nbsp; <span data-feather="message-circle"></span>
            </a>
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link scroll" href="#D">
              ����  &nbsp; <span data-feather="users"></span>
            </a>
          </li>
        </ul>

       
        <!-- Top ��ư -->
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-5 mb-1 text-muted">
        	<span></span>
        	<span>
        		<a href="#" title="top" class="scroll"> top <span data-feather="arrow-up"></span></a>
        	</span>
        </h6>
        
      </div>
    </nav>
	<!-- ���� Plan ���� ���� End //////////////////////////////////////////////////// -->
	
	
	<script>
		/* icon ����� ���� ��ũ��Ʈ */
		/* https://github.com/feathericons/feather#feather ���� */
		feather.replace();
	</script>
	