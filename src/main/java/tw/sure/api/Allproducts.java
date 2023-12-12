package tw.sure.api;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import tw.sure.model.product.Product;
import tw.sure.model.product.ProductService;
import tw.sure.model.product.ProductServiceImpl;

@WebServlet("/Allproducts")
public class Allproducts extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService pService = new ProductServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Origin", "*");

		List<Product> allProducts = pService.findAllProducts();

		Gson gson = new Gson();

		String json = gson.toJson(allProducts);

		response.getWriter().print(json);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
