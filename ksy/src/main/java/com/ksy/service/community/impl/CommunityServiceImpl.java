package com.ksy.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ksy.common.Search;
import com.ksy.service.community.CommunityDao;
import com.ksy.service.community.CommunityService;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.Report;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService{
	
	///Field
	@Autowired
	@Qualifier("communityDaoImpl")
	private CommunityDao communityDao;
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}
		
	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public void addPost(Post post) throws Exception {
		communityDao.addPost(post);
	}
	
	public Post getPost(String postId) throws Exception {
		return communityDao.getPost(postId);
	}

	public Map<String , Object > getPostList(Search search, String boardName) throws Exception {
		
		List<Post> list= communityDao.getPostList(search, boardName);
		int totalCount = communityDao.getPostTotalCount(search, boardName);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		System.out.println(list);
		
		return map;
	}
	
	public Map<String , Object > getCommentList(Search search, String postId, String userId) throws Exception {
		
		List<Comment> list= communityDao.getCommentList(search, postId, userId);
		int totalCount = communityDao.getCommentTotalCount(search, postId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		System.out.println(list);
		
		return map;
	}
	
	public void addComment(Comment comment) throws Exception {
		communityDao.addComment(comment);
	}
	
	public void update_Like(Comment comment) throws Exception {
		communityDao.update_Like(comment);
	}
	
	public void update_postLike(String postId) throws Exception {
		communityDao.update_postLike(postId);
	}
	
	public void update_Unlike(Comment comment) throws Exception {
		communityDao.update_Unlike(comment);
	}
	
	public int select_Like(String postId) throws Exception {
		return communityDao.select_Like(postId);
	}
	
	public Comment getComment(String cmtId) throws Exception {
		return communityDao.getComment(cmtId);
	}
	
	public void updateComment(Comment comment) throws Exception {
		communityDao.updateComment(comment);
	}
	
	public void deleteComment(String cmtId) throws Exception {
		communityDao.deleteComment(cmtId);
	}
	
	public void addReport(Report report) throws Exception {
		communityDao.addReport(report);
	}

}
