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
	
	/* findUser...? Plan��Ʈ�ѷ��� ��ġ�ϴ°� �´°� */
	@RequestMapping( value = "json/findUser/{planId}/{userId}", method = RequestMethod.GET )
	public String findUser( @PathVariable String planId, @PathVariable String userId ) throws Exception {
		
		String findUserId = planService.findUserId(userId);
		
		Party party = new Party();
		party.setRefId(planId);
		party.setPartyUserId(userId);
		
		if( findUserId != null ) {	//DB�� ��ϵ� ȸ��(����ȸ��)
			String checkUserId = planService.checkUserFromParty(party);
			if( checkUserId != null ) {	//�÷��� ��Ƽ �����Ͽ� ����
				findUserId += " ���� �̹� �÷��ʿ� �������� ����Դϴ�.";
			}
			// else => �÷��ʿ� ���������� ȸ���� :: �ʴ��� �� ���� !
			// return findUserId(ȸ�����̵�)
		}else {						//DB�� ����(�̰���)
			findUserId = "ȸ���� ã�� �� �����ϴ�.";
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
	
	/* checkTodo & updateTodoName �޼ҵ� ���� SQL�� ���̳������� ������� �����Ű���! */
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
		
		planService.addTodo(todo);	//todo ��� ��
		
		List<Todo> todoList = planService.getTodoList(planId);	// ����Ʈ ��˻��ؼ� �ٽ� �ѷ��ֱ�!
		
		return todoList;
	}
	
	@RequestMapping( value = "json/deleteTodo/{todoId}", method = RequestMethod.GET )
	public void deleteTodo( @PathVariable String todoId ) throws Exception {
		
		planService.deleteTodo(todoId);
	}
	
	
	

}
