package com.ksy.web.community;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ksy.common.Page;
import com.ksy.common.Search;
import com.ksy.service.community.CommunityService;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Like;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.Report;
import com.ksy.service.domain.User;
import com.ksy.service.like.LikeService;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {

	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("likeServiceImpl")
	private LikeService likeService; 
	
	public CommunityRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value="/json/addReport", method=RequestMethod.POST)
	public void addReport(Report report, HttpServletResponse response, HttpSession session) throws Exception {
		
		System.out.println("/community/json/addReport : POST");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		User user=(User)session.getAttribute("user");
		report.setReportUserId(user.getUserId());
		
		communityService.addReport(report);
		
		JSONObject obj = new JSONObject();
		obj.put("msg", "신고 완료");
		out.println(obj);
	}
	
	@RequestMapping(value="/json/deleteComment/{cmtId}", method=RequestMethod.GET )
	public void deleteComment(@PathVariable String cmtId, HttpServletResponse response) throws Exception {
		
		System.out.println("/community/json/deleteComment : GET");
		
		PrintWriter out = response.getWriter();
		
		communityService.deleteComment(cmtId);
		
		JSONObject obj = new JSONObject();
		obj.put("msg", "삭제 성공!");
		out.println(obj);
	}

	@RequestMapping(value="/json/getComment/{cmtId}", method=RequestMethod.GET )
	public Comment getComment(@PathVariable String cmtId) throws Exception {
		
		System.out.println("/community/json/getComment : GET");
		
		Comment comment = communityService.getComment(cmtId);
		
		return comment;
	}
	
	@RequestMapping(value="/json/updateComment", method=RequestMethod.POST )
	public Comment updateComment(Comment comment) throws Exception {
		
		System.out.println("/community/json/updateComment : POST");
		
		if(comment.getSecret() == null) {
			comment.setSecret("F");
		}
		
		communityService.updateComment(comment);
		comment=communityService.getComment(comment.getCmtId());
		
		return comment;
	}
	
	@RequestMapping(value="/json/like/{cmtId}", method=RequestMethod.GET )
	public void like(@PathVariable String cmtId, HttpSession session, HttpServletResponse response ) throws Exception {
	  
		System.out.println("/community/json/like : GET");
		System.out.println(cmtId);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		 
		Like like = new Like();
		User user=(User)session.getAttribute("user");
	    like.setLikeUserId(user.getUserId());
	    like.setRefId(cmtId);
	    like.setLikeType("C");
	    
	    if(likeService.countByLike(like)==0){
	    	likeService.addLike(like);
	    }
	    like=likeService.getLike(like);
	   
		Comment comment = communityService.getComment(cmtId);
		
		int cmtLikeCount = comment.getCmtLikeCount(); //게시판의 좋아요 카운트
		String likeCheck = like.getLikeCheck(); //좋아요 체크 값
		System.out.println("sdfdfsfsf"+likeCheck);
		List<String> msgs = new ArrayList<String>();
		System.out.println("들어가기전 댓글추천수 : "+cmtLikeCount);
		if(likeCheck.equals("F")) {
		  msgs.add("좋아요!");
		  likeService.like_check(like);
		  likeCheck="T";
		  cmtLikeCount++;
		  comment.setCmtLikeCount(cmtLikeCount);
		  System.out.println("들어간 후 댓글 추천수 : "+cmtLikeCount);
		  communityService.update_Like(comment);   //좋아요 갯수 증가
		}else{
		  msgs.add("좋아요 취소");
		  likeService.like_check_cancel(like);
		  likeCheck="F";
		  cmtLikeCount--;
		  comment.setCmtLikeCount(cmtLikeCount);
		  System.out.println("들어간 후 댓글 추천수 : "+cmtLikeCount);
		  communityService.update_Unlike(comment);   //좋아요 갯수 감소
		}
		JSONObject obj = new JSONObject();
		obj.put("cmtId", like.getRefId());
		obj.put("likeCheck", likeCheck);
		obj.put("cmtLikeCount", cmtLikeCount);
		obj.put("msg", msgs);
		
		out.println(obj);
	}
	
	@RequestMapping(value="/json/addBookMark/{postId}", method=RequestMethod.GET )
	public void addBookMark(@PathVariable String postId, HttpSession session, HttpServletResponse response ) throws Exception {
	  
		System.out.println("/community/json/addBookMark : GET");
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		 
		Like like = new Like();
		User user=(User)session.getAttribute("user");
	    like.setLikeUserId(user.getUserId());
	    like.setRefId(postId);
	    like.setLikeType("B");
	    
	    if(likeService.countByLike(like)==0){
	    	likeService.addLike(like);
	    }
	    like=likeService.getLike(like);

		String likeCheck = like.getLikeCheck(); //좋아요 체크 값
		List<String> msgs = new ArrayList<String>();

		if(likeCheck.equals("F")) {
		  msgs.add("좋아요!");
		  likeService.like_check(like);
		  likeCheck="T";
		}else{
		  msgs.add("좋아요 취소");
		  likeService.like_check_cancel(like);
		  likeCheck="F";

		}
		JSONObject obj = new JSONObject();
		obj.put("postId", like.getRefId());
		obj.put("likeCheck", likeCheck);
		obj.put("msg", msgs);
		
		out.println(obj);
	}
	
	@RequestMapping( value="json/likeUpdate", method=RequestMethod.POST )
	public void likeUpdate( String postId, HttpServletResponse response ) throws Exception {
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
	
		communityService.update_postLike(postId);
		System.out.println("??????");
		int like=communityService.select_Like(postId);
		System.out.println("?????? : "+like);
		JSONObject obj = new JSONObject();
		System.out.println(like);
		obj.put("like",like);
		out.println(obj);
	}
	
	@RequestMapping( value="json/addFile", method=RequestMethod.POST )
	public void addFile(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = "C:\\Users\\User\\git\\repository2\\11.Model2MVCShop\\WebContent\\images\\uploadFiles\\";
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		Thread.sleep(5000);
		out.println("../images/uploadFiles/" + str_filename);
		out.close();
	}
	
	@RequestMapping( value="json/addComment", method=RequestMethod.POST )
	public void addComment( Comment comment, HttpSession session, HttpServletResponse response ) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter(); 
		
		System.out.println("/community/addComment : POST");
		
		User user = (User)session.getAttribute("user");
		comment.setCmtWriterId(user.getUserId());
		
		if(comment.getSecret() == null) {
			comment.setSecret("F");
		}
		communityService.addComment(comment);
		
		JSONObject obj = new JSONObject();
		obj.put("OK", comment.getCmtId());
		out.println(obj);
	}
	
	@RequestMapping( value="json/getCommentList/{postId}/{currentPage}", method=RequestMethod.GET )
	public Map<String, Object> getCommentList( @PathVariable String postId, @PathVariable int currentPage, HttpSession session ) throws Exception{
		
		System.out.println("/community/json/getCommentList : GET");
		
		Search search = new Search();
		User user=(User)session.getAttribute("user");
		String userId=user.getUserId();
	
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		System.out.println("currentPage : "+currentPage+" pageSize : "+pageSize);

		Map<String, Object> map = communityService.getCommentList(search, postId, userId);
		System.out.println(map.get("list"));
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage : "+resultPage);
		map.put("resultPage", resultPage);
		map.put("search", search);
		map.put("userId", userId);
		
		return map;
	}
	
	@RequestMapping( value="json/getCommentList", method=RequestMethod.POST )
	public Map<String, Object> getCommentList( Search search, String postId, HttpSession session ) throws Exception{
		
		System.out.println("/community/json/getCommentList : POST");
		
		User user=(User)session.getAttribute("user");
		String userId=user.getUserId();
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map=communityService.getCommentList(search, postId, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		map.put("postId", postId);
		
		return map;
	}
}
