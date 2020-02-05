package com.ksy.service.like.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ksy.service.domain.Like;
import com.ksy.service.like.LikeDao;
import com.ksy.service.like.LikeService;

//==> ȸ������ ���� ����
@Service("likeServiceImpl")
public class LikeServiceImpl implements LikeService{
	
	///Field
	@Autowired
	@Qualifier("likeDaoImpl")
	private LikeDao likeDao;
	public void setLikeprodDao(LikeDao likeDao) {
		this.likeDao = likeDao;
	}
	
	///Constructor
	public LikeServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void like_check(Like like) throws Exception {
		likeDao.like_check(like);
	}
		
	public void like_check_cancel(Like like) throws Exception {
		likeDao.like_check_cancel(like);
	}

	public int countByLike(Like like) throws Exception {
		return likeDao.countByLike(like);
	}
	
	public Like getLike(Like like) throws Exception {
		return likeDao.getLike(like);
	}
	
	public void addLike(Like like) throws Exception {
		likeDao.addLike(like);
	}
}