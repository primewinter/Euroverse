package com.ksy.service.domain;

import java.sql.Timestamp;

public class Recomment {
	
	private String postId; //post_id
	private String rcmtId; //cmt_id
	private String parentCmtId; //parent_cmt_id
	private String rcmtWriterId; //writer_id
	private String nickName;
	private String rcmtContent; //cmt_content
	private Timestamp rcmtDate; //cmt_date
	private String blocked; //blocked
	private String rcmtLikeFlag; 
	private int rcmtLikeCount; //cmt_like_count
	private String secret; //secret
	private String rcmtImg; 
	private String deleted; //deleted
	
	public Recomment() {
		
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getRcmtId() {
		return rcmtId;
	}

	public void setRcmtId(String rcmtId) {
		this.rcmtId = rcmtId;
	}

	public String getParentCmtId() {
		return parentCmtId;
	}

	public void setParentCmtId(String parentCmtId) {
		this.parentCmtId = parentCmtId;
	}

	public String getRcmtWriterId() {
		return rcmtWriterId;
	}

	public void setRcmtWriterId(String rcmtWriterId) {
		this.rcmtWriterId = rcmtWriterId;
	}

	public String getRcmtContent() {
		return rcmtContent;
	}

	public void setRcmtContent(String rcmtContent) {
		this.rcmtContent = rcmtContent;
	}

	public Timestamp getRcmtDate() {
		return rcmtDate;
	}

	public void setRcmtDate(Timestamp rcmtDate) {
		this.rcmtDate = rcmtDate;
	}

	public String getBlocked() {
		return blocked;
	}

	public void setBlocked(String blocked) {
		this.blocked = blocked;
	}
	
	public String getRcmtLikeFlag() {
		return rcmtLikeFlag;
	}

	public void setRcmtLikeFlag(String rcmtLikeFlag) {
		this.rcmtLikeFlag = rcmtLikeFlag;
	}

	public int getRcmtLikeCount() {
		return rcmtLikeCount;
	}

	public void setRcmtLikeCount(int rcmtLikeCount) {
		this.rcmtLikeCount = rcmtLikeCount;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getRcmtImg() {
		return rcmtImg;
	}

	public void setRcmtImg(String rcmtImg) {
		this.rcmtImg = rcmtImg;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Recomment [postId=" + postId + ", rcmtId=" + rcmtId + ", parentCmtId=" + parentCmtId + ", rcmtWriterId="
				+ rcmtWriterId + ", nickName=" + nickName + ", rcmtContent=" + rcmtContent + ", rcmtDate=" + rcmtDate
				+ ", blocked=" + blocked + ", rcmtLikeFlag=" + rcmtLikeFlag + ", rcmtLikeCount=" + rcmtLikeCount
				+ ", secret=" + secret + ", rcmtImg=" + rcmtImg + ", deleted=" + deleted + "]";
	}

}
