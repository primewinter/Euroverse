package com.ksy.web.user;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
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
import org.codehaus.jackson.type.TypeReference;
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

	@RequestMapping(value = "json/login" , method = RequestMethod.POST )
	public Map login(@RequestBody User user , HttpSession session )throws Exception {
//		System.out.println("�α��� ����Ʈ ��Ʈ�ѷ�!");
		System.out.println("������ �� ������~");
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
	
	@RequestMapping(value = "json/checkDuplicate")
	public Map Checkduplicate(@RequestBody Map jsonMap) throws Exception {
		ObjectMapper objMap = new ObjectMapper();
		String mapString = objMap.writeValueAsString(jsonMap);
		JSONObject jsonObj = (JSONObject)JSONValue.parse(mapString);
		
		
		Map<String, String> checkMap = objMap.readValue(jsonObj.toString(), new TypeReference<Map<String, String>>(){});
		Map<String, String> returnMap = new HashMap<String, String>();
		
		
		if(checkMap.get("userId") != null) {
				System.out.println("userId�� �ߺ�üũ");
				System.out.println(checkMap.get("userId"));
				String dbUserId = userService.checkUserId(checkMap.get("userId"));
				if(dbUserId == null) {
					returnMap.put("result","ok");
					return returnMap;
				}else {
					returnMap.put("result","error");
					return returnMap;
				}
				
		}
		
		if(checkMap.get("nickname") != null) {
				System.out.println("nickname���� �ߺ�üũ");
				System.out.println(checkMap.get("nickname"));
				String dbNickname = userService.checkNickname(checkMap.get("nickname"));
				if(dbNickname == null) {
					returnMap.put("result","ok");
					return returnMap;
				}else {
					returnMap.put("result","error");
					return returnMap;
				}
			
		}
		return returnMap;
	}
	
	
	@RequestMapping(value = "json/getUserId")
	public List<String> getUserId(@RequestBody Map jsonMap) throws Exception{
		System.out.println("userIdList==========================================================");
		System.out.println(jsonMap);
		ObjectMapper objectMapper = new ObjectMapper();
		String mapString = objectMapper.writeValueAsString(jsonMap);
		System.out.println(mapString);
		JSONObject jsonObject = (JSONObject)JSONValue.parse(mapString);
		System.out.println("jsonObject~!=="+jsonObject);
		Map<String, String> profileMap = objectMapper.readValue(jsonObject.toString(), new TypeReference<Map<String, String>>(){});

		List<String> idList = new ArrayList<String>();

		User settingUser = new User();
		settingUser.setUserName(profileMap.get("userName"));
		if(profileMap.get("email") == null||profileMap.get("email").equals(" @ ") || profileMap.get("email").equals("@") || profileMap.get("email").equals("") ){//<< �̰� ���� null üũ�� �� �ڿ��� �ߴµ� �տ����� üũ�ϴϱ� ���� ���ļ� �مf���� ���� �����ϼ�
			System.out.println("�ڵ������� ����Ʈ �̱�");
			settingUser.setPhone(profileMap.get("phone"));
			idList = userService.getUserIdList(settingUser);
		}else if(profileMap.get("phone") == null || profileMap.get("phone").equals("--") ||profileMap.get("phone").equals(" - - ") || profileMap.get("phone").equals("") ) {
			System.out.println("�̸��Ϸ� ����Ʈ �̱�");
			settingUser.setEmail(profileMap.get("email"));
			idList = userService.getUserIdList(settingUser);
		}else {
			System.out.println("���....");
		}
		
		if(idList.size()==0) {
			System.out.println("�ƹ��͵� �����ϴ�!!");
			idList.add("error");
		}
		System.out.println("���̵� ����Ʈ~="+idList);
		
		return idList;
	}
	
	
	
	@RequestMapping(value = "json/googleLoginUrlMake")
	public Map googleLogin(HttpSession session) throws UnsupportedEncodingException {
		String clientId = "474522905430-f6nkrljp2qocnq1mop0ve2oc5ng91q38.apps.googleusercontent.com";
		String redirectUrl = "http://localhost:8080/user/googleLoginLogic&";

		StringBuffer googleLoginUrl = new StringBuffer();
		googleLoginUrl.append("https://accounts.google.com/o/oauth2/v2/auth?");
		googleLoginUrl.append("scope=https://www.googleapis.com/auth/analytics.readonly&");
		googleLoginUrl.append("access_type=offline&");
		googleLoginUrl.append("include_granted_scopes=true&");
		googleLoginUrl.append("state=state_parameter_passthrough_value&");
		googleLoginUrl.append("redirect_uri=");
		googleLoginUrl.append(redirectUrl);
		googleLoginUrl.append("response_type=code&");
		googleLoginUrl.append("client_id=");
		googleLoginUrl.append(clientId);
		
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("url", googleLoginUrl.toString());
		System.out.println(map.get("url"));
		
		return map;
	}
	
	
	@RequestMapping( value = "json/naverLoginUrlMake" )
	public Map naverLogin( HttpSession session ) throws Exception {
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);
		session.setAttribute("state", state); 
		
		String clientId = "zmMH7F27NTAzH6EBj4dk";
		
		String redirectUrl = URLEncoder.encode("http://localhost:8080/user/naverLoginLogic", "UTF-8");
		
		String naverLoginUrl = 	"https://nid.naver.com/oauth2.0/authorize?response_type=code" + 
								"&client_id=" + clientId + 
								"&redirect_uri=" + redirectUrl + 
								"&state="+(String)session.getAttribute("state");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("url", naverLoginUrl);
		
		return map;
	}
	
	
	
	@RequestMapping( value = "json/kakaoLoginUrlMake" )
	public Map loginKakao( HttpSession session ) throws Exception {
		String clientId = "0813ef39292fbdbe6ad4d20b0a049724";

		String redirectUrl = "http://localhost:8080/user/kakaoLoginLogic";
		
		String kakaoLoginUrl = 	"https://kauth.kakao.com/oauth/authorize?" + 
								"client_id=" + clientId + 
								"&redirect_uri=" + redirectUrl + 
								"&response_type=code";
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("url", kakaoLoginUrl);
		
		return map;

		
	}
	
	
	
	
	
}
