package tw.sure.model.cart;

import java.util.LinkedHashMap;
import java.util.Map;

import tw.sure.model.cartItem.CartItem;

/**
 * session version1.0
 * 
 * @author sure
 */
public class Cart {

//	private Integer totalCount; // 这两个变量不需要set方法，改成get方法内的局部变量，比较省资源
//	private Integer totalPrice;
	private Map<Integer, CartItem> cartItemsMap = new LinkedHashMap<>();

	// -------------------------------------------------
	public void addItem(CartItem cartItem) {

		CartItem item = cartItemsMap.get(cartItem.getId());

		if (item == null) { // 未添加过，添加进cartItemsMap

			cartItemsMap.put(cartItem.getId(), cartItem);

		} else { // 已存在购物车内，此项数量累加，更新总金额

			item.setCount(item.getCount() + 1);
			item.setTotalPrice(item.getCount() * item.getPrice());
		}

	}

	public void deleteItem(Integer id) {
		cartItemsMap.remove(id);
	}

	public void updateCount(Integer id, Integer count) {

		CartItem cartItem = cartItemsMap.get(id);

		if (cartItem != null) {
			cartItem.setCount(count);
			cartItem.setTotalPrice(cartItem.getPrice() * cartItem.getCount());
		}
	}

	public void clearCart() {
		cartItemsMap.clear();
	}

	// ----------------------------------------------------

	public Integer getTotalCount() {
		Integer totalCount = 0;
		for (Map.Entry<Integer, CartItem> entry : cartItemsMap.entrySet()) {
			totalCount += entry.getValue().getCount();
		}
		return totalCount;
	}
	
	// ItemName += "${entry.value.name}"+"_"+"${entry.value.price}"+"元x"+"${entry.value.totalPrice}"+"#";

	public String getItemNames() {
		String ItemNames = "";
		for (Map.Entry<Integer, CartItem> entry : cartItemsMap.entrySet()) {
//			ItemNames += entry.getValue().getName()+"_"+entry.getValue().getPrice()+"元X"+entry.getValue().getCount()+"#";
			ItemNames += entry.getValue().getName()+"/";
		}
		return ItemNames;
	}
	
	public String getItemInfos() {
		String ItemInfos = "";
		for (Map.Entry<Integer, CartItem> entry : cartItemsMap.entrySet()) {
			ItemInfos += "商品 "+entry.getValue().getName()+"："+entry.getValue().getInfo()+"/";
		}
		return ItemInfos;
	}

//	public void setTotalCount(Integer totalCount) {
//		this.totalCount = totalCount;
//	}

	public Integer getTotalPrice() {
		Integer totalPrice = 0;
		for (Map.Entry<Integer, CartItem> entry : cartItemsMap.entrySet()) {
			totalPrice += entry.getValue().getTotalPrice();
		}
		return totalPrice;
	}

//	public void setTotalPrice(Integer totalPrice) {
//		this.totalPrice = totalPrice;
//	}

	public Map<Integer, CartItem> getCartItemsMap() {
		return cartItemsMap;
	}

	public void setCartItemsMap(Map<Integer, CartItem> cartItemsMap) {
		this.cartItemsMap = cartItemsMap;
	}

	@Override
	public String toString() {
		return "Cart [totalCount=" + getTotalCount() + ", totalPrice=" + getTotalPrice() + ", cartItemsMap=" + cartItemsMap + "]";
	}

}
