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
import com.ksy.service.domain.Recomment;
import com.ksy.service.domain.Report;
import com.ksy.service.domain.Tag;

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
	
	public void addRecomment(Recomment recomment) throws Exception {
		communityDao.addRecomment(recomment);
	}
	
	public void addTag(String tagContent, String postId) throws Exception {
		communityDao.addTag(tagContent, postId);
	}
	
	public void updatePost(Post post) throws Exception {
		communityDao.updatePost(post);
	}
	
	public void updateTag(Tag tag) throws Exception {
		communityDao.updateTag(tag);
	}
	
	public void deleteTag(String postId) throws Exception {
		communityDao.deleteTag(postId);
	}
	
	public Post getPost(String postId, String userId) throws Exception {
		return communityDao.getPost(postId, userId);
	}
	
	public List<Tag> getTagList(String postId) throws Exception {
		
		List<Tag> list = communityDao.getTagList(postId);
		
		return list;
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
	
	public void updateLike(String cmtId) throws Exception {
		communityDao.updateLike(cmtId);
	}
	
	public void updatePostLike(String postId) throws Exception {
		communityDao.updatePostLike(postId);
	}
	
	public void updateUnlike(String cmtId) throws Exception {
		communityDao.updateUnlike(cmtId);
	}
	
	public int selectLike(String postId) throws Exception {
		return communityDao.selectLike(postId);
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
	
	public void dayBestReset() throws Exception {
		communityDao.dayBestReset();
	}
	
	public void weekBestReset() throws Exception {
		communityDao.weekBestReset();
	}
	
	public void monthBestReset() throws Exception {
		communityDao.monthBestReset();
	}

}
