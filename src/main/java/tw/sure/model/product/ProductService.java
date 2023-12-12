package tw.sure.model.product;

import java.util.List;

public interface ProductService {
	
	int insertProduct(Product product);

	int updateProduct(Product product);
	
	void updateQuantity(Integer id,Integer quantity);

	void deleteProductById(Integer id);

	Product findProductById(Integer id);

	List<Product> findAllProducts();

}
