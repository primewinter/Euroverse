package com.ksy.service.myPage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.common.Search;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Like;
import com.ksy.service.domain.Offer;
import com.ksy.service.domain.Party;
import com.ksy.service.domain.Point;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.TripSurvey;
import com.ksy.service.myPage.MyPageDao;
import com.ksy.service.user.UserDao;

@Repository("myPageDaoImpl")
public class MyPageDaoImpl implements MyPageDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MyPageDaoImpl() {
		super();
	}



	@Override
	public void addPoint(Point point) throws Exception {
		System.out.println("MyPageDao addPoint");
		sqlSession.insert("UserMapper.addPoint",point);
		System.out.println("add�Ϸ�");
	}

	@Override
	public List<Point> getPointList(Search search ,String userId) throws Exception {
		System.out.println("MyPageDao getPointList");
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId",userId);
		//map.put("boardName", boardName);
		System.out.println(map);
		
		return sqlSession.selectList("UserMapper.getPointList",map);
	}
	
	public int getPointListTotalCount(Search search ,String userId)throws Exception{
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId",userId);
		
		return sqlSession.selectOne("UserMapper.getPointListTotalCount",map);
	}
	
	
	
	public List getChoolCheckList(String userId)throws Exception{
		System.out.println("MyPageDao getChoolCheckList");
		return sqlSession.selectList("UserMapper.getChoolCheckList",userId);
	}
	
	public void updateTotalPoint(Point point)throws Exception {
		System.out.println("MyPageDao updateTotalPoint");
		sqlSession.update("UserMapper.updateTotalPoint",point);
	}
	
	
	
	
	
	
	
	
	
	
	
	public void addTripSurvey(TripSurvey tripSurvey) throws Exception{
		System.out.println("UserDaoImpl addTripSurvey");
		sqlSession.insert("UserMapper.addTripSurvey",tripSurvey);
	}
	
	
	
	public List<TripSurvey> getTripSurveyList(String userId) throws Exception{
		System.out.println("UserDaoImpl getTripSurveyList");
		return sqlSession.selectList("UserMapper.getTripSurveyList",userId);
	}
	
	public void deleteTripSurvey(String userId)throws Exception{
		sqlSession.delete("UserMapper.deleteTripSurvey",userId);
	}
	
	
	
	
	
	
	
	
	
	public List<Post> getMyPostList(Search search, String userId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		
		
		return sqlSession.selectList("UserMapper.getMyPostList",map);
	}
	
	public List<Comment> getMyCommentList(Search search, String userId){
		System.out.println("myPageDaoImpl");
		System.out.println("@@@@@@@@@@@@@@@@@@@@");
		System.out.println(search);
		System.out.println("�������̵�"+userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		
		
		return sqlSession.selectList("UserMapper.getMyCommentList",map);
	}
	
	
	
	
	/////////////////////////BookMark/////////////////////////////////////////
	public List<Like> getBookMarkList(String userId)throws Exception{
		System.out.println("myPageDaoImpl getBookMarkList()");
		
		return sqlSession.selectList("UserMapper.getBookMarkList",userId);
	}
	
	
	public Post getBookMarkPost(String postId)throws Exception{
		System.out.println("myPageDaoImpl getBookMarkPost()");
		
		
		
		return sqlSession.selectOne("UserMapper.getBookMarkPost",postId);
	}
	
	
	/////////////////////////OFFER/////////////////////////////////////////
	public List<Offer> getPlanOfferList(Search search , String userId)throws Exception{
		System.out.println("myPageDaoImpl getPlanOfferList");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		
		
		return sqlSession.selectList("UserMapper.getPlanOfferList",map);
	}
	
	public List<Offer> getPartyOfferList(Search search , String userId)throws Exception{
		System.out.println("myPageDaoImpl getPartyOfferList");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		
		return sqlSession.selectList("UserMapper.getPartyOfferList",map);
	}
	
	public int getPlanCount(String userId)throws Exception{
		
		return sqlSession.selectOne("UserMapper.getPlanCount",userId);
	}
	
	
	public void addPartyMember(Offer offer)throws Exception{
		sqlSession.insert("UserMapper.addPartyMember",offer);
		
	}
	
	public Offer getOffer(String offerId)throws Exception{
		
		return sqlSession.selectOne("UserMapper.getOffer",offerId);
	}
	
	public void updateOfferStatus(Offer offer)throws Exception{
		 sqlSession.update("UserMapper.updateOfferStatus",offer);
	}
	
	
	
	
	
	public int getMyPostListTotalCount(String userId)throws Exception{
		
		return sqlSession.selectOne("UserMapper.getMyPostListTotalCount",userId);
	}
	
	public int getMyCommentListTotalCount(String userId)throws Exception{
		
		return sqlSession.selectOne("UserMapper.getMyCommentListTotalCount",userId);
	}

	@Override
	public int getPlanOfferListTotalList(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getPlanOfferListTotalCount",userId);
	}

	@Override
	public int getPartyOfferListTotalList(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getPartyOfferListTotalCount",userId);
	}
	
	public List<Offer> getRefId(String userId)throws Exception{
		return sqlSession.selectList("UserMapper.getRefId",userId);
	}
	
	public List<Party> getPartyMember(String postId)throws Exception{
		return sqlSession.selectList("UserMapper.getPartyMember",postId);
	}
	
	public int partyCount(String userId)throws Exception{
		
		return sqlSession.selectOne("UserMapper.partyCount",userId);
	}
	
	
	
	
	////////////////////QNA///////////////////////////////////////
	public void addQna(Post post)throws Exception{
		sqlSession.insert("UserMapper.addQna" , post);
	}
	

	@Override
	public List<Post> getQnaList(Search search, String userId) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);
		return sqlSession.selectList("UserMapper.getQnaList",map);
	}

	@Override
	public int getQnaListTotalCount(String userId) {
		System.out.println("��������� ���´ٱ�??@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return sqlSession.selectOne("UserMapper.getQnaListTotalCount",userId);
	}

	@Override
	public List<Comment> getQnaCommentList(String postId) throws Exception {
		return sqlSession.selectList("UserMapper.getQnaCommentList",postId);
	}

	@Override
	public void deleteQna(String postId) throws Exception {
		sqlSession.update("UserMapper.deleteQna",postId);
	}
	
	public void updateQna(Post post )throws Exception{
		sqlSession.update("UserMapper.updateQna",post);
	}
	
	
	

}
