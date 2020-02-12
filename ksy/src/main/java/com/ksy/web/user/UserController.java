package com.ksy.web.user;

import java.awt.PageAttributes.MediaType;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpEntity;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.net.HttpHeaders;
import com.ksy.service.domain.User;
import com.ksy.service.myPage.MyPageService;
import com.ksy.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService myPageService;

	String uploadPath = "C:\\Users\\User\\git\\Euroverse\\ksy\\WebContent\\resources\\images\\userImages";
	
	
	public UserController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="login")
	public String login() {
		System.out.println(this.getClass()+"Login");
		return "redirect:/user/getUser";
	}
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		System.out.println("로그아웃 됬습니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(this.getClass()+"logout");
		
		
		session.removeAttribute("user");
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
	@RequestMapping(value="addUser" , method = RequestMethod.GET)
	public String addUser(Model model)throws Exception{
		System.out.println(this.getClass()+"addUser");
		List cityList = new ArrayList();
		cityList.add("도시1");
		cityList.add("도시2");
		cityList.add("도시3");
		cityList.add("도시4");
		cityList.add("도시5");
		cityList.add("도시6");
		cityList.add("도시7");
		cityList.add("도시8");
		cityList.add("도시9");
		cityList.add("도시10");
		cityList.add("도시11");
		cityList.add("도시12");
		cityList.add("도시13");
		cityList.add("도시14");
		cityList.add("도시15");
		cityList.add("도시16");
		cityList.add("도시17");
		
		List tripStyle = new ArrayList();
		tripStyle.add("먹방");
		tripStyle.add("배낭여행");
		tripStyle.add("실연");
		tripStyle.add("온천");
		tripStyle.add("힐링");
		
		
		model.addAttribute("cityList",cityList);
		model.addAttribute("tripStyle",tripStyle);
		
	
		return "forward:/view/user/addUser.jsp";
	}
	
	@RequestMapping(value = "addUser" , method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user")User user ,Model model) throws Exception {
		System.out.println("addUser POST Start");
		System.out.println(user);
		System.out.println(user.getDreamCity());
		System.out.println(user.getTripStyle());
		//드림시티랑 트립스타일도 따로 테이블? 로 관리하기 유저아이디랑 조인
		
//		if(user.getImage().isEmpty()==false) {
//			MultipartFile mhsr = (MultipartFile)user.getImage();
//			String path = "C:\\Users\\User\\git\\Euroverse\\ksy\\WebContent\\resources\\images\\userImages";
//			String originalName = "";
//			originalName = new String(mhsr.getOriginalFilename().getBytes("8859_1"),"UTF-8");
//			System.out.println(originalName);
//			user.setUserImg("\\resources\\images\\userImages\\"+originalName);
//			System.out.println("유저이미지"+user.getUserImg());
//			File serverFile = new File(path+File.separator + originalName);
//			mhsr.transferTo(serverFile);
//		}else {
//			user.setUserImg("\\resources\\images\\userImages\\defaultUserImage.jpg");
//		}
		MultipartFile mhsr = (MultipartFile)user.getImage();
		if( mhsr.isEmpty() == false) {	//null 체크로 잡을 수 없음! 
			//String path = "C:\\Users\\User\\git\\Euroverse\\ksy\\WebContent\\resources\\images\\planImg";
			
			/*
			 * Calendar cal = Calendar.getInstance() ; SimpleDateFormat dateFormat = new
			 * SimpleDateFormat("yyyyMMdd_HHmmSS"); String time =
			 * dateFormat.format(cal.getTime()); String fileName =
			 * mpFile.getOriginalFilename() + "_"+time;
			 */
			
			String fileName = mhsr.getOriginalFilename();
			fileName = uploadFile(fileName, mhsr.getBytes());
			//mpFile.transferTo( new File(path, fileName) );
			
			user.setUserImg(fileName);
			
		}else {
			user.setUserImg("defaultPlanImage.jpg");
		}
		
		userService.addUser(user);
		
		
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "getUser" , method=RequestMethod.GET)
	public String getUser() {
		System.out.println(this.getClass()+"getUser Start");
		
		return "redirect:/view/user/getUser.jsp";
	}
	
	
	@RequestMapping(value = "searchId",method=RequestMethod.GET)
	public String searchUserId() {
		System.out.println("UserController GET searchUserId!");
		
		return"redirect:/view/user/searchId.jsp";
	}
	
	@RequestMapping(value="searchId",method=RequestMethod.POST)
	public String searchUserId(@ModelAttribute("user") User user , Model model) throws Exception {
		System.out.println("UserController POST searchUserId");
		List<String> idList = new ArrayList<String>();
		
		String authType="";
		
		User settingUser = new User();
		if(user.getPhone().equals("") || user.getPhone().equals("--") || user.getPhone().equals(" - - ")||user.getPhone()==null) {
			settingUser.setUserName(user.getUserName());
			settingUser.setEmail(user.getEmail());
			//이거 통합된 메소드 사용하자
			idList = userService.getUserIdList(settingUser);
			authType = "email";
		}else if(user.getEmail().equals("") || user.getEmail().equals(" @ ") || user.getEmail().equals("@") || user.getEmail()==null) {
			settingUser.setUserName(user.getUserName());
			settingUser.setPhone(user.getPhone());
			//통합된 메소드 사용하기
			idList = userService.getUserIdList(settingUser);
			authType = "phone";
		}
		
		List<String> starIdList = new ArrayList<String>();
		for(int i=0;i<idList.size();i++) {
			System.out.print("이거 써서 별표 달면 될듯!=="+idList.get(i).substring(0, 3));
			String star="";
			for(int j=0;j<idList.get(i).length()-3;j++) {
				System.out.print("*");
				star+="*";
			}
			starIdList.add(idList.get(i).substring(0,3)+star);
			System.out.println();
			
			System.out.println("아이디는!!!!!!!===="+starIdList.get(i));
		}
		
		
		
//		if(starIdList==null||starIdList.size()==0) {
//			starIdList.add("일치하는 아이디가 없습니다.");
//			authType = "일치하는 아이디가 없습니다.";
//		}
//		
//		
		
		
		System.out.println(starIdList);
		
		model.addAttribute("authType",authType);
		model.addAttribute("starIdList" , starIdList);
		model.addAttribute("user",user);
		
		
		return"forward:/view/user/searchIdConfirm.jsp";
	}
	
	@RequestMapping(value="updateUser" , method = RequestMethod.GET)
	public String updateUser() {
		System.out.println("userController updateUser GET");
		return"redirect:/view/user/updateUser.jsp";
	}
	
	
	@RequestMapping(value="updateUser",method=RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user ,HttpSession session, Model model) throws Exception {
		System.out.println("userController updateUser POST");
		System.out.println(user);
		//닉네임 , 이메일 , 폰 , 이미지 , pushagree
		User currentUser = (User)session.getAttribute("user");
		currentUser.setNickname(user.getNickname());
		currentUser.setEmail(user.getEmail());
		currentUser.setPhone(user.getPhone());
		currentUser.setPushAgree(user.getPushAgree());
		
		
		
		MultipartFile mhsr = (MultipartFile)user.getImage();
		if( mhsr.isEmpty() == false) {	//null 체크로 잡을 수 없음! 
			
			String fileName = mhsr.getOriginalFilename();
			fileName = uploadFile(fileName, mhsr.getBytes());
			
			currentUser.setUserImg(fileName);
			
		}
		userService.updateUser(currentUser);
		
		
		User reloadUser = userService.getUser(currentUser.getUserId());
		session.setAttribute("user", reloadUser);
		
		
		return "redirect:/view/user/getUser.jsp";
	}
	
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		//uuid 생성 (Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString()+"_"+originalName;
		File target = new File(uploadPath, savedName);
		//임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
	@RequestMapping( value = "googleLoginLogic")
	public String googleLoginLogic(@RequestParam("code")String code , HttpSession session ,Model model) throws Exception {
		String clientId = "474522905430-f6nkrljp2qocnq1mop0ve2oc5ng91q38.apps.googleusercontent.com";
		String clientSecret = "sQXO8VNc55wULLrJHNhg0GHi";
		String googleTokenurl =	"https://accounts.google.com/o/oauth2/token?";
		
		  URL googleTokenURL = new URL(googleTokenurl);
		  HttpURLConnection googleTokenCon = (HttpURLConnection)googleTokenURL.openConnection();
		  googleTokenCon.setRequestMethod("POST");
		  googleTokenCon.setDoOutput(true);
		  
		  BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(googleTokenCon.getOutputStream()));
		  String postData = 	"grant_type=" + "authorization_code" + 
				  	"&client_secret="+clientSecret+
					"&client_id=" + clientId + 
					"&redirect_uri=" + "http://localhost:8080/user/googleLoginLogic" + 
					"&code=" + code;
		  
		  bw.write(postData);
		  bw.flush();
		  int googleTokenResponseCode = googleTokenCon.getResponseCode();
		  BufferedReader googleTokenBr =  null;
		  System.out.println("과연?");
		  System.out.println(googleTokenResponseCode);
		  if( googleTokenResponseCode == 200 ) {
				googleTokenBr = new BufferedReader(new InputStreamReader(googleTokenCon.getInputStream(), "UTF-8"));
			}
			else {
				googleTokenBr = new BufferedReader(new InputStreamReader(googleTokenCon.getErrorStream()));
			}
		  
		  String googleTokenLine = "";
			StringBuffer googleTokenResponse = new StringBuffer();
			
		  System.out.println(googleTokenBr);
		  while( (googleTokenLine = googleTokenBr.readLine()) != null ) {
			  googleTokenResponse.append(googleTokenLine);
			}
		  
		 googleTokenBr.close(); 
		  
		 System.out.println(googleTokenResponse.toString());
		 
		 JSONObject googleTokenJSONObject = (JSONObject)JSONValue.parse(googleTokenResponse.toString());
		  
		 ObjectMapper objectMapper = new ObjectMapper();
		 Map<String , String> tokenMap = objectMapper.readValue(googleTokenJSONObject.toString(),new TypeReference<Map<String,String>>(){}); 
		 System.out.println(tokenMap.get("access_token"));
		 
		 String token = tokenMap.get("access_token");
		 String header = "Bearer " + token;
		 
		 String googleLoginUrl = "https://www.googleapis.com/oauth2/v1/userinfo?";
		 
		 URL googleLoginURL = new URL(googleLoginUrl);
		 
		  HttpURLConnection googleLoginCon = (HttpURLConnection)googleLoginURL.openConnection();
          
          googleLoginCon.setRequestMethod("GET");
          
          googleLoginCon.setRequestProperty("Authorization", header);
          
          int googleLoginResponseCode = googleLoginCon.getResponseCode();
          
          BufferedReader googleLoginBr;
         
          if( googleLoginResponseCode == 200 ) { 
          	googleLoginBr = new BufferedReader(new InputStreamReader(googleLoginCon.getInputStream(), "UTF-8"));
          } else {  
          	googleLoginBr = new BufferedReader(new InputStreamReader(googleLoginCon.getErrorStream()));
          }
          
          String googleLoginLine = "";
          
          StringBuffer googleLoginResponse = new StringBuffer();
          
          while ((googleLoginLine = googleLoginBr.readLine()) != null) {
          	googleLoginResponse.append(googleLoginLine);
          }
          
          googleLoginBr.close();
          
          System.out.println(googleLoginResponse.toString());
          JSONObject googleLoginJSONObject = (JSONObject)JSONValue.parse(googleLoginResponse.toString());
          Map<String,String> googleProfile = objectMapper.readValue(googleLoginJSONObject.toString(),new TypeReference<Map<String,Object>>(){});
          System.out.println("=============구글로그인 정보!================");
          System.out.println(googleProfile);
          System.out.println("id="+googleProfile.get("id"));
          System.out.println("name= "+googleProfile.get("name"));
          System.out.println("email= "+googleProfile.get("email"));
          System.out.println("thumbnail= "+googleProfile.get("picture"));
		  System.out.println("=========================================");
		  User user = new User();
		  user.setNickname(googleProfile.get("given_name"));
		  user.setEmail(googleProfile.get("email"));
		  user.setEmailId(googleProfile.get("email").split("@")[0]);
		  user.setChoiceEmail(googleProfile.get("email").split("@")[1]);
		  user.setUserImg(googleProfile.get("picture"));
		  
		  model.addAttribute("snsUser" , user);
		  model.addAttribute("loginType" , "sns");
		  
		  
		  
		return "forward:/user/addUser";
	}
	
	@RequestMapping( value = "naverLoginLogic" )
	public String naverLoginLogic( @RequestParam("code") String code, @RequestParam("state") String state, HttpSession session , Model model) throws Exception {
		String clientId = "zmMH7F27NTAzH6EBj4dk";
		String clientSecret = "eNa1m8zS0g";
		String tokenUrl = 	"https://nid.naver.com/oauth2.0/token?" + 
								"grant_type=authorization_code" + 
								"&client_id=" + clientId + 
								"&client_secret=" + clientSecret + 
								"&code=" + code + 
								"&state=" + state;
		URL tokenURL = new URL(tokenUrl);
		User user = new User();
		HttpURLConnection tokenCon = (HttpURLConnection)tokenURL.openConnection();
		tokenCon.setRequestMethod("GET");
		
		int tokenResponseCode = tokenCon.getResponseCode();
		
		BufferedReader tokenBr =  null;
		
		if( tokenResponseCode == 200 ) { // Http 200 OK일 때 tokenCon.getInputStream() UTF-8 인코딩해서 읽음 
			tokenBr = new BufferedReader(new InputStreamReader(tokenCon.getInputStream(), "UTF-8"));
		}
		else { // 에러 발생시 tokenCon.getErrorStream()을 읽음 
			tokenBr = new BufferedReader(new InputStreamReader(tokenCon.getErrorStream()));
		}
		
		String tokenJsonData = "";
		StringBuffer tokenResponse = new StringBuffer();
		while( ( tokenJsonData = tokenBr.readLine() ) != null ) {
			tokenResponse.append(tokenJsonData);
		}
		tokenBr.close();
		System.out.println("----------response ? : " + tokenResponse.toString());
		JSONObject jsonObject = (JSONObject)JSONValue.parse(tokenResponse.toString());
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> tokenMap = objectMapper.readValue(jsonObject.toString(), new TypeReference<Map<String, String>>(){});
		
		System.out.println("-----------------------tokenMap : " + tokenMap);
		
		String accessToken = tokenMap.get("access_token");
		
        Map<String, String> profileMap = new HashMap<String, String>();
        
        try {
            String naverLoginUrl = "https://openapi.naver.com/v1/nid/me";
            
            URL naverLoginURL = new URL(naverLoginUrl);
            
            HttpURLConnection naverLoginCon = (HttpURLConnection)naverLoginURL.openConnection();
            
            naverLoginCon.setRequestMethod("GET");
            
            String header = "Bearer " + accessToken;
            
            naverLoginCon.setRequestProperty("Authorization", header);
            
            int naverLoginResponseCode = naverLoginCon.getResponseCode();
            
            BufferedReader naverLoginBr;
            
            if( naverLoginResponseCode == 200 ) { 
            	naverLoginBr = new BufferedReader(new InputStreamReader(naverLoginCon.getInputStream(), "UTF-8"));
            } else {  
            	naverLoginBr = new BufferedReader(new InputStreamReader(naverLoginCon.getErrorStream()));
            }
            
            String inputLine;
            
            StringBuffer naverLoginResponse = new StringBuffer();
            
            while ( ( inputLine = naverLoginBr.readLine() ) != null ) {
            	naverLoginResponse.append(inputLine);
            }
            
            naverLoginBr.close();
            
            
            System.out.println(naverLoginResponse.toString());
            
            jsonObject = (JSONObject)JSONValue.parse(naverLoginResponse.toString());
            profileMap = objectMapper.readValue(jsonObject.get("response").toString(), new TypeReference<Map<String, String>>(){});
            System.out.println("히히히히"+profileMap);
        } catch (Exception e) {
            System.out.println(e);
        }
		
        System.out.println("------------------profileMap" + profileMap);
        String id = profileMap.get("id");
		System.out.println("-------------------profileMap.get(id) : " + id);
		
		String name = profileMap.get("name");
		String email = profileMap.get("email");
		System.out.println("==================================================");
		
		System.out.println(profileMap.get("email"));
		System.out.println(profileMap.get("name"));
		System.out.println(profileMap.get("nickname"));
		System.out.println(profileMap.get("profile_image"));
		user.setNickname(profileMap.get("nickname"));
		user.setEmail(profileMap.get("email"));
		user.setEmailId(profileMap.get("email").split("@")[0]);
		user.setChoiceEmail(profileMap.get("email").split("@")[1]);
		user.setUserImg(profileMap.get("profile_image"));
		
		
		
		
		System.out.println("=====================================================");
		int index = email.indexOf("@");
		
		String userId = email.substring(0, index);
		System.out.println("-----------------userId ? : " + userId);
		
		model.addAttribute("snsUser",user);
		model.addAttribute("loginType","sns");
		
		
		return "forward:/user/addUser";
	}
	
	
	@RequestMapping( value = "kakaoLoginLogic" )
	public String kakaoLoginLogic( @RequestParam("code") String code, HttpSession session ,Model model) throws Exception {
		String clientId = "0813ef39292fbdbe6ad4d20b0a049724";
		
		System.out.println("code---------------------------------" + code);
		
		String kakaoTokenUrl = 	"https://kauth.kakao.com/oauth/token";
        User user = new User();

		URL kakaoTokenURL = new URL(kakaoTokenUrl);
		HttpURLConnection kakaoTokenCon = (HttpURLConnection)kakaoTokenURL.openConnection();
		kakaoTokenCon.setRequestMethod("POST");
		kakaoTokenCon.setDoOutput(true);
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(kakaoTokenCon.getOutputStream()));
		
		String postData = 	"grant_type=" + "authorization_code" + 
							"&client_id=" + clientId + 
							"&redirect_uri=" + "http://localhost:8080/user/kakaoLoginLogic" + 
							"&code=" + code;
		
		bw.write(postData);
		bw.flush();
		
		int kakaoTokenResponseCode = kakaoTokenCon.getResponseCode();
		
		BufferedReader kakaoTokenBr =  null;
		
		if( kakaoTokenResponseCode == 200 ) {
			kakaoTokenBr = new BufferedReader(new InputStreamReader(kakaoTokenCon.getInputStream(), "UTF-8"));
		}
		else {
			kakaoTokenBr = new BufferedReader(new InputStreamReader(kakaoTokenCon.getErrorStream()));
		}
		
		String kakaoTokenLine = "";
		StringBuffer kakaoTokenResponse = new StringBuffer();
		
		while( (kakaoTokenLine = kakaoTokenBr.readLine()) != null ) {
			kakaoTokenResponse.append(kakaoTokenLine);
		}
		
		kakaoTokenBr.close();
		
		System.out.println("----------response ? : " + kakaoTokenResponse.toString());
			
		JSONObject kakaoTokenJSONObject = (JSONObject)JSONValue.parse(kakaoTokenResponse.toString());
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, String> tokenMap = objectMapper.readValue(kakaoTokenJSONObject.toString(), new TypeReference<Map<String, String>>(){});
		System.out.println("-----------------------tokenMap : " + tokenMap);
		
		String token = tokenMap.get("access_token");
		
		System.out.println("---------------------카카오 로그인 시 accesstoken ? : " + token);
		
		session.setAttribute("accessToken", token);
		session.setAttribute("refreshToken", tokenMap.get("refresh_token"));
       
        Map<String, Object> profileMap = new HashMap<String, Object>();
        Map<String, Object> kakaoAccount = new HashMap<String, Object>();
        Map<String, String> b = new HashMap<String, String>();
        String kakaoId = "";
        
        try {
        	String header = "Bearer " + token;
            String kakaoLoginUrl = "https://kapi.kakao.com/v2/user/me";
            
            URL kakaoLoginURL = new URL(kakaoLoginUrl);
            
            HttpURLConnection kakaoLoginCon = (HttpURLConnection)kakaoLoginURL.openConnection();
            
            kakaoLoginCon.setRequestMethod("GET");
            
            kakaoLoginCon.setRequestProperty("Authorization", header);
            
            int kakaoLoginResponseCode = kakaoLoginCon.getResponseCode();
            
            BufferedReader kakaoLoginBr;
            
            if( kakaoLoginResponseCode == 200 ) { 
            	kakaoLoginBr = new BufferedReader(new InputStreamReader(kakaoLoginCon.getInputStream(), "UTF-8"));
            } else {  
            	kakaoLoginBr = new BufferedReader(new InputStreamReader(kakaoLoginCon.getErrorStream()));
            }
            
            String kakaoLoginLine = "";
            
            StringBuffer kakaoLoginResponse = new StringBuffer();
            
            while ((kakaoLoginLine = kakaoLoginBr.readLine()) != null) {
            	kakaoLoginResponse.append(kakaoLoginLine);
            }
            
            kakaoLoginBr.close();
            
            System.out.println(kakaoLoginResponse.toString());
            
            JSONObject kakaoLoginJSONObject = (JSONObject)JSONValue.parse(kakaoLoginResponse.toString());
            
            
            
            profileMap = objectMapper.readValue(kakaoLoginJSONObject.get("properties").toString(), new TypeReference<Map<String, Object>>(){});
            kakaoId = objectMapper.readValue(kakaoLoginJSONObject.get("id").toString(), String.class);
            kakaoAccount = objectMapper.readValue(kakaoLoginJSONObject.get("kakao_account").toString(), new TypeReference<Map<String, Object>>(){});
            
            b=(Map<String, String>)kakaoAccount.get("profile");
            System.out.println("===========================");
            System.out.println(b.get("nickname"));
            System.out.println(kakaoAccount.get("email"));
            System.out.println(profileMap.get("profile_image"));
            //System.out.println(profileMap.get("email"));
            
            System.out.println("==========================");
            System.out.println("---------------------------------profileMap ? : "+ profileMap);
            System.out.println("---------------------------------userId ? : "+ kakaoId);
            System.out.println("===================kakao account : "+kakaoAccount);
            System.out.println("하아압!!"+kakaoAccount.get("profile"));
            
            System.out.println(b.get("nickname"));
            System.out.println(b.get("thumbnail_image_url"));
            System.out.println(kakaoAccount.get("email"));
            user.setNickname(b.get("nickname"));
            user.setUserImg(b.get("thumbnail_image_url"));
            user.setEmail((String)kakaoAccount.get("email"));
            user.setEmailId(((String)kakaoAccount.get("email")).split("@")[0]);
            user.setChoiceEmail(((String)kakaoAccount.get("email")).split("@")[1]);
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        String userName = (String)profileMap.get("nickname");
        
        // DB에 카카오 아이디를 생성할 때 구분할 수 있도록 앞에 kakao 문자열 추가 
        String userId = "kakao" + kakaoId;
        
        
        
        User kakaoUser = new User();
        System.out.println(kakaoAccount.get("profile"));
        
        
        model.addAttribute("snsUser",user);
        model.addAttribute("loginType","sns");

		return "forward:/user/addUser";
	}
	

}
