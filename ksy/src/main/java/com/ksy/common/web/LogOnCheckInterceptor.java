package com.ksy.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ksy.service.domain.User;


/*
 * FileName : LogonCheckInterceptor.java
 *  �� Controller ȣ���� interceptor �� ���� ��ó��/��ó��/�Ϸ�ó���� ����
 *  	- preHandle() : Controller ȣ���� ��ó��   
 * 			(true return ==> Controller ȣ�� / false return ==> Controller ��ȣ�� ) 
 *  	- postHandle() : Controller ȣ�� �� ��ó��
 *    	- afterCompletion() : view ������ ó��
 *    
 *    ==> �α����� ȸ���̸� Controller ȣ�� : true return
 *    ==> �� �α����� ȸ���̸� Controller �� ȣ�� : false return
 */
public class LogOnCheckInterceptor extends HandlerInterceptorAdapter {

	///Field
	
		///Constructor
		public LogOnCheckInterceptor(){
			System.out.println("\nCommon :: "+this.getClass()+"\n");		
		}
		
		///Method
		public boolean preHandle(	HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception {
			
			System.out.println("@@@@@@���⼭ ���ǿ� ���� �ִ��� �ϴ� ���� Ȯ��@@@@@@@");
			HttpSession session = request.getSession();
			System.out.println(session.getId());
			User user = (User)session.getAttribute("user");
			System.out.println(user);
			if(user==null) {
				System.out.println("���� �� ������~");
				
			}else {
				System.out.println("������ ���� �ƴҶ�");
			}
			
//			System.out.println("\n[ LogonCheckInterceptor start........]");
//			System.out.println("�̰� �� ���ϴ°ǰ�?~!#!#$@@!@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//			System.out.println("����@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//			//==> �α��� ����Ȯ��
//			HttpSession session = request.getSession(true);
//			User user = (User)session.getAttribute("user");
//
//			//==> �α����� ȸ���̶��...
//			if(   user != null   )  {
//				//==> �α��� ���¿��� ���� �Ұ� URI
//				String uri = request.getRequestURI();
//				
//				if(		uri.indexOf("addUser") != -1 ||	uri.indexOf("login") != -1 		|| 
//						uri.indexOf("checkDuplication") != -1 ){
//					request.getRequestDispatcher("/index.jsp").forward(request, response);
//					System.out.println("[ �α��� ����.. �α��� �� ���ʿ� �� �䱸.... ]");
//					System.out.println("[ LogonCheckInterceptor end........]\n");
//					return false;
//				}
//				
//				System.out.println("[ �α��� ���� ... ]");
//				System.out.println("[ LogonCheckInterceptor end........]\n");
//				return true;
//			}else{ //==> �� �α����� ȭ���̶��...
//				//==> �α��� �õ� ��.....
//				String uri = request.getRequestURI();
//				
//				if(		uri.indexOf("addUser") != -1 ||	uri.indexOf("login") != -1 		|| 
//						uri.indexOf("checkDuplication") != -1 ){
//					System.out.println("[ �α� �õ� ���� .... ]");
//					System.out.println("[ LogonCheckInterceptor end........]\n");
//					return true;
//				}
//				
//				request.getRequestDispatcher("/index.jsp").forward(request, response);
//				System.out.println("[ �α��� ���� ... ]");
//				System.out.println("[ LogonCheckInterceptor end........]\n");
//				return false;
//			}
			
			return true;
		}// controller�� handler�� ������ ó����
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response,Object obj, ModelAndView mav)throws Exception {
			
//			System.out.println("��!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		
		
		}

		// view���� ó���� ���� �Ŀ� ó����
		@Override
		public void afterCompletion(HttpServletRequest request, HttpServletResponse response,Object obj, Exception e)throws Exception {
		
//			System.out.println("��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//		
//		
		}
		
}
