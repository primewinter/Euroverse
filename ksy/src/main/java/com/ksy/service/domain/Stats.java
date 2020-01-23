package com.ksy.service.domain;

public class Stats {
	
	private String userId;//user_id
	private String postId;//post_id
	private String planId;//plan_id
	
	
	private String stayEurope; //유럽에 머문 시간  <일정표?
	private String visitCity; //다녀온 도시   <여행루트
	private int myPost; //작성한 게시글
	private int myComment; //작성한 댓글
	
	
	public Stats() {
		
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPostId() {
		return postId;
	}


	public void setPostId(String postId) {
		this.postId = postId;
	}


	public String getPlanId() {
		return planId;
	}


	public void setPlanId(String planId) {
		this.planId = planId;
	}


	public String getStayEurope() {
		return stayEurope;
	}


	public void setStayEurope(String stayEurope) {
		this.stayEurope = stayEurope;
	}


	public String getVisitCity() {
		return visitCity;
	}


	public void setVisitCity(String visitCity) {
		this.visitCity = visitCity;
	}


	public int getMyPost() {
		return myPost;
	}


	public void setMyPost(int myPost) {
		this.myPost = myPost;
	}


	public int getMyComment() {
		return myComment;
	}


	public void setMyComment(int myComment) {
		this.myComment = myComment;
	}


	@Override
	public String toString() {
		return "Stats [userId=" + userId + ", postId=" + postId + ", planId=" + planId + ", stayEurope=" + stayEurope
				+ ", visitCity=" + visitCity + ", myPost=" + myPost + ", myComment=" + myComment + "]";
	}
	
	

}
