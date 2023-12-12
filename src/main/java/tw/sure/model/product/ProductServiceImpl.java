package tw.sure.model.product;

import java.util.List;

public class ProductServiceImpl implements ProductService {
	
	private ProductDao pDao = new ProductDaoImpl();

	@Override
	public int insertProduct(Product product) {
		return pDao.insertProduct(product);
	}

	@Override
	public int updateProduct(Product product) {
		return pDao.updateProduct(product);
	}

	@Override
	public void deleteProductById(Integer id) {
		pDao.deleteProductById(id);
	}

	@Override
	public Product findProductById(Integer id) {
		return pDao.findProductById(id);
	}

	@Override
	public List<Product> findAllProducts() {
		return pDao.findAllProducts();
	}

	@Override
	public void updateQuantity(Integer id,Integer quantity) {
		pDao.updateQuantity(id, quantity);
	}
	

}
