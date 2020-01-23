package com.ksy.service.domain;

import java.sql.Timestamp;

public class Day {
	
	//***********************************
	
	private int dayNo;
	private int dateMonth;
	private int dateDay;
	private Timestamp date;
	private String cityNames;
	
	
	public Day() {
		super();
	}


	public int getDayNo() {
		return dayNo;
	}
	public void setDayNo(int dayNo) {
		this.dayNo = dayNo;
	}

	public int getDateMonth() {
		return dateMonth;
	}
	public void setDateMonth(int dateMonth) {
		this.dateMonth = dateMonth;
	}

	public int getDateDay() {
		return dateDay;
	}
	public void setDateDay(int dateDay) {
		this.dateDay = dateDay;
	}

	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getCityNames() {
		return cityNames;
	}
	public void setCityNames(String cityNames) {
		this.cityNames = cityNames;
	}


	@Override
	public String toString() {
		return "Day [dayNo=" + dayNo + ", dateMonth=" + dateMonth + ", dateDay=" + dateDay + ", date=" + date
				+ ", cityNames=" + cityNames + "]";
	}

}
