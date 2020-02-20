package com.ksy.web.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.common.Page;
import com.ksy.common.Search;
import com.ksy.service.admin.AdminService;
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
	

}
