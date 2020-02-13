package com.ksy.web.push.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
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

import com.ksy.service.domain.Chat;



@ServerEndpoint("/planSocket/{planId}/{userId}")
public class PlanSocket {

			private static Map<String, List<Session>> slMap = Collections.synchronizedMap(new HashMap<>());
			private Chat chat = new Chat();
			private String msg;
			
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
							System.out.println("�����ϴ� getKey :::: " + entry.getKey());
							if (entry.getKey().equals(planId)) {
								entry.getValue().remove(session);
								for (Session se : entry.getValue()) {
									se.getBasicRemote().sendText(msg);
								}
							}
						}
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

