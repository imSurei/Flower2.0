package tw.sure.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import tw.sure.model.product.Product;
import tw.sure.model.product.ProductService;
import tw.sure.model.product.ProductServiceImpl;
import tw.sure.utils.WebUtils;

/**
 * Same with UserServlet
 */
//@WebServlet("/ProductServlet")
public class ProductServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private ProductService pService = new ProductServiceImpl();

	/**
	 * 實現產品增刪改查的功能
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Product> products = pService.findAllProducts();

		request.setAttribute("products", products);

		request.getRequestDispatcher("/pages/adminProduct.jsp").forward(request, response);

	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (ServletFileUpload.isMultipartContent(request)) {

			FileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);

			try {
				// 解析上傳數據，得到表單項FileItem
				List<FileItem> list = servletFileUpload.parseRequest(request);
				Product product = new Product();

				for (FileItem fileItem : list) {

					if (fileItem.isFormField()) { // 普通表單項目

//						System.out.println("表單name屬性： " + fileItem.getFieldName());
//						System.out.println("表單vale屬性： " + fileItem.getString("UTF-8"));

						switch (fileItem.getFieldName()) {

						case "id":
							product.setId(WebUtils.parseInt(fileItem.getString("UTF-8"), 0));
							break;
						case "name":
							product.setName(fileItem.getString("UTF-8"));
							break;
						case "type":
							product.setType(fileItem.getString("UTF-8"));
							break;
						case "subtype":
							product.setSubtype(fileItem.getString("UTF-8"));
							break;
						case "place":
							product.setPlace(fileItem.getString("UTF-8"));
							break;
						case "price":
							product.setPrice(WebUtils.parseInt(fileItem.getString("UTF-8"), 0));
							break;
						case "quantity":
							product.setQuantity(WebUtils.parseInt(fileItem.getString("UTF-8"), 0));
							break;
						case "inventory":
							product.setInventory(WebUtils.parseInt(fileItem.getString("UTF-8"), 0));
							break;
						case "info1":
							product.setInfo1(fileItem.getString("UTF-8"));
							break;
						case "info2":
							product.setInfo2(fileItem.getString("UTF-8"));
							break;
						}
					} else { // 上傳的文件

//						System.out.println("文件名File Name屬性： " + fileItem.getFieldName());
						
						product.setImgPath("pics/upload/"+fileItem.getName());
						System.out.println("pics/upload/"+fileItem.getName());
						fileItem.write(new File("/Users/sure/eclipse/MyFlower/MyFlower2.0/src/main/webapp/pages/pics/upload/"
								+ fileItem.getName()));
					}
				}
				pService.insertProduct(product);
				response.sendRedirect(request.getContextPath() + "/manager/ProductServlet?action=list");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void getProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = WebUtils.parseInt(request.getParameter("id"), 0);

		Product product = pService.findProductById(id);

		request.setAttribute("product", product);

		request.getRequestDispatcher("/pages/product_edit.jsp").forward(request, response);

	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		if (ServletFileUpload.isMultipartContent(request)) {

			FileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);

			try {
				// 解析上傳數據，得到表單項FileItem
				List<FileItem> list = servletFileUpload.parseRequest(request);
				Product product = new Product();

				for (FileItem fileItem : list) {

					if (fileItem.isFormField()) { // 普通表單項目

//						System.out.println("表單name屬性： " + fileItem.getFieldName());
//						System.out.println("表單vale屬性： " + fileItem.getString("UTF-8"));

						switch (fileItem.getFieldName()) {

						case "id":
							product.setId(WebUtils.parseInt(fileItem.getString("UTF-8"), 0));
							break;
						case "name":
							product.setName(fileItem.getString("UTF-8"));
							break;
						case "type":
							product.setType(fileItem.getString("UTF-8"));
							break;
						case "subtype":
							product.setSubtype(fileItem.getString("UTF-8"));
							break;
						case "place":
							product.setPlace(fileItem.getString("UTF-8"));
							break;
						case "price":
							product.setPrice(WebUtils.parseInt(fileItem.getString("UTF-8"), 0));
							break;
						case "quantity":
							product.setQuantity(WebUtils.parseInt(fileItem.getString("UTF-8"), 0));
							break;
						case "inventory":
							product.setInventory(WebUtils.parseInt(fileItem.getString("UTF-8"), 0));
							break;
						case "info1":
							product.setInfo1(fileItem.getString("UTF-8"));
							break;
						case "info2":
							product.setInfo2(fileItem.getString("UTF-8"));
							break;
						}
					} else { // 上傳的文件
						
						product.setImgPath("pics/upload/"+fileItem.getName());
						System.out.println("pics/upload/"+fileItem.getName());
						fileItem.write(new File("/Users/sure/eclipse/MyFlower/MyFlower2.0/src/main/webapp/pages/pics/upload/"
								+ fileItem.getName()));

					}
				}
				pService.updateProduct(product);
				response.sendRedirect(request.getContextPath() + "/manager/ProductServlet?action=list");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = WebUtils.parseInt(request.getParameter("id"), 0);

		pService.deleteProductById(id);

		response.sendRedirect(request.getContextPath() + "/manager/ProductServlet?action=list");

	}

	// jump to product_derails page
	protected void getProduct2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = WebUtils.parseInt(request.getParameter("id"), 0);

		Product product = pService.findProductById(id);

		request.setAttribute("product", product);

		request.getRequestDispatcher("/pages/product_details.jsp").forward(request, response);

	}

}
