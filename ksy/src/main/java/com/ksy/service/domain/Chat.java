package com.ksy.service.domain;

import java.sql.Timestamp;

public class Chat {
	
	private String chatId; //chat_id
	private String chatRoomId; //chatRoom_id
	private String senderId; //sender_id
	private String chatContent; //chat_content
	private Timestamp chatDate; //chat_date
	public String getChatId() {
		return chatId;
	}
	public void setChatId(String chatId) {
		this.chatId = chatId;
	}
	public String getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(String chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public Timestamp getChatDate() {
		return chatDate;
	}
	public void setChatDate(Timestamp chatDate) {
		this.chatDate = chatDate;
	}
	@Override
	public String toString() {
		return "Chat [chatId=" + chatId + ", chatRoomId=" + chatRoomId + ", senderId=" + senderId + ", chatContent="
				+ chatContent + ", chatDate=" + chatDate + "]";
	}
	

}
