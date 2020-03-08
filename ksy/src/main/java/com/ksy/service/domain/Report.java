package com.ksy.service.domain;

import java.sql.Timestamp;

public class Report {

	private String reportId;//report_id
	private String reportUserId;//report_user_id
	private String refId;//ref_id
	private String reportTarget;//report_target 게시글(P) , 댓글(C) , 대댓글(R)
	private String reportReason;//report_reason 욕설(F) , 음란물(A) , 허위사실(R)   
	private String reportContent;//report_content
	private Timestamp reportDate;//report_date 
	private String blocked;//신고된 게시글 blocked false 처리
	private String postTitle;//신고된 게시글제목
	private String cmtContent;//신고된 댓글내용
	private int cmtCount;// 게시글에 댓글개수
	
	
	
	public Report() {
		
	}
	
	

	public String getBlocked() {
		return blocked;
	}



	public void setBlocked(String blocked) {
		this.blocked = blocked;
	}



	public String getPostTitle() {
		return postTitle;
	}



	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}



	public String getCmtContent() {
		return cmtContent;
	}



	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}



	public int getCmtCount() {
		return cmtCount;
	}



	public void setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
	}



	public String getReportId() {
		return reportId;
	}



	public void setReportId(String reportId) {
		this.reportId = reportId;
	}



	public String getReportUserId() {
		return reportUserId;
	}



	public void setReportUserId(String reportUserId) {
		this.reportUserId = reportUserId;
	}



	public String getRefId() {
		return refId;
	}



	public void setRefId(String refId) {
		this.refId = refId;
	}



	public String getReportTarget() {
		return reportTarget;
	}



	public void setReportTarget(String reportTarget) {
		this.reportTarget = reportTarget;
	}



	public String getReportReason() {
		return reportReason;
	}



	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}



	public String getReportContent() {
		return reportContent;
	}



	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}



	public Timestamp getReportDate() {
		return reportDate;
	}



	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}



	@Override
	public String toString() {
		return "Report [reportId=" + reportId + ", reportUserId=" + reportUserId + ", refId=" + refId
				+ ", reportTarget=" + reportTarget + ", reportReason=" + reportReason + ", reportContent="
				+ reportContent + ", reportDate=" + reportDate + ", blocked=" + blocked + ", postTitle=" + postTitle
				+ ", cmtContent=" + cmtContent + ", cmtCount=" + cmtCount + "]";
	}
	
	
	
	
	
	
}
