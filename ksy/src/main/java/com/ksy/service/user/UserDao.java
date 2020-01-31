package com.ksy.service.user;

import java.util.List;

import com.ksy.service.domain.User;

public interface UserDao {
	
public void addUser(User user) throws Exception;
	
	public void updateUser(User user) throws Exception;
	public void updatePwd(User user)throws Exception;
	public void updateRole(String userId)throws Exception;
	public void unRegister(String userId)throws Exception;
	
	public User getUser(String userId) throws Exception ;
	
	
	public List<String> getUserIdList(User user) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////플래너에서 사용하는 메소드////////////////////////////////////
//	public void updateUserSlot(String userId) throws Exception;   <<이건 마이페이지로 보내기
//	
//	public String findUserId(String userId) throws Exception;
	/////////////////////////////////////////////////////////////////

}
