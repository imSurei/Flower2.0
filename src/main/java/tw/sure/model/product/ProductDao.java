package tw.sure.model.product;

import java.util.List;

public interface ProductDao {

	// 新增、修改統一用int返回值，記住這個crud組合的返回值類型
	int insertProduct(Product product);

	int updateProduct(Product product);
	
	// 根據id更新產品剩餘數量
	void updateQuantity(Integer id,Integer quantity);
 
	void deleteProductById(Integer id);

	Product findProductById(Integer id);

	List<Product> findAllProducts();

}
