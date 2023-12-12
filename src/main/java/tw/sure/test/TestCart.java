package tw.sure.test;

import tw.sure.model.cart.Cart;
import tw.sure.model.cartItem.CartItem;

public class TestCart {

	public static void main(String[] args) {
		
		
		Cart cart = new Cart();
		
		cart.addItem(new CartItem(1,"imgpath","haha","info",100,2,7,1000));
		cart.addItem(new CartItem(2,"imgpath","haha","info",100,2,7,1000));
		cart.addItem(new CartItem(3,"imgpath","haha","info",100,2,7,1000));
		
		cart.clearCart();
		
		cart.addItem(new CartItem(3,"imgpath","haha","info",100,1,2,100));
		
		cart.updateCount(3, 10);
		
		
		System.out.println(cart);
		
	}
}
