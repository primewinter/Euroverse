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
		
			$("a:contains('인기글게시판')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=C");
			});
			
			$("a:contains('플래너공유')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=E");
			});
			
			$("a:contains('여행후기')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=F");
			});
			
			$("a:contains('여행정보')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=B");
			});
			
			$("a:contains('QnA')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=G");
			});
			
			$("a:contains('자유게시판')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=A");
			});
			
			$("a:contains('동행')").on("click" ,function(){
				$(self.location).attr("href","/community/getPostList?boardName=D");
			});
		});
	
	</script>

	<div class="sidebar">
	  <a class="active" href="/main.jsp">EUROVERSE</a>
	  <a href="#C">인기글게시판</a>
	  <a href="#E">플래너공유</a>
	  <a href="#F">여행후기</a>
	  <a href="#B">여행정보</a>
	  <a href="#G">QnA</a>
	  <a href="#A">자유게시판</a>
	  <a href="#D">동행</a>
	</div>