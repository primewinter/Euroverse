package com.ksy.service.plan;

import java.util.List;

import com.ksy.service.domain.Offer;
import com.ksy.service.domain.Party;
import com.ksy.service.domain.Plan;
import com.ksy.service.domain.Todo;
import com.ksy.service.domain.User;

public interface PlanDao {
	
	public List<Plan> getPlanList(String userId) throws Exception;
	
	public Plan getPlan(String planId) throws Exception;
	
	
	public List<Todo> getTodoList(String planId) throws Exception;
	
	public List<User> getPlanPartyList(String planId) throws Exception;
	
	
	public void addPlan(Plan plan) throws Exception;
	
	public void updatePlan(Plan plan) throws Exception;
	
	public void updatePlanStatus(Plan plan) throws Exception;
	
	public void deletePlan(String planId) throws Exception;
	
	public void deletePlanParty(Party party) throws Exception;
	
	
	public String checkUserFromParty(Party party) throws Exception;
	
	public void addOffer(Offer offer) throws Exception;

	
	public void checkTodo(Todo todo) throws Exception;
	
	public void addTodo(Todo todo) throws Exception;
	
	public void updateTodoName(Todo todo) throws Exception;
	
	public void deleteTodo(String todoId) throws Exception;
	
	
	
	//User Service에 가야하는 메소드.... 테스트용으로 여기서 만들어 씀 
	public void updateUserSlot(String userId) throws Exception;
		
	public String findUserId(String userId) throws Exception;

	
}
