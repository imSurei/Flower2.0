package tw.sure.model.product;

public class Product {

	private Integer id;
	private String name;
	private String type;
	private String subtype;
	private String place;
	private Integer price;
	private Integer quantity;
	private Integer inventory;
	private String info1;
	private String info2;
	private String imgPath;

	public Product() {
	}

	public Product(Integer id, String name, String type, String subtype, String place, Integer price, Integer quantity,
			Integer inventory, String info1, String info2, String imgPath) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.subtype = subtype;
		this.place = place;
		this.price = price;
		this.quantity = quantity;
		this.inventory = inventory;
		this.info1 = info1;
		this.info2 = info2;
		this.imgPath = imgPath;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSubtype() {
		return subtype;
	}

	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getInventory() {
		return inventory;
	}

	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}

	public String getInfo1() {
		return info1;
	}

	public void setInfo1(String info1) {
		this.info1 = info1;
	}

	public String getInfo2() {
		return info2;
	}

	public void setInfo2(String info2) {
		this.info2 = info2;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
			this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", type=" + type + ", subtype=" + subtype + ", place=" + place
				+ ", price=" + price + ", quantity=" + quantity + ", inventory=" + inventory + ", info1=" + info1
				+ ", info2=" + info2 + ", imgPath=" + imgPath + "]";
	}

}
