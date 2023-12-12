package tw.sure.model.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tw.sure.utils.ConnectionUtil;

public class ProductDaoImpl implements ProductDao {

	@Override
	public int insertProduct(Product product) {

		int updateCount = -1;
		// 這邊雖然表格用
		String sql = "insert into product (id,name,type,subtype,place,price,quantity,inventory,info1,info2,imgPath) values(?,?,?,?,?,?,?,?,?,?,?);";
		Connection conn = ConnectionUtil.getConnection();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product.getId());
			pstmt.setString(2, product.getName());
			pstmt.setString(3, product.getType());
			pstmt.setString(4, product.getSubtype());
			pstmt.setString(5, product.getPlace());
			pstmt.setInt(6, product.getPrice());
			pstmt.setInt(7, product.getQuantity());
			pstmt.setInt(8, product.getInventory());
			pstmt.setString(9, product.getInfo1());
			pstmt.setString(10, product.getInfo2());
			pstmt.setString(11, product.getImgPath());

			updateCount = pstmt.executeUpdate();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCount;
	}

	@Override
	public int updateProduct(Product product) {

		int updateCount = -1;
		String sql = "update product set name= ?,type = ?,subtype = ?,place = ?,price = ?,quantity = ?,inventory = ?,"
				+ "info1 = ?,info2 = ?,imgPath = ? where id=?;";
		Connection conn = ConnectionUtil.getConnection();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getName());
			pstmt.setString(2, product.getType());
			pstmt.setString(3, product.getSubtype());
			pstmt.setString(4, product.getPlace());			
			pstmt.setInt(5, product.getPrice());
			pstmt.setInt(6, product.getQuantity());
			pstmt.setInt(7, product.getInventory());
			pstmt.setString(8, product.getInfo1());
			pstmt.setString(9, product.getInfo2());
			pstmt.setString(10, product.getImgPath());
			pstmt.setInt(11, product.getId());

			updateCount = pstmt.executeUpdate();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCount;
	}

	@Override
	public void deleteProductById(Integer id) {

		String sql = "delete from product where id = ?";
		Connection conn = ConnectionUtil.getConnection();

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Product findProductById(Integer id) {

		String sql = "select * from product where id = ?;";
		Connection conn = ConnectionUtil.getConnection();
		Product product = new Product();

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			ResultSet rs = pstmt.executeQuery();
			rs.next();
			product.setId(rs.getInt(1));
			product.setName(rs.getString(2));
			product.setType(rs.getString(3));
			product.setSubtype(rs.getString(4));
			product.setPlace(rs.getString(5));
			product.setPrice(rs.getInt(6));
			product.setQuantity(rs.getInt(7));
			product.setInventory(rs.getInt(8));
			product.setInfo1(rs.getString(9));
			product.setInfo2(rs.getString(10));
			product.setImgPath(rs.getString(11));

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

	@Override
	public List<Product> findAllProducts() {

		List<Product> list = new ArrayList<Product>();
		String sql = "select * from product;";
		Connection conn = ConnectionUtil.getConnection();

		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setType(rs.getString(3));
				product.setSubtype(rs.getString(4));
				product.setPlace(rs.getString(5));
				product.setPrice(rs.getInt(6));
				product.setQuantity(rs.getInt(7));
				product.setInventory(rs.getInt(8));
				product.setInfo1(rs.getString(9));
				product.setInfo2(rs.getString(10));
				product.setImgPath(rs.getString(11));
				list.add(product);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateQuantity(Integer id, Integer quantity) {
		
		String sql = "update product set quantity = ? where id = ?;";
		Connection conn = ConnectionUtil.getConnection();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quantity);
			pstmt.setInt(2, id);
			
			pstmt.executeUpdate();
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
