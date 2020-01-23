package com.ksy.service.domain;

import java.sql.Timestamp;

public class Order {
	private String orderId;
	private String buyerId;
	private String buyerName;
	private String buyerPhone;
	private String buyerEmail;
	private Timestamp orderDate;
	private String orderStatus;
	private String filghtId;
	private String roomId;
	private Timestamp payDate;
	private int payOpt;
	private int payInstal;
	private int totalAmount;
	private int actualAmount;
	private String cardNo;
	private Timestamp refundDate;
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerPhone() {
		return buyerPhone;
	}
	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}
	public String getBuyerEmail() {
		return buyerEmail;
	}
	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getFilghtId() {
		return filghtId;
	}
	public void setFilghtId(String filghtId) {
		this.filghtId = filghtId;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public int getPayOpt() {
		return payOpt;
	}
	public void setPayOpt(int payOpt) {
		this.payOpt = payOpt;
	}
	public int getPayInstal() {
		return payInstal;
	}
	public void setPayInstal(int payInstal) {
		this.payInstal = payInstal;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getActualAmount() {
		return actualAmount;
	}
	public void setActualAmount(int actualAmount) {
		this.actualAmount = actualAmount;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public Timestamp getRefundDate() {
		return refundDate;
	}
	public void setRefundDate(Timestamp refundDate) {
		this.refundDate = refundDate;
	}
	public Timestamp getPayDate() {
		return payDate;
	}
	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", buyerId=" + buyerId + ", buyerName=" + buyerName + ", buyerPhone="
				+ buyerPhone + ", buyerEmail=" + buyerEmail + ", orderDate=" + orderDate + ", orderStatus="
				+ orderStatus + ", filghtId=" + filghtId + ", roomId=" + roomId + ", payDate=" + payDate + ", payOpt="
				+ payOpt + ", payInstal=" + payInstal + ", totalAmount=" + totalAmount + ", actualAmount="
				+ actualAmount + ", cardNo=" + cardNo + ", refundDate=" + refundDate + "]";
	}
	
}
