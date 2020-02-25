package com.ksy.web.admin;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.common.Page;
import com.ksy.common.Search;
import com.ksy.service.admin.AdminService;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.User;

@RestController
@RequestMapping("/admin/*")
public class AdminRestController {

	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	
	public AdminRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['postPageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['postPageSize']}")
	int pageSize;
	
	//������ ����� �ҷ���
	@RequestMapping(value="json/getUserList", method = RequestMethod.POST)
	public Map<String, Object> getUserList(@RequestBody Search search ) throws Exception {
		
		System.out.println("\n\n restController getUserList");
		
		User user = new User();
//		Search search = new Search();
		//���� �������� �׻� 1�� ����
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//map��  getUserList ���
		Map<String, Object> map = adminService.getUserList(search);
		
		//�������� �������� ����������� ���������� ã�ƿ��� �۾� 
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
				pageUnit, pageSize);
		System.out.println(resultPage);
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		System.out.println("map ����� ==>"+map);
		
		
		return map;
	}
	
	// �����ڰ� �亯�� �����
	@RequestMapping(value="json/addQnaComment", method = RequestMethod.POST)
	public Map<String,Object> addQnaComment(@RequestBody Comment comment) throws Exception {
		
		System.out.println("AdminComtroller addQnaComment");
		
		System.out.println("comment==>"+comment);
		
		adminService.addQnaComment(comment);
		adminService.updateQnaGrade(comment.getPostId());
		
		Map<String, Object> map = adminService.getQnaCommentList(comment.getPostId());
		
		System.out.println("AdminController addQnaComment END");
		
		return map;
	}
	
	//�����ڰ� �Է��� �亯�� �ҷ���
	@RequestMapping(value="json/getQnaCommentList/{postId}", method = RequestMethod.GET)
	public Map<String,Object> getQnaCommentList(@PathVariable String postId) throws Exception {
		
		System.out.println("AdminComtroller getQnaComment");
		
		System.out.println("postId==>"+postId);
		
		Map<String,Object> map = adminService.getQnaCommentList(postId);
		
		System.out.println("map ����� ==>"+map);
		
		return map;
	}
	
	// �����ڰ� �亯�� ������ �÷���ó�� deleted = "T" ���ÿ� post ������Ʈ 
	@RequestMapping(value="json/deleteQnaComm", method = RequestMethod.POST)
	public Map<String,Object> deleteQnaComm(@RequestBody Comment comment) throws Exception {
		
		System.out.println("AdminComtroller addQnaComment");
		
		adminService.deleteQnaComm(comment.getCmtId());
		adminService.backUpQnaGrade(comment.getPostId());
		
		Map<String, Object> map = adminService.getQnaCommentList(comment.getPostId());
		
		System.out.println("comment==>"+comment);
		
		return map;
	}
	

}
