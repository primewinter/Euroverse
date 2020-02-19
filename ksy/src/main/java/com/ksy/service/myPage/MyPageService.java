package com.ksy.service.myPage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ksy.common.Search;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Like;
import com.ksy.service.domain.Offer;
import com.ksy.service.domain.Point;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.TripSurvey;

public interface MyPageService {
	
	public void addPoint(Point point) throws Exception;
	public Map<String , Object> getPointList(Search search ,String userId) throws Exception;
	public List getChoolCheckList(String userId)throws Exception;
	
	public void updateTotalPoint(Point point)throws Exception;

	
	
	
	
	public void addTripSurvey(TripSurvey tripSurvey) throws Exception;
	public List<TripSurvey> getTripSurveyList(String userId) throws Exception;
	
	
	
	
	
	
	public Map<String , Object> getMyPostList(Search search, String userId)throws Exception;
	public Map<String , Object> getMyCommentList(Search search , String userId)throws Exception;
	
	
	
	
	/////////////////////////BookMark/////////////////////////////////////////
	public List<Post> getBookMarkList(String userId)throws Exception;
	
	
	
	
	////////////////////////Offer//////////////////////////////////////////
	public Map<String , Object> getOfferList(Search search , String userId) throws Exception;

	public int getPlanCount(String userId)throws Exception;
	public void addPlanPartyMember(Offer offer)throws Exception;
	
	public Offer getOffer(String offerId)throws Exception;
	
	public void updateOfferStatus(Offer offer) throws Exception;
	
	
	
	////////////////////////QNA////////////////////////////////////////
	public void addQna(Post post)throws Exception;
	public Map<String , Object> getQnaList(Search search ,String userId)throws Exception;
	
	public List<Comment> getQnaCommentList(String postId)throws Exception;
	
	public void deleteQna(String postId)throws Exception;
	
	public void updateQna(Post post)throws Exception;
	
	
}
