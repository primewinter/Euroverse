<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

	<style>
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
	
	</script>

	<div class="sidebar">
	  <a class="active" href="/main.jsp">EUROVERSE</a>
	  <a href="#C">�α�۰Խ���</a>
	  <a href="#E">�÷��ʰ���</a>
	  <a href="#F">�����ı�</a>
	  <a href="#B">��������</a>
	  <a href="#G">QnA</a>
	  <a href="#A">�����Խ���</a>
	  <a href="#D">����</a>
	</div>