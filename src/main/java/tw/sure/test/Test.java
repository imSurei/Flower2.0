package tw.sure.test;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.sure.model.member.Member;
import tw.sure.model.member.MemberDaoImpl;
import tw.sure.utils.ConnectionUtil;

@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Test() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 使用jdbc連接 服務器 測試，需要在servlet裡面run

		// ok
//		Connection conn = ConnectionUtil.getConnection();
//		ConnectionUtil.freeConn(conn);

		// ok
//		MemberDaoImpl mdao = new MemberDaoImpl();
//		Member m = mdao.findMemberByAccountAndPassword("admin", "123");
//
//		if (m.getAccount() == null) { // 不要直接使用m來測試，把account提出來就測試正常
//			System.out.println("用戶名或密碼錯誤，請重新輸入");
//		} else {
//			System.out.println("登陸成功，即刻轉到登陸頁面");
//		}
		
		// ok admin is the primary key
//		Member member = new Member("adam","admin","123","adam@gmail.com","2020-01-16","m","taiwan","0987654321","admin");
//		System.out.println(mdao.insertMember(member, "admin"));

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
