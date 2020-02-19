package com.ksy.web.myPage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.service.community.CommunityService;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Like;
import com.ksy.service.domain.Offer;
import com.ksy.service.domain.Point;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.User;
import com.ksy.service.like.LikeService;
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
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("likeServiceImpl")
	private LikeService likeService;
	
	
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
		
		System.out.println("차차아아아아아아앙아!!!!!!!!!!!!!!!!!");
		myPageService.addPoint(point);
		myPageService.updateTotalPoint(point);
		User reloadUser = userService.getUser(user.getUserId());
		System.out.println("현재포인트는?!?!?!?!?!?"+reloadUser.getTotalPoint());
		session.setAttribute("user", reloadUser);
		System.out.println("차차아아아아아아앙아@@@@@@@@@@@@@@@@@@@@@@");
		
		
		returnMap.put("title", "출석체크");
		returnMap.put("start",date.format(today));
		System.out.println(returnMap);
		return returnMap;
	}
	
	
	@RequestMapping(value="json/choolCheck")
	public List choolCheck(HttpSession session)throws Exception {
		System.out.println("출석체크 해버리기!!!");
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String SessionUserId = ((User)session.getAttribute("user")).getUserId();
		List<Point> choolCheckList = myPageService.getChoolCheckList(SessionUserId);
		System.out.println(choolCheckList);
		List list = new ArrayList();
		for(int i=0;i<choolCheckList.size();i++) {
			Map eventMap = new HashMap();
			eventMap.put("title", "출석체크");
			String startDate = new SimpleDateFormat("yyyy-MM-dd").format(choolCheckList.get(i).getUsedDate());
			eventMap.put("start",startDate);
			list.add(eventMap);
		}
		return list;
	}
	
	
	@RequestMapping(value="json/getQnaCommentList")
	public Map getQnaCommentList(@RequestBody Post post)throws Exception{
		List<Comment> qnaCommentList = myPageService.getQnaCommentList(post.getPostId());
		Map map = new HashMap();
		
		if(qnaCommentList.size()==0) {
			System.out.println("호로로롤로롫");
			map.put("returnMessage","error");
		}else {
			map.put("qnaCommentList", qnaCommentList);
			map.put("returnMessage", "ok");
		}
		return map;
	}
	
	@RequestMapping(value="json/deleteBookMark/{postId}")
	public Map deleteBookMark(@PathVariable String postId , HttpSession session)throws Exception{
		
		
		Like like = new Like();
		User user=(User)session.getAttribute("user");
	    like.setLikeUserId(user.getUserId());
	    like.setRefId(postId);
	    like.setLikeType("B");
	    likeService.like_check_cancel(like);
	    
	    
	    List<Post> bookMarkList = myPageService.getBookMarkList(user.getUserId());
	    
		
		Map map = new HashMap();
		
		map.put("bookMarkList", bookMarkList);
		
		
		return map;
	}
	
	@RequestMapping(value="json/planOfferAccept/{offerId}")
	public Map planOfferAccept(@PathVariable String offerId , HttpSession session)throws Exception{
		
		User user = (User)session.getAttribute("user");
		Map map = new HashMap();
		
		Offer offer = myPageService.getOffer(offerId);
		System.out.println(offer);
		
		int havePlanCount = myPageService.getPlanCount(user.getUserId());
		System.out.println(havePlanCount);
		
		if(user.getSlot() <= havePlanCount) {
			System.out.println("안돼 포인트로 슬룻 구매해야함@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			map.put("resultMsg", "error");
			return map;
		}else if(user.getSlot() > havePlanCount) {
			offer.setOfferStatus("A");
			myPageService.updateOfferStatus(offer);
			myPageService.addPlanPartyMember(offer);
			map.put("resultMsg", "ok");
			return map;
			
		}
		
		//offer status 수락으로 업데이트하거나 거절하기
		//그러면 get으로 값 하나 더 만들어야한다 (수락,거절)
		//그리고 수락하면 party에 추가하기!!
		
		//아니 잠깐만 이거 get으로 해야하는게아니고 POST로 바꿔서 ref값이랑 이런거 다 가져와야함
		
		
		//Offer offer = new Offer();
		//offer.setToUserId(user.getUserId());
		//offer.setRefId(); <<여기에는 이제 offer
		//myPageService.addPlanPartyMember(offer);
		
		
		
		
		
		
		
		map.put("resultMsg", "error");
		return map;
	}


}
