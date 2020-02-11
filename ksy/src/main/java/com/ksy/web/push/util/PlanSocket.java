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
		
			// 웹 소켓이 연결되면 호출되는 이벤트
			@OnOpen
			public void handleOpen(@PathParam("planId") String planId, @PathParam("userId") String userId, Session session) throws Exception {
						System.out.println("PLANSOCKET ::: [" + planId + "] client is now connected...");
				
						List<Session> mapList = slMap.get(planId); // 같은 userId의 session 리스트 호출
						if (mapList == null || mapList.size() == 0) { // 없다면 생성
							mapList = new ArrayList<>();
						}
						mapList.add(session); // 생성된or호출된 session 리스트에 add
						slMap.put(planId, mapList);
				
						String message = userId + "님이 입장하셨습니다."; 
						sendToClient(planId, message, session);
		
			}
		
			//웹 소켓으로부터 메시지가 오면 호출되는 이벤트
			@OnMessage
			public void handleMessage(@PathParam("planId") String planId, @PathParam("userId") String userId, String message, Session session)
					throws Exception {
						// process booking from the given guest here
						System.out.println("PLANSOCKET [client to client] " + message);
						sendToClient(planId, message, session);
	
			}
		
			// 웹 소켓이 닫히면 호출되는 이벤트
			@OnClose
			public void handleClose(@PathParam("planId") String planId, @PathParam("userId") String userId, Session session) throws Exception {
						System.out.println("[PLANSOCKET] client is now disconnected...");
						String message = userId + "님이 퇴장하셨습니다."; 
						sendToClient(planId, message, session);
			}
			
			
			//웹 소켓이 에러가 나면 호출되는 이벤트
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

