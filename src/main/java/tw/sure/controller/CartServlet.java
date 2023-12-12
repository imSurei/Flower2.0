package tw.sure.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.sure.model.cart.Cart;
import tw.sure.model.cartItem.CartItem;
import tw.sure.model.product.Product;
import tw.sure.model.product.ProductService;
import tw.sure.model.product.ProductServiceImpl;
import tw.sure.utils.WebUtils;

public class CartServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private ProductService pService = new ProductServiceImpl();

	protected void addItem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = WebUtils.parseInt(request.getParameter("id"), 0);
		Product product = pService.findProductById(id);

		CartItem cartItem = new CartItem(product.getId(), product.getImgPath(), product.getName(), product.getInfo1(),
				1, product.getQuantity(), product.getPrice(), product.getPrice());

		Cart cart = (Cart) request.getSession().getAttribute("cart");

		if (cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		cart.addItem(cartItem);
		pService.updateQuantity(product.getId(), product.getQuantity() - 1); // 數據庫商品數量-1
		System.out.println(cart);

		// jump to product_index page
		String path = request.getScheme() + "://" + request.getServerName();
		response.sendRedirect(path + ":8080/MyFlower2.0/pages/product_index.jsp");

		// or stay the product details page?
//		response.sendRedirect(request.getHeader("Referer"));  // ✨記住這個方法
	}

	protected void deleteItem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = WebUtils.parseInt(request.getParameter("id"), 0);
		int quantity = WebUtils.parseInt(request.getParameter("quantity"), 0);

		Cart cart = (Cart) request.getSession().getAttribute("cart");

		if (cart != null) {
			pService.updateQuantity(id, quantity); // 同樣去數據庫還原商品數量
			cart.deleteItem(id);
			response.sendRedirect(request.getHeader("Referer")); // ✨記住這個方法
		} else {
			System.out.println("移除商品失敗");
		}
	}

	protected void clearCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cart cart = (Cart) request.getSession().getAttribute("cart");

		if (cart != null) {
			// 恢復數據庫 商品數量 one by one
			Map<Integer, CartItem> cartItems = cart.getCartItemsMap();
			for (Map.Entry<Integer, CartItem> entry : cartItems.entrySet()) {
				Integer id = entry.getValue().getId();
				Integer quantity = entry.getValue().getQuantity();
				pService.updateQuantity(id, quantity);
			}
			// 再清空購物車
			cart.clearCart();
			response.sendRedirect(request.getHeader("Referer")); // ✨記住這個方法
		} else {
			System.out.println("清空購物車失敗");
		}
	}

	protected void updateCount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = WebUtils.parseInt(request.getParameter("id"), 0);
		int count = WebUtils.parseInt(request.getParameter("count"), 0);

		Cart cart = (Cart) request.getSession().getAttribute("cart");
		
		Product product = pService.findProductById(id);
		Integer quantity = product.getQuantity();

		// 查看數據庫內 商品數量是否足夠 再修改數據庫內商品數量 及更新購物車該商品的數量
		if (cart != null && count <= quantity) {

			int minsQuantity = quantity - count + 1;
			pService.updateQuantity(id, minsQuantity); // 數據庫減少商品數量
			cart.updateCount(id, count);
			
			// 更新商品小計的cart要重新更新到session中去
			request.getSession().setAttribute("cart", cart);
			response.sendRedirect(request.getHeader("Referer")); // ✨記住這個方法
			
		} else {
			System.out.println("更新商品數量失敗");
			// 信息發給前端，在前端顯示
			request.setAttribute("msg", "購買數量超過庫存，請重新輸入");
//			getSession().setAttribute("msg", "購買數量超過庫存，請修改購買數量");
			request.getRequestDispatcher("/pages/cartStep1.jsp").forward(request, response);
		}
	}
}
