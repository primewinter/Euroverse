package com.ksy.service.domain;

import java.sql.Timestamp;

public class Order {
	private String orderId; //order_id
	private User buyer; //buyer_id
	private String buyerName; //buyer_name
	private String buyerPhone; //buyer_phone
	private String buyerEmail; //buyer_email
	private Timestamp orderDate; //order_date
	private String orderStatus; //order_status
	private Flight flightId; //flight_id
	private Room roomId; //room_id
	private Timestamp payDate; //pay_date
	private int payOpt; //pay_opt
	private int payInstal; //pay_instal
	private int totalAmount; //total_amount
	private int actualAmount; //actual_amount
	private int payPoint; //pay_point
	private String cardNo; //card_no
	private Timestamp refundDate; //refund_date
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public User getBuyer() {
		return buyer;
	}
	public void setBuyer(User buyer) {
		this.buyer = buyer;
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
	public Flight getFlightId() {
		return flightId;
	}
	public void setFlightId(Flight flightId) {
		this.flightId = flightId;
	}
	public Room getRoomId() {
		return roomId;
	}
	public void setRoomId(Room roomId) {
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
	public int getPayPoint() {
		return payPoint;
	}
	public void setPayPoint(int payPoint) {
		this.payPoint = payPoint;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", buyer=" + buyer + ", buyerName=" + buyerName + ", buyerPhone="
				+ buyerPhone + ", buyerEmail=" + buyerEmail + ", orderDate=" + orderDate + ", orderStatus="
				+ orderStatus + ", flightId=" + flightId + ", roomId=" + roomId + ", payDate=" + payDate + ", payOpt="
				+ payOpt + ", payInstal=" + payInstal + ", totalAmount=" + totalAmount + ", actualAmount="
				+ actualAmount + ", payPoint=" + payPoint + ", cardNo=" + cardNo + ", refundDate=" + refundDate + "]";
	}

	
}
