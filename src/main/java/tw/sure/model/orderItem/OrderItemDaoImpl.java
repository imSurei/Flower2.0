package tw.sure.model.orderItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import tw.sure.utils.ConnectionUtil;

public class OrderItemDaoImpl implements OrderItemDao {

	@Override
	public int saveOrderItem(OrderItem orderItem) {

		String sql = "insert into f_order_item values(null,?,?,?,?,?);";
		Connection conn = ConnectionUtil.getConnection();
		int saveCount = -1;

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, orderItem.getId());
			pstmt.setString(1, orderItem.getName());
			pstmt.setInt(2, orderItem.getCount());
			pstmt.setInt(3, orderItem.getPrice());
			pstmt.setInt(4, orderItem.getTotalPrice());
			pstmt.setString(5, orderItem.getOrderNo());

			saveCount = pstmt.executeUpdate();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return saveCount;
	}

	@Override
	public List<OrderItem> queryOrderItemsByOrderNo(String orderNo) {

		String sql = "select * from f_order_item where orderNo = ?;";
		List<OrderItem> list = new ArrayList<OrderItem>();
		Connection conn = ConnectionUtil.getConnection();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderNo);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderItem orderItem = new OrderItem();
				orderItem.setId(rs.getInt(1));
				orderItem.setName(rs.getString(2));
				orderItem.setCount(rs.getInt(3));
				orderItem.setPrice(rs.getInt(4));
				orderItem.setTotalPrice(rs.getInt(5));
				orderItem.setOrderNo(rs.getString(6));
				list.add(orderItem);
			}

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
