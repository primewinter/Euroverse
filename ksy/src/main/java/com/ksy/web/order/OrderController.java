package com.ksy.web.order;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ksy.common.Page;
import com.ksy.common.Search;
import com.ksy.service.domain.Flight;
import com.ksy.service.domain.Order;
import com.ksy.service.domain.Point;
import com.ksy.service.domain.Room;
import com.ksy.service.domain.User;
import com.ksy.service.flight.FlightService;
import com.ksy.service.order.OrderService;
import com.ksy.service.room.RoomService;
import com.ksy.service.user.UserService;
import com.siot.IamportRestHttpClientJava.IamportClient;
import com.siot.IamportRestHttpClientJava.request.CancelData;
import com.siot.IamportRestHttpClientJava.response.IamportResponse;
import com.siot.IamportRestHttpClientJava.response.Payment;

@Controller
@RequestMapping("/order/*")
public class OrderController {

	@Autowired
	@Qualifier("orderServiceImpl")
	private OrderService orderService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("flightServiceImpl")
	private FlightService flightService;
	
	@Autowired
	@Qualifier("roomServiceImpl")
	private RoomService roomService;

	public OrderController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{comm4onProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value = "addFlightOrder", method = RequestMethod.GET)
	public String addFlightOrder( 
			@RequestParam("depCity")String depCity, @RequestParam("tripCourse")String tripCourse,
			@RequestParam("depDate")String depDate, @RequestParam("leadTime")String leadTime,
			@RequestParam("arrCity")String arrCity , @RequestParam("price")int price ,
			@RequestParam("depTime")String depTime , @RequestParam("arrTime")String arrTime,
			@RequestParam("airline")String airline, @RequestParam("stopOver")String stopOver,
			@RequestParam("arrDate")String arrDate, @RequestParam("seatGrade")String seatGrade,
			@RequestParam("adultNum")int adultNum , @RequestParam("childNum")int childNum,
			@RequestParam("infantNum")int infantNum,
			//@ModelAttribute("flight")Flight flight , 
			Model model,
			HttpSession session) throws Exception {
		System.out.println("/addFlightOrder : GET");
		//상품정보 , 주문자 정보 , 결제정보 get
		User user = (User) session.getAttribute("user");
		Order order = new Order();
		System.out.println("user : "+user);
		order.setBuyer(user);
		Flight flight = new Flight();
		flight.setAirline(airline);
		flight.setDepCity(depCity);
		flight.setArrCity(arrCity);
		flight.setDepDate(depDate);
		flight.setArrDate(arrDate);
		flight.setDepTime(depTime);
		flight.setArrTime(arrTime);
		flight.setAdultNum(adultNum);
		flight.setChildNum(childNum);
		flight.setInfantNum(infantNum);
		flight.setStopOver(stopOver);
		flight.setLeadTime(leadTime);
		flight.setTripCourse(tripCourse);
		flight.setPrice(price);
		flight.setSeatGrade(seatGrade);
		flight.setAdultNum(adultNum);
		flight.setChildNum(childNum);
		flight.setInfantNum(infantNum);
		
		System.out.println("userPoint :: "+user.getTotalPoint());
		System.out.println("flight :: "+flight);
		System.out.println("order :: "+order);
		model.addAttribute("flight", flight);
		model.addAttribute("order", order);
		model.addAttribute("user", user);
		
		return "forward:/view/order/addFlightOrder.jsp";
	}
	@RequestMapping(value = "addFlightOrder", method = RequestMethod.POST)
	public String addFlightOrder(
			@RequestParam("addPoint")int addPoint,		@RequestParam("buyerName")String buyerName ,
			@RequestParam("buyerEmail")String buyerEmail , @RequestParam("buyerPhone")String buyerPhone,
			@RequestParam("usedPoint")int usedPoint,@RequestParam("totalAmount")int totalAmount,
			@ModelAttribute("flight")Flight flight, @RequestParam("orderId")String orderId,
			@RequestParam("payPoint")int payPoint, @RequestParam("actualAmount")int actualAmount,
			@RequestParam("payInstal")int payInstal , HttpSession session, HttpServletRequest request,
			Model model) throws Exception {
		System.out.println("/addFlightOrder : POST");
		//결제 후 controller
		User user = (User) session.getAttribute("user");
		System.out.println("user  :: "+user);
		Point point = new Point();
		Order order = new Order();
		
		point.setUserId(user.getUserId());
		point.setRefId(orderId);
		
		user.getTotalPoint();
		
		order.setBuyer(user);
		order.setBuyerEmail(buyerEmail);
		order.setBuyerName(buyerName);
		order.setBuyerPhone(buyerPhone);
		order.setOrderId(orderId);
		order.setPayPoint(payPoint);
		order.setPayInstal(payInstal);
		order.setActualAmount(actualAmount);
		order.setTotalAmount(totalAmount);
		System.out.println("user : "+user);
		System.out.println("order : "+order);
		System.out.println("point : "+point);
		
		flight.setOrderStatus("1"); //주문상태
		order.setOrderStatus("1");
		System.out.println("order : "+order);
		System.out.println("flight : "+flight);
		//flight 상품 insert
		flightService.addFlight(flight);
		//flight Order insert
		System.out.println("orderDate : "+flight.getOrderDate());
		order.setOrderDate(flight.getOrderDate());
		orderService.addFlightOrder(order);
		//포인트 적립
		point.setUsedType("F");
		point.setUsedPoint(addPoint);
		orderService.addPoint(point);
		System.out.println("point 1 : "+point);
		//포인트 사용
		point.setUsedType("U");
		point.setUsedPoint(usedPoint);
		orderService.addPoint(point);
		System.out.println("point 2 : "+point);
		//view로 쏴주기
		model.addAttribute("flight",flight);
		model.addAttribute("order",order);
		model.addAttribute("point",point);
		return "forward:/view/order/addOrderConfirm.jsp";
	}
	
