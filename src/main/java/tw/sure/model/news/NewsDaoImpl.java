package tw.sure.model.news;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import tw.sure.utils.ConnectionUtil;

public class NewsDaoImpl implements NewsDao {

	@Override
	public News findNewsById(Integer id) {

		String sql = "select * from news where id = ?;";
		Connection conn = ConnectionUtil.getConnection();
		News news = new News();

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			ResultSet rs = pstmt.executeQuery();
			rs.next();
			news.setId(rs.getInt("id"));
			news.setDate(rs.getString("date"));
			news.setTitle(rs.getString("title"));
			news.setContent(rs.getString("content"));

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return news;
	}

	@Override
	public List<News> findAllNews() {

		List<News> list = new ArrayList<News>();
		String sql = "select * from news";
		Connection conn = ConnectionUtil.getConnection();

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				News news = new News();
				news.setId(rs.getInt(1));
				news.setDate(rs.getString(2));
				news.setTitle(rs.getString(3));
				news.setContent(rs.getString(4));
				list.add(news);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertNews(News news) {

		int insertCount = -1;
		String sql = "insert into news(date,title,content)values(?,?,?);";
		Connection conn = ConnectionUtil.getConnection();

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, news.getDate());
			pstmt.setString(2, news.getTitle());
			pstmt.setString(3, news.getContent());

			insertCount = pstmt.executeUpdate();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertCount;
	}

	@Override
	public int updateNews(News news) {

		int updateCount = -1;
		String sql = "update news set date = ?,title = ?,content = ? where id = ?;";
		Connection conn = ConnectionUtil.getConnection();

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, news.getDate());
			pstmt.setString(2, news.getTitle());
			pstmt.setString(3, news.getContent());
			pstmt.setInt(4, news.getId());

			updateCount = pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCount;
	}

	@Override
	public void deleteNews(Integer id) {

		String sql = "delete from news where id = ?;";
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
