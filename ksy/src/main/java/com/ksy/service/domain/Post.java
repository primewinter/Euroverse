package com.ksy.service.domain;

import java.sql.Timestamp;

public class Post {
	
	private String boardName; //board_name
	private String postId; //post_id
	private String postGrade; //post_grade
	private String postNo; //post_no
	private String postContent; //post_content
	private String postTitle; //post_title
	private String postWriterId; //writer_id
	private Timestamp postDate; //post_date
	private int accCount; 
	private int accPerson; //acc_person 
	private Timestamp accStartDate; //acc_start_date
	private Timestamp accEcdDate; //acc_end_date
	private int postLikeCount; 
	private int views; //views
	private int comments; 
	private String blocked; //blocked
	private String tags; //tags
	private String postLikeFlag; 
	private String deleted; //deleted
	private String planId; //plan_id;
	private String qnaFirstCate; //qna_first_cate
	private String qnaSecondCate; //qna_second_cate
	
	public Post() {
		
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getPostGrade() {
		return postGrade;
	}

	public void setPostGrade(String postGrade) {
		this.postGrade = postGrade;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostWriterId() {
		return postWriterId;
	}

	public void setPostWriterId(String postWriterId) {
		this.postWriterId = postWriterId;
	}

	public Timestamp getPostDate() {
		return postDate;
	}

	public void setPostDate(Timestamp postDate) {
		this.postDate = postDate;
	}

	public int getAccCount() {
		return accCount;
	}

	public void setAccCount(int accCount) {
		this.accCount = accCount;
	}

	public int getAccPerson() {
		return accPerson;
	}

	public void setAccPerson(int accPerson) {
		this.accPerson = accPerson;
	}

	public Timestamp getAccStartDate() {
		return accStartDate;
	}

	public void setAccStartDate(Timestamp accStartDate) {
		this.accStartDate = accStartDate;
	}

	public Timestamp getAccEcdDate() {
		return accEcdDate;
	}

	public void setAccEcdDate(Timestamp accEcdDate) {
		this.accEcdDate = accEcdDate;
	}

	public int getPostLikeCount() {
		return postLikeCount;
	}

	public void setPostLikeCount(int postLikeCount) {
		this.postLikeCount = postLikeCount;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	public String getBlocked() {
		return blocked;
	}

	public void setBlocked(String blocked) {
		this.blocked = blocked;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getPostLikeFlag() {
		return postLikeFlag;
	}

	public void setPostLikeFlag(String postLikeFlag) {
		this.postLikeFlag = postLikeFlag;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public String getQnaFirstCate() {
		return qnaFirstCate;
	}

	public void setQnaFirstCate(String qnaFirstCate) {
		this.qnaFirstCate = qnaFirstCate;
	}

	public String getQnaSecondCate() {
		return qnaSecondCate;
	}

	public void setQnaSecondCate(String qnaSecondCate) {
		this.qnaSecondCate = qnaSecondCate;
	}

	@Override
	public String toString() {
		return "Post [boardName=" + boardName + ", postId=" + postId + ", postGrade=" + postGrade + ", postNo=" + postNo
				+ ", postContent=" + postContent + ", postTitle=" + postTitle + ", postWriterId=" + postWriterId
				+ ", postDate=" + postDate + ", accCount=" + accCount + ", accPerson=" + accPerson + ", accStartDate="
				+ accStartDate + ", accEcdDate=" + accEcdDate + ", postLikeCount=" + postLikeCount + ", views=" + views
				+ ", comments=" + comments + ", blocked=" + blocked + ", tags=" + tags + ", postLikeFlag="
				+ postLikeFlag + ", deleted=" + deleted + ", planId=" + planId + ", qnaFirstCate=" + qnaFirstCate
				+ ", qnaSecondCate=" + qnaSecondCate + "]";
	}
	
}