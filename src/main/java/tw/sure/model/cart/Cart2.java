package tw.sure.model.cart;

import java.util.Map;

import tw.sure.model.cartItem.CartItem2;

public class Cart2 { //未建表
	
	private Integer id;
	private Integer totalCount; //購物車項的總數量，== cartItemMap的size
	private Integer totalMoney; // 同上 不要public set method
	
	private Map<Integer,CartItem2> cartItemMap;
	
	

}
