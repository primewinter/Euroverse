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
import com.ksy.service.myPage.MyPageService;
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
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService myPageService;
	
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
		
		User reloadUser = userService.getUser(user.getUserId());
		System.out.println("현재포인트는 "+reloadUser.getTotalPoint());
		session.setAttribute("user", reloadUser);
		
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
		
		order.setOrderStatus("1"); //주문상태
		System.out.println("order : "+order);
		System.out.println("flight : "+flight);
		//flight 상품 insert
		flightService.addFlight(flight);
		//flight Order insert
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
		//total에 합산하기
		myPageService.updateTotalPoint(point);
		//User Session 다시 받아오기
		User reloadUser = userService.getUser(user.getUserId());
		System.out.println("현재포인트는 "+reloadUser.getTotalPoint());
		session.setAttribute("user", reloadUser);
		
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
		
		User reloadUser = userService.getUser(user.getUserId());
		System.out.println("현재포인트는 "+reloadUser.getTotalPoint());
		session.setAttribute("user", reloadUser);
		
		System.out.println("room ::: "+room);
		model.addAttribute("room", room);
		model.addAttribute("order",order);
		return "forward:/view/order/addRoomOrder.jsp";
	}

	@RequestMapping(value = "addRoomOrder", method = RequestMethod.POST)
	public String addRoomOrder(@RequestParam("usedPoint")int usedPoint,@RequestParam("totalAmount")int totalAmount,
			@RequestParam("buyerName")String buyerName ,
			@RequestParam("buyerEmail")String buyerEmail , @RequestParam("buyerPhone")String buyerPhone,
			@ModelAttribute("room")Room room, @RequestParam("orderId")String orderId,
			@RequestParam("payPoint")int payPoint, @RequestParam("actualAmount")int actualAmount,
			@RequestParam("payInstal")int payInstal,@RequestParam("addPoint")int addPoint,
			HttpSession session, HttpServletRequest request , Model model) throws Exception {
		System.out.println("/addRoomOrder : POST");
		User user = (User) session.getAttribute("user");
		Point point = new Point();
		Order order = new Order();
		System.out.println("room : "+room);
		user.getTotalPoint();
		
		point.setUsedPoint(usedPoint);
		point.setUserId(user.getUserId());
		point.setRefId(orderId);
		
		order.setBuyer(user);
		order.setBuyerName(buyerName);
		order.setBuyerPhone(buyerPhone);
		order.setBuyerEmail(buyerEmail);
		order.setOrderId(orderId);
		order.setPayPoint(payPoint);
		order.setPayInstal(payInstal);
		order.setActualAmount(actualAmount);
		order.setTotalAmount(totalAmount);
		order.setOrderStatus("1");//주문상태
		
		//상품 add
		roomService.addRoom(room);
		//예약 add
		orderService.addRoomOrder(order);
		//포인트 적립
		point.setUsedType("R");
		point.setUsedPoint(addPoint);
		orderService.addPoint(point);
		System.out.println("point 1 : "+point);
		//포인트 사용
		point.setUsedType("U");
		point.setUsedPoint(usedPoint);
		orderService.addPoint(point);
		//total에 합산하기
		myPageService.updateTotalPoint(point);
		//User Session 다시 받아오기
		User reloadUser = userService.getUser(user.getUserId());
		System.out.println("현재포인트는 "+reloadUser.getTotalPoint());
		session.setAttribute("user", reloadUser);

		order.setAddPoint(addPoint); // db에는 안넣음..
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
	
	@RequestMapping(value = "getOrderListAdmin")
	public ModelAndView getOrderListAdmin(@ModelAttribute("search") Search search, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("/getOrderListAdmin : GET+POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = flightService.getFlightListAdmin(search);
		Map<String, Object> map2 = roomService.getRoomListAdmin(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("ListPurchaseAction ::" + resultPage);


		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/view/order/getOrderListAdmin.jsp");
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("list2", map2.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value = "getFlightOrder", method = RequestMethod.GET)
	public String getFlightOrder(@RequestParam("flightId")String flightId, 
						HttpSession session, Model model) throws Exception {
		System.out.println("/getFlightOrder : GET");
		Order order = new Order();
		Flight flight = new Flight();
		Point point = (Point) session.getAttribute("point");
		System.out.println("얍 "+point);
		flight = flightService.getFlight(flightId);
		order = orderService.getFlightOrder(flightId);
		
		model.addAttribute("flight",flight);
		model.addAttribute("order",order);
		model.addAttribute("point",point);

		return "forward:/view/order/getOrder.jsp";
	}
	
	@RequestMapping(value = "getRoomOrder", method = RequestMethod.GET)
	public String getRoomOrder(
						@RequestParam("roomId")String roomId,
						HttpSession session, Model model) throws Exception {
		System.out.println("/getRoomOrder : GET");
		Order order = new Order();
		Room room = new Room();
		Point point = (Point) session.getAttribute("point");
		
		order = orderService.getRoomOrder(roomId);
		room = roomService.getRoom(roomId);
		
		model.addAttribute("room",room);
		model.addAttribute("order",order);
		model.addAttribute("point",point);

		return "forward:/view/order/getOrder.jsp";
	}
	
	@RequestMapping(value = "getOrderRefund", method = RequestMethod.GET)
	public String getOrderRefund(@ModelAttribute("order") Order order,
						@RequestParam("orderId")String orderId, 
						@RequestParam("orderStatus")String orderStatus,
						HttpSession session, Model model, HttpServletRequest request) throws Exception {
		System.out.println("/getOrderRefund : GET");
		
		order.setOrderStatus(orderStatus);
		order.setOrderId(orderId);
		orderService.getOrderRefund(order);
		
		model.addAttribute("order",order);

		return "forward:/order/getOrderList";
	}
	

	
}