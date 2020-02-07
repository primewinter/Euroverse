package com.ksy.service.tripInfo.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.service.domain.Click;
import com.model2.mvc.service.user.ClickService;

import api.war.InfinityClick;

@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 를 다양하게 Wiring 하자...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class InfinityTest {

	@Autowired
	@Qualifier("clickServiceImpl")
	private ClickService service;

	@Test
	public void addinfinityTest() throws Exception {

		System.out.println("infinityClickTest 시작!");
		
		//크롤링 생성자 생성 크롤링 시작
		InfinityClick selTest = new InfinityClick();
		
		Map<Integer, String> imgMap = selTest.imgCrawl();//크롤링 이미지를  map에 put
		Map<Integer, String> infoMap = selTest.infoCrawl();//크롤링 info map에 put
		
		//디버깅
		System.out.println("imgMap 디버깅 ==>"+imgMap);
		System.out.println("infoMap 디버깅 ==>"+infoMap);
		
		//비즈니스 로직과 연결 바인딩
		for (int i = 0; i < imgMap.size(); i++) {
			
			//크롤링해온 정보를 DB에 넣기위한 도메인생성
			Click click = new Click();
			
			//디버깅
			System.out.println("imgMap ==>"+imgMap);
			System.out.println("infoMap ==>"+infoMap);
			
			//click에 img주소와 info 바인딩
			click.setUrl(imgMap.get(i));
			click.setInfo(infoMap.get(i));
			
			//디버깅
			System.out.println("click 도메인 디버깅 ==>"+click);
			
			//디비에 저장
            service.addUrl(click);
		}

	}

	// @Test
	public void infinityTest() throws Exception {

		Click click = new Click();

		click = service.getUrl(1);

		Assert.assertEquals(1, click.getId());
	}
}
