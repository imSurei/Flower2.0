package tw.sure.model.cartItem;
/**
 * session version1.0
 * @author sure
 *
 */
public class CartItem {
	
	private Integer id;
	private String imgPath;
	private String name;
	private String info;
	private Integer count;
	private Integer quantity;
	private Integer price;
	private Integer totalPrice;
	
	public CartItem() {
	}

	public CartItem(Integer id, String imgPath, String name, String info, Integer count, Integer quantity,Integer price,
			Integer totalPrice) {
		super();
		this.id = id;
		this.imgPath = imgPath;
		this.name = name;
		this.info = info;
		this.count = count;
		this.quantity = quantity;
		this.price = price;
		this.totalPrice = totalPrice;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
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

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "CartItem [id=" + id + ", imgPath=" + imgPath + ", name=" + name + ", info=" + info + ", count=" + count
				+ ", quantity=" + quantity + ", price=" + price + ", totalPrice=" + totalPrice + "]";
	}
	
	

}
