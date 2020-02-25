package com.ksy.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ksy.service.domain.User;


/*
 * FileName : LogonCheckInterceptor.java
 *  ㅇ Controller 호출전 interceptor 를 통해 선처리/후처리/완료처리를 수행
 *  	- preHandle() : Controller 호출전 선처리   
 * 			(true return ==> Controller 호출 / false return ==> Controller 미호출 ) 
 *  	- postHandle() : Controller 호출 후 후처리
 *    	- afterCompletion() : view 생성후 처리
 *    
 *    ==> 로그인한 회원이면 Controller 호출 : true return
 *    ==> 비 로그인한 회원이면 Controller 미 호출 : false return
 */
public class LogOnCheckInterceptor extends HandlerInterceptorAdapter {

	///Field
	
		///Constructor
		public LogOnCheckInterceptor(){
			System.out.println("\nCommon :: "+this.getClass()+"\n");		
		}
		
		///Method
		public boolean preHandle(	HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception {
			
//			System.out.println("\n[ LogonCheckInterceptor start........]");
//			System.out.println("이게 다 통하는건가?~!#!#$@@!@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//			System.out.println("헤헤@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//			//==> 로그인 유무확인
//			HttpSession session = request.getSession(true);
//			User user = (User)session.getAttribute("user");
//
//			//==> 로그인한 회원이라면...
//			if(   user != null   )  {
//				//==> 로그인 상태에서 접근 불가 URI
//				String uri = request.getRequestURI();
//				
//				if(		uri.indexOf("addUser") != -1 ||	uri.indexOf("login") != -1 		|| 
//						uri.indexOf("checkDuplication") != -1 ){
//					request.getRequestDispatcher("/index.jsp").forward(request, response);
//					System.out.println("[ 로그인 상태.. 로그인 후 불필요 한 요구.... ]");
//					System.out.println("[ LogonCheckInterceptor end........]\n");
//					return false;
//				}
//				
//				System.out.println("[ 로그인 상태 ... ]");
//				System.out.println("[ LogonCheckInterceptor end........]\n");
//				return true;
//			}else{ //==> 미 로그인한 화원이라면...
//				//==> 로그인 시도 중.....
//				String uri = request.getRequestURI();
//				
//				if(		uri.indexOf("addUser") != -1 ||	uri.indexOf("login") != -1 		|| 
//						uri.indexOf("checkDuplication") != -1 ){
//					System.out.println("[ 로그 시도 상태 .... ]");
//					System.out.println("[ LogonCheckInterceptor end........]\n");
//					return true;
//				}
//				
//				request.getRequestDispatcher("/index.jsp").forward(request, response);
//				System.out.println("[ 로그인 이전 ... ]");
//				System.out.println("[ LogonCheckInterceptor end........]\n");
//				return false;
//			}
			
			return true;
		}// controller의 handler가 끝나면 처리됨
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response,Object obj, ModelAndView mav)throws Exception {
			
//			System.out.println("야!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		
		
		}

		// view까지 처리가 끝난 후에 처리됨
		@Override
		public void afterCompletion(HttpServletRequest request, HttpServletResponse response,Object obj, Exception e)throws Exception {
		
//			System.out.println("이@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//		
//		
		}
		
}