	@RequestMapping(value = "addRoomOrder", method = RequestMethod.GET)
	public String addRoomOrder( @ModelAttribute("room")Room room,
			HttpSession session, Model model) throws Exception {
		System.out.println("/addRoomOrder : GET");
		User user = (User) session.getAttribute("user");
		System.out.println("user : "+user);
		Order order = new Order();
		order.setBuyer(user);
		System.out.println("room ::: "+room);
		model.addAttribute("room", room);
		model.addAttribute("order",order);
		return "forward:/view/order/addRoomOrderjsp";
	}

	@RequestMapping(value = "addRoomOrder", method = RequestMethod.POST)
	public String addRoomOrder(@RequestParam("usedPoint")int usedPoint,@RequestParam("totalAmount")int totalAmount,
			@ModelAttribute("room")Room room, @RequestParam("orderId")String orderId,
			@RequestParam("payPoint")int payPoint, @RequestParam("actualAmount")int actualAmount,
			@RequestParam("payInstal")int payInstal,
			HttpSession session, HttpServletRequest request , Model model) throws Exception {
		System.out.println("/addRoomOrder : POST");
		
		User user = (User) session.getAttribute("user");
		Point point = new Point();
		Order order = new Order();
		point.setUsedPoint(usedPoint);
		point.setUserId(user.getUserId());
		point.setRefId(orderId);
		
		order.setBuyer(user);
		order.setOrderId(orderId);
		order.setPayPoint(payPoint);
		order.setPayInstal(payInstal);
		order.setActualAmount(actualAmount);
		order.setTotalAmount(totalAmount);
		order.setOrderStatus("1");
		
		roomService.addRoom(room);
		orderService.addRoomOrder(order);
		orderService.addPoint(point);
		
		model.addAttribute("room",room);
		model.addAttribute("order",order);
		model.addAttribute("point",point);
		
		return "forward:/view/order/addOrderConfirm.jsp";
	}
	
