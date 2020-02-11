package com.ksy.web.push.util;

import java.util.ArrayList;
import java.util.Collections;
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


@ServerEndpoint("/planSocket/{planId}/{userId}")
public class PlanSocket {

			private static Map<String, List<Session>> slMap = Collections.synchronizedMap(new HashMap<>());
		
			// �� ������ ����Ǹ� ȣ��Ǵ� �̺�Ʈ
			@OnOpen
			public void handleOpen(@PathParam("planId") String planId, @PathParam("userId") String userId, Session session) throws Exception {
						System.out.println("PLANSOCKET ::: [" + planId + "] client is now connected...");
				
						List<Session> mapList = slMap.get(planId); // ���� userId�� session ����Ʈ ȣ��
						if (mapList == null || mapList.size() == 0) { // ���ٸ� ����
							mapList = new ArrayList<>();
						}
						mapList.add(session); // ������orȣ��� session ����Ʈ�� add
						slMap.put(planId, mapList);
				
						String message = userId + "���� �����ϼ̽��ϴ�."; 
						sendToClient(planId, message, session);
		
			}
		
			//�� �������κ��� �޽����� ���� ȣ��Ǵ� �̺�Ʈ
			@OnMessage
			public void handleMessage(@PathParam("planId") String planId, @PathParam("userId") String userId, String message, Session session)
					throws Exception {
						// process booking from the given guest here
						System.out.println("PLANSOCKET [client to client] " + message);
						sendToClient(planId, message, session);
	
			}
		
			// �� ������ ������ ȣ��Ǵ� �̺�Ʈ
			@OnClose
			public void handleClose(@PathParam("planId") String planId, @PathParam("userId") String userId, Session session) throws Exception {
						System.out.println("[PLANSOCKET] client is now disconnected...");
						String message = userId + "���� �����ϼ̽��ϴ�."; 
						sendToClient(planId, message, session);
			}
			
			
			//�� ������ ������ ���� ȣ��Ǵ� �̺�Ʈ
			@OnError
			public void handleError(Throwable t) {
						t.printStackTrace();
			}
			
			
			public void sendToClient(String planId, String message, Session session) throws Exception {
						
						for (Map.Entry<String, List<Session>> entry : slMap.entrySet()) {
							System.out.println("getKey :::: " + entry.getKey()+" || message : "+message);
							if (entry.getKey().equals(planId)) {
								entry.getValue().remove(session);
								for (Session se : entry.getValue()) {
									se.getBasicRemote().sendText(message);
								}
							}
						}
			}

}

