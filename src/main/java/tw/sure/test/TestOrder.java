package tw.sure.test;

import java.util.Date;
import java.util.List;

import tw.sure.model.cart.Cart;
import tw.sure.model.cartItem.CartItem;
import tw.sure.model.order.Order;
import tw.sure.model.order.OrderDao;
import tw.sure.model.order.OrderDaoImpl;
import tw.sure.model.order.OrderService;
import tw.sure.model.order.OrderServiceImpl;
import tw.sure.model.orderItem.OrderItem;
import tw.sure.model.orderItem.OrderItemDao;
import tw.sure.model.orderItem.OrderItemDaoImpl;
import tw.sure.model.orderItem.OrderItemService;
import tw.sure.model.orderItem.OrderItemServiceImpl;

public class TestOrder {

	public static void main(String[] args) {

		OrderDao oDao = new OrderDaoImpl();
		OrderItemDao oItemDao = new OrderItemDaoImpl();

//		System.out.println(new Order("2",new Date(),2,1,1));

//		oDao.saveOrder(new Order("7",new Date(),999,1,1));

//		oItemDao.saveOrderItem(new OrderItem(1,"jack",22,100,2200,"6"));

//		System.out.println(new Date());

//		Cart cart = new Cart();

//		cart.addItem(new CartItem(3,"imgpath","hello","info",1,300,300));

		OrderService orderService = new OrderServiceImpl();
		OrderItemService orderItemService = new OrderItemServiceImpl();

//		System.out.println(orderService.createOrder(cart, 1));

//		List<Order> orders = orderService.showAllOrders();
//		for (Order order : orders) {
//			System.out.println(order);
//		}

//		List<Order> orders2 = orderService.showMyOrders(1);
//		for (Order order : orders2) {
//			System.out.println(order);
//		}

		List<OrderItem> orderItems = orderItemService.showOrderDetails("16693679805555");
		for (OrderItem orderItem : orderItems) {
			System.out.println(orderItem);
		}

	}

}
