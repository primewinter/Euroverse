package com.ksy.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ksy.common.Search;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Report;
import com.ksy.service.domain.User;

public interface AdminDao {

	//�� ������ List�� page Data�� �������� ���� �޼���
	public List<User> getUserList(Search search) throws Exception;
	
	// page�� �� �������� �� �������� ���� �޼���  �� page���� �������� int �� ����
	public int getTotalCount(Search search) throws Exception;
	 
	public void updatePostReport(String postId) throws Exception;
	
	public void updateCommReport(String commId) throws Exception;
	
	//getQnaCommentList �� select*from ���� ������ �ۼ�
	public List<Comment> getQnaCommList(String postId) throws Exception;
	
}
