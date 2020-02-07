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

//==> Meta-Data �� �پ��ϰ� Wiring ����...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class InfinityTest {

	@Autowired
	@Qualifier("clickServiceImpl")
	private ClickService service;

	@Test
	public void addinfinityTest() throws Exception {

		System.out.println("infinityClickTest ����!");
		
		//ũ�Ѹ� ������ ���� ũ�Ѹ� ����
		InfinityClick selTest = new InfinityClick();
		
		Map<Integer, String> imgMap = selTest.imgCrawl();//ũ�Ѹ� �̹�����  map�� put
		Map<Integer, String> infoMap = selTest.infoCrawl();//ũ�Ѹ� info map�� put
		
		//�����
		System.out.println("imgMap ����� ==>"+imgMap);
		System.out.println("infoMap ����� ==>"+infoMap);
		
		//����Ͻ� ������ ���� ���ε�
		for (int i = 0; i < imgMap.size(); i++) {
			
			//ũ�Ѹ��ؿ� ������ DB�� �ֱ����� �����λ���
			Click click = new Click();
			
			//�����
			System.out.println("imgMap ==>"+imgMap);
			System.out.println("infoMap ==>"+infoMap);
			
			//click�� img�ּҿ� info ���ε�
			click.setUrl(imgMap.get(i));
			click.setInfo(infoMap.get(i));
			
			//�����
			System.out.println("click ������ ����� ==>"+click);
			
			//��� ����
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
