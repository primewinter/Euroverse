package com.ksy.service.like;

import com.ksy.service.domain.Like;

public interface LikeService {
	
	public void like_check(Like like) throws Exception ;
		
	public void like_check_cancel(Like like) throws Exception ;

	public int countByLike(Like like) throws Exception ;
		
	public Like getLike(Like like) throws Exception ;
	
	public void addLike(Like like) throws Exception ;
}