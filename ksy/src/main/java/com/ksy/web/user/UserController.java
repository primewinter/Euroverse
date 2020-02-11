package com.ksy.web.user;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
		System.out.println("�α׾ƿ� ����ϴ�!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(this.getClass()+"logout");
		
		
		session.removeAttribute("user");
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
	@RequestMapping(value="addUser" , method = RequestMethod.GET)
	public String addUser(Model model)throws Exception{
		System.out.println(this.getClass()+"addUser");
		List cityList = new ArrayList();
		cityList.add("����1");
		cityList.add("����2");
		cityList.add("����3");
		cityList.add("����4");
		cityList.add("����5");
		cityList.add("����6");
		cityList.add("����7");
		cityList.add("����8");
		cityList.add("����9");
		cityList.add("����10");
		cityList.add("����11");
		cityList.add("����12");
		cityList.add("����13");
		cityList.add("����14");
		cityList.add("����15");
		cityList.add("����16");
		cityList.add("����17");
		
		List tripStyle = new ArrayList();
		tripStyle.add("�Թ�");
		tripStyle.add("�賶����");
		tripStyle.add("�ǿ�");
		tripStyle.add("��õ");
		tripStyle.add("����");
		
		
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
		//�帲��Ƽ�� Ʈ����Ÿ�ϵ� ���� ���̺�? �� �����ϱ� �������̵�� ����
		System.out.println("���⺸����!!!"+user.getImage().isEmpty());
		
//		if(user.getImage().isEmpty()==false) {
//			MultipartFile mhsr = (MultipartFile)user.getImage();
//			String path = "C:\\Users\\User\\git\\Euroverse\\ksy\\WebContent\\resources\\images\\userImages";
//			String originalName = "";
//			originalName = new String(mhsr.getOriginalFilename().getBytes("8859_1"),"UTF-8");
//			System.out.println(originalName);
//			user.setUserImg("\\resources\\images\\userImages\\"+originalName);
//			System.out.println("�����̹���"+user.getUserImg());
//			File serverFile = new File(path+File.separator + originalName);
//			mhsr.transferTo(serverFile);
//		}else {
//			user.setUserImg("\\resources\\images\\userImages\\defaultUserImage.jpg");
//		}
		MultipartFile mhsr = (MultipartFile)user.getImage();
		if( mhsr.isEmpty() == false) {	//null üũ�� ���� �� ����! 
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
			//�̰� ���յ� �޼ҵ� �������
			idList = userService.getUserIdList(settingUser);
			authType = "email";
		}else if(user.getEmail().equals("") || user.getEmail().equals(" @ ") || user.getEmail().equals("@") || user.getEmail()==null) {
			settingUser.setUserName(user.getUserName());
			settingUser.setPhone(user.getPhone());
			//���յ� �޼ҵ� ����ϱ�
			idList = userService.getUserIdList(settingUser);
			authType = "phone";
		}
		
		List<String> starIdList = new ArrayList<String>();
		for(int i=0;i<idList.size();i++) {
			System.out.print("�̰� �Ἥ ��ǥ �޸� �ɵ�!=="+idList.get(i).substring(0, 3));
			String star="";
			for(int j=0;j<idList.get(i).length()-3;j++) {
				System.out.print("*");
				star+="*";
			}
			starIdList.add(idList.get(i).substring(0,3)+star);
			System.out.println();
			
			System.out.println("���̵��!!!!!!!===="+starIdList.get(i));
		}
		
		
		
//		if(starIdList==null||starIdList.size()==0) {
//			starIdList.add("��ġ�ϴ� ���̵� �����ϴ�.");
//			authType = "��ġ�ϴ� ���̵� �����ϴ�.";
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
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		//�г��� , �̸��� , �� , �̹��� , pushagree
		User currentUser = (User)session.getAttribute("user");
		currentUser.setNickname(user.getNickname());
		currentUser.setEmail(user.getEmail());
		currentUser.setPhone(user.getPhone());
		currentUser.setPushAgree(user.getPushAgree());
		
		
		
		MultipartFile mhsr = (MultipartFile)user.getImage();
		if( mhsr.isEmpty() == false) {	//null üũ�� ���� �� ����! 
			
			String fileName = mhsr.getOriginalFilename();
			fileName = uploadFile(fileName, mhsr.getBytes());
			
			currentUser.setUserImg(fileName);
			
		}else {
			currentUser.setUserImg("defaultUserImage.jpg");
		}
		userService.updateUser(currentUser);
		
		
		User reloadUser = userService.getUser(currentUser.getUserId());
		session.setAttribute("user", reloadUser);
		
		
		return "redirect:/view/user/getUser.jsp";
	}
	
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		//uuid ���� (Universal Unique IDentifier, ���� ���� �ĺ���)
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString()+"_"+originalName;
		File target = new File(uploadPath, savedName);
		//�ӽ� ���丮�� ����� ���ε�� ������ ������ ���丮�� ����
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
	
}
