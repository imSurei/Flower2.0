package tw.sure.model.orderItem;

import java.util.List;

public interface OrderItemService {
	
	// 根據訂單號 查詢所有訂單項
	List<OrderItem> showOrderDetails(String orderNo);

}
