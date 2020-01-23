package com.ksy.service.domain;

import java.sql.Timestamp;

public class Report {

	private String reportId;//report_id
	private String reportUserId;//report_user_id
	private String refId;//ref_id
	private String reportTarget;//report_target �Խñ�(P) , ���(C) , ����(R)
	private String reportReason;//report_reason �弳(F) , ������(A) , �������(R)   
	private String reportContent;//report_content
	private Timestamp reportDate;//report_date 
	
	
	
	public Report() {
		
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
				+ reportContent + ", reportDate=" + reportDate + "]";
	}
	
	
	
	
	
	
}
