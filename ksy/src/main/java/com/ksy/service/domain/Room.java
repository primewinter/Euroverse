package com.ksy.service.domain;

import java.sql.Timestamp;

public class Room {
	private String roomId; //room_id
	private String roomName; //room_name
	private int price; //price
	private String roomCity; //room_city
	private Timestamp checkIn; //check_in
	private Timestamp checkOut; //check_out
	private String roomType; //room_type
	private int adultNum;  //adult_num
	private int childNum; //child_num
	private int roomNum; //room_num
	private String roomImg; //room_img
	private String roomDetail; //room_detail
	public String getRoomId() { 
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getRoomCity() {
		return roomCity;
	}
	public void setRoomCity(String roomCity) {
		this.roomCity = roomCity;
	}
	public Timestamp getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Timestamp checkIn) {
		this.checkIn = checkIn;
	}
	public Timestamp getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Timestamp checkOut) {
		this.checkOut = checkOut;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getAdultNum() {
		return adultNum;
	}
	public void setAdultNum(int adultNum) {
		this.adultNum = adultNum;
	}
	public int getChildNum() {
		return childNum;
	}
	public void setChildNum(int childNum) {
		this.childNum = childNum;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public String getRoomImg() {
		return roomImg;
	}
	public void setRoomImg(String roomImg) {
		this.roomImg = roomImg;
	}
	public String getRoomDetail() {
		return roomDetail;
	}
	public void setRoomDetail(String roomDetail) {
		this.roomDetail = roomDetail;
	}
	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", roomName=" + roomName + ", price=" + price + ", roomCity=" + roomCity
				+ ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", roomType=" + roomType + ", adultNum="
				+ adultNum + ", childNum=" + childNum + ", roomNum=" + roomNum + ", roomImg=" + roomImg
				+ ", roomDetail=" + roomDetail + "]";
	}
}
