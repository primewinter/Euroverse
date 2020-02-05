package com.ksy.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.service.community.CommunityDao;
import com.ksy.common.Search;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.Report;

@Repository("communityDaoImpl")
public class CommunityDaoImpl implements CommunityDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public CommunityDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public void addPost(Post post) throws Exception {
		sqlSession.insert("CommunityMapper.addPost", post);
	}

	public Post getPost(String postId) throws Exception {
		sqlSession.update("CommunityMapper.updateViews", postId);
		return sqlSession.selectOne("CommunityMapper.getPost", postId);
	}
	
	public List<Post> getPostList(Search search, String boardName) throws Exception {
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("boardName", boardName);
		
		return sqlSession.selectList("CommunityMapper.getPostList", map);
	}
	
	public List<Comment> getCommentList(Search search, String postId, String userId) throws Exception {
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("search", search);
		map.put("postId", postId);
		
		return sqlSession.selectList("CommunityMapper.getCommentList", map);
	}

	public int getPostTotalCount(Search search, String boardName) throws Exception {
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("boardName", boardName);
		
		return sqlSession.selectOne("CommunityMapper.getPostTotalCount", map);
	}
	
	public int getCommentTotalCount(Search search, String postId) throws Exception {
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("postId", postId);
		
		return sqlSession.selectOne("CommunityMapper.getCommentTotalCount", map);
	}
	
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("CommunityMapper.addComment", comment);
	}
	
	public void update_Like(Comment comment) throws Exception {
		sqlSession.update("CommunityMapper.update_Like", comment);
	}
	
	public void update_postLike(String postId) throws Exception {
		sqlSession.update("CommunityMapper.update_postLike", postId);
	}
	
	public void update_Unlike(Comment comment) throws Exception {
		sqlSession.update("CommunityMapper.update_Unlike", comment);
	}
	
	public int select_Like(String postId) throws Exception {
		return sqlSession.selectOne("CommunityMapper.select_Like", postId);
	}
	
	public Comment getComment(String cmtId) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getComment", cmtId);
	}
	
	public void updateComment(Comment comment) throws Exception {
		sqlSession.update("CommunityMapper.updateComment", comment);
	}
	
	public void deleteComment(String cmtId) throws Exception {
		sqlSession.update("CommunityMapper.deleteComment", cmtId);
	}
	
	public void addReport(Report report) throws Exception {
		sqlSession.insert("CommunityMapper.addReport", report);
	}

}
