package com.ksy.web.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksy.common.Page;
import com.ksy.common.Search;
import com.ksy.service.admin.AdminService;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.User;
import com.ksy.service.user.UserService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminservice;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	
	public AdminController() {

		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['postPageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['postPageSize']}")
	int pageSize;
	
	@RequestMapping(value="getUserList")
	public String getUserList(@ModelAttribute("search") Search search, Model model, HttpSession session) throws Exception {
		
		System.out.println(this.getClass()+"getUserList");
		
		
		User user = new User();
		
//		������ admin�� �ƴҰ�� ������ ��������
		user= (User)session.getAttribute("user");
		if(!user.getUserId().equals("admin")) {
			return "redirect:/";
		}
		
		System.out.println("getAttribute ==>"+session.getAttribute("user"));
		
		
		
		//���� �������� null�� ��� ����Ʈ 1�� ����
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//map��  getUserList ���
		Map<String, Object> map = adminservice.getUserList(search);
		
		//�������� �������� ����������� ���������� ã�ƿ��� �۾� 
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
				pageUnit, pageSize);
		System.out.println(resultPage);
		System.out.println("map.get ==>"+map.get("list"));
		
		//view(jsp)�� ����������
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search",search);
		
		System.out.println("model ==>"+model);
		
		return "forward:/view/admin/getUserList.jsp";
		
	}// end of getUserList
	
	
	@RequestMapping(value="getUser", method=RequestMethod.GET)
	public String getUser(@RequestParam("userId") String userId, Model model) throws Exception {
		
		System.out.println(this.getClass()+"getUser");
		
		User user = new User();
		user = userService.getUser(userId);
		
		//view(jsp)�� ����������
		model.addAttribute("user", user);
		
		System.out.println("model ==>"+model);
		
		return "forward:/view/user/getUser.jsp";
		
	}// end of getUser
	
	
	@RequestMapping(value="getAdminQnAList", method=RequestMethod.GET)
	public String getAdminQnAList(@ModelAttribute("search") Search search, Model model, HttpSession session ) throws Exception {
		
		System.out.println(this.getClass()+"getAdminQnaList");
		
		User user = new User();
		
//		������ admin�� �ƴҰ�� ������ ��������
		user= (User)session.getAttribute("user");
		if(!user.getUserId().equals("admin")) {
			return "redirect:/";
		}
		
		//���� �������� null�� ��� ����Ʈ 1�� ����
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//map��  getUserList ���
		Map<String, Object> map = adminservice.getAdminQnAList(search);
		
		//�������� �������� ����������� ���������� ã�ƿ��� �۾� 
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
				pageUnit, pageSize);
		System.out.println(resultPage);
		System.out.println("map.get ==>"+map.get("list"));
		
		//view(jsp)�� ����������
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search",search);
		
		System.out.println("model ==>"+model);
		
		return "forward:/view/admin/adminQnaList.jsp";
		
	}// end of getUser
	
	@RequestMapping(value="addQnaComment", method=RequestMethod.GET)
	public String addQnaComment(@ModelAttribute("comment") Comment comment, Model model) {
		
		
		
		return "forward:/view/admin/adminQnaList.jsp";
	}
	
	@RequestMapping(value="updateQnaGrade", method=RequestMethod.GET)
	public String updateQnaGrade(@ModelAttribute("comment") Comment comment, Model model) {
		
		
		
		return "forward:/view/admin/adminQnaList.jsp";
	}

	@RequestMapping(value="deleteQnaComm", method=RequestMethod.GET)
	public String deleteQnaComm(@ModelAttribute("comment") Comment comment, Model model) {
		
		
		
		return "forward:/view/admin/adminQnaList.jsp";
	}
	
	@RequestMapping(value="getQnaComment", method=RequestMethod.GET)
	public String getQnaComment(@ModelAttribute("comment") Comment comment, Model model) {
		
		
		
		return "forward:/view/admin/adminQnaList.jsp";
	}
	
	
}//end of class
