package tw.sure.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import tw.sure.utils.ConnectionUtil;

@WebServlet("/TestConectDB")
public class TestConectDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TestConectDB() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		getConnection();
//		ConnectionUtil.getConnection();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private Connection getConnection() {

		Connection conn = null;

		try {
			DataSource ds = getDataSource();

			if (ds != null)
				conn = ds.getConnection();
			    System.out.println("connect DB successful.");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	private DataSource getDataSource() {

		DataSource ds = null;

		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource)ic.lookup("java:comp/env/jdbc/mysql");
			
//			Context context = (Context) ic.lookup("java:comp/env");
//			ds = (DataSource) context.lookup("jdbc/mysql");

		} catch (NamingException e) {
			e.printStackTrace();
		}
		return ds;
	}

}
