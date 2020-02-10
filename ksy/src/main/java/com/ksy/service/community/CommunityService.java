package com.ksy.service.community;

import java.util.List;
import java.util.Map;

import com.ksy.common.Search;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.Recomment;
import com.ksy.service.domain.Report;
import com.ksy.service.domain.Tag;

public interface CommunityService {
	
	public void addPost(Post post) throws Exception ;
	
	public void addRecomment(Recomment recomment) throws Exception ;
	
	public void addTag(String tagContent, String postId) throws Exception ;
	
	public void updatePost(Post post) throws Exception ;
	
	public void updateTag(Tag tag) throws Exception ;
	
	public void deleteTag(String postId) throws Exception ;
	
	public Post getPost(String postId, String userId) throws Exception ;
	
	public List<Tag> getTagList(String postId) throws Exception ;

	public Map<String,Object> getPostList(Search search, String boardName) throws Exception;
	
	public Map<String,Object> getCommentList(Search search, String postId, String userId) throws Exception ;
	
	public void addComment(Comment comment) throws Exception ;
	
	public void updateLike(String cmtId) throws Exception;
	
	public void updatePostLike(String postId) throws Exception;
	
	public void updateUnlike(String cmtId) throws Exception;
	
	public int selectLike(String postId) throws Exception;

	public Comment getComment(String cmtId) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	public void deleteComment(String cmtId) throws Exception;
	
	public void addReport(Report report) throws Exception ;
	
	public void dayBestReset() throws Exception ;
	
	public void weekBestReset() throws Exception ;
	
	public void monthBestReset() throws Exception ;

}