	@RequestMapping(value = "getOrderList")
	public ModelAndView getOrderList(@ModelAttribute("search") Search search, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("/getOrderList : GET+POST");
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		String buyerId = user.getUserId();

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		//Map<String, Object> map = orderService.getOrderList(search , buyerId);
		Map<String, Object> map = flightService.getFlightList(search ,buyerId);
		Map<String, Object> map2 = roomService.getRoomList(search, buyerId);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("ListPurchaseAction ::" + resultPage);

		List<Order> orderList = (List<Order>) map.get("list");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/view/order/getOrderList.jsp");
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("list2", map2.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("buyerId", buyerId);
		return modelAndView;
	}
	
	@RequestMapping(value = "getOrder", method = RequestMethod.GET)
	public String getOrder(@RequestParam("flightId")String flightId, 
						@RequestParam("roomId")String roomId,
						HttpSession session, Model model) throws Exception {
		System.out.println("/getOrder : GET");
		Order order = new Order();
		Flight flight = new Flight();
		Room room = new Room();
		Point point = (Point) session.getAttribute("point");
		
		
		if (room.getRoomId() == null ) {
			flight = flightService.getFlight(flightId);
			order = orderService.getFlightOrder(flightId);
		}else if(flight.getFlightId() == null) {
			//orderService.getRoomOrder(orderId);
			room = roomService.getRoom(roomId);
		}
		model.addAttribute("flight",flight);
		model.addAttribute("room",room);
		model.addAttribute("order",order);
		model.addAttribute("point",point);

		return "forward:/view/order/getOrder.jsp";
	}
	
	@RequestMapping(value = "getOrderRefund", method = RequestMethod.POST)
	public String getOrderRefund(@RequestParam("flightId")String flightId, 
						@RequestParam("roomId")String roomId,
						HttpSession session, Model model) throws Exception {
		
		
		
		
		return "";
	}
	
///////////////////////////////////환불////////////////////////////////////////

	IamportClient client;

	public void setup() throws Exception {
		String api_key = "1083818024539221";
		String api_secret = "gzVUKM3QNUfC53Ciu8FsqXEwv0Z0NZQ4yLZiy29mWpY1sBkXJZqaW4Gs4GtSFjXd5WvDZF0V4YXxzhuj";

		client = new IamportClient(api_key, api_secret);
	}

	public void testGetToken() throws Exception {
		String token = client.getToken();
		System.out.println("token : " + token);
	}

	@RequestMapping(value = "cancel")
	public void payRefund(@RequestParam("orderId")String orderId ) throws Exception {
		// 이미 취소된 거래 imp_uid
		System.out.println("testCancelPaymentByImpUid --- Start!---");
		setup();
		testGetToken();
		setup();
		Order order = orderService.getFlightOrder(orderId);
		
		CancelData cancel = new CancelData(orderId, true);
		System.out.println("imp_uid : " + order.getOrderId());
		IamportResponse<Payment> cancelpayment = client.cancelPayment(cancel);
		System.out.println(cancelpayment.getMessage());
		System.out.println("testCancelPaymentByImpUid --- End!---");
	}

///////////////////////////////환불 끝///////////////////////////////////////////////
	// Filed
	private WebDriver driver;
	private WebElement webElement;

	// Properties
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "C:/selenium-java-3.141.59/chromedriver_win32/chromedriver.exe";

	// 크롤링 할 URL
	private String base_url;

	////////////////////////////////////////////////////////////
	@RequestMapping(value = "searchFlight", method = RequestMethod.POST)
	public String searchFlight(@ModelAttribute("flight")Flight flight , Model model) throws Exception {
		System.out.println("/selenium : POST");
		//User가 입력한 값 get
		String depCity = flight.getDepCity();
		String arrCity = flight.getArrCity();
		String depDate = flight.getDepDate();
		String arrDate = flight.getArrDate();
		int adultNum = flight.getAdultNum();
		int childNum = flight.getChildNum();
		int infantNum = flight.getInfantNum();
		String seatGrade = flight.getSeatGrade();
		//Date 파싱
		String year = depDate.substring(0, 4);
		String month = depDate.substring(4, 5);// 월
		if (depDate.charAt(4) == '0') {
			month = depDate.substring(5, 6);
		} else {
			return month;
		}
		String date = depDate.substring(6); // 일

		System.out.println("flight : "+flight);
		System.out.println("dep : " + depCity);
		System.out.println("arr : " + arrCity);
		System.out.println("year : " + year);
		System.out.println("month : " + month);
		System.out.println("date :" + date);

		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		// Driver SetUp
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver(options);
		
//		options = webdriver.ChromeOptions() ,
//				options.add_argument('headless') ,
//				options.add_argument('disable-gpu') ,
//				driver = webdriver.Chrome('/Applications/chromedriver', options=options);
		
		base_url = "http://fly.interpark.com/?mbn=tour&mln=tour_air";

		String keyword = "";
		try {
			// get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
			driver.get(base_url);

			System.out.println("selenium 시작");
			synchronized (driver) {
				driver.wait(200);
			}
			// depCity 검색창 선택
			driver.findElement(By.xpath("//*[@id=\"dep_name\"]")).click();
			// depCity 검색어 선택
			driver.findElement(
					By.xpath("//*[@id=\"depCitySearchHistory\"]/div[4]/div/div/table/tbody").linkText(depCity)).click();
			// arrCity 검색창 선택
			driver.findElement(By.xpath("//*[@id=\"arr_name\"]")).click();
			// depCity 검색어 선택
			driver.findElement(
					By.xpath("//*[@id=\"depCitySearchHistory\"]/div[4]/div/div/table/tbody").linkText(arrCity)).click();
			// 달력 아이콘 선택
			driver.findElement(By.xpath("//*[@id=\"depDateArrDate\"]")).click();
			synchronized (driver) {
				driver.wait(800);
			}
			// 년,월 아이콘 클릭
			driver.findElement(By.xpath("//*[@id=\"section0\"]/div[2]/strong/a")).click();
			synchronized (driver) {
				driver.wait(500);
			}
			// 년도 클릭
			driver.findElement(By.xpath("//*[@id=\"0_" + year + "\"]")).click();
			synchronized (driver) {
				driver.wait(500);
			}
			// 월 클릭
			driver.findElement(By.cssSelector("#year_container0 > ul.moth > li:nth-child(" + month + ")")).click();
			synchronized (driver) {
				driver.wait(500);

			}
			// depDate 선택
			driver.findElement(By.xpath("//*[@id=\"dd" + date + "_0\"]/a")).click();
			synchronized (driver) {
				driver.wait(1000);
			}
			// arrDate 선택
			driver.findElement(By.cssSelector("#dd31_1")).click();
			synchronized (driver) {
				driver.wait(1500);
			}
			//num 선택
			driver.findElement(By.xpath("//*[@id=\"peopleChoice\"]")).click();
			if (adultNum > 0) {
				String adult = Integer.toString(adultNum);
				webElement = driver.findElement(By.xpath("//*[@id=\"Adt\"]"));
				webElement.click();
				webElement.clear();
				webElement.sendKeys(adult);
			}else if(childNum > 0 ) {
				String child = Integer.toString(childNum);
				webElement = driver.findElement(By.xpath("//*[@id=\"Chd\"]"));
				webElement.click();
				webElement.clear();
				webElement.sendKeys(child);
			}else if(infantNum > 0) {
				String infant = Integer.toString(infantNum);
				webElement = driver.findElement(By.xpath("//*[@id=\"Inf\"]"));
				webElement.click();
				webElement.clear();
				webElement.sendKeys(infant);
			}
			
			//seat_grade 선택
			webElement = driver.findElement(By.cssSelector("#classSel > ul > li").linkText(seatGrade));
			webElement.click();
			//확인버튼 선택
			driver.findElement(By.xpath("//*[@id=\"peopleChoicePop\"]/div[2]/button[1]"));
			
			
			driver.findElement(By.cssSelector("#cal > div > div.dFoot > a.btn1.btn-enter")).click();
			driver.findElement(By.cssSelector("#searchButton > span")).click();

			System.out.println("============");
			System.out.println("selenium 완료");

			synchronized (driver) {
				driver.wait(10000);

			}

			// List안에 필요한 정보들 넣기
			List<WebElement> airline = driver.findElements(By.cssSelector("#schedule0List > li > div.t1"));
			List<WebElement> dep = driver.findElements(By.cssSelector("#schedule0List > li > div.t2"));
			List<WebElement> arr = driver.findElements(By.cssSelector("#schedule0List > li > div.t3"));
			List<WebElement> stopOver = driver.findElements(By.cssSelector("#schedule0List > li > div.t4"));
			List<WebElement> leadTime = driver.findElements(By.cssSelector("#schedule0List > li > div.t5"));
			List<WebElement> num = driver.findElements(By.cssSelector("#schedule0List > li > div.t6"));
			List<WebElement> price = driver.findElements(By.cssSelector("#schedule0List > li > div.t7"));
			
			List<String> detail = new ArrayList<String>();
			for (WebElement list : airline) {
				detail.add(list.getText());
			}
			List<String> detail2 = new ArrayList<String>();
			for (WebElement list : dep) {
				detail2.add(list.getText());
			}
			List<String> detail3 = new ArrayList<String>();
			for (WebElement list : arr) {
				detail3.add(list.getText());
			}
			List<String> detail4 = new ArrayList<String>();
			for (WebElement list : stopOver) {
				detail4.add(list.getText());
			}
			List<String> detail5 = new ArrayList<String>();
			for (WebElement list : leadTime) {
				detail5.add(list.getText());
			}
			List<String> detail6 = new ArrayList<String>();
			for (WebElement list : num) {
				detail6.add(list.getText());
			}
			List<String> detail7 = new ArrayList<String>();
			for (WebElement list : price) {
				detail7.add(list.getText());
			}
			

			for (int j = 1; j < detail.size(); j++) {
				System.out.println("==============" + j + "번 항공권=============");
				for (int i = 1; i < 9; i++) {
					System.out.println("t1(항공사) :: " + detail.get(i * j));
					System.out.println("t2(출발지역) :: " + detail2.get(i * j));
					System.out.println("t3(도착지역) :: " + detail3.get(i * j));
					System.out.println("t4(경유) :: " + detail4.get(i * j));
					System.out.println("t5(소요시간) :: " + detail5.get(i * j));
					System.out.println("t6(인원) :: " + detail6.get(i * j));
					System.out.println("t7(가격) :: " + detail7.get(i * j));
				}

				List<Flight> flightList = new ArrayList<Flight>();
				for (int i = 0; i < detail.size(); i++) {
					flight.setAirline(detail.get(i));
					flight.setDepDate(detail2.get(i).substring(3));
					flight.setArrDate(detail3.get(i).substring(3));
					flight.setStopOver(detail4.get(i));
					flight.setLeadTime(detail5.get(i));
					flight.setAdultNum(adultNum);
					flight.setChildNum(childNum);
					flight.setInfantNum(infantNum);
					flight.setPrice(Integer.parseInt(detail7.get(i)));
					flightList.add(flight);
					
//	        		   flight.setAirline(detail.get(i));
//	        		   flight.setDeptDate(detail2.get(i));
//	        		   flightList.add(flight);
					model.addAttribute("flightList", flightList);
					System.out.println("model : " + model);
					System.out.println("flightList : " + flightList);
				}
			}
			Thread.sleep(60000);
		} catch (IndexOutOfBoundsException ie) {
			System.out.println("IndexOutOfBounds");
			ie.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			driver.close();
		}

		////////////////////////////////////////////////////////////

		return "forward:/purchase/SeleniumView.jsp";

	}

	@RequestMapping(value = "room", method = RequestMethod.POST)
	public String searchRoom(@ModelAttribute("room")Room room, Model model) throws Exception {
		System.out.println("/selenium : POST");
		
		//User가 검색한 값 get
		String roomCity = room.getRoomCity();
		String checkIn = String.valueOf(room.getCheckIn());
		String checkOut = String.valueOf(room.getCheckOut());
		int roomNum = room.getRoomNum();
		int adultNum = room.getAdultNum();
		int childNum = room.getChildNum();
		
		
		String year = checkIn.substring(0, 4); // 년도
		String month = checkIn.substring(4, 6);// 월
		String date = checkIn.substring(6); // 일

		System.out.println("room : " + room);

		// crawl();
		// public synchronized void crawl() {

		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		// Driver SetUp
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver(options);
		base_url = "https://kr.hotels.com/?intlid=HOME+%3A%3A+header_main_section";

		String keyword = "";
		try {
			// get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
			driver.get(base_url);

			System.out.println("자바스크립트 클릭 시작");
			// arrCity 클릭
			webElement = driver.findElement(By.xpath("//*[@id=\"qf-0q-destination\"]"));
			webElement.clear();
			synchronized (driver) {
				driver.wait(500);

			}
			// text 작성
			webElement.sendKeys(roomCity);
			synchronized (driver) {
				driver.wait(500);

			}
			//광고 제거
			webElement = driver.findElement(By.cssSelector("#managed-overlay > button"));
			webElement.click();
			
			// 다른 곳 터치
			driver.findElement(By.xpath("//*[@id=\"hds-marquee\"]/div[2]/div[1]/div/p")).click();
			synchronized (driver) {
				driver.wait(500);

			}
			// 년,월 아이콘 클릭
			webElement = driver.findElement(By.xpath("//*[@id=\"qf-0q-localised-check-in\"]"));
			webElement.clear();
			synchronized (driver) {
				driver.wait(500);

			}
			// 날짜 작성
			webElement.sendKeys(year + "/" + month + "/" + date);
			synchronized (driver) {
				driver.wait(500);

			}
			// 다른 곳 터치
			driver.findElement(By.xpath("//*[@id=\"hds-marquee\"]/div[2]/div[1]/div/p")).click();
			synchronized (driver) {
				driver.wait(500);

			}
			// 객실 터치
			driver.findElement(By.xpath("//*[@id=\"qf-0q-rooms\"]")).click();
			synchronized (driver) {
				driver.wait(300);

			}
			// 객실 갯수 클릭
			driver.findElement(By.cssSelector("#qf-0q-rooms > option:nth-child(" + roomNum + ")")).click();

			synchronized (driver) {
				driver.wait(500);

			}
			// 검색 클릭
			driver.findElement(By.xpath("//*[@id=\"hds-marquee\"]/div[2]/div[1]/div/form/div[4]/button")).click();
//	            synchronized (driver) {
//	        	   driver.wait(1500);
//			}
			System.out.println("============");
			System.out.println("자바스크립트 클릭 완료");

			synchronized (driver) {
				driver.wait(1000);
			}
			
			int pageDown = 5;
			webElement = driver.findElement(By.tagName("body"));
			while (pageDown > 0) {
				webElement = driver.findElement(By.tagName("body"));
				webElement.sendKeys(Keys.PAGE_DOWN);
				pageDown -= 1;
				synchronized (driver) {
					driver.wait(200);
				}
				System.out.println("페이지 다운11");
			}
			synchronized (driver) {
				driver.wait(1000);
			}
			pageDown = 3;
			while (pageDown > 0) {
				webElement = driver.findElement(By.tagName("body"));
				webElement.sendKeys(Keys.PAGE_DOWN);
				pageDown -= 1;
				synchronized (driver) {
					driver.wait(200);
				}
				System.out.println("페이지 다운22");
			}
			synchronized (driver) {
				driver.wait(1000);
			}
			pageDown = 3;
			while (pageDown > 0) {
				webElement = driver.findElement(By.tagName("body"));
				webElement.sendKeys(Keys.PAGE_DOWN);
				pageDown -= 1;
				synchronized (driver) {
					driver.wait(200);
				}
				System.out.println("페이지 다운33");
			}
			synchronized (driver) {
				driver.wait(1000);
			}
			//숙소이름
			List<WebElement> name = driver
					.findElements(By.cssSelector("#listings > ol > li > article > section > div > h3 > a"));
			//숙소주소
			List<WebElement> addr = driver
					.findElements(By.cssSelector("#listings > ol > li > article > section > div > address > span"));
			//가격
			List<WebElement> price = driver.findElements(
					By.cssSelector("#listings > ol > li > article > section > aside > div.price > a > ins"));
			/////////////////////////////////////이미지////////////////////////////////////////////////////
			  
			  List<WebElement> roomImg = driver.findElements(By.cssSelector(
					  "#listings > ol > li > article > section > div > figure > a > img.u-photo.use-bgimage.featured-img-tablet"));
			  List<String> styleList = new ArrayList<String>();
			  for(WebElement down : roomImg) {
				   styleList.add(down.getAttribute("style"));
			  }
			  //String down = download.getAttribute("style"); //imgUrl 
			  System.out.println("StyleList : "+styleList);
			  List<String> imgSrc = new ArrayList<String>();
			  for(String tempt : styleList) {
				  int start = tempt.indexOf("(")+2; 
				  int end = tempt.lastIndexOf(")")-1;
				  System.out.println("Start : "+start+"End : "+end); 
				  String url =tempt.substring(start , end); 
				  System.out.println("URL : "+url);   
				  //list2.add(url);
				  String savePath =
						  "C:\\Users\\User\\git\\repository\\Exhibition\\11.Model2MVCShop\\WebContent\\images\\uploadFiles\\";
				  String saveFileName = System.currentTimeMillis()+".jpg";
				  String fileFormat = "jpg";
				  
				  System.out.println(" DOWN ::: " + url); 
				  System.out.println(" SAVE PATH ::: "+ savePath); 
				  System.out.println(" SAVE FILE NAME ::: " + saveFileName);
				  System.out.println(" FILE FORMAT ::: " + fileFormat);
				  File saveFile = new File(savePath + saveFileName);
				  imgSrc.add(saveFileName);
				  //saveImage(down, saveFile, fileFormat);
				  
				  URL url2 = new URL(url); 
				  // 다운로드 할 이미지 URL
				  BufferedImage bi = ImageIO.read(url2); 
				  ImageIO.write(bi, fileFormat, saveFile); // 저장할 파일 형식, 저장할 파일명
			  }
			  /////////////////////////////////////이미지////////////////////////////////////////////////////
			  /////////////////////////////////////링크 이동////////////////////////////////////////////////////
			
			List<WebElement> detailLink = driver.findElements(By.cssSelector("#listings > ol > li > article > section > div > figure > a"));
			
			List<String> linkList = new ArrayList<String>();
			  for(WebElement link : detailLink) {
				  linkList.add(link.getAttribute("href"));
			  }
			  System.out.println("linkList : "+linkList);
			
			  /////////////////////////////////링크 이동//////////////////////////////
			List<String> detail = new ArrayList<String>();
			for (WebElement list : name) {
				detail.add(list.getText());
			}
			List<String> detail2 = new ArrayList<String>();
			for (WebElement list : addr) {
				detail2.add(list.getText());
			}
			List<String> detail3 = new ArrayList<String>();
			for (WebElement list : price) {
				detail3.add(list.getText());
			}
			List<String> detail4 = new ArrayList<String>(); 
			for(String saveFileName : imgSrc){
				detail4.add(saveFileName); 
			}
			List<String> detail5 = new ArrayList<String>(); 
			for(WebElement list : detailLink){
				detail5.add(list.getText()); 
			}


			System.out.println("detail : " + detail +"detail2 : "+ detail2 +"detail3 : "+ detail3+"detail4 : "+imgSrc);
			for (int j = 0; j < detail.size(); j++) {
				System.out.println("==============" + j + "번 숙소 =============");
				for (int i = 0; i < 9; i++) {
					System.out.println("t1(숙소이름) :: " + detail.get(i * j));
					System.out.println("t2(주소) :: " + detail2.get(i * j));
					System.out.println("t3(가격) :: " + detail3.get(i * j));
					System.out.println("t4(이미지) :: "+detail4.get(i * j));
					System.out.println("t5(링크) :: "+linkList.get(i*j));
				}
				List<Room> roomList = new ArrayList<Room>(); 
				for(int i=0; i<detail.size();i++) { 
				room.setRoomName(detail.get(i));
				room.setRoomAddr(detail2.get(i));
				room.setPrice(Integer.parseInt(detail3.get(i)));
				room.setRoomImg(detail4.get(i));
				room.setDetailLink(linkList.get(i));
				//검색 시 가져온 정보
				room.setRoomCity(roomCity);
				room.setAdultNum(adultNum);
				room.setChildNum(childNum);
				room.setRoomNum(roomNum);

				roomList.add(room);
				model.addAttribute("roomList",roomList);
				}
			}
		} catch (IndexOutOfBoundsException ie) {
			System.out.println("IndexOutOfBounds");
			ie.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			driver.close();
		}
		synchronized (driver) {
			driver.wait(1500);
		}
		////////////////////////////////////////////////////////////

		return "forward:/purchase/SeleniumView2.jsp";

	}
	
	@RequestMapping(value = "roomDetail")
	public String getRoom(
			@RequestParam("detailLink") String detailLink ,  Model model , HttpRequest request) throws Exception {
		System.out.println("/selenium : POST");
		Room room = new Room();
		room.getRoomAddr();
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		// Driver SetUp
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver(options);
		
		String keyword = "";
		try {
			// get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
			driver.get(detailLink);

			System.out.println("new Link 클릭 시작");
			//숙소이름	
			WebElement name = driver.findElement(By.xpath("//*[@id=\"property-header\"]/div[1]/div[1]/h1"));
			String roomName = name.getText();
			room.setRoomName(roomName);
			
			//무료wifi 주차 기타정보 											
//			WebElement etc = driver.findElement(By.xpath("//*[@id=\"property-header\"]/div/div[3]/ul"));
//			String etc2 = etc.getText();
//			purchase.setReceiverName(etc2);
//			System.out.println("etc : "+purchase.getReceiverName());
			
			//주요편의시설										
			WebElement main = driver.findElement(By.xpath("//*[@id=\"overview-section-4\"]"));
			String mainService = main.getText();
			room.setMainService(mainService);
			//가족단위 편의시설
			WebElement family = driver.findElement(By.xpath("//*[@id=\"overview-section-5\"]"));
			String familyService = family.getText();
			room.setFamilyService(familyService);
			//주요 명소
			WebElement sight = driver.findElement(By.xpath("//*[@id=\"overview-section-6\"]"));
			String sights = sight.getText();
			room.setSights(sights);
			//호텔 내 정보
			WebElement hotel = driver.findElement(By.xpath("//*[@id=\"amenities\"]/div[2]/div/div[1]/div"));
			String hotelInfo = hotel.getText();
			room.setHotelInfo(hotelInfo);
			//객실 내 정보
			WebElement roomIn = driver.findElement(By.xpath("//*[@id=\"amenities\"]/div[2]/div/div[2]"));
			String roomInfo = roomIn.getText();
			room.setRoomInfo(roomInfo);
			//큰 이미지
			WebElement image = driver.findElement(By.xpath("//*[@id=\"carousel-container\"]/div[1]/ul/li[1]"));
			String roomImg = image.getAttribute("data-desktop");
			room.setRoomImg(roomImg);
			
//			 for (WebElement list : etc) {
//				 System.out.println("ETC.. :: "+etc);
//				 System.out.println("List :: "+list.getText());
//			 }
			model.addAttribute("room",room);
		} catch (IndexOutOfBoundsException ie) {
			System.out.println("IndexOutOfBounds");
			ie.printStackTrace();
		} catch (Exception e) {
	
			e.printStackTrace();
	
		} finally {
	
			driver.close();
		}
		synchronized (driver) {
			driver.wait(3000);
		}
		////////////////////////////////////////////////////////////
	
		return "forward:/purchase/roomDetail.jsp";

	}
}