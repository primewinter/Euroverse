package com.ksy.web.chat;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.service.domain.Chat;
import com.ksy.service.domain.ChatRoom;
import com.ksy.service.domain.Plan;
import com.ksy.service.domain.User;
import com.ksy.service.user.UserService;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

	@RestController
	@RequestMapping("/chat/json/*")
	public class ChatRestController {
		
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		
		private MongoClient mongoConn;
		private MongoDatabase mongoDB;
		private MongoCollection<Document> coll;
		
		public ChatRestController() {
			System.out.println(this.getClass()+" MongoDB �����-----------------------------");
			this.mongoConn = new MongoClient("localhost", 27017);
			this.mongoDB = mongoConn.getDatabase("Euroverse");
			
			}

		@RequestMapping(value = "getPlan", method=RequestMethod.GET)
		public String getPlan(@RequestParam("planId") String planId, Model model) throws Exception {
			System.out.println("getPlan :: "+planId);
			Plan plan = new Plan();
			plan.setPlanId(planId);
			model.addAttribute("plan", plan);
			return "forward:/chat/chat.jsp";
		}
		
		@RequestMapping(value = "getChatRoomList/{userId}", method=RequestMethod.GET)
		public List<ChatRoom> getChatRoom(@PathVariable("userId") String userId, Model model) throws Exception {
			System.out.println("getChatRoom :: "+userId);
			coll = mongoDB.getCollection("ChatRoom");
			MongoCollection<Document> coll2 = mongoDB.getCollection("Chat");
			List<String> listUser = new ArrayList<String>();
			listUser.add(userId);
			
			BasicDBObject query = new BasicDBObject("chatMems", new BasicDBObject("$in", listUser));
			FindIterable<Document> fit = coll.find(query);
			List<Document> docs = new ArrayList<Document>();
			fit.into(docs);
			System.out.println("query ������ cur :: "+fit);
			List<ChatRoom> roomList = new ArrayList<ChatRoom>();
			for(Document doc : docs) {
				ChatRoom chatRoom = new ChatRoom();
				chatRoom.setChatRoomId(doc.get("_id")+"");
				chatRoom.setChatMems((List<String>)doc.get("chatMems"));
				chatRoom.setChatRoomName(doc.get("chatRoomName")+"");
				System.out.println(listUser+"�� �����ϴ� ä�ù� ��� : "+chatRoom);
				roomList.add(chatRoom);
				
				System.out.println("ä�ù� ������ �޽���====================");
				query = new BasicDBObject("chatRoomId", doc.get("_id")+"");
				chatRoom.setLastChat(coll2.find(query).sort(new BasicDBObject("chatDate", -1)).first());
				System.out.println("ä�ù� ������ �޽��� : "+chatRoom.getLastChat());
				
			}
			return roomList;
		}
		
		@RequestMapping(value="getChat/{chatRoomId}", method=RequestMethod.GET)
		public List<Document> getChat(@PathVariable("chatRoomId") String chatRoomId) throws Exception{
			System.out.println("getChat :: "+chatRoomId);

			coll = mongoDB.getCollection("Chat");
			BasicDBObject query = new BasicDBObject("chatRoomId", chatRoomId);
			FindIterable<Document> fit = coll.find(query).limit(100);
			List<Document> docs = new ArrayList<Document>();
			fit.into(docs);
			for (Document doc : docs) {
				System.out.println("ä�ù�id �� "+chatRoomId+"�� ä�� �޽��� : "+doc);
				doc.put("user", userService.getUser(doc.get("senderId")+""));
			}
			// _id�� ���� ����Ͽ� ������������ ����
			//db.orders.find().sort( { "_id": 1 } )
//			amount ���� ����Ͽ� ������������ �����ϰ�, ������ ������ id ���� ������������ �����ϱ�
//			db.orders.find().sort( { "amount": 1, "_id": -1 } )
			
			return docs;
		}
		
		@RequestMapping(value="getChat/{chatRoomId}", method=RequestMethod.POST)
		public List<Document> getChat(@PathVariable("chatRoomId") String chatRoomId, @RequestParam int page) throws Exception{
			System.out.println("getChat :: "+chatRoomId);
			
			coll = mongoDB.getCollection("Chat");
			BasicDBObject query = new BasicDBObject("chatRoomId", chatRoomId);
			FindIterable<Document> fit = coll.find(query).sort(new BasicDBObject("chatDate", -1))
					.skip((page-1)*100).limit(100);
			// page 100�� ���????? **************************
			List<Document> docs = new ArrayList<Document>();
			fit.into(docs);
			for (Document doc : docs) {
				System.out.println("ä�ù�id �� "+chatRoomId+"�� ä�� �޽��� : "+doc);
			}
			// _id�� ���� ����Ͽ� ������������ ����
			//db.orders.find().sort( { "_id": 1 } )
//			amount ���� ����Ͽ� ������������ �����ϰ�, ������ ������ id ���� ������������ �����ϱ�
//			db.orders.find().sort( { "amount": 1, "_id": -1 } )
			
			return docs;
		}
		
		@RequestMapping(value="getChatRoom/{chatRoomId}", method=RequestMethod.GET)
		public Map<String, Object> getChatRoom(@PathVariable("chatRoomId") String chatRoomId) throws Exception{
			System.out.println("getChatRoom :: "+chatRoomId);

			coll = mongoDB.getCollection("ChatRoom");
			BasicDBObject query = new BasicDBObject("_id", new ObjectId(chatRoomId));
			FindIterable<Document> fit = coll.find(query);
			Document doc = fit.first();
			List<String> userList = (List<String>) doc.get("chatMems");
			List<User> users = new ArrayList<>();
			for(String userId : userList) {
				System.out.println("ä�ù濡 ������ ȸ�� ���̵� : "+userId);
				users.add(userService.getUser(userId));
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("userList", users);
			map.put("chatRoomName", doc.get("chatRoomName")+"");
			map.put("creator", doc.get("creator")+"");
			
			return map;
		}
		
		@RequestMapping(value="createRoom", method=RequestMethod.POST)
		public void createRoom(@RequestBody ChatRoom chatRoom) throws Exception {
			
			System.out.println("createRoom :: ChatRoom :"+chatRoom);
			
			List<String> chatMems = chatRoom.getChatMems();
			
			coll = mongoDB.getCollection("ChatRoom");
			System.out.println("ChatRoom DB ������");
			
			Document doc = new Document("creator", chatRoom.getCreator())
													.append("chatMems", chatMems)
													.append("chatRoomName", chatRoom.getChatRoomName())
													.append("createdDate", new Date());

			System.out.println("Document : "+doc);
			coll.insertOne(doc);
			System.out.println("insert�� Document "+doc);
		}
		
		
		@RequestMapping(value="joinChatRoom", method=RequestMethod.POST)
		public void joinChatRoom(@RequestBody ChatRoom chatRoom) throws Exception {
			// ������ ������ ������Ű�� ��
			System.out.println("joinChatRoom :: ChatRoom"+chatRoom);
			// chatRoom �� ������� ���� : chatRoomId, ���� ������ų ȸ��id
			// b/l : DB���� chatRoomId �� chatMems �� �ҷ��ͼ� �ű⿡ ���� ������ų ȸ�� id�� �ְ� update
			coll = mongoDB.getCollection("ChatRoom");
			
			BasicDBObject searchQuery = new BasicDBObject();
			//searchQuery.append("_id", new BasicDBObject("$toString",chatRoom.getChatRoomId()));
			searchQuery.append("_id", chatRoom.get_id());
			FindIterable<Document> cur = coll.find(searchQuery);
			Document doc = cur.first();
			System.out.println("_id �� "+chatRoom.getChatRoomId()+"�� ä�ù� :: "+doc);
			List<String> arr = (List<String>) doc.get("chatMems");
			arr.add(chatRoom.getChatMems().get(0));
			
			BasicDBObject updateQuery = new BasicDBObject();
			updateQuery.append("$set", 
				new BasicDBObject().append("chatMems", arr));
			coll.updateMany(searchQuery, updateQuery);			
			
		}
		
		@RequestMapping(value="quitChatRoom", method=RequestMethod.POST)
		public void quitChatRoom(@RequestBody ChatRoom chatRoom) throws Exception {
			// ����
			System.out.println("quitChatRoom :: ChatRoom"+chatRoom);
			
			coll = mongoDB.getCollection("ChatRoom");
			
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.append("_id", new ObjectId(chatRoom.getChatRoomId()));
			FindIterable<Document> cur = coll.find(searchQuery);
			Document doc = cur.first();
			List<String> arr = (List<String>) doc.get("chatMems");
			System.out.println("remove �� : "+arr);
			arr.remove(chatRoom.getChatMems().get(0));
			System.out.println("remove �� : "+arr);
			
			BasicDBObject updateQuery = new BasicDBObject();
			updateQuery.append("$set", 
				new BasicDBObject().append("chatMems", arr));
			coll.updateMany(searchQuery, updateQuery);	
			
		}
		
		@RequestMapping(value="readChat", method=RequestMethod.POST)
		public void readChat(@RequestBody Chat chat) throws Exception {
			System.out.println("readChat :: "+chat);
			
			coll = mongoDB.getCollection("Chat");
			BasicDBObject query = new BasicDBObject();
			query.append("_id", chat.get_id());
			FindIterable<Document> cur = coll.find(query);
			Document doc = cur.first();
			List<String> arr = (List<String>) doc.get("readers");
			System.out.println("read �� : "+arr);
			arr.add(chat.getSenderId());
			System.out.println("read �� : "+arr);
			
			BasicDBObject updateQuery = new BasicDBObject();
			updateQuery.append("$set", 
				new BasicDBObject().append("readers", arr));
			coll.updateMany(query, updateQuery);	
			
		}
		
		public void connectMongoDB(String chatId) throws Exception {
			
			// connection�� ���� instance ����
			MongoClientURI connectionString = new MongoClientURI("mongodb://localhost:27017");
			MongoClient mongoClient = new MongoClient(connectionString);
			
			// dataBase ���� : "chat" = Ư�� database �̸�
			MongoDatabase database = mongoClient.getDatabase("chat");
			
			// Collection ���� : "user" = Ư�� collection �̸�
			MongoCollection<Document> collection = database.getCollection("user");
			
			
			// document �����
			// - document Ŭ���� ��ü ���� �� �����ڷ� �ʵ� �̸��� ���� �Ű������� �ָ� �׿� �ش��ϴ� JSON ������ ����� ����. 
			// - ���� �迭 ������ ���� ������ ���� ���״� Arrays Ŭ������ asList() �޼ҵ带 �̿��Ͽ� ���� �����ϸ� �ȴ�.
			// - ���� �ʵ尡 ������ ��쿡�� ���ο� Document ��ü�� ���� �ʵ��� ������ �־��ָ� �ȴ�.
			Document doc = new Document("content", "�ȳ� �ݰ���")
					.append("type", "database")
					.append("count", 1)
					.append("read", Arrays.asList("user01", "user02", "user03"))
					.append("info", new Document("x", 203).append("y", 102));
			
			
			// �ϳ��� ����(DOCUMENT) �����ϱ�
			collection.insertOne(doc);
			
			// ���� ����(DOCUMENTS) �����ϱ�
			List<Document> documents = new ArrayList<Document>();
			 for (int i = 0; i < 100; i++) {
			     documents.add(new Document("i", i));
			 }
			 collection.insertMany(documents);
		}
			
}