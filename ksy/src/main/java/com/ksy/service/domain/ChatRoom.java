package com.ksy.service.domain;

import java.util.List;

public class ChatRoom {
	
	private String chatRoomId; // chatRoom_id
	private String chatRoomName; // chatRoom_name
	private int chatMemNum; // chatMem_num 채팅 참여 인원
	private List<User> chatMems; // 채팅 참여 회원 목록

	// 출력용 field
	private String lastChat; // 마지막 메시지
	private int unreadMsgCount; // 안 읽은 메시지 수
	
	public String getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(String chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
	public String getChatRoomName() {
		return chatRoomName;
	}
	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}
	public int getChatMemNum() {
		return chatMemNum;
	}
	public void setChatMemNum(int chatMemNum) {
		this.chatMemNum = chatMemNum;
	}
	public List<User> getChatMems() {
		return chatMems;
	}
	public void setChatMems(List<User> chatMems) {
		this.chatMems = chatMems;
	}
	public String getLastChat() {
		return lastChat;
	}
	public void setLastChat(String lastChat) {
		this.lastChat = lastChat;
	}
	public int getUnreadMsgCount() {
		return unreadMsgCount;
	}
	public void setUnreadMsgCount(int unreadMsgCount) {
		this.unreadMsgCount = unreadMsgCount;
	}
	@Override
	public String toString() {
		return "ChatRoom [chatRoomId=" + chatRoomId + ", chatRoomName=" + chatRoomName + ", chatMemNum=" + chatMemNum
				+ ", chatMems=" + chatMems + ", lastChat=" + lastChat + ", unreadMsgCount=" + unreadMsgCount + "]";
	}
	
	

}
