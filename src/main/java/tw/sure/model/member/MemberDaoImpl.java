package tw.sure.model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tw.sure.utils.ConnectionUtil;

public class MemberDaoImpl implements MemberDao {

	@Override
	public Member findMemberByAccount(String account) {

		Member member = new Member();

		Connection conn = ConnectionUtil.getConnection();

		String sql = "select * from member where account = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);

			ResultSet rs = pstmt.executeQuery();
			rs.next(); // 只有一筆資料 所以不用while loop
			member.setId(rs.getInt("id"));
			member.setName(rs.getString("name"));
			member.setAccount(rs.getString("account"));
			member.setPassword(rs.getString("password"));
			member.setEmail(rs.getString("email"));
			member.setBirthDate(rs.getString("birthDate"));
			member.setGender(rs.getString("gender"));
			member.setAddress(rs.getString("address"));
			member.setPhone(rs.getString("phone"));
			member.setStatus(rs.getString("status"));

			conn.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return member;
	}
	
	@Override
	public Member findMemberByAccountAndEmail(String account,String email) {
		
		Member member = new Member();

		Connection conn = ConnectionUtil.getConnection();

		String sql = "select * from member where account= ? and email = ?;";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setString(2, email);

			ResultSet rs = pstmt.executeQuery();
			rs.next(); // 只有一筆資料 所以不用while loop
			member.setId(rs.getInt("id"));
			member.setName(rs.getString("name"));
			member.setAccount(rs.getString("account"));
			member.setPassword(rs.getString("password"));
			member.setEmail(rs.getString("email"));
			member.setBirthDate(rs.getString("birthDate"));
			member.setGender(rs.getString("gender"));
			member.setAddress(rs.getString("address"));
			member.setPhone(rs.getString("phone"));
			member.setStatus(rs.getString("status"));

			conn.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return member;
	}

	@Override
	public Member findMemberByAccountAndPassword(String account, String password) {

		Member member = new Member();

		Connection conn = ConnectionUtil.getConnection();

		String sql = "select * from member where account = ? and password = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setString(2, password);

			ResultSet rs = pstmt.executeQuery();
			rs.next(); // 只有一筆資料 所以不用while loop
			member.setId(rs.getInt("id"));
			member.setName(rs.getString("name"));
			member.setAccount(rs.getString("account"));
			member.setPassword(rs.getString("password"));
			member.setEmail(rs.getString("email"));
			member.setBirthDate(rs.getString("birthDate"));
			member.setGender(rs.getString("gender"));
			member.setAddress(rs.getString("address"));
			member.setPhone(rs.getString("phone"));
			member.setStatus(rs.getString("status"));

			conn.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return member;

	}

	@Override
	public List<Member> findAllMembers() {

		List<Member> list = new ArrayList<Member>();
		String sql = "select * from member";
		Connection conn = ConnectionUtil.getConnection();

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Member member = new Member();
				member.setId(rs.getInt(1));
				member.setName(rs.getString(2));
				member.setAccount(rs.getString(3));
				member.setPassword(rs.getString(4));
				member.setEmail(rs.getString(5));
				member.setBirthDate(rs.getString(6));
				member.setGender(rs.getString(7));
				member.setAddress(rs.getString(8));
				member.setPhone(rs.getString(9));
				member.setStatus(rs.getString(10));
				list.add(member);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertMember(Member m, String status) {

		Connection conn = ConnectionUtil.getConnection();
		String sql = "insert into member values(null,?,?,?,?,?,?,?,?,?);";
		int updateCount = -1;

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setString(2, m.getAccount());
			pstmt.setString(3, m.getPassword());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getBirthDate());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getPhone());
			pstmt.setString(9, status);

			updateCount = pstmt.executeUpdate();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateCount;
	}

	@Override
	public int updateMember(Member m) {

		int updateCount = -1;
		Connection conn = ConnectionUtil.getConnection();
		String sql = "update member set name = ?,account = ?,password = ?,email = ?,birthDate = ?,"
				+ "gender = ?,address = ?,phone = ?,status = ? where id = ?;";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setString(2, m.getAccount());
			pstmt.setString(3, m.getPassword());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getBirthDate());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getPhone());
			pstmt.setString(9, m.getStatus());
			pstmt.setInt(10, m.getId());
			
			updateCount = pstmt.executeUpdate();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCount;
	}

	@Override
	public void deleteMember(int id) {
		
		String sql = "delete from member where id = ?;";
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

}
