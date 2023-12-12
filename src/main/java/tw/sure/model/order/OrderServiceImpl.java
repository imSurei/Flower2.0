package tw.sure.model.order;

import java.util.Date;
import java.util.List;
import java.util.Map;

import tw.sure.model.cart.Cart;
import tw.sure.model.cartItem.CartItem;
import tw.sure.model.orderItem.OrderItem;
import tw.sure.model.orderItem.OrderItemDao;
import tw.sure.model.orderItem.OrderItemDaoImpl;

public class OrderServiceImpl implements OrderService {

	private OrderDao orderDao = new OrderDaoImpl();
	private OrderItemDao orderItemDao = new OrderItemDaoImpl();

	@Override
	public String createOrder(Cart cart, Integer userId) {

		// step1:保存訂單
		// orderNo 需要唯一性 --> 時間戳，雙十一搶0點0秒，又不會是唯一，所以還要加上userId
		String orderNo = System.currentTimeMillis() + "" + userId;

		Order order = new Order(orderNo, new Date(), cart.getTotalPrice(), 0, userId);
		orderDao.saveOrder(order);

		// step2:保存訂單項 --> 購物車的商品項 == 訂單項 --> 遍歷商品項轉換成訂單項保存即可
		for (Map.Entry<Integer, CartItem> entry : cart.getCartItemsMap().entrySet()) {
			
			CartItem cartItem = entry.getValue();
			
			OrderItem orderItem = new OrderItem(null,cartItem.getName(),cartItem.getCount(),cartItem.getPrice(),cartItem.getTotalPrice(),orderNo);
			
			orderItemDao.saveOrderItem(orderItem);
		}
		
		// step3:生成訂單後，要清空購物車？
//		cart.clearCart();
		//	返回訂單號
		return orderNo;
	}

	@Override
	public List<Order> showAllOrders() {
		return orderDao.queryOrders();
	}

	@Override
	public int changeOrderStatus(String orderNo, Integer status) {
		return orderDao.changeOrderStatus(orderNo, status);
	}

	@Override
	public List<Order> showMyOrders(Integer userId) {
		return orderDao.queryOrdersByUserId(userId);
	}

	@Override
	public Order findOrderByOrderNo(String orderNo) {
		return orderDao.findOrderByOrderNo(orderNo);
	}

	

	

}
