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
			
			// 웹 소켓이 연결되면 호출되는 이벤트
			@OnOpen
			public void handleOpen(@PathParam("planId") String planId, @PathParam("userId") String userId, Session session) throws Exception {
				System.out.println("\n==================="+planId+"번 플래너채팅 ::: [" + userId + "] 접속");
				
				List<Session> mapList = slMap.get(planId); // 같은 userId의 session 리스트 호출
				if (mapList == null || mapList.size() == 0) { // 없다면 생성
					mapList = new ArrayList<>();
				}
				mapList.add(session); // 생성된or호출된 session 리스트에 add
				slMap.put(planId, mapList);
				
				chat.setSenderId("system");
				chat.setChatContent(userId+"님이 입장하셨습니다.");
				msg = new ObjectMapper().writeValueAsString(chat);
				System.out.println(">> 보낸 메시지 : "+msg);
				
				sendToPlan(planId, msg, session);
		
			}
		
			//웹 소켓으로부터 메시지가 오면 호출되는 이벤트
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
		
			// 웹 소켓이 닫히면 호출되는 이벤트
			@OnClose
			public void handleClose(@PathParam("planId") String planId, @PathParam("userId") String userId, Session session) throws Exception {
						System.out.println("[PLANSOCKET] client is now disconnected...");
						
						chat.setSenderId("system");
						chat.setChatContent(userId+"님이 퇴장하셨습니다.");
						msg = new ObjectMapper().writeValueAsString(chat);
						System.out.println(">> 보낸 메시지 : "+msg);
						for (Map.Entry<String, List<Session>> entry : slMap.entrySet()) {
							System.out.println("퇴장하는 getKey :::: " + entry.getKey());
							if (entry.getKey().equals(planId)) {
								entry.getValue().remove(session);
								for (Session se : entry.getValue()) {
									se.getBasicRemote().sendText(msg);
								}
							}
						}
			}
			
			
			//웹 소켓이 에러가 나면 호출되는 이벤트
			@OnError
			public void handleError(Throwable t) {
						t.printStackTrace();
			}
			
			
			private void sendToPlan(String planId, String message, Session session) throws Exception {
				
				for (Map.Entry<String, List<Session>> entry : slMap.entrySet()) {
					System.out.println("[동행 채팅] 플래너ID :::: " + entry.getKey()+" || 메시지 : "+message);
					if (entry.getKey().equals(planId)) {
						for (Session se : entry.getValue()) {
							se.getBasicRemote().sendText(message);
							System.out.println(planId+"에 보낸 메시지 : "+message);
						}
					}
				}
				
			}

}

