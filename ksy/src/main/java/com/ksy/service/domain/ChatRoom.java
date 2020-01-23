package com.ksy.service.domain;

import java.util.List;

public class ChatRoom {
	
	private String chatRoomId; // chatRoom_id
	private String chatRoomName; // chatRoom_name
	private int chatMemNum; // chatMem_num ä�� ���� �ο�
	private List<User> chatMems; // ä�� ���� ȸ�� ���

	// ��¿� field
	private String lastChat; // ������ �޽���
	private int unreadMsgCount; // �� ���� �޽��� ��
	
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
