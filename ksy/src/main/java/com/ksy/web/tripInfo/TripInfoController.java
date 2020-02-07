package com.ksy.web.tripInfo;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksy.service.domain.TripInfo;
import com.ksy.service.tripInfo.TripInfoService;


//==> È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ RestController
@Controller
@RequestMapping("/api/*")
public class TripInfoController {
	
	///Field
	@Autowired
	@Qualifier("tripInfoServiceImpl")
	private TripInfoService clickService;
		
	public TripInfoController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="infinityClick", method=RequestMethod.GET)
	public String infinityClick(@ModelAttribute("tripInfo") TripInfo tripInfo, Model model) throws Exception{
		
		System.out.println("infinityClick ½ÃÀÛ");
		
		//³­¼ö¹ß»ý Rnadom class
		Random random = new Random();
		int id = random.nextInt(16);//0~16±îÁöÀÇ ³­¼ö¸¦ ¹ß»ý½ÃÅ²´Ù.
		System.out.println("id µð¹ö±ë ==>"+id);
		
		//ºñÁî´Ï½º ·ÎÁ÷ ¿¬°á
		tripInfo = clickService.getUrl(id);
		
		System.out.println("tripInfo µð¹ö±ë ==>"+tripInfo);
		
		//ºñÁî´Ï½º¿Í ºä¸¦ ¿¬°áÇÏ±âÀ§ÇØ
		model.addAttribute("tripInfo",tripInfo);
		System.out.println("model µð¹ö±ë==>"+model);
		
		return "forward:/view/tripInfo/infinityClick.jsp";
		
	}
}