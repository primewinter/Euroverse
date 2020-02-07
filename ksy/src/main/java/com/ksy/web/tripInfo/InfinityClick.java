package com.ksy.web.tripInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.internal.WebElementToJsonConverter;

public class InfinityClick {
	
	public static void main(String[] args) throws Exception {

		InfinityClick selTest = new InfinityClick();
		selTest.imgCrawl();
		selTest.infoCrawl();
	}

	// WebDriver
	private WebDriver driver;
	private WebElement webElement;

	// Properties
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "C:\\chromedriver.exe";

	private String base_url;

	public InfinityClick() {
		super();

		// System Property SetUp
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		//�˻��� ������ �ʵ�� ����
		driver = new ChromeDriver();
		String dreamCity = "����";
		
		// pixabay Ȩ���������� ũ�Ѹ� �˻������� ���̳����ϰ�
		base_url = "https://pixabay.com/ko/images/search/" + dreamCity + "/?cat=buildings"; 
	
		
		

	}

	public Map<Integer,String> imgCrawl() throws Exception {


		System.out.println("crawling start!!!!");
		//ũ�Ѹ� �ؿ� url ��������
		driver.get(base_url);
		driver.findElement(By.xpath("//*[@id=\"content\"]/div/div[1]/div/label/input")).click();
		
		//selenium�� �����Ǵ� By Class�� �̿��Ͽ� CssSeletor�� Css���� 
		By picture = By.cssSelector("div.flex_grid.credits.search_results > div > a > img");
		
		//seletor�� ������ tag�� webElement���·� list�� ����.
		List<WebElement> pictures = driver.findElements(picture);
		System.out.println("pictures ==>" + pictures);
		
		//�����
		System.out.println("pictures ����� ==>" + pictures.size());
		
		//ũ�Ѹ��ؿ� ���� ���� map����.
		Map<Integer,String> urlMap = new HashMap<Integer,String>();
		webElement = driver.findElement(picture);
		
		for (int i = 0; i < pictures.size(); i++) {
			
			//WebElement�� �ִ� getAttribute �޼��带 ����ϱ����� cssSelector�� selct�ؿ� �±׸� ����
			WebElement pic = pictures.get(i);
			
			//�̹����� ������ִ� src�±׿�, alt�±׿� ���� String ������ �ֱ�
			String url = pic.getAttribute("src");
			
			//�� �̹����� �ּҿ� �Ӽ��� �����
			System.out.println("url ����� ==>"+url);
			
			//ũ�Ѹ��ؼ� �������� data���� Ȯ���� (.gif)������ �츮������ �ʿ���� �Ϸ���Ʈ ������ �� ������ ���� �ʿ� ������� if�� 
			if (url.contains("blank.gif")) {
				
			}else {
				
				urlMap.put(i,url);
			}
			
		}
		
		//������
		System.out.println("urlMap==>"+urlMap);
		
		return urlMap;
	}
	
	public Map<Integer,String> infoCrawl() throws Exception {

		System.out.println("crawling start!!!!");
		//ũ�Ѹ� �ؿ� url ��������
		driver.get(base_url);
		driver.findElement(By.xpath("//*[@id=\"content\"]/div/div[1]/div/label/input")).click();
		
		//selenium�� �����Ǵ� By Class�� �̿��Ͽ� CssSeletor�� Css���� 
		By picture = By.cssSelector("div.flex_grid.credits.search_results > div > a > img");
		
		//seletor�� ������ tag�� webElement���·� list�� ����.
		List<WebElement> pictures = driver.findElements(picture);
		
		//�����
		System.out.println("pictures ����� ==>" + pictures.size());
		
		//ũ�Ѹ��ؿ� ���� ���� map����.
		Map<Integer,String> infoMap = new HashMap<Integer,String>();
		
//		for(WebElement pic : pictures)
		for (int i = 0; i < pictures.size(); i++) {
			
			//WebElement�� �ִ� getAttribute �޼��带 ����ϱ����� cssSelector�� selct�ؿ� �±׸� ����
			WebElement pic = pictures.get(i);
			
			//�̹����� ������ִ� src�±׿�, alt�±׿� ���� String ������ �ֱ�
			String url = pic.getAttribute("src");
			String info = pic.getAttribute("alt");
			
			//�� �̹����� �ּҿ� �Ӽ��� �����
//			System.out.println("url ����� ==>"+url);
//			System.out.println("info �����==>"+info);
			
			//ũ�Ѹ��ؼ� �������� data���� Ȯ���� (.gif)������ �츮������ �ʿ���� �Ϸ���Ʈ ������ �� ������ ���� �ʿ� ������� if�� 
			if (url.contains("blank.gif")) {
				
				info=null; //String ���� blank.gif ��� ���ڰ� ������ �� ������ ������ null ��ȯ.
				
			}else {
				
				infoMap.put(i,info);// map�� image�� info �ֱ�
			}
		}
		
//		//������
		System.out.println("map==>"+infoMap);
		
		return infoMap;
	}
}