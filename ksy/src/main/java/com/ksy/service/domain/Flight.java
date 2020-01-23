package com.ksy.service.domain;

public class Flight {
	private String filghtId;
	private String airline;
	private int price;
	private String tripCourse;
	private String depCity;
	private String depDate;
	private String arrCity;
	private String arrDate;
	private String seatGrade;
	private int adultNum;
	private int childNum;
	private int infantNum;
	private String leadTime;
	private String stopOver;
	public String getFilghtId() {
		return filghtId;
	}
	public void setFilghtId(String filghtId) {
		this.filghtId = filghtId;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTripCourse() {
		return tripCourse;
	}
	public void setTripCourse(String tripCourse) {
		this.tripCourse = tripCourse;
	}
	public String getDepCity() {
		return depCity;
	}
	public void setDepCity(String depCity) {
		this.depCity = depCity;
	}
	public String getDepDate() {
		return depDate;
	}
	public void setDepDate(String depDate) {
		this.depDate = depDate;
	}
	public String getArrCity() {
		return arrCity;
	}
	public void setArrCity(String arrCity) {
		this.arrCity = arrCity;
	}
	public String getArrDate() {
		return arrDate;
	}
	public void setArrDate(String arrDate) {
		this.arrDate = arrDate;
	}
	public String getSeatGrade() {
		return seatGrade;
	}
	public void setSeatGrade(String seatGrade) {
		this.seatGrade = seatGrade;
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
	public int getInfantNum() {
		return infantNum;
	}
	public void setInfantNum(int infantNum) {
		this.infantNum = infantNum;
	}
	public String getLeadTime() {
		return leadTime;
	}
	public void setLeadTime(String leadTime) {
		this.leadTime = leadTime;
	}
	public String getStopOver() {
		return stopOver;
	}
	public void setStopOver(String stopOver) {
		this.stopOver = stopOver;
	}
	@Override
	public String toString() {
		return "Flight [filghtId=" + filghtId + ", airline=" + airline + ", price=" + price + ", tripCourse="
				+ tripCourse + ", depCity=" + depCity + ", depDate=" + depDate + ", arrCity=" + arrCity + ", arrDate="
				+ arrDate + ", seatGrade=" + seatGrade + ", adultNum=" + adultNum + ", childNum=" + childNum
				+ ", infantNum=" + infantNum + ", leadTime=" + leadTime + ", stopOver=" + stopOver + "]";
	}
}
