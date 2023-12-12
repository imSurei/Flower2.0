package tw.sure.test;

import java.util.List;

import tw.sure.model.product.Product;
import tw.sure.model.product.ProductDao;
import tw.sure.model.product.ProductDaoImpl;
import tw.sure.model.product.ProductService;
import tw.sure.model.product.ProductServiceImpl;

public class TestProductDao {

	public static void main(String[] args) {
		
//		ProductDao pDao = new ProductDaoImpl();
		
		// ok
//		int insertProduct = pDao.insertProduct(new Product(11,"11","flower","rose","taiwan",100,99,100,"info1","info2","src/img"));
//		System.out.println(insertProduct);
		
		// ok 
//		int updateProduct = pDao.updateProduct(new Product(9,"9","flower","nose","taiwan",100,99,100,"info1","info2","src/img"));
//		System.out.println(updateProduct);
		
		// ok
//		pDao.deleteProductById(13);
	
		
		// ok
//		Product findProductById = pDao.findProductById(9);
//		System.out.println(findProductById);
		
		// ok
//		List<Product> findAllProducts = pDao.findAllProducts();
//		for(Product p:findAllProducts) {
//			System.out.println(p);
//		}
		
		//-----------------------------------------------------
		
		ProductService pService = new ProductServiceImpl();
		
		// ok
//		System.out.println(pService.findProductById(1));
		
		// ok
//		List<Product> findAllProducts = pService.findAllProducts();
//		for(Product p:findAllProducts) {
//			System.out.println(p);
//		}
		
		// ok
//		pService.deleteProductById(24);
		
		
		// ok
//		Product product = new Product(12,"10","花束啊啊啊啊啊","玫瑰","台灣",100,99,100,"你好","你好too","src/img");
//		System.out.println(product);
//		System.out.println(pService.insertProduct(product));
//		System.out.println(product);
		
		// ok
//		pService.updateProduct(new Product(9,"9","flower","rose","taiwan",100,99,100,"info1","info2","src/img"));
		
		
		
		

	}

}
