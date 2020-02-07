package com.ksy.service.domain;

import java.sql.Timestamp;

public class Comment {
	
	private String postId; //post_id
	private String cmtId; //cmt_id
	private String cmtWriterId; //writer_id
	private String nickName;
	private String cmtContent; //cmt_content
	private Timestamp cmtDate; //cmt_date
	private String blocked; //blocked
	private String cmtLikeFlag;
	private int cmtLikeCount; 
	private String secret; //secret
	private String cmtImg;  
	private String deleted; //deleted
	private String postWriterId;
	
	public Comment() {
		
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getCmtId() {
		return cmtId;
	}

	public void setCmtId(String cmtId) {
		this.cmtId = cmtId;
	}

	public String getCmtWriterId() {
		return cmtWriterId;
	}

	public void setCmtWriterId(String cmtWriterId) {
		this.cmtWriterId = cmtWriterId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getCmtContent() {
		return cmtContent;
	}

	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}

	public Timestamp getCmtDate() {
		return cmtDate;
	}

	public void setCmtDate(Timestamp cmtDate) {
		this.cmtDate = cmtDate;
	}

	public String getBlocked() {
		return blocked;
	}

	public void setBlocked(String blocked) {
		this.blocked = blocked;
	}

	public String getCmtLikeFlag() {
		
		if(cmtLikeFlag == null || cmtLikeFlag.equals("")) {
			return "F";
		}else if(cmtLikeFlag == "F") {
			return "F";
		}else if(cmtLikeFlag == "T") {
			return "T";
		}
		
		return cmtLikeFlag;
	}

	public void setCmtLikeFlag(String cmtLikeFlag) {
		this.cmtLikeFlag = cmtLikeFlag;
	}

	public int getCmtLikeCount() {
		return cmtLikeCount;
	}

	public void setCmtLikeCount(int cmtLikeCount) {
		this.cmtLikeCount = cmtLikeCount;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getCmtImg() {
		return cmtImg;
	}

	public void setCmtImg(String cmtImg) {
		this.cmtImg = cmtImg;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getPostWriterId() {
		return postWriterId;
	}

	public void setPostWriterId(String postWriterId) {
		this.postWriterId = postWriterId;
	}

	@Override
	public String toString() {
		return "Comment [postId=" + postId + ", cmtId=" + cmtId + ", cmtWriterId=" + cmtWriterId + ", nickName="
				+ nickName + ", cmtContent=" + cmtContent + ", cmtDate=" + cmtDate + ", blocked=" + blocked
				+ ", cmtLikeFlag=" + cmtLikeFlag + ", cmtLikeCount=" + cmtLikeCount + ", secret=" + secret + ", cmtImg="
				+ cmtImg + ", deleted=" + deleted + ", postWriterId=" + postWriterId + "]";
	}
}
