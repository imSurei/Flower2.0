package tw.sure.utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.pool.DruidPooledConnection;

/*
 * JNDI 
 * 使用 靜態方法 減少new 浪費資源
 * 工具類盡量用static方法
 */
public class ConnectionUtil {

	private static DruidDataSource dataSource;

	static {

		try {

			Properties properties = new Properties();
			// 讀取jdbc文件
			InputStream inputStream = ConnectionUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
			// 從流中加載數據
			properties.load(inputStream);

			// 創建數據庫連接池
			dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);

//			System.out.println(dataSource.getConnection());  success

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

//	public static DataSource getDataSource() {
//
//		DataSource ds = null;
//
//		try {
//			InitialContext ic = new InitialContext();
//			ds = (DataSource) ic.lookup("java:comp/env/jdbc/mysql");
//
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//		return ds;
//	}

//	public static Connection getConnection() {
//
//		Connection conn = null;
//
//		try {
//
//			DataSource ds = getDataSource();
//			if (ds != null)
//				conn = ds.getConnection();
//			System.out.println("connect DB successful...");
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return conn;
//	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void freeConn(Connection conn) {
		try {
			if (conn != null)
				conn.close();

			System.out.println("conn is closed...");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
