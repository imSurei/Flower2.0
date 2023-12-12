package tw.sure.model.orderItem;


public class OrderItem {
	
	private Integer id;
	private String name;
	private Integer count;
	private Integer price;
	private Integer totalPrice;
	private String orderNo;
	
	public OrderItem() {
	}

	public OrderItem(Integer id, String name, Integer count, Integer price, Integer totalPrice, String orderNo) {
		super();
		this.id = id;
		this.name = name;
		this.count = count;
		this.price = price;
		this.totalPrice = totalPrice;
		this.orderNo = orderNo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return "OrderItem [id=" + id + ", name=" + name + ", count=" + count + ", price=" + price + ", totalPrice="
				+ totalPrice + ", orderNo=" + orderNo + "]";
	}

}
