package com.ksy.service.domain;

public class Memo {
	
	private String planId;			//plan_id
	private String memoId;			//memo_id
	private String memoDetail;		//memo_detail
	private String memoRegDate;		//memo_reg_date	:: SYSDATE
	private String memoRegUser;		//memo_reg_user 
	
	
	public Memo() {
		super();
	}


	public String getPlanId() {
		return planId;
	}
	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public String getMemoId() {
		return memoId;
	}
	public void setMemoId(String memoId) {
		this.memoId = memoId;
	}

	public String getMemoDetail() {
		return memoDetail;
	}
	public void setMemoDetail(String memoDetail) {
		this.memoDetail = memoDetail;
	}

	public String getMemoRegDate() {
		return memoRegDate;
	}
	public void setMemoRegDate(String memoRegDate) {
		this.memoRegDate = memoRegDate;
	}

	public String getMemoRegUser() {
		return memoRegUser;
	}
	public void setMemoRegUser(String memoRegUser) {
		this.memoRegUser = memoRegUser;
	}


	@Override
	public String toString() {
		return "Memo [planId=" + planId + ", memoId=" + memoId + ", memoDetail=" + memoDetail + ", memoRegDate="
				+ memoRegDate + ", memoRegUser=" + memoRegUser + "]";
	}
	
	

}
