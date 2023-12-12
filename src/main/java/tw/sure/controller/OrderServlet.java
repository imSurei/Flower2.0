package tw.sure.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.sure.model.cart.Cart;
import tw.sure.model.cartItem.CartItem;
import tw.sure.model.member.Member;
import tw.sure.model.order.Order;
import tw.sure.model.order.OrderService;
import tw.sure.model.order.OrderServiceImpl;
import tw.sure.model.orderItem.OrderItem;
import tw.sure.model.orderItem.OrderItemService;
import tw.sure.model.orderItem.OrderItemServiceImpl;
import tw.sure.utils.WebUtils;

public class OrderServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderServiceImpl();
	private OrderItemService orderItemService = new OrderItemServiceImpl();

	protected void createOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 調用OrderService createOrder(Cart cart, Integer userId)方法
		Cart cart = (Cart) request.getSession().getAttribute("cart");
//		String itemInfos = cart.getItemInfos();
//		request.getSession().setAttribute("itemInfos", itemInfos);
//		String itemNames = cart.getItemNames();
//		request.getSession().setAttribute("itemNames", itemNames);
		
		Member user = (Member) request.getSession().getAttribute("member");
		Integer id = user.getId();
		
		System.out.println("調用orderService的生成訂單方法...");
		String orderNo = orderService.createOrder(cart, id);
		
		// 將order存進session，以便金流拿數據
		Order order = orderService.findOrderByOrderNo(orderNo);
		request.getSession().setAttribute("order", order);
//		request.getSession().setAttribute("orderNo", order.getOrderNo());
//		request.getSession().setAttribute("orderDate", order.getOrderDate());
//		request.getSession().setAttribute("orderMoney", order.getOrderMoney());
		
		// 保存訂單後，將產品數量根據訂單數減少，並清空購物車
//		Map<Integer, CartItem> cartItems = cart.getCartItemsMap();
//		String itemNames = cart.getItemNames();
		
		
		
		cart.clearCart(); // 清空購物車
//		request.getRequestDispatcher("/pages/ECPayClient.jsp").forward(request, response);
		// 已保存數據到session，就用重定向，避免請求轉發遇到刷新反覆提交數據的問題
		response.sendRedirect(request.getContextPath()+"/pages/cartStep4.jsp");
	}
	
	protected void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<Order> orders = orderService.showAllOrders();
		
		request.setAttribute("orders", orders);
		
		request.getRequestDispatcher("/pages/adminOrders.jsp").forward(request, response);	
		
	}
	
	protected void changeOrderStatus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String orderNo = request.getParameter("orderNo");
//			int orderStatus = WebUtils.parseInt(request.getParameter("orderStatus"), 0); //前台已驗證status狀態，不需要再傳該參數
			
			orderService.changeOrderStatus(orderNo,1); // status自定義
			
			response.sendRedirect(request.getHeader("Referer"));
		
	}
	
	protected void changeOrderStatus2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String orderNo = request.getParameter("orderNo");
//			int orderStatus = WebUtils.parseInt(request.getParameter("orderStatus"), 0); //前台已驗證status狀態，不需要再傳該參數
			
			orderService.changeOrderStatus(orderNo,2); // status自定義
			
			response.sendRedirect(request.getHeader("Referer"));
		
	}
	
	
	protected void showOrderDetails(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String orderNo = request.getParameter("orderNo");
		
		List<OrderItem> items = orderItemService.showOrderDetails(orderNo);
		
		request.setAttribute("orderItems", items);
		
		request.getRequestDispatcher("/pages/orderDetails.jsp").forward(request, response);
	}
	
	protected void showOrderDetails2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String orderNo = request.getParameter("orderNo");
		
		List<OrderItem> items = orderItemService.showOrderDetails(orderNo);
		
		request.setAttribute("orderItems", items);
		
		request.getRequestDispatcher("/pages/userOrderDetails.jsp").forward(request, response);
	}
	
	protected void showMyOrders(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int userId = WebUtils.parseInt(request.getParameter("userId"), 0);
		
		List<Order> myOrders = orderService.showMyOrders(userId);
		
		request.setAttribute("myOrders", myOrders);
		
		request.getRequestDispatcher("/pages/userOrders.jsp").forward(request, response);
	}

}
