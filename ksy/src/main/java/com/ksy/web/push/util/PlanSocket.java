package com.ksy.web.push.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.ksy.common.util.Util;
import com.ksy.service.domain.Chat;
import com.ksy.service.domain.User;
import com.ksy.service.user.UserService;



@ServerEndpoint("/planSocket/{planId}/{userId}")
public class PlanSocket {

			private static Map<String, List<Session>> slMap = Collections.synchronizedMap(new HashMap<>());
			private static Map<String, List<User>> users = Collections.synchronizedMap(new HashMap<>());
			private Chat chat = new Chat();
			private String msg;
			private UserService userService = (UserService)Util.getBean("userServiceImpl");
			
			// �� ������ ����Ǹ� ȣ��Ǵ� �̺�Ʈ
			@OnOpen
			public void handleOpen(@PathParam("planId") String planId, @PathParam("userId") String userId, Session session) throws Exception {
				System.out.println("\n==================="+planId+"�� �÷���ä�� ::: [" + userId + "] ����");
				
				List<Session> mapList = slMap.get(planId); // ���� userId�� session ����Ʈ ȣ��
				if (mapList == null || mapList.size() == 0) { // ���ٸ� ����
					mapList = new ArrayList<>();
				}
				mapList.add(session); // ������orȣ��� session ����Ʈ�� add
				slMap.put(planId, mapList);
				
				chat.setSenderId("system");
				chat.setChatContent(userId+"���� �����ϼ̽��ϴ�.");
				msg = new ObjectMapper().writeValueAsString(chat);
				System.out.println(">> ���� �޽��� : "+msg);
				sendToPlan(planId, msg, session);
				
				// ���� �����ο� ���
				List<User> userList = users.get(planId);
				if( userList == null || userList.size() == 0 ) {
					userList = new ArrayList<>();
				}
				//UserService userService = (UserService)Util.getBean("userServiceImpl");
				userList.add(userService.getUser(userId));
				System.out.println(planId+"�� ���� ������ ȸ�� ::");
				for(User user : userList ) {
					System.out.println(user);
				}
				System.out.println("===========");
				users.put(planId, userList);
				msg = new ObjectMapper().writeValueAsString(userList);
				sendToPlan(planId, msg, session);
						
			}
		
			//�� �������κ��� �޽����� ���� ȣ��Ǵ� �̺�Ʈ
			@OnMessage
			public void handleMessage(@PathParam("planId") String planId, @PathParam("userId") String userId, String message, Session session)
					throws Exception {
						// process booking from the given guest here
						System.out.println("PLANSOCKET [client to client] " + message);
						JSONObject jsonobj = (JSONObject)JSONValue.parse(message);
						
						ObjectMapper objectMapper = new ObjectMapper();
						chat = objectMapper.readValue(jsonobj.get("chat").toString(), Chat.class);
						//UserService userService = (UserService)Util.getBean("userServiceImpl");
						chat.setUser(userService.getUser(chat.getSenderId()));
						SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
						chat.setSendTime(sdf.format(new Date()));
						msg = new ObjectMapper().writeValueAsString(chat);
						sendToPlan(planId, msg, session);
	
			}
		
			// �� ������ ������ ȣ��Ǵ� �̺�Ʈ
			@OnClose
			public void handleClose(@PathParam("planId") String planId, @PathParam("userId") String userId, Session session) throws Exception {
						System.out.println("[PLANSOCKET] client is now disconnected...");
						
						chat.setSenderId("system");
						chat.setChatContent(userId+"���� �����ϼ̽��ϴ�.");
						msg = new ObjectMapper().writeValueAsString(chat);
						System.out.println(">> ���� �޽��� : "+msg);
						for (Map.Entry<String, List<Session>> entry : slMap.entrySet()) {
							System.out.println(planId +"�� �÷��ʸ� �����ϴ� getKey :::: " + entry.getKey());
							if (entry.getKey().equals(planId)) {
								entry.getValue().remove(session);
								for (Session se : entry.getValue()) {
									se.getBasicRemote().sendText(msg);
								}
							}
						}
						System.out.println("���� ����!"+users.get(planId).size());
						Iterator<User> iter = users.get(planId).iterator();
						User quit = userService.getUser(userId);
						while (iter.hasNext()) {
						    quit = iter.next();
						    iter.remove();
						}
						msg = new ObjectMapper().writeValueAsString(users.get(planId));
						sendToPlan(planId, msg, session);
			}
			
			
			//�� ������ ������ ���� ȣ��Ǵ� �̺�Ʈ
			@OnError
			public void handleError(Throwable t) {
						t.printStackTrace();
			}
			
			
			private void sendToPlan(String planId, String message, Session session) throws Exception {
				
				for (Map.Entry<String, List<Session>> entry : slMap.entrySet()) {
					System.out.println("[���� ä��] �÷���ID :::: " + entry.getKey()+" || �޽��� : "+message);
					if (entry.getKey().equals(planId)) {
						for (Session se : entry.getValue()) {
							se.getBasicRemote().sendText(message);
							System.out.println(planId+"�� ���� �޽��� : "+message);
						}
					}
				}
				
			}

}

