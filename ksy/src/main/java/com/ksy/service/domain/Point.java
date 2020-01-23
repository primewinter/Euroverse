package com.ksy.service.domain;

import java.sql.Timestamp;

public class Point {
	
	public Point() {
		
	}
	
	//point TABLE
	private String pointId; //point_id
	private String userId; //user_id
	private String refId; //ref_id
	private String usedType; //used_type  출석체크(C) , 슬롯구매(S) , 항공권,숙소 구매(B) , 포인트사용(U)
	private int usedPoint; //used_point
	private Timestamp usedDate; //used_date
	
	public String getPointId() {
		return pointId;
	}
	public void setPointId(String pointId) {
		this.pointId = pointId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRefId() {
		return refId;
	}
	public void setRefId(String refId) {
		this.refId = refId;
	}
	public String getUsedType() {
		return usedType;
	}
	public void setUsedType(String usedType) {
		this.usedType = usedType;
	}
	public int getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}
	public Timestamp getUsedDate() {
		return usedDate;
	}
	public void setUsedDate(Timestamp usedDate) {
		this.usedDate = usedDate;
	}
	@Override
	public String toString() {
		return "Point [pointId=" + pointId + ", userId=" + userId + ", refId=" + refId + ", usedType=" + usedType
				+ ", usedPoint=" + usedPoint + ", usedDate=" + usedDate + "]";
	}
	
	
 
	
	
	
	
	
	

}
