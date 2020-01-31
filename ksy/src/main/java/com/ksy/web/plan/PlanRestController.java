package com.ksy.web.plan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.service.domain.Offer;
import com.ksy.service.domain.Party;
import com.ksy.service.domain.Todo;
import com.ksy.service.domain.User;
import com.ksy.service.plan.PlanService;
import com.ksy.service.planSub.PlanSubService;

@RestController
@RequestMapping("/plan/*")
public class PlanRestController {
	
	@Autowired
	@Qualifier("planServiceImpl")
	private PlanService planService;
	
	@Autowired
	@Qualifier("planSubServiceImpl")
	private PlanSubService planSubService;
	
	public PlanRestController() {
		System.out.println(this.getClass());
	}
	
	
	
	@RequestMapping( value = "json/updateUserSlot/{userId}", method = RequestMethod.GET )
	public void updateUserSlot( @PathVariable String userId ) throws Exception {
		
		planService.updateUserSlot(userId);
	}
	
	
	@RequestMapping( value = "json/getPlanPartyList/{planId}", method = RequestMethod.GET )
	public List<User> getPlanPartyList( @PathVariable String planId ) throws Exception {
		
		List<User> planPartyList = planService.getPlanPartyList(planId);
		
		return planPartyList;
	}
	
	@RequestMapping( value = "json/deletePlanParty/{planId}/{userId}", method = RequestMethod.GET )
	public List<User> deletePlanParty( @PathVariable String planId, @PathVariable String userId ) throws Exception {
		
		Party party = new Party();
		party.setRefId(planId);
		party.setPartyUserId(userId);
		
		planService.deletePlanParty(party);
		
		List<User> planPartyList = planService.getPlanPartyList(planId);
		
		return planPartyList;
	}
	
	/* findUser...? Plan컨트롤러에 위치하는게 맞는가 */
	@RequestMapping( value = "json/findUser/{planId}/{userId}", method = RequestMethod.GET )
	public String findUser( @PathVariable String planId, @PathVariable String userId ) throws Exception {
		
		String findUserId = planService.findUserId(userId);
		
		Party party = new Party();
		party.setRefId(planId);
		party.setPartyUserId(userId);
		
		if( findUserId != null ) {	//DB에 등록된 회원(가입회원)
			String checkUserId = planService.checkUserFromParty(party);
			if( checkUserId != null ) {	//플래너 파티 멤버목록에 있음
				findUserId += " 님은 이미 플래너에 참여중인 멤버입니다.";
			}
			// else => 플래너에 미참여중인 회원임 :: 초대할 수 있음 !
			// return findUserId(회원아이디)
		}else {						//DB에 없음(미가입)
			findUserId = "회원을 찾을 수 없습니다.";
		}
		
		return findUserId;
	}
	
	@RequestMapping( value = "json/addOffer", method = RequestMethod.POST )
	public void addOffer( @RequestBody Offer offer ) throws Exception {
		
		planService.addOffer(offer);
	}
	
	@RequestMapping( value = "json/getTodoList/{planId}", method = RequestMethod.GET )
	public List<Todo> getTodoList( @PathVariable String planId ) throws Exception {
		
		List<Todo> todoList = planService.getTodoList(planId);
		
		return todoList;
	}
	
	/* checkTodo & updateTodoName 메소드 묶고 SQL을 다이나믹으로 만들수도 있을거같음! */
	@RequestMapping( value = "json/checkTodo/{todoCheck}/{todoId}", method = RequestMethod.GET )
	public void checkTodo( @PathVariable String todoId, @PathVariable String todoCheck ) throws Exception {
		
		Todo todo = new Todo();
		todo.setTodoId(todoId);
		todo.setTodoCheck(todoCheck);
		
		planService.checkTodo(todo);
	}
	
	@RequestMapping( value = "json/updateTodoName/{todoName}/{todoId}", method = RequestMethod.GET )
	public void updateTodoName( @PathVariable String todoName, @PathVariable String todoId ) throws Exception {
		
		Todo todo = new Todo();
		todo.setTodoName(todoName);
		todo.setTodoId(todoId);
		
		planService.updateTodoName(todo);
	}
	
	@RequestMapping( value = "json/addTodo/{todoName}/{planId}", method = RequestMethod.GET )
	public List<Todo> addTodo( @PathVariable String todoName, @PathVariable String planId ) throws Exception {
		
		Todo todo = new Todo();
		todo.setTodoName(todoName);
		todo.setPlanId(planId);
		
		planService.addTodo(todo);	//todo 등록 후
		
		List<Todo> todoList = planService.getTodoList(planId);	// 리스트 재검색해서 다시 뿌려주기!
		
		return todoList;
	}
	
	@RequestMapping( value = "json/deleteTodo/{todoId}", method = RequestMethod.GET )
	public void deleteTodo( @PathVariable String todoId ) throws Exception {
		
		planService.deleteTodo(todoId);
	}
	
	
	

}
