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
import com.ksy.service.domain.Tag;

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
		if( post.getBoardName().equals("D")) {
			sqlSession.insert("CommunityMapper.addAccFindPost", post);
		}else {
			sqlSession.insert("CommunityMapper.addPost", post);
		}
	}
	
	public void addTag(String tagContent, String postId) throws Exception {
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("tagContent", tagContent);
		map.put("postId", postId);
		
		sqlSession.insert("CommunityMapper.addTag", map);
	}
	
	public void updatePost(Post post) throws Exception {
		sqlSession.update("CommunityMapper.updatePost", post);
	}
	
	public void updateTag(Tag tag) throws Exception {
		sqlSession.update("CommunityMapper.updateTag", tag);
	}

	public void deleteTag(String postId) throws Exception {
		sqlSession.delete("CommunityMapper.deleteTag", postId);
	}
	
	public Post getPost(String postId, String userId) throws Exception {
		sqlSession.update("CommunityMapper.updateViews", postId);
		sqlSession.update("CommunityMapper.updateBestPost", postId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("postId", postId);
		map.put("userId", userId);
		
		return sqlSession.selectOne("CommunityMapper.getPost", map);
	}
	
	public List<Tag> getTagList(String postId) throws Exception {
		return sqlSession.selectList("CommunityMapper.getTagList", postId);
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
	
	public List<Comment> rcmtNum(String postId) throws Exception {
		return sqlSession.selectList("CommunityMapper.rcmtNum", postId);
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
	
	public void updateLike(String cmtId) throws Exception {
		sqlSession.update("CommunityMapper.updateLike", cmtId);
	}
	
	public void updatePostLike(String postId) throws Exception {
		sqlSession.update("CommunityMapper.updatePostLike", postId);
	}
	
	public void updateUnlike(String cmtId) throws Exception {
		sqlSession.update("CommunityMapper.updateUnlike", cmtId);
	}
	
	public int selectLike(String postId) throws Exception {
		return sqlSession.selectOne("CommunityMapper.selectLike", postId);
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
		if(report.getReportTarget().equals("P")) {
			sqlSession.update("CommunityMapper.postBlocked", report.getRefId());
		}else if(report.getReportTarget().equals("C")) {
			sqlSession.update("CommunityMapper.cmtBlocked", report.getRefId());	
		}
		sqlSession.insert("CommunityMapper.addReport", report);
	}
	
	public void dayBestReset() throws Exception {
		sqlSession.update("CommunityMapper.dayBestReset");
	}
	
	public void weekBestReset() throws Exception {
		sqlSession.update("CommunityMapper.weekBestReset");
	}
	
	public void monthBestReset() throws Exception {
		sqlSession.update("CommunityMapper.monthBestReset");
	}

}
