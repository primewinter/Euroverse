package com.ksy.service.community;

import java.util.List;

import com.ksy.common.Search;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.Report;

public interface CommunityDao {
	
	public void addPost(Post post) throws Exception ;
	
	public Post getPost(String postId) throws Exception ;

	public List<Post> getPostList(Search search, String boardName) throws Exception ;
	
	public List<Comment> getCommentList(Search search, String postId, String userId) throws Exception ;
	
	public int getPostTotalCount(Search search, String boardName) throws Exception ;
	
	public int getCommentTotalCount(Search search, String postId) throws Exception ;

	public void addComment(Comment comment) throws Exception ;
	
	public void update_Like(Comment comment) throws Exception;
	
	public void update_postLike(String postId) throws Exception;
	
	public void update_Unlike(Comment comment) throws Exception;
	
	public int select_Like(String postId) throws Exception;
	
	public Comment getComment(String cmtId) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	public void deleteComment(String cmtId) throws Exception;
	
	public void addReport(Report report) throws Exception ;
}
