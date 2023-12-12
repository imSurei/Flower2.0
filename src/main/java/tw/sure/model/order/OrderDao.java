package tw.sure.model.order;

import java.util.List;

public interface OrderDao {

	// 生成訂單
	int saveOrder(Order order);
	
	// 通過orderNo查找該筆order資料
	Order findOrderByOrderNo(String orderNo);

	// 查詢所有訂單
	List<Order> queryOrders();

	// 更改訂單狀態
	int changeOrderStatus(String orderNo, Integer status);

	// 查看用戶所有訂單
	List<Order> queryOrdersByUserId(Integer userId);

}
