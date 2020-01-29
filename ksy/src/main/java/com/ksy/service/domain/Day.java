package com.ksy.service.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Day {
	
	//***********************************
	
		private int dayNo;
		
		private Timestamp date;

		private String dateString;
		
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


		public Timestamp getDate() {
			return date;
		}
		public void setDate(Timestamp date) {
			this.date = date;
			
			/*
			if(date != null) {
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				
				String month = ""+(cal.get(cal.MONTH)+1);
				if( cal.get(cal.MONTH) < 9) {
					month = "0"+month;
				}
				
				String day = ""+cal.get(cal.DAY_OF_MONTH);
				if( cal.get(cal.DAY_OF_MONTH) <10 ) {
					day = "0"+day;
				}
				
				this.dateString = cal.get(cal.YEAR)+"-"+month+"-"+day;
			}
			*/
			
			if(date != null) {
				Date dateForDay = new Date(date.getTime());		//요일을 위한 dateForDay
				this.dateString = date.toString().substring(0,10) + " : "+dateForDay.toString().substring(0,3);
			}
		}

		public String getCityNames() {
			return cityNames;
		}
		public void setCityNames(String cityNames) {
			this.cityNames = cityNames;
		}

		public String getDateString() {
			return dateString;
		}
		public void setDateString(String dateString) {
			this.dateString = dateString;
		}


		@Override
		public String toString() {
			return "Day [dayNo=" + dayNo + ", date=" + date + ", dateString=" + dateString + ", cityNames=" + cityNames
					+ "]";
		}

}
