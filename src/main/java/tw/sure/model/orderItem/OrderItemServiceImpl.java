package tw.sure.model.orderItem;

import java.util.List;

public class OrderItemServiceImpl implements OrderItemService {

	private OrderItemDao orderItemDao = new OrderItemDaoImpl();

	@Override
	public List<OrderItem> showOrderDetails(String orderNo) {
		return orderItemDao.queryOrderItemsByOrderNo(orderNo);
	}

}
