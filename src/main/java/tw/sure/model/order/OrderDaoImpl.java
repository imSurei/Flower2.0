package tw.sure.model.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tw.sure.utils.ConnectionUtil;

public class OrderDaoImpl implements OrderDao {

	@Override
	public int saveOrder(Order order) {

		String sql = "insert into f_order values(?,?,?,?,?);";
		Connection conn = ConnectionUtil.getConnection();
		int saveCount = -1;

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order.getOrderNo());
			pstmt.setDate(2, new java.sql.Date(order.getOrderDate().getTime()));
			pstmt.setInt(3, order.getOrderMoney());
			pstmt.setInt(4, order.getOrderStatus());
			pstmt.setInt(5, order.getOrderUser());

			saveCount = pstmt.executeUpdate();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return saveCount;
	}

	@Override
	public List<Order> queryOrders() {

		String sql = "select * from f_order;";
		Connection conn = ConnectionUtil.getConnection();
		List<Order> list = new ArrayList<Order>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				order.setOrderNo(rs.getString(1));
				order.setOrderDate(rs.getDate(2));
				order.setOrderMoney(rs.getInt(3));
				order.setOrderStatus(rs.getInt(4));
				order.setOrderUser(rs.getInt(5));

				list.add(order);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int changeOrderStatus(String orderNo, Integer status) {

		String sql = "update f_order set orderStatus = ? where orderNo = ?;";
		Connection conn = ConnectionUtil.getConnection();
		int count = -1;

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setString(2, orderNo);
			count = pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<Order> queryOrdersByUserId(Integer userId) {

		String sql = "select * from f_order where orderUser = ?;";
		Connection conn = ConnectionUtil.getConnection();
		List<Order> list = new ArrayList<Order>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				order.setOrderNo(rs.getString(1));
				order.setOrderDate(rs.getDate(2));
				order.setOrderMoney(rs.getInt(3));
				order.setOrderStatus(rs.getInt(4));
				order.setOrderUser(rs.getInt(5));
				list.add(order);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Order findOrderByOrderNo(String orderNo) {
		
		String sql = "select * from f_order where orderNo = ?;";
		Connection conn = ConnectionUtil.getConnection();
		Order order = new Order();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderNo);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			order.setOrderNo(rs.getString(1));
			order.setOrderDate(rs.getDate(2));
			order.setOrderMoney(rs.getInt(3));
			order.setOrderStatus(rs.getInt(4));
			order.setOrderUser(rs.getInt(5));
					
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return order;
	}

}
