package com.ksy.service.myPage;

import java.util.List;

import com.ksy.common.Search;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Like;
import com.ksy.service.domain.Offer;
import com.ksy.service.domain.Point;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.TripSurvey;

public interface MyPageDao {
	public void addPoint(Point point) throws Exception;
	public List<Point> getPointList(Search search ,String userId) throws Exception;
	public int getPointListTotalCount(Search search ,String userId)throws Exception;
	public List getChoolCheckList(String userId)throws Exception;
	
	
	
	
	
	public void updateTotalPoint(Point point)throws Exception;
	
	
	
	
	
	/////////////////////survey/////////////////////////////////////////
	public void addTripSurvey(TripSurvey tripSurvey) throws Exception;
	public List<TripSurvey> getTripSurveyList(String userId) throws Exception;
	
	
	
	//////////////////////community///////////////////////////////////////////////
	public List<Post> getMyPostList(Search search, String userId)throws Exception;
	public int getMyPostListTotalCount(String userId)throws Exception;
	
	public List<Comment> getMyCommentList(Search search,String userId)throws Exception;
	public int getMyCommentListTotalCount(String userId)throws Exception;
	
	
	
	/////////////////////////BookMark/////////////////////////////////////////
	public List<Like> getBookMarkList(String userId)throws Exception;
	public Post getBookMarkPost(String postId)throws Exception;
	
	
	
	//////////////////////////////offer///////////////////////////////////////
	public List<Offer> getPlanOfferList(Search search , String userId) throws Exception;
	public List<Offer> getPartyOfferList(Search search , String userId) throws Exception;
	
	
	
}
