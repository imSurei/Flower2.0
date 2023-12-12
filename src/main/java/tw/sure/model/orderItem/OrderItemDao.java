package tw.sure.model.orderItem;

import java.util.List;

public interface OrderItemDao {
	
	// 生成訂單項
	int saveOrderItem(OrderItem orderItem);
	
	// 根據訂單號 查詢所有訂單項
	List<OrderItem> queryOrderItemsByOrderNo(String orderNo);

}
