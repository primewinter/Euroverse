package com.ksy.web.user;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.service.domain.Point;
import com.ksy.service.domain.User;
import com.ksy.service.myPage.MyPageService;
import com.ksy.service.user.UserService;


@RestController
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService myPageService;
	
	
	public UserRestController() {
		System.out.println(this.getClass() + "default Constructor");
	}

	
	
	@RequestMapping(value = "json/test")
	public Map test(@RequestBody Map jsonMap) throws JsonGenerationException, JsonMappingException, IOException {
		System.out.println("레스트 테스트용 매핑");
		System.out.println(jsonMap);
		
		
		ObjectMapper objMap = new ObjectMapper();
		String mapString = objMap.writeValueAsString(jsonMap);
		JSONObject jsonObj = (JSONObject)JSONValue.parse(mapString);
		System.out.println(jsonObj);
		
		
		return null;
	}
	
	
	@RequestMapping(value = "json/login" , method = RequestMethod.POST )
	public Map login(@RequestBody User user , HttpSession session )throws Exception {
//		System.out.println("로그인 레스트 컨트롤러!");
		System.out.println("가지고 온 정보는~");
		System.out.println(user.getUserId());
		System.out.println(user.getPwd());
		
		User dbUser = userService.getUser(user.getUserId());
		
		Map<String, String> returnMap = new HashMap<String, String>();
		
		if ( dbUser == null ) { 
			returnMap.put("result", "errorId");
		}else { 
			if(!dbUser.getPwd().equals(user.getPwd())) {
				returnMap.put("result", "errorPwd");
			}
			else {
				session.setAttribute("user", dbUser);
				returnMap.put("result", "ok");
			}
		}
		return returnMap;
	}
	
	
	
	
}
