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


//==> ȸ������ RestController
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
		
		System.out.println("infinityClick ����");
		
		//�����߻� Rnadom class
		Random random = new Random();
		int id = random.nextInt(16);//0~16������ ������ �߻���Ų��.
		System.out.println("id ����� ==>"+id);
		
		//����Ͻ� ���� ����
		tripInfo = clickService.getUrl(id);
		
		System.out.println("tripInfo ����� ==>"+tripInfo);
		
		//����Ͻ��� �並 �����ϱ�����
		model.addAttribute("tripInfo",tripInfo);
		System.out.println("model �����==>"+model);
		
		return "forward:/view/tripInfo/infinityClick.jsp";
		
	}
}