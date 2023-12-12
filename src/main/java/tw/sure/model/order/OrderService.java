package tw.sure.model.order;

import java.util.List;

import tw.sure.model.cart.Cart;

public interface OrderService {

	// 生成訂單
	String createOrder(Cart cart, Integer userId);

	// 通過orderNo查找該筆order資料
	Order findOrderByOrderNo(String orderNo);

	// 查詢所有訂單
	List<Order> showAllOrders();

	// 更改訂單狀態
	int changeOrderStatus(String orderNo, Integer status);

	// 查看用戶所有訂單
	List<Order> showMyOrders(Integer userId);

}
