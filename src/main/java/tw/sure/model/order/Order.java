package tw.sure.model.order;

import java.util.Date;


public class Order {
	
	private String orderNo;
	private Date orderDate;
	private Integer orderMoney;
	// 0-未發貨 1-已發貨 2-已簽收
	private Integer orderStatus = 0;
	private Integer orderUser;
	
//	private List<OrderItem> orderItemList;  //一對多 的一 需要寫，多 不需要寫，order中本來就有很多orderItem 
	
	public Order() {
		
	}
	
	public Order(String orderNo, Date orderDate, Integer orderMoney, Integer orderStatus, Integer orderUser) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.orderMoney = orderMoney;
		this.orderStatus = orderStatus;
		this.orderUser = orderUser;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Integer getOrderMoney() {
		return orderMoney;
	}

	public void setOrderMoney(Integer orderMoney) {
		this.orderMoney = orderMoney;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Integer getOrderUser() {
		return orderUser;
	}

	public void setOrderUser(Integer orderUser) {
		this.orderUser = orderUser;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderDate=" + orderDate + ", orderMoney=" + orderMoney
				+ ", orderStatus=" + orderStatus + ", orderUser=" + orderUser + "]";
	}

}
