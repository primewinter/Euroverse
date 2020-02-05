package com.ksy.web.myPage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.service.domain.Point;
import com.ksy.service.domain.User;
import com.ksy.service.myPage.MyPageService;
import com.ksy.service.user.UserService;

@RestController
@RequestMapping("/myPage/*")

public class MyPageRestController {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService myPageService;
	
	
	public MyPageRestController() {
		System.out.println(this.getClass() + "default Constructor");
	}
	
	@RequestMapping(value="json/choolChecking")
	public Map choolChecking(HttpSession session)throws Exception{
		System.out.println("choolChecking in the RestController");

		Point point = new Point();
		User user = (User)session.getAttribute("user");
		point.setUserId(user.getUserId());
		point.setUsedType("C");
		point.setUsedPoint(100);
		Map returnMap = new HashMap();
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		List<Point> checkList = myPageService.getChoolCheckList(user.getUserId());
		SimpleDateFormat dbDate = new SimpleDateFormat("yyyy-MM-dd");
		if(checkList != null) {
			for(int i=0 ; i<checkList.size();i++) {
				if(dbDate.format(checkList.get(i).getUsedDate()).equals(date.format(today))) {
					returnMap.put("error", "error");
					return returnMap;
				}
			}
		}
		myPageService.addPoint(point);
		returnMap.put("title", "�⼮üũ��~");
		returnMap.put("start",date.format(today));
		System.out.println(returnMap);
		return returnMap;
	}
	
	
	@RequestMapping(value="json/choolCheck")
	public List choolCheck(HttpSession session)throws Exception {
		System.out.println("�⼮üũ �ع�����!!!");
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String SessionUserId = ((User)session.getAttribute("user")).getUserId();
		List<Point> choolCheckList = myPageService.getChoolCheckList(SessionUserId);
		System.out.println(choolCheckList);
		List list = new ArrayList();
		for(int i=0;i<choolCheckList.size();i++) {
			Map eventMap = new HashMap();
			eventMap.put("title", "�⼮üũ");
			String startDate = new SimpleDateFormat("yyyy-MM-dd").format(choolCheckList.get(i).getUsedDate());
			eventMap.put("start",startDate);
			list.add(eventMap);
		}
		return list;
	}
	

}
